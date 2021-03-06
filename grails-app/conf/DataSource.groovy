hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
  development {
    dataSource {
      dialect = org.hibernate.dialect.MySQLInnoDBDialect
      pooled = true
      driverClassName = "com.mysql.jdbc.Driver"
      username = "root"
      password = ""
      dbCreate = "update" // one of 'create', 'create-drop','update'
      url = "jdbc:mysql://localhost/wendysStoreDev"
    }
  }
  test {
    dataSource {
      dialect = org.hibernate.dialect.MySQLInnoDBDialect
      pooled = true
      driverClassName = "com.mysql.jdbc.Driver"
      username = "root"
      password = ""
      dbCreate = "update"
      url = "jdbc:mysql://localhost/wendysStoreTest"
    }
  }
  production {
    dataSource {
      dialect = org.hibernate.dialect.MySQLInnoDBDialect      
      pooled = false
      dbCreate = "update"
      jndiName = "java:comp/env/jdbc/WendysStoreProdDB"
    }
  }
}