// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package nl.xservices.plugins;

import android.content.Intent;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaActivity;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;

public class LaunchMyApp extends CordovaPlugin
{

    private static final String ACTION_CHECKINTENT = "checkIntent";

    public LaunchMyApp()
    {
    }

    public boolean execute(String s, JSONArray jsonarray, CallbackContext callbackcontext)
        throws JSONException
    {
        if ("checkIntent".equalsIgnoreCase(s))
        {
            s = ((CordovaActivity)webView.getContext()).getIntent();
            if (s.getDataString() != null)
            {
                callbackcontext.sendPluginResult(new PluginResult(org.apache.cordova.PluginResult.Status.OK, s.getDataString()));
                s.setData(null);
                return true;
            } else
            {
                callbackcontext.error("App was not started via the launchmyapp URL scheme. Ignoring this errorcallback is the best approach.");
                return false;
            }
        } else
        {
            callbackcontext.error("This plugin only responds to the checkIntent action.");
            return false;
        }
    }

    public void onNewIntent(Intent intent)
    {
        String s = intent.getDataString();
        if (intent.getDataString() != null)
        {
            intent.setData(null);
            webView.loadUrl((new StringBuilder()).append("javascript:handleOpenURL('").append(s).append("');").toString());
        }
    }
}
