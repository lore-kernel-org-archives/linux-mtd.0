Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZchQC-0004bD-Tb
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 22:12:53 +0000
Received: by wicge5 with SMTP id ge5so9218134wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2015 15:12:31 -0700 (PDT)
Sender: Luis de Bethencourt <bethencourt@gmail.com>
From: Luis de Bethencourt <luis@debethencourt.com>
Date: Fri, 18 Sep 2015 00:12:30 +0200
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Aaron Sierra <asierra@xes-inc.com>,
 Jaiprakash Singh <b44839@freescale.com>, Wolfram Sang <wsa@the-dreams.de>,
 Nicholas Mc Guire <hofrat@osadl.org>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] mtd: fsl_ifc_nand: Fix module autoload for OF platform
 driver
Message-ID: <20150917221230.GA9222@goodgumbo.baconseed.org>
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
 drivers/mtd/nand/fsl_ifc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index a4e27e8..429142e 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -1163,6 +1163,7 @@ static const struct of_device_id fsl_ifc_nand_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, fsl_ifc_nand_match);
 
 static struct platform_driver fsl_ifc_nand_driver = {
 	.driver = {
-- 
2.4.6
