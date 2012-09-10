Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TAxQj-00043S-KL
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2012 06:25:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: add helpers to get the supportted ONFI timing mode
Date: Mon, 10 Sep 2012 14:01:11 +0800
Message-ID: <1347256871-18339-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1347256871-18339-1-git-send-email-b32955@freescale.com>
References: <1347256871-18339-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: mikedunn@newsguy.com, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add onfi_get_async_timing_mode() to get the supportted asynchronous
timing mode.

add onfi_get_sync_timing_mode() to get the supportted synchronous
timing mode.

Also add the neccessary macros : the timing modes.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 641794c..83b85a1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -231,6 +231,14 @@ typedef enum {
 /* Keep gcc happy */
 struct nand_chip;
 
+/* ONFI timing mode, used in both asynchronous and synchronous mode */
+#define ONFI_TIMING_MODE_0	(1 << 0)
+#define ONFI_TIMING_MODE_1	(1 << 1)
+#define ONFI_TIMING_MODE_2	(1 << 2)
+#define ONFI_TIMING_MODE_3	(1 << 3)
+#define ONFI_TIMING_MODE_4	(1 << 4)
+#define ONFI_TIMING_MODE_5	(1 << 5)
+
 /* ONFI feature address */
 #define ONFI_FEATURE_ADDR_TIMING_MODE	0x1
 
@@ -682,4 +690,16 @@ struct platform_nand_chip *get_platform_nandchip(struct mtd_info *mtd)
 	return chip->priv;
 }
 
+/* return the supported asynchronous timing mode. */
+static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
+{
+	return le16_to_cpu(chip->onfi_params.async_timing_mode);
+}
+
+/* return the supported synchronous timing mode. */
+static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
+{
+	return le16_to_cpu(chip->onfi_params.src_sync_timing_mode);
+}
+
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.7.0.4
