Received: from ip10.savigear.adsl.uk.xo.com ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17GJxI-0000qp-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2002 14:39:04 +0100
Received: from spoinky.renegade.org.uk ([192.168.1.2])
	by xerp.secret.org.uk with esmtp (Exim 3.33 #1)
	id 17GJxG-0005M0-00
	for linux-mtd@lists.infradead.org; Fri, 07 Jun 2002 14:39:02 +0100
Received: from localhost ([127.0.0.1] helo=secret.org.uk)
	by spoinky.renegade.org.uk with esmtp (Exim 3.35 #1 (Debian))
	id 17GJxF-0001dQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2002 14:39:01 +0100
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: module usage counting in mtdblock
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 07 Jun 2002 14:39:00 +0100
Message-Id: <E17GJxF-0001dQ-00@spoinky.renegade.org.uk>
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

Hi,

I think there is a bug in mtdblock where the open() leaves the module count
1 more than it should be and it should be using BLK_{INC,DEC}_USE_COUNT
everywhere instead of MOD_{INC,DEC}_USE_COUNT

(BLK_{INC,DEC}_USE_COUNT are nops on >= 2.4.14 due to module counting being
done by fs/block_dev.c)

Does the following look correct?

cheers
si


Index: mtdblock.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdblock.c,v
retrieving revision 1.54
diff -u -r1.54 mtdblock.c
--- mtdblock.c	3 May 2002 16:46:24 -0000	1.54
+++ mtdblock.c	7 Jun 2002 13:26:01 -0000
@@ -280,11 +280,13 @@
 	if (dev >= MAX_MTD_DEVICES)
 		return -EINVAL;
 
-	MOD_INC_USE_COUNT;
+	BLK_INC_USE_COUNT;
 
 	mtd = get_mtd_device(NULL, dev);
-	if (!mtd)
+	if (!mtd) {
+		BLK_DEC_USE_COUNT;
 		return -ENODEV;
+	}
 	if (MTD_ABSENT == mtd->type) {
 		put_mtd_device(mtd);
 		BLK_DEC_USE_COUNT;
@@ -326,7 +328,7 @@
 		if (!mtdblk->cache_data) {
 			put_mtd_device(mtdblk->mtd);
 			kfree(mtdblk);
-			MOD_DEC_USE_COUNT;
+			BLK_DEC_USE_COUNT;
 			return -ENOMEM;
 		}
 	}
