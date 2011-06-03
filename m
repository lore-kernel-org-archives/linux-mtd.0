Received: from mail-px0-f171.google.com ([209.85.212.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSMiD-00075z-6w
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 05:14:21 +0000
Received: by pxi7 with SMTP id 7so885013pxi.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 22:14:17 -0700 (PDT)
Subject: [PATCH 1/2] mtd: pxa3xx_nand: fix a memory leak
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 13:14:10 +0800
Message-ID: <1307078050.4167.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>, Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In pxa3xx_nand_remove, we should call nand_release instead of
mtd_device_unregister to properly free bad block table memory
and bad block descriptor memory.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1fb3b3a..f7040ea 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1119,7 +1119,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	clk_put(info->clk);
 
 	if (mtd) {
-		mtd_device_unregister(mtd);
+		nand_release(mtd);
 		kfree(mtd);
 	}
 	return 0;
-- 
1.7.4.1
