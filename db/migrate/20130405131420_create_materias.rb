class CreateMaterias < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      t.string :nombre
      t.string :sigla
      t.references :curso

      t.timestamps
    end
 add_index :materias, :curso_id
  end
end
