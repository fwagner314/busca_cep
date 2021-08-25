# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerAddressesInsertUpdate < ActiveRecord::Migration[6.0]
  def up
    create_trigger("addresses_before_insert_update_row_tr", :generated => true, :compatibility => 1).
        on("addresses").
        before(:insert, :update) do
      <<-SQL_ACTIONS

	    IF EXISTS (SELECT 1 FROM teste.addresses WHERE zipcode = NEW.zipcode) THEN
	    	RAISE NOTICE 'CEP Já Cadastrado';
            RETURN NULL;
        ELSE
            RETURN NEW;
        END IF;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("addresses_before_insert_update_row_tr", "addresses", :generated => true)
  end
end
