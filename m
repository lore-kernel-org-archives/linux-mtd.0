Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3qIR-0003Eb-1w
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 19:09:03 +0000
Received: by padhx2 with SMTP id hx2so13876062pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 11:08:42 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] mtd: nand: fix typo (t_ald -> t_adl)
Date: Tue,  1 Dec 2015 11:08:32 -0800
Message-Id: <1448996912-14677-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's "ADL" ("ALE to data loading" time) not "ALD".

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Caught by inspection. Compile tested only.

 include/linux/mtd/nand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index eaf48b5a95dd..fad634ea1685 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -283,7 +283,7 @@ struct nand_onfi_params {
 	u8 input_pin_capacitance_max;
 	u8 driver_strength_support;
 	__le16 t_int_r;
-	__le16 t_ald;
+	__le16 t_adl;
 	u8 reserved4[8];
 
 	/* vendor */
@@ -407,7 +407,7 @@ struct nand_jedec_params {
 	__le16 input_pin_capacitance_typ;
 	__le16 clk_pin_capacitance_typ;
 	u8 driver_strength_support;
-	__le16 t_ald;
+	__le16 t_adl;
 	u8 reserved4[36];
 
 	/* ECC and endurance block */
-- 
2.6.0.rc2.230.g3dd15c0
