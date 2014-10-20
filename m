Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgG5Z-0005BS-G9
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 16:45:45 +0000
From: Vinod Koul <vinod.koul@intel.com>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: mxc_nand: use __iowrite32_copy for 32 bit copy
Date: Mon, 20 Oct 2014 21:36:13 +0530
Message-Id: <1413821173-18347-2-git-send-email-vinod.koul@intel.com>
In-Reply-To: <1413821173-18347-1-git-send-email-vinod.koul@intel.com>
References: <1413821173-18347-1-git-send-email-vinod.koul@intel.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Bo Shen <voice.shen@atmel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Mark Brown <broonie@linaro.org>,
 Vinod Koul <vinod.koul@intel.com>, Huang Shijie <shijie8@gmail.com>,
 Jingoo Han <jg1.han@samsung.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Josh Triplett <josh@joshtriplett.org>, Herve Codina <Herve.CODINA@celad.com>,
 Josh Wu <Josh.wu@atmel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver was also using own method to do 32bit copy, turns out
we have a kernel API so use that instead

Signed-off-by: Vinod Koul <vinod.koul@intel.com>
---
 drivers/mtd/nand/mxc_nand.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index dba262b..3794cd7 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -280,14 +280,10 @@ static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
 		*t++ = __raw_readl(s++);
 }
 
-static void memcpy32_toio(void __iomem *trg, const void *src, int size)
+static inline void memcpy32_toio(void __iomem *trg, const void *src, int size)
 {
-	int i;
-	u32 __iomem *t = trg;
-	const u32 *s = src;
-
-	for (i = 0; i < (size >> 2); i++)
-		__raw_writel(*s++, t++);
+	/* __iowrite32_copy use 32bit size values so divide by 4 */
+	__iowrite32_copy(trg, src, size/4);
 }
 
 static int check_int_v3(struct mxc_nand_host *host)
-- 
1.7.0.4
