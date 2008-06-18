Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91pe-0001XE-9u
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 17:52:30 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m5IHqTWs019502
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 10:52:29 -0700
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD]Remove dead code
MIME-Version: 1.0
Message-ID: <OF46A22CC0.E795A9BE-ON8825746C.006121A0-8825746C.00622E1D@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 18 Jun 2008 10:52:26 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As near as I can tell this line of code serves no usefull purpose, so I 
removed it.

Signed-off-by: Bruce Leonard <brucle@selinc.com>

---

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 5e121ce..2733e04 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1029,7 +1029,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t 
offs)
        if (!this->bbt || !td)
                return -EINVAL;
 
-       len = mtd->size >> (this->bbt_erase_shift + 2);
        /* Allocate a temporary buffer for one eraseblock incl. oob */
        len = (1 << this->bbt_erase_shift);
        len += (len >> this->page_shift) * mtd->oobsize;
