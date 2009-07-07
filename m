Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO9I3-0004hC-JY
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 11:56:59 +0000
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id n67BuiMQ007973
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 06:56:49 -0500
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id n67Bugcb015510
	for <linux-mtd@lists.infradead.org>;
	Tue, 7 Jul 2009 06:56:43 -0500 (CDT)
Message-ID: <61715.192.168.10.89.1246967804.squirrel@dbdmail.itg.ti.com>
Date: Tue, 7 Jul 2009 17:26:44 +0530 (IST)
Subject: [PATCH][MTD][NAND] nand_base.c: Fixing past end of the page read,
	in nand_do_read_oob
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check for reading past end of the page, in the function 'nand_do_read_oob', was
missing. This patch fixes it.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
This bug was found while testing with 'NAND test modules: oobtest' (maintained
by Adrian Hunter).
http://git.infradead.org/users/ahunter/nand-tests.git


--- a/drivers/mtd/nand/nand_base.c	2009-07-07 15:40:35.000000000 +0530
+++ b/drivers/mtd/nand/nand_base.c	2009-07-07 15:40:51.000000000 +0530
@@ -1427,6 +1427,13 @@ static int nand_do_read_oob(struct mtd_i
 		return -EINVAL;
 	}

+	/* Do not allow read past end of page */
+	if ((ops->ooboffs + ops->ooblen) > len) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to read "
+				"past end of page\n", __func__);
+		return -EINVAL;
+	}
+
 	/* Do not allow reads past end of device */
 	if (unlikely(from >= mtd->size ||
 		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
