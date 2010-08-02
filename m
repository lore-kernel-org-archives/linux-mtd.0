Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OfrNp-0002l1-7e
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 09:32:34 +0000
Date: Mon, 2 Aug 2010 11:32:30 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mxc_nand: fix Unbalanced enable for IRQ
Message-ID: <20100802093230.GA29811@pengutronix.de>
References: <1276178584-10074-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1276178584-10074-1-git-send-email-eric@eukrea.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd@lists.infradead.org, ivo.clarysse@gmail.com, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

can we please have this patch soon in mainline.  This bugs our
autobuilder since long.

Best regards
Uwe

On Thu, Jun 10, 2010 at 04:03:04PM +0200, Eric Bénard wrote:
> * preset should be done before sending the reset command
> 
> * without this, I get the following error on an i.MX35 :
> [    0.900000] ------------[ cut here ]------------
> [    0.900000] WARNING: at kernel/irq/manage.c:290 __enable_irq+0x4c/0x88()
> [    0.900000] Unbalanced enable for IRQ 33
> [    0.900000] Modules linked in:
> [    0.900000] [<c002ffb8>] (unwind_backtrace+0x0/0xf0) from [<c02f7d0c>] (dump_stack+0x18/0x1c)
> [    0.900000] [<c02f7d0c>] (dump_stack+0x18/0x1c) from [<c0049a44>] (warn_slowpath_common+0x54/0x6c)
> [    0.900000] [<c0049a44>] (warn_slowpath_common+0x54/0x6c) from [<c0049b00>] (warn_slowpath_fmt+0x38/0x40)
> [    0.900000] [<c0049b00>] (warn_slowpath_fmt+0x38/0x40) from [<c008f65c>] (__enable_irq+0x4c/0x88)
> [    0.900000] [<c008f65c>] (__enable_irq+0x4c/0x88) from [<c008fca0>] (enable_irq+0x54/0x98)
> [    0.900000] [<c008fca0>] (enable_irq+0x54/0x98) from [<c021e618>] (wait_op_done+0x40/0x134)
> [    0.900000] [<c021e618>] (wait_op_done+0x40/0x134) from [<c021e808>] (send_cmd+0x30/0x38)
> [    0.900000] [<c021e808>] (send_cmd+0x30/0x38) from [<c021eb8c>] (mxc_nand_command+0x26c/0x328)
> [    0.900000] [<c021eb8c>] (mxc_nand_command+0x26c/0x328) from [<c021aa60>] (nand_scan_ident+0x188/0x6c0)
> [    0.900000] [<c021aa60>] (nand_scan_ident+0x188/0x6c0) from [<c001a9cc>] (mxcnd_probe+0x2b8/0x3d0)
> [    0.900000] [<c001a9cc>] (mxcnd_probe+0x2b8/0x3d0) from [<c01f9e88>] (platform_drv_probe+0x20/0x24)
> [    0.900000] [<c01f9e88>] (platform_drv_probe+0x20/0x24) from [<c01f8c38>] (driver_probe_device+0xb0/0x164)
> [    0.900000] [<c01f8c38>] (driver_probe_device+0xb0/0x164) from [<c01f8d54>] (__driver_attach+0x68/0x8c)
> [    0.900000] [<c01f8d54>] (__driver_attach+0x68/0x8c) from [<c01f8348>] (bus_for_each_dev+0x50/0x84)
> [    0.900000] [<c01f8348>] (bus_for_each_dev+0x50/0x84) from [<c01f8a9c>] (driver_attach+0x20/0x28)
> [    0.900000] [<c01f8a9c>] (driver_attach+0x20/0x28) from [<c01f7c00>] (bus_add_driver+0x144/0x2dc)
> [    0.900000] [<c01f7c00>] (bus_add_driver+0x144/0x2dc) from [<c01f906c>] (driver_register+0xb0/0x13c)
> [    0.900000] [<c01f906c>] (driver_register+0xb0/0x13c) from [<c01fa13c>] (platform_driver_register+0x4c/0x60)
> [    0.900000] [<c01fa13c>] (platform_driver_register+0x4c/0x60) from [<c01fa170>] (platform_driver_probe+0x20/0xa0)
> [    0.900000] [<c01fa170>] (platform_driver_probe+0x20/0xa0) from [<c001a708>] (mxc_nd_init+0x18/0x24)
> [    0.900000] [<c001a708>] (mxc_nd_init+0x18/0x24) from [<c002938c>] (do_one_initcall+0x64/0x1bc)
> [    0.900000] [<c002938c>] (do_one_initcall+0x64/0x1bc) from [<c00084c4>] (kernel_init+0xe8/0x1ac)
> [    0.900000] [<c00084c4>] (kernel_init+0xe8/0x1ac) from [<c002aee8>] (kernel_thread_exit+0x0/0x8)
> [    0.900000] ---[ end trace 8bf72ac6ba089a19 ]---
> [    1.140000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB 3,3V 8-bit)
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  drivers/mtd/nand/mxc_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 82e9438..8878503 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -604,8 +604,8 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>  	/* Command pre-processing step */
>  	switch (command) {
>  	case NAND_CMD_RESET:
> -		send_cmd(host, command, false);
>  		preset(mtd);
> +		send_cmd(host, command, false);
>  		break;
>  
>  	case NAND_CMD_STATUS:
> -- 
> 1.6.3.3
> 
> 

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
