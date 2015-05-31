// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package net.tunts.webintent;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.text.Html;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaActivity;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class WebIntent extends CordovaPlugin
{

    private CallbackContext onNewIntentCallback;

    public WebIntent()
    {
        onNewIntentCallback = null;
    }

    public boolean execute(String s, JSONArray jsonarray, CallbackContext callbackcontext)
    {
        if (!s.equals("startActivity")) goto _L2; else goto _L1
_L1:
        if (jsonarray.length() == 1)
        {
            break MISSING_BLOCK_LABEL_33;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
        JSONObject jsonobject = jsonarray.getJSONObject(0);
        if (!jsonobject.has("type")) goto _L4; else goto _L3
_L3:
        s = jsonobject.getString("type");
_L19:
        if (!jsonobject.has("url")) goto _L6; else goto _L5
_L5:
        jsonarray = Uri.parse(jsonobject.getString("url"));
_L20:
        if (!jsonobject.has("extras")) goto _L8; else goto _L7
_L7:
        Object obj = jsonobject.getJSONObject("extras");
_L21:
        if (!jsonobject.has("handler")) goto _L10; else goto _L9
_L9:
        Object obj1 = jsonobject.getJSONObject("handler");
_L22:
        HashMap hashmap = new HashMap();
        String s1 = null;
        if (obj == null) goto _L12; else goto _L11
_L11:
        JSONArray jsonarray1;
        String s2;
        int i;
        try
        {
            jsonarray1 = ((JSONObject) (obj)).names();
        }
        // Misplaced declaration of an exception variable
        catch (String s)
        {
            callbackcontext.error(s.getMessage());
            return false;
        }
        i = 0;
        if (i >= jsonarray1.length())
        {
            break; /* Loop/switch isn't completed */
        }
        s2 = jsonarray1.getString(i);
        hashmap.put(s2, ((JSONObject) (obj)).getString(s2));
        i++;
        if (true) goto _L13; else goto _L12
_L13:
        break MISSING_BLOCK_LABEL_144;
_L12:
        obj = s1;
        if (obj1 == null)
        {
            break MISSING_BLOCK_LABEL_241;
        }
        obj = new HashMap();
        ((Map) (obj)).put("packageName", ((JSONObject) (obj1)).getString("packageName"));
        ((Map) (obj)).put("className", ((JSONObject) (obj1)).getString("className"));
        startActivity(jsonobject.getString("action"), jsonarray, s, hashmap, ((Map) (obj)));
        callbackcontext.success();
        return true;
        s;
        callbackcontext.error(s.getMessage());
        return false;
_L2:
        if (!s.equals("hasExtra"))
        {
            break MISSING_BLOCK_LABEL_351;
        }
        if (jsonarray.length() == 1)
        {
            break MISSING_BLOCK_LABEL_308;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
        s = ((CordovaActivity)cordova.getActivity()).getIntent();
        jsonarray = jsonarray.getString(0);
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.OK, s.hasExtra(jsonarray)));
        return true;
        if (!s.equals("getExtra"))
        {
            break MISSING_BLOCK_LABEL_451;
        }
        if (jsonarray.length() == 1)
        {
            break MISSING_BLOCK_LABEL_384;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
        s = ((CordovaActivity)cordova.getActivity()).getIntent();
        jsonarray = jsonarray.getString(0);
        if (!s.hasExtra(jsonarray))
        {
            break MISSING_BLOCK_LABEL_435;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.OK, s.hasExtra(jsonarray)));
        return true;
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.ERROR));
        return false;
        if (!s.equals("getUri"))
        {
            break MISSING_BLOCK_LABEL_507;
        }
        if (jsonarray.length() == 0)
        {
            break MISSING_BLOCK_LABEL_483;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
        callbackcontext.success(((CordovaActivity)cordova.getActivity()).getIntent().getDataString());
        return true;
        if (!s.equals("onNewIntent"))
        {
            break MISSING_BLOCK_LABEL_567;
        }
        if (jsonarray.length() == 0)
        {
            break MISSING_BLOCK_LABEL_539;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
        onNewIntentCallback = callbackcontext;
        s = new PluginResult(org.apache.cordova.PluginResult.Status.NO_RESULT);
        s.setKeepCallback(true);
        callbackcontext.sendPluginResult(s);
        return true;
        if (!s.equals("sendBroadcast")) goto _L15; else goto _L14
_L14:
        if (jsonarray.length() == 1)
        {
            break MISSING_BLOCK_LABEL_600;
        }
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
        jsonarray = jsonarray.getJSONObject(0);
        if (!jsonarray.has("extras"))
        {
            break MISSING_BLOCK_LABEL_755;
        }
        s = jsonarray.getJSONObject("extras");
_L23:
        obj = new HashMap();
        if (s == null) goto _L17; else goto _L16
_L16:
        obj1 = s.names();
        i = 0;
_L18:
        if (i >= ((JSONArray) (obj1)).length())
        {
            break; /* Loop/switch isn't completed */
        }
        s1 = ((JSONArray) (obj1)).getString(i);
        ((Map) (obj)).put(s1, s.getString(s1));
        i++;
        if (true) goto _L18; else goto _L17
_L17:
        sendBroadcast(jsonarray.getString("action"), ((Map) (obj)));
        callbackcontext.success();
        return true;
_L15:
        callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.INVALID_ACTION));
        return false;
_L4:
        s = null;
          goto _L19
_L6:
        jsonarray = null;
          goto _L20
_L8:
        obj = null;
          goto _L21
_L10:
        obj1 = null;
          goto _L22
        s = null;
          goto _L23
    }

    public void onNewIntent(Intent intent)
    {
        if (onNewIntentCallback != null)
        {
            onNewIntentCallback.success(intent.getDataString());
        }
    }

    void sendBroadcast(String s, Map map)
    {
        Intent intent = new Intent();
        intent.setAction(s);
        String s1;
        for (s = map.keySet().iterator(); s.hasNext(); intent.putExtra(s1, (String)map.get(s1)))
        {
            s1 = (String)s.next();
        }

        ((CordovaActivity)cordova.getActivity()).sendBroadcast(intent);
    }

    void startActivity(String s, Uri uri, String s1, Map map, Map map1)
    {
        if (uri != null)
        {
            s = new Intent(s, uri);
        } else
        {
            s = new Intent(s);
        }
        if (map1 != null)
        {
            s.setClassName((String)map1.get("packageName"), (String)map1.get("className"));
        }
        if (s1 != null && uri != null)
        {
            s.setDataAndType(uri, s1);
            break MISSING_BLOCK_LABEL_63;
        } else
        {
            if (s1 != null)
            {
                s.setType(s1);
            }
            continue;
        }
        do
        {
            for (uri = map.keySet().iterator(); uri.hasNext();)
            {
                map1 = (String)uri.next();
                String s2 = (String)map.get(map1);
                if (map1.equals("android.intent.extra.TEXT") && s1.equals("text/html"))
                {
                    s.putExtra(map1, Html.fromHtml(s2));
                } else
                if (map1.equals("android.intent.extra.STREAM"))
                {
                    s.putExtra(map1, Uri.parse(s2));
                } else
                if (map1.equals("android.intent.extra.EMAIL"))
                {
                    s.putExtra("android.intent.extra.EMAIL", new String[] {
                        s2
                    });
                } else
                {
                    s.putExtra(map1, s2);
                }
            }

            ((CordovaActivity)cordova.getActivity()).startActivity(s);
            return;
        } while (true);
    }
}
