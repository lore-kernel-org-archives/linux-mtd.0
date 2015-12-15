Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8uef-0003OA-Ld
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 18:48:58 +0000
Received: by mail-pa0-x22b.google.com with SMTP id tl7so764928pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2015 10:48:37 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>, Marek Vasut <marex@denx.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?q?Eddie=20Huang=20=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>,
 =?UTF-8?q?Milton=20Chiang=20=28=E6=B1=9F=E6=98=8E=E6=99=8F=29?=
 <Milton.Chiang@mediatek.com>
Subject: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions (aliased
 with Winbond)
Date: Tue, 15 Dec 2015 10:48:20 -0800
Message-Id: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Spansion and Winbond have occasionally used the same manufacturer ID,
and they don't support the same features. Particularly, writing SR=0
seems to break read access for Spansion's s25fl064k. Unfortunately, we
don't currently have a way to differentiate these Spansion and Winbond
parts, so rather than regressing support for these Spansion flash, let's
drop the new Winbond lock/unlock support for now. We can try to address
Winbond support during the next release cycle.

Original discussion:

http://patchwork.ozlabs.org/patch/549173/
http://patchwork.ozlabs.org/patch/553683/

Fixes: 357ca38d4751 ("mtd: spi-nor: support lock/unlock/is_locked for Winbond")
Fixes: c6fc2171b249 ("mtd: spi-nor: disable protection for Winbond flash at startup")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reported-by: Felix Fietkau <nbd@openwrt.org>
Cc: Felix Fietkau <nbd@openwrt.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 ++----
 include/linux/mtd/spi-nor.h   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 49883905a434..f5d59de1ee6e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1200,8 +1200,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_SST ||
-	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
+	    JEDEC_MFR(info) == SNOR_MFR_SST) {
 		write_enable(nor);
 		write_sr(nor, 0);
 	}
@@ -1217,8 +1216,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->_read = spi_nor_read;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
-	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
 		nor->flash_is_locked = stm_is_locked;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c8723b62c4cd..bc742dac7d3a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -25,7 +25,7 @@
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
 #define SNOR_MFR_SPANSION	CFI_MFR_AMD
 #define SNOR_MFR_SST		CFI_MFR_SST
-#define SNOR_MFR_WINBOND	0xef
+#define SNOR_MFR_WINBOND	0xef /* Also used by some Spansion */
 
 /*
  * Note on opcode nomenclature: some opcodes have a format like
-- 
2.6.0.rc2.230.g3dd15c0
