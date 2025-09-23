from django.db import models

class Category(models.Model):
    category_id = models.CharField(max_length=11, primary_key=True)
    category_name = models.CharField(max_length=100, null=True, blank=True)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.category_name or self.category_id


class Supplier(models.Model):
    supplier_id = models.CharField(max_length=11, primary_key=True)
    supplier_name = models.CharField(max_length=100, null=True, blank=True)

    def __str__(self):
        return self.supplier_name or self.supplier_id


class SupplierContact(models.Model):
    contact_id = models.CharField(max_length=11, primary_key=True)
    email = models.EmailField(max_length=100, null=True, blank=True)
    phoneNumber = models.CharField(max_length=20, null=True, blank=True)
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.email or self.contact_id


class Customer(models.Model):
    customer_id = models.CharField(max_length=11, primary_key=True)
    name = models.CharField(max_length=100, null=True, blank=True)
    address = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.name or self.customer_id


class CustomerContact(models.Model):
    contact_id = models.CharField(max_length=11, primary_key=True)
    email = models.EmailField(max_length=100, null=True, blank=True)
    phoneNumbers = models.CharField(max_length=20, null=True, blank=True)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.email or self.contact_id


class Product(models.Model):
    product_id = models.CharField(max_length=11, primary_key=True)
    name = models.CharField(max_length=100, null=True, blank=True)
    number = models.IntegerField(default=0)
    picture = models.TextField(null=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True, blank=True)
    supplier = models.ForeignKey(Supplier, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name or self.product_id


class Purchase(models.Model):
    purchases_id = models.CharField(max_length=11, primary_key=True)
    purchase_date = models.DateField(null=True, blank=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.purchases_id


class OrderDetail(models.Model):
    STATUS_CHOICES = [
        ('NotDelivered', 'NotDelivered'),
        ('pending', 'pending'),
        ('Delivered', 'Delivered'),
        ('', 'Unknown'),
    ]
    order_id = models.CharField(max_length=11, primary_key=True)
    order_created_by = models.DateTimeField(null=True, blank=True)
    order_updated_at = models.DateTimeField(null=True, blank=True)
    order_status = models.CharField(max_length=20, choices=STATUS_CHOICES, null=True, blank=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True, blank=True)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return f"{self.order_id} - {self.order_status or 'Unknown'}"
