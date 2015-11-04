Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0li-00017v-KX
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:18:40 +0000
Received: by qkct129 with SMTP id t129so21916965qkc.2
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 08:18:17 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 6/6] mtd: pxa3xx_nand: Gate/ungate the NAND clock in
 suspend/resume paths
Date: Wed,  4 Nov 2015 13:13:46 -0300
Message-Id: <1446653626-14802-7-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND clock can be disabled on suspend and enabled on resume.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 0e6eb6c1f9b3..13371d6e9ba5 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1936,12 +1936,18 @@ static int pxa3xx_nand_suspend(struct device *dev)
 		return -EAGAIN;
 	}
 
+	clk_disable(info->clk);
 	return 0;
 }
 
 static int pxa3xx_nand_resume(struct device *dev)
 {
 	struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(info->clk);
+	if (ret < 0)
+		return ret;
 
 	/* We don't want to handle interrupt without calling mtd routine */
 	disable_int(info, NDCR_INT_MASK);
-- 
2.5.2
