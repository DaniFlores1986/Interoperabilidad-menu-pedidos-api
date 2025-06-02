workspace "Sistema de Gestión de Menús y Pedidos" {
    description "Plataforma para que empresas corporativas soliciten menús y gestionen pedidos con Turconagro"

    model {
        // Personas
        cliente = person "Cliente Corporativo" "Empresa que solicita comida para sus empleados"
        operador = person "Operador de Turconagro" "Administra menús y verifica pedidos"

        // Sistema principal
        sistema = softwareSystem "Sistema de Gestión de Menús y Pedidos" {
            tags "Sistema"

            // Contenedor: Portal del Cliente
            portalCliente = container "Portal Web del Cliente Corporativo" "Permite ver menús y hacer pedidos" "Aplicación Web"
            cliente -> portalCliente "Consulta menús y realiza pedidos"

            // Contenedor: Portal del Administrador
            portalAdmin = container "Portal Web del Operador" "Permite al operador administrar menús y pedidos" "Aplicación Web"
            operador -> portalAdmin "Administra menús y verifica pedidos"

            // Contenedor: API
            api = container "API REST" "Expone servicios para la app web del cliente y del operador" "Spring Boot" {
                // Componentes dentro de la API
                controladorPedidos = component "Controlador de Pedidos" "Expone los endpoints REST para pedidos"
                controladorAdmin = component "Controlador de Administración" "Endpoints para gestionar menús y pedidos"
                servicioNegocio = component "Servicio de Negocio" "Contiene la lógica para pedidos y menús"
                repositorioDatos = component "Repositorio de Datos" "Accede a la base de datos"
                notificador = component "Componente de Notificación" "Envía notificaciones al cliente"

                portalCliente -> controladorPedidos "Invoca endpoints de pedidos"
                portalAdmin -> controladorAdmin "Invoca endpoints administrativos"

                controladorPedidos -> servicioNegocio "Usa lógica de negocio"
                controladorAdmin -> servicioNegocio "Usa lógica de negocio"
                servicioNegocio -> repositorioDatos "Consulta y modifica datos"
                servicioNegocio -> notificador "Envía notificaciones"
            }

            // Contenedor: Base de Datos
            baseDatos = container "Base de Datos" "Almacena menús, pedidos y usuarios" "MySQL"
            api -> baseDatos "Consulta y modifica datos"
        }
    }

    views {
        // Vista de contexto del sistema
        systemContext sistema {
            include *
            autolayout lr
        }

        // Vista de contenedores
        container sistema {
            include *
            autolayout lr
        }

        // Vista de componentes dentro de la API
        component api "componentes_api_rest" {
            include *
            autolayout lr
        }

        styles {
            element "Sistema" {
                shape RoundedBox
                background #0B84A5
                color #ffffff
            }

            element "Person" {
                shape Person
                background #6B8E23
                color #ffffff
            }

            element "AppWeb" {
                shape WebBrowser
                background #A5C8D8
            }

            element "Api" {
                shape Hexagon
                background #F6C85F
            }

            element "Database" {
                shape Cylinder
                background #9C27B0
                color #ffffff
            }
        }

        theme "https://srv-si-001.utpl.edu.ec/REST_PRO_ERP/Recursos/Imagenes/themeAZ_2023.json"
    }
}