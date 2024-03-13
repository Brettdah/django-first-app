from django.shortcuts import render

def djapp(request):
    return render(request, 'hello_world.html', {})
