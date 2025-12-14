## Commercial Enterprise DBMS
An sqlite database system managing various aspects of a commercial enterprise, such as customers, suppliers, products, employees, purchases from suppliers and sales to customers.

# Entity-Relationship Diagram
https://github.com/andreasdarsa/Commercial-Enterprise-DBMS/blob/main/er_diagram_4403.jpg

# Relationships explained
- **Purchase_from_supplier**: This is an **N:M** relationship between **Supplier** and **Product**, considering a product could be bought from various suppliers and one supplier could supply various products to the company.
- **Sale_to_customer**: This is an **N:M:1** relationship between **Product**, **Customer** and **Employee**. A product could be bought by various customers and various customers could buy the same product. However, only one employee participates per sale (e.g. the cashier at the checkout) and their participation is not even mandatory (in case the purchase happens online)

# Relational model
<img width="805" height="417" alt="image" src="https://github.com/user-attachments/assets/526836ed-a8b5-410d-9fce-5688304ff4b4" />

