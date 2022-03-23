from django.db.models.query_utils import Q
from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import *
from .models import *
import sys

SUCCESS_MESSAGE = 1
ERROR_MESSAGE = 0

class getClips(APIView):
    CLIP_ID = "clipId"
    SEARCH_KEY = "searchKey"
    def post(self,request):
        message = {}
        try:
            requestData = request.data
            print("data:" , requestData)

            clips = Clip.objects.all()

            if self.SEARCH_KEY in requestData.keys():
                clips = Clip.objects.filter(Q(clipText__icontains = requestData["searchKey"]) | Q(clipTitle__icontains = requestData["searchKey"]))

            clipsData = ClipSerializer(clips,many = True).data
            print("data ->  ",clipsData)
            result = {"clips": clipsData}
        except:
            result = {"message":sys.exc_info(),"result":ERROR_MESSAGE}
            print("Error -> ",result)
        finally: return Response(result)


class saveClip(APIView):
    def post(self,request):
        result = {}
        try:
            requestData = request.data
            clip_instance = Clip.objects.create(clipText= requestData["clipText"],clipTitle = requestData["clipTitle"])
            clip_instance.save()
        except:
            result = {"message":sys.exc_info(),"result":ERROR_MESSAGE}
            print("Error -> ",result)
        else:
            result['message'] = SUCCESS_MESSAGE
        return Response(result)

class updateClip(APIView):
    def post(self,request):
        result = {}
        try:
            requestData = request.data
            clip = Clip.objects.get(pk = requestData["id"])
            clip.clipTitle = requestData["clipTitle"]
            clip.clipText = requestData["clipText"]
            clip.save()
        except:
            result = {"message":sys.exc_info(),"result":ERROR_MESSAGE}
            print("Error -> ",result)
        else:
            result['message'] = SUCCESS_MESSAGE
        return Response(result)
        
        



            