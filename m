Received: from mail-qa0-x22c.google.com ([2607:f8b0:400d:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xwejp-0005Zo-1S
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 22:19:06 +0000
Received: by mail-qa0-f44.google.com with SMTP id i13so12440059qae.17
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 14:18:42 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [RFC] mtd: fsl-quadspi: Allow driver to probe
Date: Thu,  4 Dec 2014 20:18:18 -0200
Message-Id: <1417731498-13962-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Calling clk_rate causes the kernel to oops:

[    1.037920] Division by zero in kernel.
[    1.041807] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.18.0-rc7-next-20141204-00002-g5aa23e1 #2143
[    1.050967] Hardware name: Freescale i.MX6 SoloX (Device Tree)
[    1.056853] Backtrace: 
[    1.059360] [<80011ea0>] (dump_backtrace) from [<8001203c>] (show_stack+0x18/0x1c)
[    1.066982]  r6:00000000 r5:00000000 r4:00000000 r3:00000000
[    1.072754] [<80012024>] (show_stack) from [<806b7100>] (dump_stack+0x88/0xa4)
[    1.080038] [<806b7078>] (dump_stack) from [<80011d20>] (__div0+0x18/0x20)
[    1.086958]  r5:be018500 r4:be017c00
[    1.090600] [<80011d08>] (__div0) from [<802aa418>] (Ldiv0+0x8/0x10)
[    1.097012] [<80504fbc>] (clk_divider_set_rate) from [<80503ddc>] (clk_change_rate+0x14c/0x17c)
[    1.105759]  r7:00000000 r6:00000000 r5:be018500 r4:00000000
[    1.111516] [<80503c90>] (clk_change_rate) from [<80503ea0>] (clk_set_rate+0x94/0x98)
[    1.119391]  r8:be7e0368 r7:00000000 r6:be11a000 r5:be018500 r4:00000000 r3:00000000
[    1.127290] [<80503e0c>] (clk_set_rate) from [<80410558>] (fsl_qspi_probe+0x23c/0x75c)
[    1.135260]  r5:be11a010 r4:be350010
[    1.138900] [<8041031c>] (fsl_qspi_probe) from [<80385a18>] (platform_drv_probe+0x50/0xac)
[    1.147214]  r10:00000000 r9:80960964 r8:809b3a5c r7:809b3a5c r6:fffffdfb r5:be11a010
[    1.155180]  r4:ffffffed
[    1.157761] [<803859c8>] (platform_drv_probe) from [<80384360>] (driver_probe_device+0x10c/0x234)
[    1.166679]  r7:00000000 r6:00000000 r5:be11a010 r4:811df1bc
[    1.172443] [<80384254>] (driver_probe_device) from [<80384524>] (__driver_attach+0x9c/0xa0)
[    1.180926]  r10:00000000 r8:8094cd4c r7:00000000 r6:be11a044 r5:809b3a5c r4:be11a010
[    1.188904] [<80384488>] (__driver_attach) from [<80382990>] (bus_for_each_dev+0x5c/0x90)
[    1.197129]  r6:80384488 r5:809b3a5c r4:00000000 r3:be10c25c
[    1.202886] [<80382934>] (bus_for_each_dev) from [<80383e48>] (driver_attach+0x20/0x28)
[    1.210933]  r6:809a6ee0 r5:be396280 r4:809b3a5c
[    1.215653] [<80383e28>] (driver_attach) from [<80383abc>] (bus_add_driver+0xdc/0x1dc)
[    1.223606] [<803839e0>] (bus_add_driver) from [<80384be4>] (driver_register+0x80/0xfc)
[    1.231655]  r7:809155ec r6:be393a40 r5:8097e018 r4:809b3a5c
[    1.237433] [<80384b64>] (driver_register) from [<803858a0>] (__platform_driver_register+0x50/0x64)
[    1.246523]  r5:8097e018 r4:8097e018
[    1.250162] [<80385850>] (__platform_driver_register) from [<8094cd64>] (fsl_qspi_driver_init+0x18/0x20)
[    1.259704] [<8094cd4c>] (fsl_qspi_driver_init) from [<80008a7c>] (do_one_initcall+0x88/0x1dc)
[    1.268375] [<800089f4>] (do_one_initcall) from [<80915e38>] (kernel_init_freeable+0x110/0x1e0)
[    1.277121]  r10:80960970 r9:80960964 r8:000000cc r7:809155ec r6:809d9cc0 r5:00000006
[    1.285084]  r4:8096de1c
[    1.287661] [<80915d28>] (kernel_init_freeable) from [<806b1bcc>] (kernel_init+0x10/0xf4)
[    1.295886]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:806b1bbc
[    1.303832]  r4:00000000
[    1.306430] [<806b1bbc>] (kernel_init) from [<8000ed68>] (ret_from_fork+0x14/0x2c)
[    1.314025]  r4:00000000 r3:00000000
[    1.318397] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    1.328474] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    1.337139] Division by zero in kernel.
[    1.341018] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.18.0-rc7-next-20141204-00002-g5aa23e1 #2143
[    1.350145] Hardware name: Freescale i.MX6 SoloX (Device Tree)
[    1.356029] Backtrace: 
[    1.358532] [<80011ea0>] (dump_backtrace) from [<8001203c>] (show_stack+0x18/0x1c)
[    1.366155]  r6:00000000 r5:00000000 r4:00000000 r3:00000000
[    1.371928] [<80012024>] (show_stack) from [<806b7100>] (dump_stack+0x88/0xa4)
[    1.379210] [<806b7078>] (dump_stack) from [<80011d20>] (__div0+0x18/0x20)
[    1.386132]  r5:be018500 r4:be017c00
[    1.389771] [<80011d08>] (__div0) from [<802aa418>] (Ldiv0+0x8/0x10)
[    1.396181] [<80504fbc>] (clk_divider_set_rate) from [<80503ddc>] (clk_change_rate+0x14c/0x17c)
[    1.404932]  r7:be350660 r6:00000000 r5:be018500 r4:00000000
[    1.410690] [<80503c90>] (clk_change_rate) from [<80503ea0>] (clk_set_rate+0x94/0x98)
[    1.418564]  r8:00000003 r7:be350660 r6:c0990000 r5:be018500 r4:00000000 r3:00000000
[    1.426462] [<80503e0c>] (clk_set_rate) from [<8041087c>] (fsl_qspi_probe+0x560/0x75c)
[    1.434427]  r5:be11a010 r4:be350010
[    1.438066] [<8041031c>] (fsl_qspi_probe) from [<80385a18>] (platform_drv_probe+0x50/0xac)
[    1.446381]  r10:00000000 r9:80960964 r8:809b3a5c r7:809b3a5c r6:fffffdfb r5:be11a010
[    1.454325]  r4:ffffffed
[    1.456930] [<803859c8>] (platform_drv_probe) from [<80384360>] (driver_probe_device+0x10c/0x234)
[    1.465852]  r7:00000000 r6:00000000 r5:be11a010 r4:811df1bc
[    1.471614] [<80384254>] (driver_probe_device) from [<80384524>] (__driver_attach+0x9c/0xa0)
[    1.480098]  r10:00000000 r8:8094cd4c r7:00000000 r6:be11a044 r5:809b3a5c r4:be11a010
[    1.488078] [<80384488>] (__driver_attach) from [<80382990>] (bus_for_each_dev+0x5c/0x90)
[    1.496306]  r6:80384488 r5:809b3a5c r4:00000000 r3:be10c25c
[    1.502070] [<80382934>] (bus_for_each_dev) from [<80383e48>] (driver_attach+0x20/0x28)
[    1.510124]  r6:809a6ee0 r5:be396280 r4:809b3a5c
[    1.514847] [<80383e28>] (driver_attach) from [<80383abc>] (bus_add_driver+0xdc/0x1dc)
[    1.522800] [<803839e0>] (bus_add_driver) from [<80384be4>] (driver_register+0x80/0xfc)
[    1.530849]  r7:809155ec r6:be393a40 r5:8097e018 r4:809b3a5c
[    1.536629] [<80384b64>] (driver_register) from [<803858a0>] (__platform_driver_register+0x50/0x64)
[    1.545722]  r5:8097e018 r4:8097e018
[    1.549362] [<80385850>] (__platform_driver_register) from [<8094cd64>] (fsl_qspi_driver_init+0x18/0x20)
[    1.558901] [<8094cd4c>] (fsl_qspi_driver_init) from [<80008a7c>] (do_one_initcall+0x88/0x1dc)
[    1.567575] [<800089f4>] (do_one_initcall) from [<80915e38>] (kernel_init_freeable+0x110/0x1e0)
[    1.576325]  r10:80960970 r9:80960964 r8:000000cc r7:809155ec r6:809d9cc0 r5:00000006
[    1.584270]  r4:8096de1c
[    1.586867] [<80915d28>] (kernel_init_freeable) from [<806b1bcc>] (kernel_init+0x10/0xf4)
[    1.595090]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:806b1bbc
[    1.603033]  r4:00000000
[    1.605629] [<806b1bbc>] (kernel_init) from [<8000ed68>] (ret_from_fork+0x14/0x2c)
[    1.613222]  r4:00000000 r3:00000000
[    1.616906] fsl-quadspi 21e4000.qspi: QuadSPI SPI NOR flash driver

If I remove the calls to clk_set_rate the driver can probe:

[    1.039364] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    1.049301] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    1.057986] fsl-quadspi 21e4000.qspi: QuadSPI SPI NOR flash driver


I don't know what would be the appropriate fix, so marking this as RFC.

Suggestions welcome. Thanks

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 39763b9..ed49e1f 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -601,12 +601,6 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg;
-	int ret;
-
-	/* the default frequency, we will change it in the future.*/
-	ret = clk_set_rate(q->clk, 66000000);
-	if (ret)
-		return ret;
 
 	/* Init the LUT table. */
 	fsl_qspi_init_lut(q);
@@ -634,15 +628,10 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 {
 	unsigned long rate = q->clk_rate;
-	int ret;
 
 	if (is_imx6sx_qspi(q))
 		rate *= 4;
 
-	ret = clk_set_rate(q->clk, rate);
-	if (ret)
-		return ret;
-
 	/* Init the LUT table again. */
 	fsl_qspi_init_lut(q);
 
-- 
1.9.1
