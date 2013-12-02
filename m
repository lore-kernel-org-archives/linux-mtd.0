Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnYxP-0005dt-RQ
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 19:15:00 +0000
Received: by mail-ie0-f175.google.com with SMTP id x13so22094015ief.34
 for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2013 11:14:36 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: fix misspelling in ONFI parameter field name
Date: Mon,  2 Dec 2013 11:14:12 -0800
Message-Id: <1386011652-27411-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s/strenght/strength/

This field isn't used anywhere, so this rename is safe.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9e6c8f9f306e..f3ea8daf08ee 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -279,7 +279,7 @@ struct nand_onfi_params {
 	__le16 io_pin_capacitance_typ;
 	__le16 input_pin_capacitance_typ;
 	u8 input_pin_capacitance_max;
-	u8 driver_strenght_support;
+	u8 driver_strength_support;
 	__le16 t_int_r;
 	__le16 t_ald;
 	u8 reserved4[7];
-- 
1.8.4.4
