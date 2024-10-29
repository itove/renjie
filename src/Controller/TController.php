<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\HttpClient\HttpClientInterface;
use App\Service\Data;
use App\Entity\Node;
use App\Entity\Region;
use App\Entity\Category;

class TController extends AbstractController
{
    public function __construct(HttpClientInterface $client, Data $data)
    {
        $this->httpClient = $client;
        $this->data = $data;
    }

    #[Route('/t', name: 'app_t')]
    public function index(Request $request): Response
    {
        $data = $this->data->getMisc($request->getLocale());
        
        $keywords = ['随车', '汽车', '清障', '高空', '电源', '救险'];

        $url = 'https://www.cn-truck.com/gonggao/listres';
        $payload = [
            'qymc' => '人杰',
            'clmc' => '',
        ];


            $url2 = "https://www.cn-truck.com/index.php?m=gonggao&c=index&a=showgg&clxh=XCL5410JQZ&pc=378&cx=0"; #&pc=385&cx=0
            // $url2 = "https://www.cn-truck.com/index.php?m=gonggao&c=index&a=showgg&clxh={$i['clxh']}"; #&pc=385&cx=0
            dump($url2);
            $content = $this->httpClient->request('GET', $url2)->getContent();
            dump($content);
        
        $em = $this->data->getEntityManager();
        $region = $this->data->getRegionByLabel('products');

        foreach($keywords as $k){
            $cate = $em->getRepository(Category::class)->findOneNameLike($k);

            $payload['clmc'] = $k;
            $content = $this->httpClient->request('POST', $url, ['body' => $payload])->toArray();
            $items = $content['data'];
            // dump($items);
            foreach($items as $i){
                // dump($i['title']);
                // dump($i['clxh']);
                // dump($i['cpmc']);
                
                $p = $em->getRepository(Node::class)->findOneBy(['title' => $i['cpmc']]);
                dump($p);
                if (null === $p) {
                    $p = new Node();
                    $p->setTitle($i['cpmc']);
                    $p->addRegion($region);
                    $p->setCategory($cate);
                    $p->setAddress(0);
                    $p->setPhone(0);
                } else {
                    $p->addRegion($region);
                    $p->setCategory($cate);
                    $p->setAddress(0);
                    $p->setPhone(0);
                }

                if (null === $p) {
                    $em->persist($p);
                }
            }
        }

        $em->flush();

        return $this->render('t/index.html.twig', $data);
    }
}
