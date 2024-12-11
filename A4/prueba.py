import os
from lxml import etree

# Ruta al directorio que contiene receta.xml y receta.xsl
base_dir = r"C:\Users\SALUD\Downloads\VM\vscode\A4\receta"

# Cambiar al directorio base
os.chdir(base_dir)

# Rutas de los archivos XML y XSL
xml_path = os.path.join(base_dir, "receta.xml")  # XML con todas las recetas
xsl_path = os.path.join(base_dir, "receta.xsl")  # Transformación XSLT

try:
    # Cargar el archivo XML
    xml_tree = etree.parse(xml_path)

    # Cargar el archivo XSL
    xsl_tree = etree.parse(xsl_path)

    # Crear el transformador XSLT
    transform = etree.XSLT(xsl_tree)

    # Encontrar todas las recetas en el XML
    recetas = xml_tree.xpath("//receta")

    # Generar un archivo HTML por cada receta directamente en la carpeta base
    for i, receta in enumerate(recetas, start=1):
        # Crear un árbol XML solo con la receta actual
        receta_tree = etree.ElementTree(receta)

        # Aplicar la transformación
        result_tree = transform(receta_tree)

        # Generar el nombre del archivo para cada receta
        titulo = receta.find("titulo").text.strip().replace(" ", "_").lower()
        output_file = os.path.join(base_dir, f"{titulo}.html")  # Guardar directamente en la carpeta base

        # Guardar el resultado
        with open(output_file, "wb") as f:
            f.write(etree.tostring(result_tree, pretty_print=True, encoding="utf-8"))

        print(f"Archivo generado: {output_file}")

except Exception as e:
    print(f"Ocurrió un error: {e}")
