<?php

namespace App\Entity;

class Taxon
{
    public const TON = [
        '3.2',
        '5',
        '6',
        '8',
        '10',
        '12',
        '14',
        '16',
        '55',
    ];
    
    public const DRIVE_TYPES = [
        '4x2',
        '6x4',
        '8x4',
    ];
    

    public static function get($taxon)
    {
        $taxon = strtoupper($taxon);
        $constant = constant('Self::' . $taxon);
        return $constant;
    }
}
