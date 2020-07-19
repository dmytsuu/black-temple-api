# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  create_table 'account', id: :integer, unsigned: true, options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Account System', force: :cascade do |t|
    t.string 'username', limit: 32, default: '', null: false
    t.integer 'gmlevel', limit: 1, default: 0, null: false, unsigned: true
    t.text 'sessionkey', size: :long
    t.text 'v', size: :long
    t.text 's', size: :long
    t.text 'email'
    t.timestamp 'joindate', default: -> { 'CURRENT_TIMESTAMP' }, null: false
    t.string 'last_ip', limit: 30, default: '0.0.0.0', null: false
    t.integer 'failed_logins', default: 0, null: false, unsigned: true
    t.integer 'locked', limit: 1, default: 0, null: false, unsigned: true
    t.timestamp 'last_login', null: false
    t.integer 'active_realm_id', default: 0, null: false, unsigned: true
    t.integer 'expansion', limit: 1, default: 0, null: false, unsigned: true
    t.bigint 'mutetime', default: 0, null: false, unsigned: true
    t.integer 'locale', limit: 1, default: 0, null: false, unsigned: true
    t.text 'token'
    t.index ['gmlevel'], name: 'idx_gmlevel'
    t.index ['username'], name: 'idx_username', unique: true
  end

  create_table 'account_banned', id: :integer, options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Ban List', force: :cascade do |t|
    t.integer 'account_id', default: 0, null: false, comment: 'Account id'
    t.bigint 'banned_at', default: 0, null: false
    t.bigint 'expires_at', default: 0, null: false
    t.string 'banned_by', limit: 50, null: false
    t.bigint 'unbanned_at', default: 0, null: false
    t.string 'unbanned_by', limit: 50
    t.string 'reason', null: false
    t.integer 'active', limit: 1, default: 1, null: false
  end

  create_table 'ip_banned', primary_key: %w[ip banned_at], options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Banned IPs', force: :cascade do |t|
    t.string 'ip', limit: 32, default: '0.0.0.0', null: false
    t.bigint 'banned_at', null: false
    t.bigint 'expires_at', null: false
    t.string 'banned_by', limit: 50, default: '[Console]', null: false
    t.string 'reason', default: 'no reason', null: false
  end

  create_table 'realmcharacters', primary_key: %w[realmid acctid], options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Realm Character Tracker', force: :cascade do |t|
    t.integer 'realmid', default: 0, null: false, unsigned: true
    t.bigint 'acctid', null: false, unsigned: true
    t.integer 'numchars', limit: 1, default: 0, null: false, unsigned: true
    t.index ['acctid'], name: 'acctid'
  end

  create_table 'realmd_db_version', id: false, options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Last applied sql update to DB', force: :cascade do |t|
    t.binary 'required_s2398_01_realmd_banning', limit: 1
  end

  create_table 'realmlist', id: :integer, unsigned: true, options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Realm System', force: :cascade do |t|
    t.string 'name', limit: 32, default: '', null: false
    t.string 'address', limit: 32, default: '127.0.0.1', null: false
    t.integer 'port', default: 8085, null: false
    t.integer 'icon', limit: 1, default: 0, null: false, unsigned: true
    t.integer 'realmflags', limit: 1, default: 2, null: false, comment: 'Supported masks: 0x1 (invalid, not show in realm list), 0x2 (offline, set by mangosd), 0x4 (show version and build), 0x20 (new players), 0x40 (recommended)', unsigned: true
    t.integer 'timezone', limit: 1, default: 0, null: false, unsigned: true
    t.integer 'allowedSecurityLevel', limit: 1, default: 0, null: false, unsigned: true
    t.float 'population', default: 0.0, null: false, unsigned: true
    t.string 'realmbuilds', limit: 64, default: '', null: false
    t.index ['name'], name: 'idx_name', unique: true
  end

  create_table 'uptime', primary_key: %w[realmid starttime], options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC', comment: 'Uptime system', force: :cascade do |t|
    t.integer 'realmid', null: false, unsigned: true
    t.bigint 'starttime', default: 0, null: false, unsigned: true
    t.string 'startstring', limit: 64, default: '', null: false
    t.bigint 'uptime', default: 0, null: false, unsigned: true
    t.integer 'maxplayers', limit: 2, default: 0, null: false, unsigned: true
  end
end
