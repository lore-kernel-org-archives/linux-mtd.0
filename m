Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPFk8-0008FT-JQ
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 20:01:55 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
Date: Tue, 11 Aug 2015 21:57:12 +0200
Message-Id: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
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
index 1259cc558ce9..ed44bddcc43f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -127,11 +127,23 @@
 #define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
 
 /* macros for registers read/write */
-#define nand_writel(info, off, val)	\
-	writel_relaxed((val), (info)->mmio_base + (off))
-
-#define nand_readl(info, off)		\
-	readl_relaxed((info)->mmio_base + (off))
+#define nand_writel(info, off, val)					\
+	do {								\
+		dev_vdbg(&info->pdev->dev,				\
+			 "%s():%d nand_writel(0x%x, %s)\n",		\
+			 __func__, __LINE__, (val), #off);		\
+		writel_relaxed((val), (info)->mmio_base + (off));	\
+	} while (0)
+
+#define nand_readl(info, off)						\
+	({								\
+		unsigned int _v;					\
+		_v = readl_relaxed((info)->mmio_base + (off));		\
+		dev_vdbg(&info->pdev->dev,				\
+			 "%s():%d nand_readl(%s): 0x%x\n",		\
+			 __func__, __LINE__, #off, _v);			\
+		_v;							\
+	})
 
 /* error code and state */
 enum {
-- 
2.1.4
