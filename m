Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNnmJ-0006ph-H0
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 20:30:24 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2] mtd: nand: pxa3xx_nand: add register access debug
Date: Mon, 25 Jan 2016 21:29:45 +0100
Message-Id: <1453753785-9635-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add verbose debug for register accesses. This enables easier debugging
by following where and how hardware is stimulated, and how it answers.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/nand/pxa3xx_nand.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e453ae9a17fa..0845d09e14c1 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -136,11 +136,23 @@
 #define READ_ID_BYTES		7
 
 /* macros for registers read/write */
-#define nand_writel(info, off, val)	\
-	writel_relaxed((val), (info)->mmio_base + (off))
-
-#define nand_readl(info, off)		\
-	readl_relaxed((info)->mmio_base + (off))
+#define nand_writel(info, off, val)					\
+	do {								\
+		dev_vdbg(&info->pdev->dev,				\
+			 "%s():%d nand_writel(0x%x, 0x%04x)\n",		\
+			 __func__, __LINE__, (val), (off));		\
+		writel_relaxed((val), (info)->mmio_base + (off));	\
+	} while (0)
+
+#define nand_readl(info, off)						\
+	({								\
+		unsigned int _v;					\
+		_v = readl_relaxed((info)->mmio_base + (off));		\
+		dev_vdbg(&info->pdev->dev,				\
+			 "%s():%d nand_readl(0x%04x): 0x%x\n",		\
+			 __func__, __LINE__, (off), _v);		\
+		_v;							\
+	})
 
 /* error code and state */
 enum {
-- 
2.1.4
