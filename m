Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDO1-0004h1-GY
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:34 +0000
Received: by dadm1 with SMTP id m1so3145809dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:32 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
Date: Fri, 22 Jun 2012 16:35:39 -0700
Message-Id: <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_read_oob() has some unexpected similarities to mtd_read(). For
instance, when ops->datbuf != NULL, nand_base.c might return max_bitflips;
however, when ops->datbuf == NULL, nand_base's code potentially could
return -EUCLEAN (no in-tree drivers do this yet). In any case where the
driver might return max_bitflips, we should translate this into an
appropriate return code using the bitflip_threshold.

Essentially, mtd_read_oob() duplicates the logic from mtd_read().

This prevents users of mtd_read_oob() from receiving a positive return
value (i.e., from max_bitflips) and interpreting it as an unknown error.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/mtdcore.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index fcfce24..75288d3 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -860,10 +860,22 @@ EXPORT_SYMBOL_GPL(mtd_panic_write);
 
 int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 {
+	int ret_code;
 	ops->retlen = ops->oobretlen = 0;
 	if (!mtd->_read_oob)
 		return -EOPNOTSUPP;
-	return mtd->_read_oob(mtd, from, ops);
+	/*
+	 * In cases where ops->datbuf != NULL, mtd->_read_oob() can have
+	 * semantics similar to mtd->_read(), regarding max bitflips. In other
+	 * cases, mtd->_read_oob() may return -EUCLEAN. In all cases, perform
+	 * similar logic to mtd_read() (see above).
+	 */
+	ret_code = mtd->_read_oob(mtd, from, ops);
+	if (unlikely(ret_code < 0))
+		return ret_code;
+	if (mtd->ecc_strength == 0)
+		return 0;	/* device lacks ecc */
+	return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
 }
 EXPORT_SYMBOL_GPL(mtd_read_oob);
 
-- 
1.7.10
