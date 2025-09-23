from django.db.models import Sum
from django.shortcuts import render 
from .models import Product, Supplier, Customer, Purchase, OrderDetail

def dashboard(request):
    total_products = Product.objects.aggregate(total=Sum("number"))["total"] or 0
    total_suppliers = Supplier.objects.count()
    total_customers = Customer.objects.count()
    total_purchases = Purchase.objects.count()
    total_orders = OrderDetail.objects.count()

    context = {
        "total_products": total_products,
        "total_suppliers": total_suppliers,
        "total_customers": total_customers,
        "total_purchases": total_purchases,
        "total_orders": total_orders,
    }
    return render(request, "ims/dashboard.html", context)
