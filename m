From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 1/2] mtd: Fix some function description mismatches in
 mtdcore.c
Date: Thu, 29 Mar 2018 09:34:58 +0800
Message-ID: <1522287299-12620-2-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1522287299-12620-1-git-send-email-xiaolei.li@mediatek.com>
References: <1522287299-12620-1-git-send-email-xiaolei.li@mediatek.com>
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

In mtdcore.c, some function descriptions do not match function
definitions. Just fix these mismatches.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/mtdcore.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 28553c8..413ea9b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -419,7 +419,7 @@ int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
 EXPORT_SYMBOL_GPL(mtd_wunit_to_pairing_info);
 
 /**
- * mtd_wunit_to_pairing_info - get wunit from pairing information
+ * mtd_pairing_info_to_wunit - get wunit from pairing information
  * @mtd: pointer to new MTD device info structure
  * @info: pairing information struct
  *
@@ -1525,9 +1525,9 @@ int mtd_ooblayout_get_databytes(struct mtd_info *mtd, u8 *databuf,
 EXPORT_SYMBOL_GPL(mtd_ooblayout_get_databytes);
 
 /**
- * mtd_ooblayout_get_eccbytes - set data bytes into the oob buffer
+ * mtd_ooblayout_set_databytes - set data bytes into the oob buffer
  * @mtd: mtd info structure
- * @eccbuf: source buffer to get data bytes from
+ * @databuf: source buffer to get data bytes from
  * @oobbuf: OOB buffer
  * @start: first ECC byte to set
  * @nbytes: number of ECC bytes to set
@@ -1559,7 +1559,7 @@ int mtd_ooblayout_count_freebytes(struct mtd_info *mtd)
 EXPORT_SYMBOL_GPL(mtd_ooblayout_count_freebytes);
 
 /**
- * mtd_ooblayout_count_freebytes - count the number of ECC bytes in OOB
+ * mtd_ooblayout_count_eccbytes - count the number of ECC bytes in OOB
  * @mtd: mtd info structure
  *
  * Works like mtd_ooblayout_count_bytes(), except it count ECC bytes.
-- 
1.9.1
