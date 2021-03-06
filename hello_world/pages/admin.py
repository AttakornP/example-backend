from django.contrib import admin
from pages.models import Invite


class InviteAdmin(admin.ModelAdmin):
    list_display = ("name", "branch", "gender", "date_of_birth", "race")
    list_filter = ("branch", "gender", "race")
    search_fields = ("name",)

admin.site.register(Invite, InviteAdmin)
