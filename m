Received: from www.altera.com ([66.35.227.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iWu2-0002zG-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 08:36:02 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id AAA06985
	for <linux-mtd@lists.infradead.org>; Wed, 6 Mar 2002 00:42:51 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.6/8.11.6) id g268lKv09419
	for linux-mtd@lists.infradead.org; Wed, 6 Mar 2002 08:47:20 GMT
Message-Id: <200203060847.g268lKv09419@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: Fwd: jffs2 & new linux zlib
Date: Wed, 6 Mar 2002 08:47:20 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

What, no comments at all? Shall I just check this in then? - it works for me.

Clive

----------  Forwarded Message  ----------

Subject: jffs2 & new linux zlib
Date: Tue, 19 Feb 2002 14:24:30 +0000
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org

In testing jffs2 in linux 2.5.4-rmk1 I've found that kmalloc cannot allocate
objects of the size returned by zlib_deflate_workspacesize() and
zlib_inflate_workspacesize(). The patch below uses vmalloc to sucessfully
allocate the memory, however I'm not sure that this is the best approach.,
maybe it would be better to try and reduce the size of the deflate_workspace
& inflate workspace in zlib? (This might be a ridiculous idea, I haven't a
clue how zlib works) Any suggestions?

--- linux_2.5.4-rmk1/fs/jffs2/compr_zlib.c	Mon Feb 11 01:50:06 2002
+++ linux/fs/jffs2/compr_zlib.c	Tue Feb 19 13:33:24 2002
@@ -80,8 +80,7 @@ int zlib_compress(unsigned char *data_in
 		return -1;

 #ifdef __KERNEL__
-	strm.workspace = kmalloc(zlib_deflate_workspacesize(),
-				 GFP_KERNEL);
+	strm.workspace = vmalloc(zlib_deflate_workspacesize());
 	if (strm.workspace == NULL) {
 		printk(KERN_WARNING "deflateInit alloc of workspace failed\n");
 		return -1;
@@ -123,7 +122,7 @@ int zlib_compress(unsigned char *data_in

 	}
 	zlib_deflateEnd(&strm);
-	kfree(strm.workspace);
+	vfree(strm.workspace);

 	D1(printk(KERN_DEBUG "zlib compressed %ld bytes into %ld\n", strm.total_in,
strm.total_out));

@@ -137,7 +136,7 @@ int zlib_compress(unsigned char *data_in

  out_err:
 	zlib_deflateEnd(&strm);
-	kfree(strm.workspace);
+	vfree(strm.workspace);
 	return -1;
 }

@@ -148,8 +147,7 @@ void zlib_decompress(unsigned char *data
 	int ret;

 #ifdef __KERNEL__
-	strm.workspace = kmalloc(zlib_inflate_workspacesize(),
-				 GFP_KERNEL);
+	strm.workspace = vmalloc(zlib_inflate_workspacesize());
 	if (strm.workspace == NULL) {
 		printk(KERN_WARNING "inflateInit alloc of workspace failed\n");
 		return;
@@ -177,5 +175,5 @@ void zlib_decompress(unsigned char *data
 		printk(KERN_NOTICE "inflate returned %d\n", ret);
 	}
 	zlib_inflateEnd(&strm);
-	kfree(strm.workspace);
+	vfree(strm.workspace);
 }

-------------------------------------------------------
