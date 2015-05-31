// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package net.moodlemoot.mootes14;

import android.os.Bundle;
import org.apache.cordova.CordovaActivity;

public class mootes14 extends CordovaActivity
{

    public mootes14()
    {
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        loadUrl(launchUrl);
    }
}
