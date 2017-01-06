Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPZzI-00032b-EC
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 19:15:43 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/5] mtd: nand: Add max_bb_per_die and blocks_per_die
 fields to nand_chip
Date: Fri, 6 Jan 2017 13:14:44 -0600
Message-ID: <1483730086-26706-4-git-send-email-zach.brown@ni.com>
In-Reply-To: <1483730086-26706-1-git-send-email-zach.brown@ni.com>
References: <1483730086-26706-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The fields max_bb_per_die and blocks_per_die are useful determining the
number of bad blocks a MTD needs to allocate. How they are set will
depend on if the chip is ONFI, JEDEC or a full-id entry in the nand_ids
table.

Signed-off-by: Zach Brown <zach.brown@ni.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c5f3a01..4e1b441 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -801,6 +801,9 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  *			supported, 0 otherwise.
  * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
  *			supported, 0 otherwise.
+ * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
+ *			this nand device will encounter their life times.
+ * @blocks_per_die:	[INTERN] The number of PEBs in a die
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
@@ -883,6 +886,8 @@ struct nand_chip {
 		struct nand_onfi_params	onfi_params;
 		struct nand_jedec_params jedec_params;
 	};
+	u16 max_bb_per_die;
+	u32 blocks_per_die;
 
 	struct nand_data_interface *data_interface;
 
-- 
2.7.4
