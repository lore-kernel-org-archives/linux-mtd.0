Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm1-0002Xz-0U
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:32:58 +0000
Received: by mail-pf0-x242.google.com with SMTP id e126so98380pfe.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:36 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 01/17] include:mtd:add multi-plane page program command
Date: Tue,  2 Feb 2016 02:30:36 +0000
Message-Id: <1454380252-16170-2-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This patch file is to add multi-plane page program command,
and add dual plane page program hook pinter in nand_chip structure.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 include/linux/mtd/nand.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 272f429..4c5be01 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -77,6 +77,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_CMD_READ1		1
 #define NAND_CMD_RNDOUT		5
 #define NAND_CMD_PAGEPROG	0x10
+#define NAND_CMD_MULTI_PAGEPROG	0x11
 #define NAND_CMD_READOOB	0x50
 #define NAND_CMD_ERASE1		0x60
 #define NAND_CMD_STATUS		0x70
@@ -671,6 +672,9 @@ struct nand_chip {
 	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
 			uint32_t offset, int data_len, const uint8_t *buf,
 			int oob_required, int page, int cached, int raw);
+	int (*write_plane_page)(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t offset, int data_len, const uint8_t *buf,
+			int oob_required, int page, int plane, int raw);
 	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip *chip,
 			int feature_addr, uint8_t *subfeature_para);
 	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
-- 
1.9.1
