<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla para el documento completo -->
    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>
                <xsl:value-of select="receta/titulo"/>
            </title>
            <link rel="stylesheet" href="../CSS/recetas.css"/>
        </head>
        <body>
            <div class="container">
                <!-- Menú de navegación -->
                <header class="menu">
                    <div class="title">
                        <img src="../images/delicias_kitchen.png"/>
                    </div>
                    <hr/>
                    <div class="buttons">
                        <a href="../listado/index.html"><button>INICIO</button></a>
                        <a href="../listado/sobre-mi.html"><button>SOBRE MÍ</button></a>
                        <a href="recetas.html"><button>RECETAS</button></a>
                        <a href="../contacto/contacto.html"><button>CONTACTO</button></a>
                        <a href="../listado/index.html"><button>OTRAS COSAS</button></a>
                    </div>
                    <hr/>
                </header>

                <!-- Contenido principal de la receta -->
                <div class="content">
                    <div class="sidebar">
                        <h3>Sobre la receta</h3>
                        <p>
                            <xsl:value-of select="receta/descripcion"/>
                        </p>
                        <!-- Verificar si la imagen está presente -->
                        <xsl:if test="receta/imagen">
                            <img src="../images/{receta/imagen}" alt="Receta Imagen"/>
                        </xsl:if>
                    </div>

                    <div class="main-content">
                        <article class="recipe">
                            <h2><xsl:value-of select="receta/titulo"/></h2>
                            <p><small><xsl:value-of select="receta/fecha"/></small></p>
                            <p><xsl:value-of select="receta/descripcion_larga"/></p>
                            <!-- Verificar si la imagen principal está presente -->
                            <xsl:if test="receta/imagen_principal">
                                <img src="../images/{receta/imagen_principal}" alt="Imagen principal de la receta" width="400" height="250"/>
                            </xsl:if>

                            <!-- Ingredientes -->
                            <section class="ingredients">
                                <h3>Ingredientes</h3>
                                <ul>
                                    <xsl:for-each select="receta/ingredientes/ingrediente">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                            </section>
                            <!-- Tiempo de la receta -->
                            <section class="tiempo">
                                <h3>Tiempo de preparacion</h3>
                                <h5>
                                    <xsl:for-each select="receta/tiempo">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </h5>
                            </section>
                            <!-- Pasos de la receta -->
                            <section class="steps">
                                <h3>Instrucciones</h3>
                                <ol>
                                    <xsl:for-each select="receta/pasos/paso">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ol>
                            </section>

                        </article>
                    </div>
                </div>

                <!-- Footer -->
                <div class="footer">
                    <a href="#">FACEBOOK</a> |
                    <a href="#">TWITTER</a> |
                    <a href="#">INSTAGRAM</a> |
                    <a href="#">PINTEREST</a> |
                    <a href="#">EMAIL</a> |
                    <a href="#">RSS</a>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
