Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUBeM-0000J9-Lf
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 07:59:00 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 2/8] mtd: add a helper to get the supported features for
 ONFI nand
Date: Mon, 22 Apr 2013 15:47:52 +0800
Message-ID: <1366616878-29481-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1366616878-29481-1-git-send-email-b32955@freescale.com>
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <shijie8@gmail.com>

add a helper to get the supported features for ONFI nand.
Also add the neccessary macros.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 210bf36..122322c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -202,6 +202,11 @@ typedef enum {
 /* Keep gcc happy */
 struct nand_chip;
 
+/* ONFI features */
+#define ONFI_FEATURE_16_BIT_BUS		(1 << 0)
+#define ONFI_FEATURE_EXT_PARAM_PAGE	(1 << 7)
+#define ONFI_FEATURE_UNKNOWN		(1 << 15)
+
 /* ONFI timing mode, used in both asynchronous and synchronous mode */
 #define ONFI_TIMING_MODE_0		(1 << 0)
 #define ONFI_TIMING_MODE_1		(1 << 1)
@@ -750,6 +755,14 @@ struct platform_nand_chip *get_platform_nandchip(struct mtd_info *mtd)
 	return chip->priv;
 }
 
+/* return the supported features. */
+static inline int onfi_feature(struct nand_chip *chip)
+{
+	if (!chip->onfi_version)
+		return ONFI_FEATURE_UNKNOWN;
+	return le16_to_cpu(chip->onfi_params.features);
+}
+
 /* return the supported asynchronous timing mode. */
 static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
 {
-- 
1.7.1
