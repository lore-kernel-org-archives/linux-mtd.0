Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coP1S-0008Rh-7t
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 06:36:31 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v3 1/8] mtd: nand: add more helpers in nand.h
Date: Thu, 16 Mar 2017 14:47:30 +0800
Message-ID: <1489646857-10112-2-git-send-email-peterpandong@micron.com>
In-Reply-To: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
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

This commit adds some helpers in nand.h
    nand_size()
    valid_nand_address()
    valid_nand_oob_ops()
    nand_oob_ops_across_page()
    valid_nand_erase_ops()

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand.h | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c2197b4..4a812e6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -410,6 +410,65 @@ static inline int nand_neraseblocks(struct nand_device *nand)
 }
 
 /**
+ * nand_size - Get NAND size
+ * @nand: NAND device
+ *
+ * Returns the total size exposed by @nand.
+ */
+static inline u64 nand_size(struct nand_device *nand)
+{
+	return nand->memorg.ndies * nand->memorg.diesize;
+}
+
+static inline bool valid_nand_address(struct nand_device *nand, loff_t addr)
+{
+	return addr < nand_size(nand);
+}
+
+static inline bool valid_nand_oob_ops(struct nand_device *nand, loff_t start,
+				      struct mtd_oob_ops *ops)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+
+	if (ops->ooboffs >= ooblen)
+		return false;
+	if (ops->ooboffs + ops->ooblen >
+	    (nand_len_to_pages(nand, nand_size(nand)) -
+			       nand_offs_to_page(nand, start)) * ooblen)
+		return false;
+
+	return true;
+}
+
+static inline bool nand_oob_ops_across_page(struct nand_device *nand,
+					    struct mtd_oob_ops *ops)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		     mtd->oobavail : mtd->oobsize;
+
+	return (ops->ooboffs + ops->ooblen) > ooblen;
+}
+
+static inline bool valid_nand_erase_ops(struct nand_device *nand,
+					struct erase_info *einfo)
+{
+	/* check address align on block boundary */
+	if (einfo->addr & (nand_eraseblock_size(nand) - 1))
+		return false;
+	/* check lendth align on block boundary */
+	if (einfo->len & (nand_eraseblock_size(nand) - 1))
+		return false;
+	/* Do not allow erase past end of device */
+	if ((einfo->addr + einfo->len) > nand_size(nand))
+		return false;
+
+	return true;
+}
+
+/**
  * nand_register - Register a NAND device
  * @nand: NAND device
  *
-- 
1.9.1
