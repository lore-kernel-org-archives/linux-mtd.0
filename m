Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0DlU-0006R9-3W
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 20:28:39 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/5] mtd: nand: Add bb_per_lun and blocks_per_lun fields to
 nand_chip
Date: Fri, 28 Oct 2016 15:27:42 -0500
Message-ID: <1477686464-7437-4-git-send-email-zach.brown@ni.com>
In-Reply-To: <1477686464-7437-1-git-send-email-zach.brown@ni.com>
References: <1477686464-7437-1-git-send-email-zach.brown@ni.com>
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

The fields bb_per_lun and blocks_per_lun are useful determining the
number of bad blocks a MTD needs to allocate. How they are set will
depend on if the chip is ONFI, JEDEC or a fuill-id entry in the nand_ids
table.

Signed-off-by: Zach Brown <zach.brown@ni.com>
---
 include/linux/mtd/nand.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c5d3d502..efbe439 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -771,6 +771,9 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  *			supported, 0 otherwise.
  * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
  *			supported, 0 otherwise.
+ * @bb_per_lun:	[INTERN] the max number of bad blocks each LUN of a
+ *			this nand device will encounter their life times.
+ * @blocks_per_lun:	[INTERN] The number of PEBs in a LUN
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
@@ -853,6 +856,8 @@ struct nand_chip {
 		struct nand_onfi_params	onfi_params;
 		struct nand_jedec_params jedec_params;
 	};
+	__le16 bb_per_lun;
+	__le32 blocks_per_lun;
 
 	struct nand_data_interface *data_interface;
 
-- 
2.7.4
