Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKY66-0005Ze-TP
 for linux-mtd@lists.infradead.org; Sun, 08 Feb 2015 20:04:51 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: pxa3xx_nand: fix driver when num_cs is 0
Date: Sun,  8 Feb 2015 21:02:09 +0100
Message-Id: <1423425729-20671-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As the devicetree binding doesn't require num_cs to exist or be strictly
positive, and neither does the platform data case, a bug appear when
num_cs is set to 0 and panics the kernel.

The issue is that in alloc_nand_resource(), chip is dereferenced without
having a value assigned when num_cs == 0.

Fix this by returning ENODEV is num_cs == 0.

The panic seen is :
Unable to handle kernel NULL pointer dereference at virtual address 000002b8
pgd = c0004000
[000002b8] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT ARM
Modules linked in:
Hardware name: Marvell PXA3xx (Device Tree Support)
task: c3822aa0 ti: c3826000 task.ti: c3826000
PC is at alloc_nand_resource+0x180/0x4a8
LR is at alloc_nand_resource+0xa0/0x4a8
pc : [<c0275b90>]    lr : [<c0275ab0>]    psr: 68000013
sp : c3827d90  ip : 00000000  fp : 00000000
r10: c3862200  r9 : 0000005e  r8 : 00000000
r7 : c3865610  r6 : c3862210  r5 : c3924210  r4 : c3862200
r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0000397f  Table: 80004018  DAC: 00000035
Process swapper (pid: 1, stack limit = 0xc3826198)
Stack: (0xc3827d90 to 0xc3828000)
...zip...
[<c0275b90>] (alloc_nand_resource) from [<c0275ff8>] (pxa3xx_nand_probe+0x140/0x978)
[<c0275ff8>] (pxa3xx_nand_probe) from [<c0258c40>] (platform_drv_probe+0x48/0xa4)
[<c0258c40>] (platform_drv_probe) from [<c0257650>] (driver_probe_device+0x80/0x21c)
[<c0257650>] (driver_probe_device) from [<c0257878>] (__driver_attach+0x8c/0x90)
[<c0257878>] (__driver_attach) from [<c0255ec4>] (bus_for_each_dev+0x58/0x88)
[<c0255ec4>] (bus_for_each_dev) from [<c0256ec8>] (bus_add_driver+0xd8/0x1d4)
[<c0256ec8>] (bus_add_driver) from [<c0257f14>] (driver_register+0x78/0xf4)
[<c0257f14>] (driver_register) from [<c00088a8>] (do_one_initcall+0x80/0x1e4)
[<c00088a8>] (do_one_initcall) from [<c048ed08>] (kernel_init_freeable+0xec/0x1b4)
[<c048ed08>] (kernel_init_freeable) from [<c0377d8c>] (kernel_init+0x8/0xe4)
[<c0377d8c>] (kernel_init) from [<c00095f8>] (ret_from_fork+0x14/0x3c)
Code: e503b234 e5953008 e1530001 caffffd1 (e59002b8)
---[ end trace a5770060c8441895 ]---

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 96b0b1d..4a2df63 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1572,6 +1572,8 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	int ret, irq, cs;
 
 	pdata = dev_get_platdata(&pdev->dev);
+	if (pdata->num_cs <= 0)
+		return -ENODEV;
 	info = devm_kzalloc(&pdev->dev, sizeof(*info) + (sizeof(*mtd) +
 			    sizeof(*host)) * pdata->num_cs, GFP_KERNEL);
 	if (!info)
-- 
2.1.0
