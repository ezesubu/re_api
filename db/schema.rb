# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150106225238) do

  create_table "administradores", force: true do |t|
    t.string    "nombre",     limit: 150, null: false
    t.string    "email",      limit: 150, null: false
    t.integer   "id_nivel",               null: false
    t.string    "password",   limit: 45,  null: false
    t.timestamp "fecha_alta",             null: false
    t.integer   "status",                 null: false
  end

  create_table "autor", force: true do |t|
    t.string    "slug",        limit: 128,             null: false
    t.string    "titulo",      limit: 256,             null: false
    t.text      "descripcion"
    t.integer   "status",                  default: 1, null: false
    t.timestamp "fecha",                               null: false
  end

  add_index "autor", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "autor", ["slug"], name: "Índice 4", using: :btree
  add_index "autor", ["status"], name: "fk_autor_statuses1_idx", using: :btree
  add_index "autor", ["titulo"], name: "Índice 5", length: {"titulo"=>255}, using: :btree

  create_table "autor_multimedia", force: true do |t|
    t.integer "autor_id",      null: false
    t.integer "multimedia_id", null: false
  end

  add_index "autor_multimedia", ["autor_id"], name: "autor_id", using: :btree
  add_index "autor_multimedia", ["multimedia_id"], name: "multimedia_id", using: :btree

  create_table "biblioteca", force: true do |t|
    t.integer  "id_usuario",                                           null: false
    t.string   "portada",        limit: 45,  default: "generica",      null: false
    t.string   "nombre",         limit: 100,                           null: false
    t.string   "tipo",           limit: 13,  default: "personalizada", null: false
    t.integer  "estatus",                    default: 1,               null: false
    t.datetime "fecha_creacion",                                       null: false
  end

  add_index "biblioteca", ["id_usuario"], name: "FK_usuario_idx", using: :btree

  create_table "biblioteca_acceso", id: false, force: true do |t|
    t.integer  "id_biblioteca", null: false
    t.datetime "fecha_acceso",  null: false
  end

  add_index "biblioteca_acceso", ["id_biblioteca"], name: "FK_biblioteca_idx", using: :btree

  create_table "biblioteca_libro", force: true do |t|
    t.integer  "id_biblioteca",              null: false
    t.integer  "id_libro",                   null: false
    t.integer  "estatus",        default: 1, null: false
    t.datetime "fecha_creacion",             null: false
  end

  add_index "biblioteca_libro", ["id_biblioteca"], name: "FK_biblioteca_libro_idx", using: :btree
  add_index "biblioteca_libro", ["id_libro", "id_biblioteca"], name: "index2", unique: true, using: :btree

  create_table "categorias", force: true do |t|
    t.string    "slug",        limit: 128,             null: false
    t.string    "titulo",      limit: 256,             null: false
    t.string    "claves",      limit: 256,             null: false
    t.text      "descripcion"
    t.integer   "activo",      limit: 1,   default: 1, null: false
    t.timestamp "fecha",                               null: false
    t.integer   "status",                  default: 1, null: false
  end

  add_index "categorias", ["slug"], name: "Índice 2", using: :btree
  add_index "categorias", ["slug"], name: "Índice 4", unique: true, using: :btree
  add_index "categorias", ["titulo"], name: "Índice 3", length: {"titulo"=>255}, using: :btree

  create_table "ciudad", force: true do |t|
    t.string  "nombre",      limit: 35,             null: false
    t.string  "codigo_pais", limit: 3,              null: false
    t.string  "distrito",    limit: 20,             null: false
    t.integer "poblacion",              default: 0, null: false
  end

  add_index "ciudad", ["codigo_pais"], name: "codigo_pais", using: :btree

  create_table "coleccion", force: true do |t|
    t.integer   "user_id",                             null: false
    t.string    "titulo",      limit: 128,             null: false
    t.text      "descripcion",                         null: false
    t.integer   "seguidores",              default: 0, null: false
    t.integer   "activo",      limit: 1,   default: 1, null: false
    t.timestamp "fecha",                               null: false
    t.integer   "status",                  default: 1, null: false
  end

  add_index "coleccion", ["status"], name: "fk_coleccion_statuses1_idx", using: :btree
  add_index "coleccion", ["user_id"], name: "user_id", using: :btree

  create_table "coleccion_seguidor", force: true do |t|
    t.integer "coleccion_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "coleccion_seguidor", ["coleccion_id"], name: "coleccion_id", using: :btree
  add_index "coleccion_seguidor", ["user_id"], name: "user_id", using: :btree

  create_table "discusion", force: true do |t|
    t.integer   "user_id",                                     null: false
    t.integer   "libro_id",                                    null: false
    t.string    "titulo",      limit: 128,                     null: false
    t.text      "descripcion",                                 null: false
    t.string    "slug",                                        null: false
    t.string    "idioma",      limit: 2,   default: "es",      null: false
    t.string    "tipo",        limit: 7,   default: "abierta", null: false
    t.boolean   "moderar",                 default: false,     null: false
    t.integer   "seguidores",              default: 0,         null: false
    t.integer   "comentarios",                                 null: false
    t.integer   "activo",      limit: 1,   default: 1,         null: false
    t.timestamp "fecha_alta",                                  null: false
    t.integer   "status",                  default: 1,         null: false
  end

  add_index "discusion", ["libro_id"], name: "libro_id", using: :btree
  add_index "discusion", ["status"], name: "fk_discusion_statuses1_idx", using: :btree
  add_index "discusion", ["user_id"], name: "user_id", using: :btree

  create_table "discusion_comentario", force: true do |t|
    t.integer   "discusion_id",                       null: false
    t.integer   "user_id",                            null: false
    t.integer   "replica_id",                         null: false
    t.text      "comentario",                         null: false
    t.timestamp "fecha_alta",                         null: false
    t.integer   "status",       limit: 1, default: 1, null: false
  end

  add_index "discusion_comentario", ["discusion_id"], name: "discusion_id", using: :btree
  add_index "discusion_comentario", ["replica_id"], name: "replica_id", using: :btree
  add_index "discusion_comentario", ["user_id"], name: "user_id", using: :btree

  create_table "discusion_invitacion", force: true do |t|
    t.integer "discusion_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "discusion_invitacion", ["discusion_id"], name: "discusion_id", using: :btree
  add_index "discusion_invitacion", ["user_id"], name: "user_id", using: :btree

  create_table "discusion_seguidor", force: true do |t|
    t.integer "discusion_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "discusion_seguidor", ["discusion_id"], name: "discusion_id", using: :btree
  add_index "discusion_seguidor", ["user_id"], name: "user_id", using: :btree

  create_table "editorial", force: true do |t|
    t.string    "slug",        limit: 128,               null: false
    t.string    "titulo",      limit: 256,               null: false
    t.text      "descripcion"
    t.integer   "activo",      limit: 1,   default: 1,   null: false
    t.timestamp "fecha",                                 null: false
    t.integer   "status",                  default: 1,   null: false
    t.string    "tipo",        limit: 1,   default: "L"
  end

  add_index "editorial", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "editorial", ["slug"], name: "Índice 4", using: :btree
  add_index "editorial", ["status"], name: "fk_editorial_statuses2_idx", using: :btree
  add_index "editorial", ["titulo"], name: "Índice 5", length: {"titulo"=>255}, using: :btree

  create_table "editorial_multimedia", force: true do |t|
    t.integer "editorial_id",  null: false
    t.integer "multimedia_id", null: false
  end

  add_index "editorial_multimedia", ["editorial_id"], name: "editorial_id", using: :btree
  add_index "editorial_multimedia", ["multimedia_id"], name: "multimedia_id", using: :btree

  create_table "genero", force: true do |t|
    t.string    "slug",        limit: 128,             null: false
    t.string    "titulo",      limit: 256,             null: false
    t.text      "descripcion"
    t.integer   "activo",      limit: 1,   default: 1, null: false
    t.timestamp "fecha",                               null: false
  end

  add_index "genero", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "genero", ["slug"], name: "slug", unique: true, using: :btree

  create_table "generos_musicales", force: true do |t|
    t.string    "nombre",     limit: 150,             null: false
    t.timestamp "fecha_alta",                         null: false
    t.integer   "status",                 default: 1, null: false
  end

  create_table "groups", force: true do |t|
    t.string "name",        limit: 20,  null: false
    t.string "description", limit: 100, null: false
  end

  create_table "idioma_pais", id: false, force: true do |t|
    t.string "codigo_pais", limit: 3,                null: false
    t.string "idioma",      limit: 30,               null: false
    t.string "es_oficial",  limit: 1,  default: "F", null: false
    t.float  "porcentaje",  limit: 4,  default: 0.0, null: false
  end

  create_table "idiomas", force: true do |t|
    t.string    "slug",        limit: 128,             null: false
    t.string    "titulo_esp",  limit: 256,             null: false
    t.string    "titulo_ing",  limit: 256,             null: false
    t.string    "clave",       limit: 5,               null: false
    t.text      "descripcion"
    t.integer   "activo",      limit: 1,   default: 1, null: false
    t.timestamp "fecha",                               null: false
    t.integer   "status",                  default: 1, null: false
  end

  add_index "idiomas", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "intereses", force: true do |t|
    t.string    "nombre",     limit: 150,             null: false
    t.timestamp "fecha_alta",                         null: false
    t.integer   "status",                 default: 1, null: false
  end

  create_table "libro", force: true do |t|
    t.integer   "status",                                 default: 1, null: false
    t.integer   "status_paginacion",                      default: 0, null: false
    t.integer   "imagen_modificada",                      default: 0, null: false
    t.text      "slug",                                               null: false
    t.integer   "descomprimido",                          default: 0, null: false
    t.datetime  "fecha_descompresion",                                null: false
    t.string    "archivo_epub",                                       null: false
    t.integer   "paginas",                                default: 0, null: false
    t.text      "page_list",           limit: 2147483647,             null: false
    t.text      "container_xml",       limit: 2147483647,             null: false
    t.text      "content_opf",         limit: 2147483647,             null: false
    t.text      "toc_ncx",             limit: 2147483647,             null: false
    t.text      "titulo",                                             null: false
    t.text      "descripcion"
    t.string    "ISBN",                limit: 250
    t.string    "fecha_libro",         limit: 50
    t.string    "url"
    t.integer   "idioma",                                             null: false
    t.text      "derechos",                                           null: false
    t.timestamp "fecha_alta",                                         null: false
    t.integer   "id_usr_alta",                                        null: false
    t.integer   "tipo_membresia",                         default: 1, null: false
  end

  add_index "libro", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "libro", ["idioma"], name: "Índice 6", using: :btree
  add_index "libro", ["slug"], name: "Índice 4", length: {"slug"=>100}, using: :btree
  add_index "libro", ["status"], name: "fk_libro_statuses2_idx", using: :btree
  add_index "libro", ["status_paginacion"], name: "Índice 7", using: :btree
  add_index "libro", ["titulo"], name: "Índice 5", length: {"titulo"=>100}, using: :btree

  create_table "libro_autor", force: true do |t|
    t.integer "libro_id", null: false
    t.integer "autor_id", null: false
  end

  add_index "libro_autor", ["autor_id"], name: "autor_id", using: :btree
  add_index "libro_autor", ["libro_id"], name: "libro_id", using: :btree

  create_table "libro_capitulos", force: true do |t|
    t.integer   "id_libro"
    t.string    "clave_archivo"
    t.string    "nombre_archivo"
    t.string    "tipo_archivo"
    t.text      "contenido",      limit: 2147483647
    t.timestamp "fecha_registro"
  end

  add_index "libro_capitulos", ["clave_archivo"], name: "Índice 3", using: :btree
  add_index "libro_capitulos", ["id_libro"], name: "Índice 2", using: :btree
  add_index "libro_capitulos", ["nombre_archivo"], name: "Índice 4", using: :btree

  create_table "libro_categoria", force: true do |t|
    t.integer "libro_id",     null: false
    t.integer "categoria_id", null: false
  end

  add_index "libro_categoria", ["categoria_id"], name: "categoria_id", using: :btree
  add_index "libro_categoria", ["libro_id", "categoria_id"], name: "Índice 4", unique: true, using: :btree
  add_index "libro_categoria", ["libro_id"], name: "libro_id", using: :btree

  create_table "libro_coleccion", force: true do |t|
    t.integer "libro_id",     null: false
    t.integer "coleccion_id", null: false
  end

  add_index "libro_coleccion", ["coleccion_id"], name: "coleccion_id", using: :btree
  add_index "libro_coleccion", ["libro_id"], name: "libro_id", using: :btree

  create_table "libro_destacado", force: true do |t|
    t.integer   "libro_id",                   null: false
    t.integer   "status",         default: 1, null: false
    t.integer   "tipo",           default: 2, null: false
    t.timestamp "fecha_registro",             null: false
  end

  add_index "libro_destacado", ["libro_id", "tipo"], name: "Índice 4", unique: true, using: :btree
  add_index "libro_destacado", ["libro_id"], name: "libro_id", using: :btree
  add_index "libro_destacado", ["status"], name: "tema_id", using: :btree

  create_table "libro_editorial", force: true do |t|
    t.integer "libro_id",     null: false
    t.integer "editorial_id", null: false
  end

  add_index "libro_editorial", ["editorial_id"], name: "editorial_id", using: :btree
  add_index "libro_editorial", ["libro_id"], name: "libro_id", using: :btree

  create_table "libro_genero", force: true do |t|
    t.integer "libro_id",  null: false
    t.integer "genero_id", null: false
  end

  add_index "libro_genero", ["genero_id"], name: "genero_id", using: :btree
  add_index "libro_genero", ["libro_id"], name: "libro_id", using: :btree

  create_table "libro_multimedia", force: true do |t|
    t.integer "libro_id",      null: false
    t.integer "multimedia_id", null: false
  end

  add_index "libro_multimedia", ["libro_id"], name: "libro_id", using: :btree
  add_index "libro_multimedia", ["multimedia_id"], name: "multimedia_id", using: :btree

  create_table "libro_tema", force: true do |t|
    t.integer "libro_id", null: false
    t.integer "tema_id",  null: false
  end

  add_index "libro_tema", ["libro_id"], name: "libro_id", using: :btree
  add_index "libro_tema", ["tema_id"], name: "tema_id", using: :btree

  create_table "llaves", id: false, force: true do |t|
    t.integer   "id",                                null: false
    t.string    "llave",      limit: 45,             null: false
    t.string    "hash",       limit: 45,             null: false
    t.timestamp "fecha_alta",                        null: false
    t.integer   "status",                default: 1, null: false
  end

  add_index "llaves", ["status"], name: "fk_llaves_statuses_idx", using: :btree

  create_table "log_libros", force: true do |t|
    t.integer   "id_usuario",                             null: false
    t.integer   "id_libro",                               null: false
    t.integer   "id_accion",                              null: false
    t.string    "epubcfi",        limit: 250,             null: false
    t.float     "porcentaje",                             null: false
    t.integer   "pagina",                                 null: false
    t.string    "so",             limit: 50,              null: false
    t.string    "navegador",      limit: 50,              null: false
    t.string    "ip",             limit: 50,              null: false
    t.datetime  "fecha_log",                              null: false
    t.timestamp "fecha_registro",                         null: false
    t.integer   "status",                     default: 1, null: false
  end

  add_index "log_libros", ["id_libro"], name: "FK_log_libros_libro", using: :btree
  add_index "log_libros", ["id_usuario"], name: "fk_logs_usuario_users1_idx", using: :btree

  create_table "logs_actividad_usr", force: true do |t|
    t.integer   "id_usuario",                         null: false
    t.string    "seccion",    limit: 50,              null: false
    t.integer   "id_item",                            null: false
    t.integer   "id_accion",                          null: false
    t.string    "ip",         limit: 25,              null: false
    t.string    "notas",      limit: 250,             null: false
    t.timestamp "fecha_log",                          null: false
    t.integer   "status",                 default: 1, null: false
  end

  add_index "logs_actividad_usr", ["id_item"], name: "Índice 4", using: :btree
  add_index "logs_actividad_usr", ["id_usuario"], name: "Índice 2", using: :btree
  add_index "logs_actividad_usr", ["seccion"], name: "Índice 3", using: :btree

  create_table "logs_administrador", id: false, force: true do |t|
    t.integer   "id",               null: false
    t.integer   "id_administrador", null: false
    t.timestamp "fehcha_log",       null: false
  end

  add_index "logs_administrador", ["id_administrador"], name: "fk_logs_administrador_administradores1", using: :btree

  create_table "logs_landingpage", force: true do |t|
    t.string    "clave_usuario", limit: 10,             null: false
    t.string    "ip_address",    limit: 15,             null: false
    t.timestamp "fecha_log",                            null: false
    t.integer   "status",                   default: 1, null: false
  end

  add_index "logs_landingpage", ["clave_usuario"], name: "fk_logs_usuario_users1_idx", using: :btree

  create_table "logs_usuario", force: true do |t|
    t.integer   "id_usuario",                        null: false
    t.string    "ip_address", limit: 15,             null: false
    t.timestamp "fecha_log",                         null: false
    t.integer   "status",                default: 1, null: false
  end

  add_index "logs_usuario", ["id_usuario"], name: "fk_logs_usuario_users1_idx", using: :btree

  create_table "membresias", force: true do |t|
    t.string    "nombre",          limit: 45,             null: false
    t.text      "descripcion",                            null: false
    t.integer   "id_periodicidad",                        null: false
    t.float     "precio_periodo",                         null: false
    t.timestamp "fecha_alta",                             null: false
    t.integer   "status",                     default: 1, null: false
  end

  create_table "membresias_usuarios", force: true do |t|
    t.integer   "id_usuario",                               null: false
    t.integer   "id_membresia",                             null: false
    t.datetime  "fecha_ultimo_pago"
    t.string    "id_pago_paypal",    limit: 85
    t.timestamp "fecha_alta",                               null: false
    t.integer   "status",                       default: 1, null: false
  end

  create_table "multimedia", force: true do |t|
    t.string    "slug",            limit: 128,             null: false
    t.string    "titulo",          limit: 256,             null: false
    t.text      "descripcion"
    t.string    "URL",             limit: 256
    t.string    "imagen_auxiliar", limit: 50
    t.string    "tipo",            limit: 6,               null: false
    t.integer   "orden"
    t.timestamp "fecha_alta",                              null: false
    t.integer   "status",                      default: 1, null: false
  end

  add_index "multimedia", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "multimedia", ["status"], name: "fk_multimedia_statuses1_idx", using: :btree

  create_table "niveles_administrador", force: true do |t|
    t.string "nombre", limit: 150
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id",              null: false
    t.integer  "application_id",                 null: false
    t.string   "token",                          null: false
    t.integer  "expires_in",                     null: false
    t.string   "redirect_uri",      limit: 2048, null: false
    t.datetime "created_at",                     null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.string   "redirect_uri", limit: 2048, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "pais", primary_key: "codigo", force: true do |t|
    t.string  "nombre",                limit: 52,                          null: false
    t.string  "continente",            limit: 12, default: "Norteamérica", null: false
    t.string  "region",                limit: 26,                          null: false
    t.float   "superficie",            limit: 10, default: 0.0,            null: false
    t.integer "independecia_anio",     limit: 2
    t.integer "poblacion",                        default: 0,              null: false
    t.float   "esperanza_de_vida",     limit: 3
    t.float   "producto_nal_bruto",    limit: 10
    t.float   "producto_nal_brutoOld", limit: 10
    t.string  "nombre_local",          limit: 45,                          null: false
    t.string  "forma_de_gobierno",     limit: 45,                          null: false
    t.string  "jefe_de_estado",        limit: 60
    t.integer "capital"
    t.string  "codigo2",               limit: 2,                           null: false
  end

  create_table "periodicidad_membresias", force: true do |t|
    t.string    "nombre",        limit: 45,             null: false
    t.integer   "cantidad",                             null: false
    t.string    "unidad_medida", limit: 45,             null: false
    t.timestamp "fecha_alta",                           null: false
    t.integer   "status",                   default: 1, null: false
  end

  create_table "publicacion", force: true do |t|
    t.string    "slug",                  limit: 128,                     null: false
    t.string    "titulo",                limit: 128,                     null: false
    t.string    "subtitulo",             limit: 128,                     null: false
    t.text      "descripcion"
    t.string    "ISSN",                  limit: 20
    t.integer   "idioma",                                                null: false
    t.integer   "pais_id",                                               null: false
    t.integer   "region_id",                                             null: false
    t.date      "fecha_publicacion",                                     null: false
    t.integer   "numero",                                                null: false
    t.string    "periodicidad",          limit: 10
    t.integer   "tiraje"
    t.string    "genero_enfocado",       limit: 9
    t.string    "nivel_socioeconomico",  limit: 3
    t.integer   "edad_enfocada_inicial"
    t.integer   "edad_enfocada_final"
    t.boolean   "descontinuada"
    t.integer   "activo",                limit: 1,   default: 1,         null: false
    t.timestamp "fecha",                                                 null: false
    t.integer   "status",                            default: 1,         null: false
    t.string    "id_issuu",              limit: 40,                      null: false
    t.string    "tipo",                  limit: 9,   default: "revista", null: false
    t.string    "localidad",             limit: 100,                     null: false
  end

  add_index "publicacion", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "publicacion", ["id_issuu"], name: "id_issuu_UNIQUE", unique: true, using: :btree
  add_index "publicacion", ["pais_id"], name: "pais_id", using: :btree
  add_index "publicacion", ["region_id"], name: "region_id", using: :btree
  add_index "publicacion", ["slug"], name: "slug", using: :btree
  add_index "publicacion", ["status"], name: "fk_publicacion_statuses2_idx", using: :btree

  create_table "publicacion_actividad", id: false, force: true do |t|
    t.integer  "id_usuario",                   null: false
    t.integer  "id_publicacion",               null: false
    t.integer  "pagina",                       null: false
    t.datetime "fecha",                        null: false
    t.string   "sistema_operativo", limit: 50, null: false
    t.string   "navegador",         limit: 50, null: false
  end

  add_index "publicacion_actividad", ["id_publicacion"], name: "FK_publicacion_actividad_2_idx", using: :btree
  add_index "publicacion_actividad", ["id_usuario"], name: "FK_publicacion_actividad", using: :btree

  create_table "publicacion_coleccion", force: true do |t|
    t.integer "publicacion_id", null: false
    t.integer "coleccion_id",   null: false
  end

  add_index "publicacion_coleccion", ["coleccion_id"], name: "coleccion_id", using: :btree
  add_index "publicacion_coleccion", ["publicacion_id"], name: "publicacion_id", using: :btree

  create_table "publicacion_contenido", force: true do |t|
    t.integer   "id_publicacion",                            null: false
    t.string    "id_issuu",          limit: 50,              null: false
    t.string    "titulo",            limit: 100,             null: false
    t.date      "fecha_publicacion",                         null: false
    t.string    "slug",              limit: 100,             null: false
    t.string    "descripcion",       limit: 50
    t.integer   "paginas",                                   null: false
    t.integer   "status",                        default: 1
    t.timestamp "fecha_registro"
  end

  add_index "publicacion_contenido", ["id_issuu"], name: "id_issuu_UNIQUE", unique: true, using: :btree
  add_index "publicacion_contenido", ["id_publicacion"], name: "Índice 4", using: :btree
  add_index "publicacion_contenido", ["slug", "id_publicacion"], name: "slug_UNIQUE", unique: true, using: :btree

  create_table "publicacion_destacada", force: true do |t|
    t.integer   "publicacion_id",             null: false
    t.integer   "status",         default: 1, null: false
    t.integer   "tipo",           default: 2, null: false
    t.timestamp "fecha_registro",             null: false
  end

  add_index "publicacion_destacada", ["publicacion_id"], name: "publicacion_id", using: :btree
  add_index "publicacion_destacada", ["publicacion_id"], name: "Índice 3", unique: true, using: :btree

  create_table "publicacion_editorial", force: true do |t|
    t.integer "publicacion_id", null: false
    t.integer "editorial_id",   null: false
  end

  add_index "publicacion_editorial", ["editorial_id"], name: "editorial_id", using: :btree
  add_index "publicacion_editorial", ["publicacion_id"], name: "publicacion_id", using: :btree

  create_table "publicacion_multimedia", force: true do |t|
    t.integer "publicacion_id", null: false
    t.integer "multimedia_id",  null: false
  end

  add_index "publicacion_multimedia", ["multimedia_id"], name: "multimedia_id", using: :btree
  add_index "publicacion_multimedia", ["publicacion_id"], name: "publicacion_id", using: :btree

  create_table "publicacion_tema", force: true do |t|
    t.integer "publicacion_id", null: false
    t.integer "tema_id",        null: false
  end

  add_index "publicacion_tema", ["publicacion_id"], name: "publicacion_id", using: :btree
  add_index "publicacion_tema", ["tema_id"], name: "tema_id", using: :btree

  create_table "seguidor", force: true do |t|
    t.integer "user_id",     null: false
    t.integer "seguidor_id", null: false
  end

  add_index "seguidor", ["seguidor_id"], name: "seguidor_id", using: :btree
  add_index "seguidor", ["user_id"], name: "user_id", using: :btree

  create_table "solicitudes_beta", force: true do |t|
    t.integer   "status",                              default: 1,             null: false
    t.string    "nombre",                  limit: 100,                         null: false
    t.string    "username",                limit: 100,                         null: false
    t.string    "password",                                                    null: false
    t.string    "email",                   limit: 150,                         null: false
    t.string    "codigo_activacion",       limit: 40
    t.string    "clasificacion",           limit: 100, default: "registrados", null: false
    t.integer   "correo_valido",                       default: 1,             null: false
    t.string    "avatar",                  limit: 120
    t.string    "id_facebook",             limit: 120
    t.string    "id_twitter",              limit: 120
    t.string    "id_google",               limit: 120
    t.date      "fecha_nacimiento"
    t.string    "sexo",                    limit: 10
    t.string    "lugar_residencia",        limit: 85
    t.string    "forgotten_password_code", limit: 40
    t.timestamp "fecha_alta",                                                  null: false
  end

  add_index "solicitudes_beta", ["status"], name: "fk_usuarios_statuses2_idx", using: :btree

  create_table "statuses", force: true do |t|
    t.string "nombre", limit: 45, null: false
  end

  create_table "statuses_libro", force: true do |t|
    t.string "nombre", limit: 128
  end

  create_table "temas", force: true do |t|
    t.string    "slug",        limit: 128,               null: false
    t.string    "titulo",      limit: 256,               null: false
    t.string    "titulo_ing",  limit: 256,               null: false
    t.text      "descripcion"
    t.integer   "activo",      limit: 1,   default: 1,   null: false
    t.timestamp "fecha",                                 null: false
    t.integer   "status",                  default: 1,   null: false
    t.string    "tipo",        limit: 1,   default: "L"
  end

  add_index "temas", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "temas", ["slug"], name: "Índice 3", using: :btree
  add_index "temas", ["titulo"], name: "Índice 4", length: {"titulo"=>255}, using: :btree
  add_index "temas", ["titulo_ing"], name: "Índice 5", length: {"titulo_ing"=>255}, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_groups", force: true do |t|
    t.integer "user_id",            null: false
    t.integer "group_id", limit: 3, null: false
  end

  add_index "users_groups", ["group_id"], name: "group_id", using: :btree
  add_index "users_groups", ["user_id"], name: "user_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string    "nombre",                  limit: 150,                                       null: false
    t.string    "username",                limit: 100,                                       null: false
    t.string    "password",                                                                  null: false
    t.string    "email",                   limit: 100,                                       null: false
    t.string    "avatar",                  limit: 120, default: "/user_avatars/default.png"
    t.string    "id_facebook",             limit: 120
    t.string    "id_twitter",              limit: 120
    t.string    "id_google",               limit: 120
    t.date      "fecha_nacimiento"
    t.string    "sexo",                    limit: 6
    t.string    "estado_civil",            limit: 1
    t.string    "pais_nacimiento",         limit: 3
    t.string    "pais_residencia",         limit: 3
    t.integer   "ciudad_residencia"
    t.string    "codigo_activacion",       limit: 40
    t.string    "forgotten_password_code", limit: 40
    t.integer   "newsletter",                          default: 0,                           null: false
    t.timestamp "fecha_alta",                                                                null: false
    t.integer   "status",                              default: 1,                           null: false
    t.integer   "status_verificacion",                 default: 2,                           null: false
    t.integer   "adopters",                            default: 0,                           null: false
    t.string    "encrypted_password"
  end

  add_index "usuarios", ["email"], name: "Índice 3", unique: true, using: :btree
  add_index "usuarios", ["status"], name: "fk_usuarios_statuses2_idx", using: :btree

  create_table "usuarios_autores", force: true do |t|
    t.integer "id_usuario", null: false
    t.integer "id_autor",   null: false
  end

  add_index "usuarios_autores", ["id_autor"], name: "FK_usuario_autor_idx", using: :btree
  add_index "usuarios_autores", ["id_usuario"], name: "FK_usuario_autor_2_idx", using: :btree

  create_table "usuarios_categorias", force: true do |t|
    t.integer "id_usuario",   null: false
    t.integer "id_categoria", null: false
  end

  add_index "usuarios_categorias", ["id_categoria"], name: "FK_usuario_categoria_2_idx", using: :btree
  add_index "usuarios_categorias", ["id_usuario"], name: "FK_usuario_categoria_idx", using: :btree

  create_table "usuarios_generos_musicales", force: true do |t|
    t.integer "id_usuario",        null: false
    t.integer "id_genero_musical", null: false
  end

  add_index "usuarios_generos_musicales", ["id_usuario"], name: "FK_usuario_genero_idx", using: :btree

  create_table "usuarios_intereses", force: true do |t|
    t.integer "id_usuario", null: false
    t.integer "id_interes", null: false
  end

  add_index "usuarios_intereses", ["id_usuario"], name: "FK_usuario_interes_idx", using: :btree

end
