Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZchRh-0005sT-BF
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 22:14:26 +0000
Received: by wiclk2 with SMTP id lk2so41834613wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2015 15:14:04 -0700 (PDT)
Sender: Luis de Bethencourt <bethencourt@gmail.com>
From: Luis de Bethencourt <luis@debethencourt.com>
Date: Fri, 18 Sep 2015 00:14:02 +0200
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jingoo Han <jg1.han@samsung.com>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Lunn <andrew@lunn.ch>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd: orion_nand: Fix module autoload for OF platform
 driver
Message-ID: <20150917221402.GA9312@goodgumbo.baconseed.org>
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
 drivers/mtd/nand/orion_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index c3c6d30..64785f4 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -201,6 +201,7 @@ static const struct of_device_id orion_nand_of_match_table[] = {
 	{ .compatible = "marvell,orion-nand", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, orion_nand_of_match_table);
 #endif
 
 static struct platform_driver orion_nand_driver = {
-- 
2.4.6
