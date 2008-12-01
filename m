Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L78CQ-0005tL-SG
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 12:48:27 +0000
Date: Mon, 1 Dec 2008 13:48:22 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: "Ostendorf, Rainer" <Rainer.Ostendorf@BENNING.de>
Subject: RE: Problems with JFFS2 FS during parallel write operations
In-Reply-To: <0F0EC10F42A3384392AE60EF2A660B40427D98@tbbsrv56>
Message-ID: <Pine.LNX.4.64.0812011347210.7313@vixen.sonytel.be>
References: <0F0EC10F42A3384392AE60EF2A660B40427D98@tbbsrv56>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 1 Dec 2008, Ostendorf, Rainer wrote:
> i'm still working on the problem described in my previous post:
> 
> [...]
> > During normal operation the system runs perfectly stable, but when i 
> > start two processes running parallel, writing huge amounts of data 
> > to the flash device, i get error 
> > messages from the JFFS2 filesystem:
> > 
> > ...
> > argh. node added in wrong place
> > argh. node added in wrong place
> > ...
> > 
> > This message repeats for about 15-20 times while copying parallel 2 
> > files of about 6MByte to the flash via Ethernet (SCP). 
> [...]
> 
> As i can only reproduce the corruption of the JFFS2 FS during parallel access of at leat two processes writing to the flash, i assume that the cause for the corruption is some kind of race-condition. Have there been any known problems/bugs with race conditions, that could lead to an error like this? Would it probably help to upgrade to a newer kernel version? Any hint and help would be greatly appreciated.

Do you use LZO compression? If yes, it could have been this one:

commit dc8a0843a435b2c0891e7eaea64faaf1ebec9b11
Author: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Date:   Wed Nov 5 23:21:16 2008 +0100

    [JFFS2] fix race condition in jffs2_lzo_compress()
    
    deflate_mutex protects the globals lzo_mem and lzo_compress_buf.  However,
    jffs2_lzo_compress() unlocks deflate_mutex _before_ it has copied out the
    compressed data from lzo_compress_buf.  Correct this by moving the mutex
    unlock after the copy.
    
    In addition, document what deflate_mutex actually protects.
    
    Cc: stable@kernel.org
    Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
    Acked-by: Richard Purdie <rpurdie@openedhand.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

diff --git a/fs/jffs2/compr_lzo.c b/fs/jffs2/compr_lzo.c
index 47b0457..90cb60d 100644
--- a/fs/jffs2/compr_lzo.c
+++ b/fs/jffs2/compr_lzo.c
@@ -19,7 +19,7 @@
 
 static void *lzo_mem;
 static void *lzo_compress_buf;
-static DEFINE_MUTEX(deflate_mutex);
+static DEFINE_MUTEX(deflate_mutex);	/* for lzo_mem and lzo_compress_buf */
 
 static void free_workspace(void)
 {
@@ -49,18 +49,21 @@ static int jffs2_lzo_compress(unsigned char *data_in, unsigned char *cpage_out,
 
 	mutex_lock(&deflate_mutex);
 	ret = lzo1x_1_compress(data_in, *sourcelen, lzo_compress_buf, &compress_size, lzo_mem);
-	mutex_unlock(&deflate_mutex);
-
 	if (ret != LZO_E_OK)
-		return -1;
+		goto fail;
 
 	if (compress_size > *dstlen)
-		return -1;
+		goto fail;
 
 	memcpy(cpage_out, lzo_compress_buf, compress_size);
-	*dstlen = compress_size;
+	mutex_unlock(&deflate_mutex);
 
+	*dstlen = compress_size;
 	return 0;
+
+ fail:
+	mutex_unlock(&deflate_mutex);
+	return -1;
 }
 
 static int jffs2_lzo_decompress(unsigned char *data_in, unsigned char *cpage_out,


With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
