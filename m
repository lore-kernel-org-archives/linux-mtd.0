Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr1Oc-0007Fk-I0
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 06:36:35 +0000
Received: by ggcs5 with SMTP id s5so50878ggc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 23:36:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 1/2] mtd: check for max_bitflips in mtd_read_oob()
Date: Mon, 16 Jul 2012 23:38:14 -0700
Message-Id: <1342507095-18574-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
References: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, Mike Dunn <mikedunn@newsguy.com>
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
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reviewed-by Mike Dunn <mikedunn@newsguy.com>
---
v2: reword a few comments, add Reviewed-by

 drivers/mtd/mtdcore.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index fcfce24..44b58c2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -860,10 +860,23 @@ EXPORT_SYMBOL_GPL(mtd_panic_write);
 
 int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 {
+	int ret_code;
 	ops->retlen = ops->oobretlen = 0;
 	if (!mtd->_read_oob)
 		return -EOPNOTSUPP;
-	return mtd->_read_oob(mtd, from, ops);
+	/*
+	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
+	 * similar to mtd->_read() and may return a non-negative integer
+	 * representing max bitflips. In other cases, mtd->_read_oob() may
+	 * return -EUCLEAN. In all cases, perform similar logic to mtd_read()
+	 * (see above).
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
1.7.11.1
