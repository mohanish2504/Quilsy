from quilsyserver.models import Clip
from django.urls import include, path
from rest_framework import routers
from .views import *

router = routers.DefaultRouter()

urlpatterns = [
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('getClips/', getClips.as_view()),
    path('saveClip/', saveClip.as_view()),
    path('updateClip/', updateClip.as_view())
    
]