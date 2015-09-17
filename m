Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZchPj-0004EC-Fh
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 22:12:24 +0000
Received: by wicgb1 with SMTP id gb1so9068573wic.1
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2015 15:12:01 -0700 (PDT)
Sender: Luis de Bethencourt <bethencourt@gmail.com>
From: Luis de Bethencourt <luis@debethencourt.com>
Date: Fri, 18 Sep 2015 00:11:59 +0200
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd: fsl_elbc_nand: Fix module autoload for OF platform
 driver
Message-ID: <20150917221159.GA9170@goodgumbo.baconseed.org>
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
 drivers/mtd/nand/fsl_elbc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 04b22fd..b812074 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -946,6 +946,7 @@ static const struct of_device_id fsl_elbc_nand_match[] = {
 	{ .compatible = "fsl,elbc-fcm-nand", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, fsl_elbc_nand_match);
 
 static struct platform_driver fsl_elbc_nand_driver = {
 	.driver = {
-- 
2.4.6
