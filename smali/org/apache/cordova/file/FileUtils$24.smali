.class Lorg/apache/cordova/file/FileUtils$24;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$f:Lorg/apache/cordova/file/FileUtils$FileOp;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 537
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$24;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$24;->val$f:Lorg/apache/cordova/file/FileUtils$FileOp;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 540
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$f:Lorg/apache/cordova/file/FileUtils$FileOp;

    invoke-interface {v1}, Lorg/apache/cordova/file/FileUtils$FileOp;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 565
    :goto_0
    return-void

    .line 541
    :catch_0
    move-exception v0

    .line 542
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 543
    instance-of v1, v0, Lorg/apache/cordova/file/EncodingException;

    if-eqz v1, :cond_0

    .line 544
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 545
    :cond_0
    instance-of v1, v0, Ljava/io/FileNotFoundException;

    if-eqz v1, :cond_1

    .line 546
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->NOT_FOUND_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 547
    :cond_1
    instance-of v1, v0, Lorg/apache/cordova/file/FileExistsException;

    if-eqz v1, :cond_2

    .line 548
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->PATH_EXISTS_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 549
    :cond_2
    instance-of v1, v0, Lorg/apache/cordova/file/NoModificationAllowedException;

    if-eqz v1, :cond_3

    .line 550
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->NO_MODIFICATION_ALLOWED_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 551
    :cond_3
    instance-of v1, v0, Lorg/apache/cordova/file/InvalidModificationException;

    if-eqz v1, :cond_4

    .line 552
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->INVALID_MODIFICATION_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 553
    :cond_4
    instance-of v1, v0, Ljava/net/MalformedURLException;

    if-eqz v1, :cond_5

    .line 554
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 555
    :cond_5
    instance-of v1, v0, Ljava/io/IOException;

    if-eqz v1, :cond_6

    .line 556
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->INVALID_MODIFICATION_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 557
    :cond_6
    instance-of v1, v0, Lorg/apache/cordova/file/EncodingException;

    if-eqz v1, :cond_7

    .line 558
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 559
    :cond_7
    instance-of v1, v0, Lorg/apache/cordova/file/TypeMismatchException;

    if-eqz v1, :cond_8

    .line 560
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->TYPE_MISMATCH_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 562
    :cond_8
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->UNKNOWN_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0
.end method
