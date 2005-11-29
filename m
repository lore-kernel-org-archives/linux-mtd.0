Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh76u-0000UU-HS
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 10:09:50 -0500
Date: Tue, 29 Nov 2005 18:09:57 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: manningc2@actrix.gen.nz
Message-Id: <20051129180957.512d5c8d.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] yaffs2: changes to make yaffs work with the layout-based
 NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles,

below is the patch that does two things:

- compacts the structures (theyare still way too big IMHO)
- adapts the yaffs2-mtd layer for the changes in OOB area treatment (see earlier patches to linux-mtd list).

Any feedback is very appreciated.

Vitaly

diff -uNr linux-2.6.10.orig/fs/yaffs2/yaffs_ecc.h linux-2.6.10.nand/fs/yaffs2/yaffs_ecc.h
--- linux-2.6.10.orig/fs/yaffs2/yaffs_ecc.h	2005-11-24 16:51:17.000000000 +0300
+++ linux-2.6.10.nand/fs/yaffs2/yaffs_ecc.h	2005-11-23 17:30:21.000000000 +0300
@@ -30,7 +30,7 @@
 	unsigned char colParity;
 	unsigned lineParity;
 	unsigned lineParityPrime;
-} yaffs_ECCOther;
+} __attribute__ ((__packed__)) yaffs_ECCOther;
 
 void yaffs_ECCCalculate(const unsigned char *data, unsigned char *ecc);
 int yaffs_ECCCorrect(unsigned char *data, unsigned char *read_ecc,
diff -uNr linux-2.6.10.orig/fs/yaffs2/yaffs_mtdif2.c linux-2.6.10.nand/fs/yaffs2/yaffs_mtdif2.c
--- linux-2.6.10.orig/fs/yaffs2/yaffs_mtdif2.c	2005-11-24 16:51:17.000000000 +0300
+++ linux-2.6.10.nand/fs/yaffs2/yaffs_mtdif2.c	2005-11-29 16:55:22.000000000 +0300
@@ -66,7 +66,7 @@
 				       data);
 		if (tags)
 			retval =
-			    mtd->write_oob(mtd, addr, mtd->oobsize, &dummy,
+			    mtd->write_oob(mtd, addr, mtd->oobavail, &dummy,
 					   (__u8 *) & pt);
 
 	}
@@ -112,11 +112,11 @@
 				      data);
 		if (tags)
 			retval =
-			    mtd->read_oob(mtd, addr, mtd->oobsize, &dummy,
+			    mtd->read_oob(mtd, addr, mtd->oobavail, &dummy,
 					  dev->spareBuffer);
 	}
-
-	memcpy(&pt, dev->spareBuffer, sizeof(pt));
+	memcpy(&pt, dev->spareBuffer, mtd->oobavail < sizeof(pt) ? 
+			mtd->oobavail : sizeof(pt));
 
 	if (tags)
 		yaffs_UnpackTags2(tags, &pt);
diff -uNr linux-2.6.10.orig/fs/yaffs2/yaffs_packedtags2.h linux-2.6.10.nand/fs/yaffs2/yaffs_packedtags2.h
--- linux-2.6.10.orig/fs/yaffs2/yaffs_packedtags2.h	2005-11-24 16:51:17.000000000 +0300
+++ linux-2.6.10.nand/fs/yaffs2/yaffs_packedtags2.h	2005-11-23 17:30:21.000000000 +0300
@@ -11,12 +11,12 @@
 	unsigned objectId;
 	unsigned chunkId;
 	unsigned byteCount;
-} yaffs_PackedTags2TagsPart;
+} __attribute__((__packed__)) yaffs_PackedTags2TagsPart;
 
 typedef struct {
 	yaffs_PackedTags2TagsPart t;
 	yaffs_ECCOther ecc;
-} yaffs_PackedTags2;
+} __attribute__((__packed__)) yaffs_PackedTags2;
 
 void yaffs_PackTags2(yaffs_PackedTags2 * pt, const yaffs_ExtendedTags * t);
 void yaffs_UnpackTags2(yaffs_ExtendedTags * t, yaffs_PackedTags2 * pt);
