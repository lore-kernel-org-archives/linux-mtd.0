Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kMBP-0004m8-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 09:33:31 +0000
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 16kLcK-0004Tw-00
	for linux-mtd@lists.infradead.org; Mon, 11 Mar 2002 08:57:16 +0000
Received: from there (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id JAA08992
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 09:56:31 +0100 (MET)
Message-Id: <200203110856.JAA08992@mail.utfors.se>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: compr_zlib.c
Date: Mon, 11 Mar 2002 09:56:30 +0100
References: <0111121314140A.28381@jocke.lumentis.se> <01121714081700.06319@jocke.lumentis.se>
In-Reply-To: <01121714081700.06319@jocke.lumentis.se>
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

Hi all

I noticed that zlib.c by default adds a small header and a adler32 checksum to the compressed
data. This is not needed since JFFS2 adds it's own CRC32. There is an 'undocumented' way to 
avoid the header and adler32 checksum, specify a negative windowBits to deflateInit2()/inflateInit2().
Also it is possible to trim the memory usage by adjusting  windowBits and memLevel accordinly. I have
left these at their default values since I don't know zlib very well. Perhaps someone else can comment?

Also I wonder about STREAM_END_SPACE, which is defined to 12. Is it useful to try and compress
data as small as 13 bytes with zlib? Maybe the simpler rtime should be used for small amounts of
data?

Below is a patch against the stable 2.4 branch, which is backwards compatible.

        Jocke

PS.
     There has been a few improvements to JFFS2 that I would like to see in the stable 2.4 branch, we
     have been using these for about 2 weeks now and I think they are stable. 


Index: fs/jffs2/compr_zlib.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/compr_zlib.c,v
retrieving revision 1.8
diff -u -r1.8 compr_zlib.c
--- fs/jffs2/compr_zlib.c       2001/09/20 15:28:31     1.8
+++ fs/jffs2/compr_zlib.c       2002/03/11 08:31:35
@@ -31,7 +31,7 @@
  * provisions above, a recipient may use your version of this file
  * under either the RHEPL or the GPL.
  *
- * $Id: compr_zlib.c,v 1.8 2001/09/20 15:28:31 dwmw2 Exp $
+ * $Id: compr_zlib.c,v 1.8 2002/01/31 13:56:11 jocke Exp $
  *
  */

@@ -92,9 +92,21 @@
        strm.zalloc = (void *)0;
        strm.zfree = (void *)0;
 #endif
-
-       if (Z_OK != deflateInit(&strm, 3)) {
-               printk(KERN_WARNING "deflateInit failed\n");
+       /* The memory requirements for deflate are (in bytes):
+          1 << (windowBits+2)   +  1 << (memLevel+9)
+          that is: 128K for windowBits=15  +  128K for memLevel = 8  (default values)
+          plus a few kilobytes for small objects. For example, if you want to reduce
+          the default memory requirements from 256K to 128K, compile with
+              make CFLAGS="-O -DMAX_WBITS=14 -DMAX_MEM_LEVEL=7"
+          Of course this will generally degrade compression (there's no free lunch).
+
+          The memory requirements for inflate are (in bytes) 1 << windowBits
+          that is, 32K for windowBits=15 (default value) plus a few kilobytes
+          for small objects.
+       */
+       /* -MAX_WBITS impiles -> suppress zlib header and adler32 */
+       if (Z_OK != deflateInit2(&strm, 3, Z_DEFLATED, -MAX_WBITS, 8, Z_DEFAULT_STRATEGY)) {
+               printk(KERN_WARNING "deflateInit2 failed\n");
                return -1;
        }
        strm.next_in = data_in;
@@ -142,7 +154,7 @@
                      __u32 srclen, __u32 destlen)
 {
        z_stream strm;
-       int ret;
+       int ret, wbits, i;

 #ifdef __KERNEL__
        strm.zalloc = zalloc;
@@ -151,23 +163,34 @@
        strm.zalloc = (void *)0;
        strm.zfree = (void *)0;
 #endif
-
-       if (Z_OK != inflateInit(&strm)) {
-               printk(KERN_WARNING "inflateInit failed\n");
-               return;
-       }
-       strm.next_in = data_in;
-       strm.avail_in = srclen;
-       strm.total_in = 0;
-
-       strm.next_out = cpage_out;
-       strm.avail_out = destlen;
-       strm.total_out = 0;
+       /* -MAX_WBITS impiles -> suppress zlib header and adler32.
+          try first with -MAX_WBITS, if that fails, try MAX_WBITS to be
+          backwards compatible */
+       wbits = -MAX_WBITS;
+       for(i = 0; i < 2; i++){
+               if (Z_OK != inflateInit2(&strm, wbits)) {
+                       printk(KERN_WARNING "inflateInit2 failed\n");
+                       return;
+               }
+               strm.next_in = data_in;
+               strm.avail_in = srclen;
+               strm.total_in = 0;
+
+               strm.next_out = cpage_out;
+               strm.avail_out = destlen;
+               strm.total_out = 0;
+
+               while((ret = inflate(&strm, Z_FINISH)) == Z_OK)
+                       ;
+               inflateEnd(&strm);
+               if (ret == Z_DATA_ERROR){
+                       wbits = -wbits;
+                       continue; /* try again with next wbits */
+               }

-       while((ret = inflate(&strm, Z_FINISH)) == Z_OK)
-               ;
-       if (ret != Z_STREAM_END) {
-               printk(KERN_NOTICE "inflate returned %d\n", ret);
+               if (ret != Z_STREAM_END) {
+                       printk(KERN_NOTICE "inflate returned %d, wbits: %d\n", ret, wbits);
+               }
+               break; /* all went well */
        }
-       inflateEnd(&strm);
 }
