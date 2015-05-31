.class public Lnet/tunts/webintent/WebIntent;
.super Lorg/apache/cordova/CordovaPlugin;
.source "WebIntent.java"


# instance fields
.field private onNewIntentCallback:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/tunts/webintent/WebIntent;->onNewIntentCallback:Lorg/apache/cordova/CallbackContext;

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 18
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 43
    :try_start_0
    const-string v2, "startActivity"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 44
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    .line 45
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 46
    .local v16, "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 47
    const/4 v2, 0x0

    .line 180
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :goto_0
    return v2

    .line 51
    :cond_0
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    .line 52
    .local v15, "obj":Lorg/json/JSONObject;
    const-string v2, "type"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "type"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 53
    .local v5, "type":Ljava/lang/String;
    :goto_1
    const-string v2, "url"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "url"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 54
    .local v4, "uri":Landroid/net/Uri;
    :goto_2
    const-string v2, "extras"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "extras"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 55
    .local v11, "extras":Lorg/json/JSONObject;
    :goto_3
    const-string v2, "handler"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "handler"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 56
    .local v12, "handler":Lorg/json/JSONObject;
    :goto_4
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 57
    .local v6, "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 60
    .local v7, "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v11, :cond_5

    .line 61
    invoke-virtual {v11}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v10

    .line 62
    .local v10, "extraNames":Lorg/json/JSONArray;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_5
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v13, v2, :cond_5

    .line 63
    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 64
    .local v14, "key":Ljava/lang/String;
    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 65
    .local v17, "value":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-interface {v6, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 52
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "type":Ljava/lang/String;
    .end local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "extraNames":Lorg/json/JSONArray;
    .end local v11    # "extras":Lorg/json/JSONObject;
    .end local v12    # "handler":Lorg/json/JSONObject;
    .end local v13    # "i":I
    .end local v14    # "key":Ljava/lang/String;
    .end local v17    # "value":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1

    .line 53
    .restart local v5    # "type":Ljava/lang/String;
    :cond_2
    const/4 v4, 0x0

    goto :goto_2

    .line 54
    .restart local v4    # "uri":Landroid/net/Uri;
    :cond_3
    const/4 v11, 0x0

    goto :goto_3

    .line 55
    .restart local v11    # "extras":Lorg/json/JSONObject;
    :cond_4
    const/4 v12, 0x0

    goto :goto_4

    .line 69
    .restart local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v7    # "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v12    # "handler":Lorg/json/JSONObject;
    :cond_5
    if-eqz v12, :cond_6

    .line 70
    new-instance v7, Ljava/util/HashMap;

    .end local v7    # "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 72
    .restart local v7    # "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "packageName"

    const-string v3, "packageName"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v7, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string v2, "className"

    const-string v3, "className"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v7, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 77
    :cond_6
    :try_start_1
    const-string v2, "action"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lnet/tunts/webintent/WebIntent;->startActivity(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 83
    :try_start_2
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 84
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 78
    :catch_0
    move-exception v8

    .line 79
    .local v8, "e":Landroid/content/ActivityNotFoundException;
    invoke-virtual {v8}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 80
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 86
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "type":Ljava/lang/String;
    .end local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "e":Landroid/content/ActivityNotFoundException;
    .end local v11    # "extras":Lorg/json/JSONObject;
    .end local v12    # "handler":Lorg/json/JSONObject;
    .end local v15    # "obj":Lorg/json/JSONObject;
    :cond_7
    const-string v2, "hasExtra"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 87
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_8

    .line 88
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 89
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 90
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 92
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/tunts/webintent/WebIntent;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaActivity;

    invoke-virtual {v2}, Lorg/apache/cordova/CordovaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v13

    .line 93
    .local v13, "i":Landroid/content/Intent;
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 94
    .local v9, "extraName":Ljava/lang/String;
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {v13, v9}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    move-object/from16 v0, v16

    invoke-direct {v0, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .line 95
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 96
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 98
    .end local v9    # "extraName":Ljava/lang/String;
    .end local v13    # "i":Landroid/content/Intent;
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_9
    const-string v2, "getExtra"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 99
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_a

    .line 100
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 101
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 102
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 104
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/tunts/webintent/WebIntent;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaActivity;

    invoke-virtual {v2}, Lorg/apache/cordova/CordovaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v13

    .line 105
    .restart local v13    # "i":Landroid/content/Intent;
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 107
    .restart local v9    # "extraName":Ljava/lang/String;
    invoke-virtual {v13, v9}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 108
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {v13, v9}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    move-object/from16 v0, v16

    invoke-direct {v0, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .line 109
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 110
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 113
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_b
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 114
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 115
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 118
    .end local v9    # "extraName":Ljava/lang/String;
    .end local v13    # "i":Landroid/content/Intent;
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_c
    const-string v2, "getUri"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 119
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-eqz v2, :cond_d

    .line 120
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 121
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 122
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 125
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/tunts/webintent/WebIntent;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaActivity;

    invoke-virtual {v2}, Lorg/apache/cordova/CordovaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v13

    .line 126
    .restart local v13    # "i":Landroid/content/Intent;
    invoke-virtual {v13}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "uri":Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 129
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 131
    .end local v4    # "uri":Ljava/lang/String;
    .end local v13    # "i":Landroid/content/Intent;
    :cond_e
    const-string v2, "onNewIntent"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 132
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-eqz v2, :cond_f

    .line 133
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 134
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 135
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 138
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_f
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lnet/tunts/webintent/WebIntent;->onNewIntentCallback:Lorg/apache/cordova/CallbackContext;

    .line 139
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 140
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 141
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 142
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 144
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_10
    const-string v2, "sendBroadcast"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 145
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_11

    .line 146
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 147
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 148
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 152
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :cond_11
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    .line 154
    .restart local v15    # "obj":Lorg/json/JSONObject;
    const-string v2, "extras"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    const-string v2, "extras"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 155
    .restart local v11    # "extras":Lorg/json/JSONObject;
    :goto_6
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 158
    .restart local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v11, :cond_13

    .line 159
    invoke-virtual {v11}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v10

    .line 160
    .restart local v10    # "extraNames":Lorg/json/JSONArray;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_7
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v13, v2, :cond_13

    .line 161
    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 162
    .restart local v14    # "key":Ljava/lang/String;
    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 163
    .restart local v17    # "value":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-interface {v6, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    add-int/lit8 v13, v13, 0x1

    goto :goto_7

    .line 154
    .end local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "extraNames":Lorg/json/JSONArray;
    .end local v11    # "extras":Lorg/json/JSONObject;
    .end local v13    # "i":I
    .end local v14    # "key":Ljava/lang/String;
    .end local v17    # "value":Ljava/lang/String;
    :cond_12
    const/4 v11, 0x0

    goto :goto_6

    .line 167
    .restart local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "extras":Lorg/json/JSONObject;
    :cond_13
    const-string v2, "action"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v6}, Lnet/tunts/webintent/WebIntent;->sendBroadcast(Ljava/lang/String;Ljava/util/Map;)V

    .line 168
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 169
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 173
    .end local v6    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "extras":Lorg/json/JSONObject;
    .end local v15    # "obj":Lorg/json/JSONObject;
    :cond_14
    new-instance v16, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 174
    .restart local v16    # "res":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 175
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 178
    .end local v16    # "res":Lorg/apache/cordova/PluginResult;
    :catch_1
    move-exception v8

    .line 179
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 180
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 186
    iget-object v0, p0, Lnet/tunts/webintent/WebIntent;->onNewIntentCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lnet/tunts/webintent/WebIntent;->onNewIntentCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 189
    :cond_0
    return-void
.end method

.method sendBroadcast(Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 226
    .local p2, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 227
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 228
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 229
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 230
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 233
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lnet/tunts/webintent/WebIntent;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    check-cast v4, Lorg/apache/cordova/CordovaActivity;

    invoke-virtual {v4, v1}, Lorg/apache/cordova/CordovaActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 234
    return-void
.end method

.method startActivity(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p4, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p5, "handlerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 194
    .local v0, "i":Landroid/content/Intent;
    :goto_0
    if-eqz p5, :cond_0

    .line 195
    const-string v4, "packageName"

    invoke-interface {p5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "className"

    invoke-interface {p5, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 198
    :cond_0
    if-eqz p3, :cond_3

    if-eqz p2, :cond_3

    .line 199
    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 206
    :cond_1
    :goto_1
    invoke-interface {p4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 207
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 209
    .local v3, "value":Ljava/lang/String;
    const-string v4, "android.intent.extra.TEXT"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "text/html"

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 210
    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    goto :goto_2

    .line 192
    .end local v0    # "i":Landroid/content/Intent;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 201
    .restart local v0    # "i":Landroid/content/Intent;
    :cond_3
    if-eqz p3, :cond_1

    .line 202
    invoke-virtual {v0, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 211
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v3    # "value":Ljava/lang/String;
    :cond_4
    const-string v4, "android.intent.extra.STREAM"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 214
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_2

    .line 215
    :cond_5
    const-string v4, "android.intent.extra.EMAIL"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 217
    const-string v4, "android.intent.extra.EMAIL"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 219
    :cond_6
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 222
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_7
    iget-object v4, p0, Lnet/tunts/webintent/WebIntent;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    check-cast v4, Lorg/apache/cordova/CordovaActivity;

    invoke-virtual {v4, v0}, Lorg/apache/cordova/CordovaActivity;->startActivity(Landroid/content/Intent;)V

    .line 223
    return-void
.end method
