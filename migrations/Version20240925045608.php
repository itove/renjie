<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240925045608 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE category_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE conf_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE feedback_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE image_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE language_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE link_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE menu_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE node_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE "order_id_seq" INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE page_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE refund_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE region_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE spec_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE tag_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE "user_id_seq" INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE category (id INT NOT NULL, name VARCHAR(255) NOT NULL, label VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE conf (id INT NOT NULL, language_id INT DEFAULT NULL, sitename VARCHAR(255) NOT NULL, keywords TEXT DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, address VARCHAR(255) DEFAULT NULL, phone VARCHAR(25) DEFAULT NULL, email VARCHAR(55) DEFAULT NULL, logo VARCHAR(255) DEFAULT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, note VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_14F389A882F1BAF4 ON conf (language_id)');
        $this->addSql('COMMENT ON COLUMN conf.keywords IS \'(DC2Type:simple_array)\'');
        $this->addSql('COMMENT ON COLUMN conf.updated_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('CREATE TABLE feedback (id INT NOT NULL, node_id INT DEFAULT NULL, firstname VARCHAR(15) DEFAULT NULL, lastname VARCHAR(15) DEFAULT NULL, email VARCHAR(35) DEFAULT NULL, phone VARCHAR(20) DEFAULT NULL, title VARCHAR(255) DEFAULT NULL, body TEXT NOT NULL, country VARCHAR(30) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_D2294458460D9FD7 ON feedback (node_id)');
        $this->addSql('CREATE TABLE image (id INT NOT NULL, node_id INT NOT NULL, image VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_C53D045F460D9FD7 ON image (node_id)');
        $this->addSql('CREATE TABLE language (id INT NOT NULL, language VARCHAR(30) NOT NULL, prefix VARCHAR(15) NOT NULL, locale VARCHAR(15) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE link (id INT NOT NULL, menu_id INT NOT NULL, title VARCHAR(255) NOT NULL, link VARCHAR(255) NOT NULL, weight SMALLINT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_36AC99F1CCD7E912 ON link (menu_id)');
        $this->addSql('CREATE TABLE menu (id INT NOT NULL, name VARCHAR(255) NOT NULL, label VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE node (id INT NOT NULL, language_id INT DEFAULT NULL, category_id INT DEFAULT NULL, parent_id INT DEFAULT NULL, title VARCHAR(255) NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, body TEXT DEFAULT NULL, image VARCHAR(255) DEFAULT NULL, summary TEXT DEFAULT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, video VARCHAR(255) DEFAULT NULL, audio VARCHAR(255) DEFAULT NULL, qr VARCHAR(255) DEFAULT NULL, phone VARCHAR(255) DEFAULT NULL, latitude DOUBLE PRECISION DEFAULT NULL, longitude DOUBLE PRECISION DEFAULT NULL, address VARCHAR(255) DEFAULT NULL, price INT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_857FE84582F1BAF4 ON node (language_id)');
        $this->addSql('CREATE INDEX IDX_857FE84512469DE2 ON node (category_id)');
        $this->addSql('CREATE INDEX IDX_857FE845727ACA70 ON node (parent_id)');
        $this->addSql('COMMENT ON COLUMN node.created_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN node.updated_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('CREATE TABLE node_region (node_id INT NOT NULL, region_id INT NOT NULL, PRIMARY KEY(node_id, region_id))');
        $this->addSql('CREATE INDEX IDX_BB70E4D3460D9FD7 ON node_region (node_id)');
        $this->addSql('CREATE INDEX IDX_BB70E4D398260155 ON node_region (region_id)');
        $this->addSql('CREATE TABLE node_tag (node_id INT NOT NULL, tag_id INT NOT NULL, PRIMARY KEY(node_id, tag_id))');
        $this->addSql('CREATE INDEX IDX_70AC95F8460D9FD7 ON node_tag (node_id)');
        $this->addSql('CREATE INDEX IDX_70AC95F8BAD26311 ON node_tag (tag_id)');
        $this->addSql('CREATE TABLE "order" (id INT NOT NULL, node_id INT NOT NULL, consumer_id INT NOT NULL, quantity SMALLINT NOT NULL, amount INT NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, paid_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, used_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, status SMALLINT NOT NULL, price INT NOT NULL, cancelled_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, refunded_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, deleted_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, sn VARCHAR(255) NOT NULL, wx_trans_id VARCHAR(255) DEFAULT NULL, bank_type VARCHAR(255) DEFAULT NULL, wx_prepay_id VARCHAR(255) DEFAULT NULL, deleted BOOLEAN NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_F5299398460D9FD7 ON "order" (node_id)');
        $this->addSql('CREATE INDEX IDX_F529939837FDBD6D ON "order" (consumer_id)');
        $this->addSql('COMMENT ON COLUMN "order".created_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN "order".paid_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN "order".used_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN "order".cancelled_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN "order".refunded_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN "order".deleted_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('CREATE TABLE page (id INT NOT NULL, name VARCHAR(255) NOT NULL, label VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE refund (id INT NOT NULL, ord_id INT NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, reason SMALLINT NOT NULL, note VARCHAR(255) DEFAULT NULL, sn VARCHAR(255) NOT NULL, wx_refund_id VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_5B2C1458E636D3F5 ON refund (ord_id)');
        $this->addSql('COMMENT ON COLUMN refund.created_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('CREATE TABLE region (id INT NOT NULL, page_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, label VARCHAR(255) NOT NULL, count SMALLINT NOT NULL, icon VARCHAR(20) DEFAULT NULL, fields TEXT DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_F62F176C4663E4 ON region (page_id)');
        $this->addSql('COMMENT ON COLUMN region.fields IS \'(DC2Type:simple_array)\'');
        $this->addSql('CREATE TABLE spec (id INT NOT NULL, node_id INT NOT NULL, name VARCHAR(25) NOT NULL, value VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_C00E173E460D9FD7 ON spec (node_id)');
        $this->addSql('CREATE TABLE tag (id INT NOT NULL, name VARCHAR(255) NOT NULL, label VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE "user" (id INT NOT NULL, username VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, plain_password VARCHAR(255) DEFAULT NULL, openid VARCHAR(255) DEFAULT NULL, name VARCHAR(255) DEFAULT NULL, phone VARCHAR(255) DEFAULT NULL, avatar VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_8D93D649F85E0677 ON "user" (username)');
        $this->addSql('CREATE TABLE user_node (user_id INT NOT NULL, node_id INT NOT NULL, PRIMARY KEY(user_id, node_id))');
        $this->addSql('CREATE INDEX IDX_FFFEA48CA76ED395 ON user_node (user_id)');
        $this->addSql('CREATE INDEX IDX_FFFEA48C460D9FD7 ON user_node (node_id)');
        $this->addSql('CREATE TABLE messenger_messages (id BIGSERIAL NOT NULL, body TEXT NOT NULL, headers TEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, available_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, delivered_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_75EA56E0FB7336F0 ON messenger_messages (queue_name)');
        $this->addSql('CREATE INDEX IDX_75EA56E0E3BD61CE ON messenger_messages (available_at)');
        $this->addSql('CREATE INDEX IDX_75EA56E016BA31DB ON messenger_messages (delivered_at)');
        $this->addSql('COMMENT ON COLUMN messenger_messages.created_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN messenger_messages.available_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('COMMENT ON COLUMN messenger_messages.delivered_at IS \'(DC2Type:datetime_immutable)\'');
        $this->addSql('CREATE OR REPLACE FUNCTION notify_messenger_messages() RETURNS TRIGGER AS $$
            BEGIN
                PERFORM pg_notify(\'messenger_messages\', NEW.queue_name::text);
                RETURN NEW;
            END;
        $$ LANGUAGE plpgsql;');
        $this->addSql('DROP TRIGGER IF EXISTS notify_trigger ON messenger_messages;');
        $this->addSql('CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON messenger_messages FOR EACH ROW EXECUTE PROCEDURE notify_messenger_messages();');
        $this->addSql('ALTER TABLE conf ADD CONSTRAINT FK_14F389A882F1BAF4 FOREIGN KEY (language_id) REFERENCES language (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE feedback ADD CONSTRAINT FK_D2294458460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT FK_C53D045F460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE link ADD CONSTRAINT FK_36AC99F1CCD7E912 FOREIGN KEY (menu_id) REFERENCES menu (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node ADD CONSTRAINT FK_857FE84582F1BAF4 FOREIGN KEY (language_id) REFERENCES language (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node ADD CONSTRAINT FK_857FE84512469DE2 FOREIGN KEY (category_id) REFERENCES category (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node ADD CONSTRAINT FK_857FE845727ACA70 FOREIGN KEY (parent_id) REFERENCES node (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node_region ADD CONSTRAINT FK_BB70E4D3460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node_region ADD CONSTRAINT FK_BB70E4D398260155 FOREIGN KEY (region_id) REFERENCES region (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node_tag ADD CONSTRAINT FK_70AC95F8460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE node_tag ADD CONSTRAINT FK_70AC95F8BAD26311 FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE "order" ADD CONSTRAINT FK_F5299398460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE "order" ADD CONSTRAINT FK_F529939837FDBD6D FOREIGN KEY (consumer_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE refund ADD CONSTRAINT FK_5B2C1458E636D3F5 FOREIGN KEY (ord_id) REFERENCES "order" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE region ADD CONSTRAINT FK_F62F176C4663E4 FOREIGN KEY (page_id) REFERENCES page (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE spec ADD CONSTRAINT FK_C00E173E460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE user_node ADD CONSTRAINT FK_FFFEA48CA76ED395 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE user_node ADD CONSTRAINT FK_FFFEA48C460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE category_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE conf_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE feedback_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE image_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE language_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE link_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE menu_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE node_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE "order_id_seq" CASCADE');
        $this->addSql('DROP SEQUENCE page_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE refund_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE region_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE spec_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE tag_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE "user_id_seq" CASCADE');
        $this->addSql('ALTER TABLE conf DROP CONSTRAINT FK_14F389A882F1BAF4');
        $this->addSql('ALTER TABLE feedback DROP CONSTRAINT FK_D2294458460D9FD7');
        $this->addSql('ALTER TABLE image DROP CONSTRAINT FK_C53D045F460D9FD7');
        $this->addSql('ALTER TABLE link DROP CONSTRAINT FK_36AC99F1CCD7E912');
        $this->addSql('ALTER TABLE node DROP CONSTRAINT FK_857FE84582F1BAF4');
        $this->addSql('ALTER TABLE node DROP CONSTRAINT FK_857FE84512469DE2');
        $this->addSql('ALTER TABLE node DROP CONSTRAINT FK_857FE845727ACA70');
        $this->addSql('ALTER TABLE node_region DROP CONSTRAINT FK_BB70E4D3460D9FD7');
        $this->addSql('ALTER TABLE node_region DROP CONSTRAINT FK_BB70E4D398260155');
        $this->addSql('ALTER TABLE node_tag DROP CONSTRAINT FK_70AC95F8460D9FD7');
        $this->addSql('ALTER TABLE node_tag DROP CONSTRAINT FK_70AC95F8BAD26311');
        $this->addSql('ALTER TABLE "order" DROP CONSTRAINT FK_F5299398460D9FD7');
        $this->addSql('ALTER TABLE "order" DROP CONSTRAINT FK_F529939837FDBD6D');
        $this->addSql('ALTER TABLE refund DROP CONSTRAINT FK_5B2C1458E636D3F5');
        $this->addSql('ALTER TABLE region DROP CONSTRAINT FK_F62F176C4663E4');
        $this->addSql('ALTER TABLE spec DROP CONSTRAINT FK_C00E173E460D9FD7');
        $this->addSql('ALTER TABLE user_node DROP CONSTRAINT FK_FFFEA48CA76ED395');
        $this->addSql('ALTER TABLE user_node DROP CONSTRAINT FK_FFFEA48C460D9FD7');
        $this->addSql('DROP TABLE category');
        $this->addSql('DROP TABLE conf');
        $this->addSql('DROP TABLE feedback');
        $this->addSql('DROP TABLE image');
        $this->addSql('DROP TABLE language');
        $this->addSql('DROP TABLE link');
        $this->addSql('DROP TABLE menu');
        $this->addSql('DROP TABLE node');
        $this->addSql('DROP TABLE node_region');
        $this->addSql('DROP TABLE node_tag');
        $this->addSql('DROP TABLE "order"');
        $this->addSql('DROP TABLE page');
        $this->addSql('DROP TABLE refund');
        $this->addSql('DROP TABLE region');
        $this->addSql('DROP TABLE spec');
        $this->addSql('DROP TABLE tag');
        $this->addSql('DROP TABLE "user"');
        $this->addSql('DROP TABLE user_node');
        $this->addSql('DROP TABLE messenger_messages');
    }
}