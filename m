Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERylJ-00016c-Rf
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 17:12:48 -0400
Received: from slurryseal.ddns.mvista.com (slurryseal.ddns.mvista.com
	[10.0.10.193])
	by hermes.mvista.com (Postfix) with ESMTP id AC1521A639
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Oct 2005 14:12:43 -0700 (PDT)
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4) with ESMTP id
	j9ILDUjf028932
	for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2005 14:13:30 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4/Submit) id j9ILDUcx028931
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 14:13:30 -0700
Date: Tue, 18 Oct 2005 14:13:30 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051018211330.GA28414@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: JFFS2 ignore ECC bytes in cleanmarker
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Floating for discussion a patch that avoids inspecting the ECC (and bad
block indicator) bytes in the OOB area when checking an autoplaced
chip's block for a valid JFFS2 cleanmarker.  It sounds like cleanmarkers
are on their way out, so this specific code might have a pretty short
lifespan.  But in general it may be best for the flash filesystems to
restrict themselves to looking at the free OOB bytes and ignoring those
that the hardware claims for its own purposes, whatever the FS-specific
data structure.

In my case I'm dealing with a NAND flash hardware controller that
automatically plunks down generated ECC bytes into the OOB (and so far I
haven't found a good way to avoid behaviors that modify those bytes), so
once the cleanmarker is written the ECC bytes will not be 0xFF and the
existing check will fail.

This falls under the general topic of recent discussion re: JFFS2 and
YAFFS* use of OOB bytes, and redefining what read_oob() returns based on
the chip-specific layout may well be a better answer (I think Vitaly
Wool's recent patches address this).  All in all, I'm not suggesting
commit the patch below at this time, but if it's useful to somebody with
a NAND controller that behaves similarly or it sparks any discussion
then have at. -- Todd

Index: fs/jffs2/wbuf.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
retrieving revision 1.100
diff -u -r1.100 wbuf.c
--- fs/jffs2/wbuf.c	30 Sep 2005 13:59:13 -0000	1.100
+++ fs/jffs2/wbuf.c	18 Oct 2005 20:47:29 -0000
@@ -959,17 +959,40 @@
 	}
 	
 	/* Special check for first page */
-	for(i = 0; i < oob_size ; i++) {
-		/* Yeah, we know about the cleanmarker. */
-		if (mode && i >= c->fsdata_pos && 
-		    i < c->fsdata_pos + c->fsdata_len)
-			continue;
-
-		if (buf[i] != 0xFF) {
-			D2(printk(KERN_DEBUG "Found %02x at %x in OOB for %08x\n",
-				  buf[i], i, jeb->offset));
-			ret = 1; 
-			goto out;
+	if (c->mtd->oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+		/* Walk through the autoplace chunks */
+		for (i = 0; c->mtd->oobinfo.oobfree[i][1]; i++) {
+			int j;
+
+			for (j = 0; j < c->mtd->oobinfo.oobfree[i][1]; j++) {
+				int pos = c->mtd->oobinfo.oobfree[i][0] + j;
+
+				if (mode && pos >= c->fsdata_pos &&
+				    pos < c->fsdata_pos + c->fsdata_len)
+					continue;
+
+				if (buf[pos] != 0xFF) {
+					D2(printk(KERN_DEBUG "Found %02x at 0x%x in OOB for %08x\n",
+						  buf[pos], pos,
+						  jeb->offset));
+					ret = 1;
+					goto out;
+				}
+			}
+		}
+	} else {
+		for(i = 0; i < oob_size ; i++) {
+			/* Yeah, we know about the cleanmarker. */
+			if (mode && i >= c->fsdata_pos && 
+			    i < c->fsdata_pos + c->fsdata_len)
+				continue;
+			
+			if (buf[i] != 0xFF) {
+				D2(printk(KERN_DEBUG "Found %02x at %x in OOB for %08x\n",
+					  buf[i], i, jeb->offset));
+				ret = 1; 
+				goto out;
+			}
 		}
 	}
 
