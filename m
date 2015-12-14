Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8I8U-0004kB-77
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 01:41:11 +0000
Received: by pfbu66 with SMTP id u66so6112673pfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 13 Dec 2015 17:40:49 -0800 (PST)
From: Karl Zhang <shuangshuo@gmail.com>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, paul.gortmaker@windriver.com,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org
Cc: peterpandong@micron.com, beanhuo@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: [PATCH v2 1/2] mtd: spi-nor: add Manufacturer ID for Micron
Date: Mon, 14 Dec 2015 01:40:00 +0000
Message-Id: <1450057201-28419-2-git-send-email-karlzhang@micron.com>
In-Reply-To: <1450057201-28419-1-git-send-email-karlzhang@micron.com>
References: <1450057201-28419-1-git-send-email-karlzhang@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron Manufacturer ID assigned by JEDEC is 2Ch.
Add this ID, for new Spi NOR from Micron.

ST's ID(20h) is Micron due to the history.

Signed-off-by: Karl Zhang <karlzhang@micron.com>
---
 v2: no change

 include/linux/mtd/cfi.h     | 1 +
 include/linux/mtd/spi-nor.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 9b57a9b..cbf7716 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -377,6 +377,7 @@ struct cfi_fixup {
 #define CFI_MFR_SHARP		0x00B0
 #define CFI_MFR_SST		0x00BF
 #define CFI_MFR_ST		0x0020 /* STMicroelectronics */
+#define CFI_MFR_MICRON		0x002C /* Micron */
 #define CFI_MFR_TOSHIBA		0x0098
 #define CFI_MFR_WINBOND		0x00DA
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fac3f6f..b858e93 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -22,6 +22,8 @@
  */
 #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
+/* Micron Manufacturer ID assigned by JEDEC */
+#define SNOR_MFR_MICRON_JEDEC	CFI_MFR_MICRON
 #define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
 #define SNOR_MFR_SPANSION	CFI_MFR_AMD
-- 
1.9.1
