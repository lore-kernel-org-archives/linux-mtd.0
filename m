Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZchQi-00051P-1J
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 22:13:24 +0000
Received: by wicfx3 with SMTP id fx3so41688996wic.1
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2015 15:13:02 -0700 (PDT)
Sender: Luis de Bethencourt <bethencourt@gmail.com>
From: Luis de Bethencourt <luis@debethencourt.com>
Date: Fri, 18 Sep 2015 00:13:01 +0200
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Fabian Frederick <fabf@skynet.be>, Wolfram Sang <wsa@the-dreams.de>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] mtd: mpc5121_nfc: Fix module autoload for OF platform
 driver
Message-ID: <20150917221301.GA9231@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luisbg@osg.samsung.com>
---
 drivers/mtd/nand/mpc5121_nfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 2a49b53..019fe0d 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -841,6 +841,7 @@ static const struct of_device_id mpc5121_nfc_match[] = {
 	{ .compatible = "fsl,mpc5121-nfc", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, mpc5121_nfc_match);
 
 static struct platform_driver mpc5121_nfc_driver = {
 	.probe		= mpc5121_nfc_probe,
-- 
2.4.6
