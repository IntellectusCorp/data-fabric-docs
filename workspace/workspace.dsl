/*
 * This is a combined version of the following workspaces:
 *
 * - "Big Bank plc - System Landscape" (https://structurizr.com/share/28201/)
 * - "Big Bank plc - Internet Banking System" (https://structurizr.com/share/36141/)
*/
workspace "Int2 Data Fabric" "The workspace to illustrate the key features of Data Fabric." {
    !docs docs
    !adrs adrs

    model {
        # customer = person "Personal Banking Customer" "A customer of the bank, with personal bank accounts." "Customer"
        dataConsumer = person "Data Consumer" "A consumer who are needed a data in various context." "Data Consumer"
        dataOwner = person "Data Owner" "A provider who owned data set." "Data Owner"
        enterpriseERP = softwaresystem "ERP" "A type of data source, ERP." "Data Sources"
        dataLake = softwaresystem "Data Lake" "A type of data source, Data Lake." "Data Sources"
        dataWarehouse = softwaresystem "Data Warehouse" "A type of data source, Data Warehouse." "Data Sources"
        cloudDataStorage = softwaresystem "Cloud Data Storage" "A type of data source, Cloud Data Storage." "Data Sources"

        # generator = softwaresystem "Generator" "Gathering knowledge through extracting GPT engine based external system."
        enterprise "Int2 Data Fabric" {

            fabricCore = softwaresystem "Fabric Core" "Weaving together structured and contextualized knowledge from diverse sources." "Int2 Data Fabric" {
                !docs data-fabric-core/docs
                !adrs data-fabric-core/adrs
               //  properties {
               //      "Owner" "Customer Services"
               //      "Development Team" "Dev/Internet Services"
               //  }

               dataTailoringEngine =  container "Data Tailoring Engine" "Provides a mechanism to orchestrate the data with the governances." ""
               knowledgeWeaver = container "Knowledge Weaver" "Provides a sustainable mechanism to gather a knowledge from diverse source and than processed it to enable automation." "Python and AWS Lambda" "Serverless Application"
               knowledgeFabric = container "Knowledge Fabric" "Weaving together structured and contextualized knowledge from diverse sources." "Knowledge Fabric" 
               dataGovernance = container "Data Governance" "Data Governance" "Data Fabric"
               activeMetadata = container "Active Metadata" "Active metadata." "Data Fabric"
               dataCatalog = container "Data Catalog" "Data Catalog." "Data Fabric"
               informationRetrievalEngine = container "Information Retrieval Engine" "Information Retrieval." "Data Fabric"
               knowledgeGraphDatabase = container "Knowledge Graph Database" "Database to store graph structure of data" "Database"
            }

            dataExplorer = softwaresystem "Data Explorer" "Data Portal to provide GUI to end users." "Int2 Data Fabric"
            fabricBroker = softwaresystem "Fabric Broker" "Broker to manage data pipeline." "Int2 Data Fabric"
        }

        # relationships between people and software systems
        dataConsumer -> dataExplorer
        fabricBroker -> dataOwner "data pipeline"
        fabricBroker -> enterpriseERP "data pipeline"
        fabricBroker -> dataLake "data pipeline"
        fabricBroker -> dataWarehouse "data pipeline"
        fabricBroker -> cloudDataStorage "data pipeline"

        # relationships to/from containers
        dataExplorer -> fabricCore "uses"
        fabricBroker -> fabricCore "uses"
        
        activeMetadata -> knowledgeFabric "Integrates"
        activeMetadata -> dataGovernance "Integrates"
        
        dataTailoringEngine -> dataGovernance "Integrates"

        informationRetrievalEngine -> dataGovernance "Integrates"
        informationRetrievalEngine -> activeMetadata "Integrates"
        informationRetrievalEngine -> knowledgeFabric "Integrates"

        knowledgeWeaver -> knowledgeFabric "organizes"
        knowledgeWeaver -> knowledgeGraphDatabase "builds"

        knowledgeFabric -> knowledgeGraphDatabase "explorers"

        dataCatalog -> activeMetadata "associates"

      //   deploymentEnvironment "Development" {
      //       deploymentNode "Developer Laptop" "" "Microsoft Windows 10 or Apple macOS" {
      //           deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
      //               developerSinglePageApplicationInstance = containerInstance singlePageApplication
      //           }
      //           deploymentNode "Docker Container - Web Server" "" "Docker" {
      //               deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
      //                   developerWebApplicationInstance = containerInstance webApplication
      //                   developerApiApplicationInstance = containerInstance apiApplication
      //               }
      //           }
      //           deploymentNode "Docker Container - Database Server" "" "Docker" {
      //               deploymentNode "Database Server" "" "Oracle 12c" {
      //                   developerDatabaseInstance = containerInstance database
      //               }
      //           }
      //       }
      //   }

      //   deploymentEnvironment "Live" {
      //       deploymentNode "Customer's mobile device" "" "Apple iOS or Android" {
      //           liveMobileAppInstance = containerInstance mobileApp
      //       }
      //       deploymentNode "Customer's computer" "" "Microsoft Windows or Apple macOS" {
      //           deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
      //               liveSinglePageApplicationInstance = containerInstance singlePageApplication
      //           }
      //       }

      //       deploymentNode "Big Bank plc" "" "Big Bank plc data center" {
      //           deploymentNode "bigbank-web***" "" "Ubuntu 16.04 LTS" "" 4 {
      //               deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
      //                   liveWebApplicationInstance = containerInstance webApplication
      //               }
      //           }
      //           deploymentNode "bigbank-api***" "" "Ubuntu 16.04 LTS" "" 8 {
      //               deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
      //                   liveApiApplicationInstance = containerInstance apiApplication
      //               }
      //           }

      //           deploymentNode "bigbank-db01" "" "Ubuntu 16.04 LTS" {
      //               primaryDatabaseServer = deploymentNode "Oracle - Primary" "" "Oracle 12c" {
      //                   livePrimaryDatabaseInstance = containerInstance database
      //               }
      //           }
      //           deploymentNode "bigbank-db02" "" "Ubuntu 16.04 LTS" "Failover" {
      //               secondaryDatabaseServer = deploymentNode "Oracle - Secondary" "" "Oracle 12c" "Failover" {
      //                   liveSecondaryDatabaseInstance = containerInstance database "Failover"
      //               }
      //           }
      //       }

      //       primaryDatabaseServer -> secondaryDatabaseServer "Replicates data to"
      //   }
    }

    views {
        properties {
            "c4plantuml.elementProperties" "true"
            "generatr.style.colors.primary" "#485fc7"
            "generatr.style.colors.secondary" "#ffffff"
            // "generatr.style.faviconPath" "site/favicon.ico"
            // "generatr.style.logoPath" "site/logo.png"
        }

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext fabricCore "SystemContext" {
            include *
            animation {
               fabricCore
            }
            autoLayout
        }

        container fabricCore "Containers" {
            include *
            animation {
               activeMetadata
               dataTailoringEngine
               knowledgeWeaver
               knowledgeFabric
               dataGovernance
               informationRetrievalEngine
               knowledgeGraphDatabase
            }
            autoLayout
        }

      //   dynamic apiApplication "SignIn" "Summarises how the sign in feature works in the single-page application." {
      //       singlePageApplication -> signinController "Submits credentials to"
      //       signinController -> securityComponent "Validates credentials using"
      //       securityComponent -> database "select * from users where username = ?"
      //       database -> securityComponent "Returns user data to"
      //       securityComponent -> signinController "Returns true if the hashed password matches"
      //       signinController -> singlePageApplication "Sends back an authentication token to"
      //       autoLayout
      //   }

      //   deployment internetBankingSystem "Development" "DevelopmentDeployment" {
      //       include *
      //       animation {
      //           developerSinglePageApplicationInstance
      //           developerWebApplicationInstance developerApiApplicationInstance
      //           developerDatabaseInstance
      //       }
      //       autoLayout
      //   }

      //   deployment internetBankingSystem "Live" "LiveDeployment" {
      //       include *
      //       animation {
      //           liveSinglePageApplicationInstance
      //           liveMobileAppInstance
      //           liveWebApplicationInstance liveApiApplicationInstance
      //           livePrimaryDatabaseInstance
      //           liveSecondaryDatabaseInstance
      //       }
      //       autoLayout
      //   }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }
}