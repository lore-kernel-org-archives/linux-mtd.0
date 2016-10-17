Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=s-opensource.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwAe1-0001IU-7e
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 16:20:10 +0000
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: omap2: Fix module autoload
Date: Mon, 17 Oct 2016 13:19:37 -0300
Message-Id: <1476721177-3425-1-git-send-email-javier@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/mtd/nand/omap2_nand.ko | grep alias
alias:          platform:omap2-nand

After this patch:

$ modinfo drivers/mtd/nand/omap2_nand.ko | grep alias
alias:          platform:omap2-nand
alias:          of:N*T*Cti,omap2-nandC*
alias:          of:N*T*Cti,omap2-nand

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/mtd/nand/omap2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 5513bfd9cdc9..0934c3b3f70e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -2197,6 +2197,7 @@ static const struct of_device_id omap_nand_ids[] = {
 	{ .compatible = "ti,omap2-nand", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, omap_nand_ids);
 
 static struct platform_driver omap_nand_driver = {
 	.probe		= omap_nand_probe,
-- 
2.7.4
