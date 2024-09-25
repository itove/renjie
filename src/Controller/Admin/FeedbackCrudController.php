<?php

namespace App\Controller\Admin;

use App\Entity\Feedback;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;

class FeedbackCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Feedback::class;
    }
    
    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->disable('new')
            ->disable('edit')
            ->add('index', 'detail')
            ->remove('index', 'delete')
            ->addBatchAction(Action::BATCH_DELETE)
        ;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
