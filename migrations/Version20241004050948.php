<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241004050948 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE feedback ADD sex SMALLINT DEFAULT NULL');
        $this->addSql('ALTER TABLE feedback ADD province VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE feedback ADD city VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE feedback ADD note VARCHAR(255) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE feedback DROP sex');
        $this->addSql('ALTER TABLE feedback DROP province');
        $this->addSql('ALTER TABLE feedback DROP city');
        $this->addSql('ALTER TABLE feedback DROP note');
    }
}
