Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0oHX-0002aU-4i
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 10:23:36 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 <stable@vger.kernel.org>
Subject: [PATCH] mtd: nand: fix ONFI parameter page layout
Date: Mon, 23 Nov 2015 11:23:07 +0100
Message-Id: <1448274187-22174-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

src_ssync_features field is only 1 byte large, and the 4th reserved area
is actually 8 bytes large.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes d1e1f4e42b5 ("mtd: nand: add support for reading ONFI parameters from NAND device")
Cc: <stable@vger.kernel.org> #v2.6.37+
---
 include/linux/mtd/nand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5a9d1d4..93fc372 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -276,7 +276,7 @@ struct nand_onfi_params {
 	__le16 t_r;
 	__le16 t_ccs;
 	__le16 src_sync_timing_mode;
-	__le16 src_ssync_features;
+	u8 src_ssync_features;
 	__le16 clk_pin_capacitance_typ;
 	__le16 io_pin_capacitance_typ;
 	__le16 input_pin_capacitance_typ;
@@ -284,7 +284,7 @@ struct nand_onfi_params {
 	u8 driver_strength_support;
 	__le16 t_int_r;
 	__le16 t_ald;
-	u8 reserved4[7];
+	u8 reserved4[8];
 
 	/* vendor */
 	__le16 vendor_revision;
-- 
2.1.4
