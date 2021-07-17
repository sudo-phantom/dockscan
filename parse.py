from lxml import etree

x = etree.parse('./data/vulners-open.xml')
pretty_xml = etree.tostring(x, pretty_print=True, encoding=str)
print(pretty_xml)
