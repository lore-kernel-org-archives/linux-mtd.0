Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB8EC83F0A
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jul 2025 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:From:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl1fS0pBpmU5f5t6yvhvR6vaYf7UHaxZMlfOhlrh+mc=; b=3Ba7uxIiX3Lw7O
	BcmG5xbCX3Wg9u/v3xxnJUZ6aQlmTOkcjWPWR3WDFfDVKaxV8kZR8QJ5Z2LJkCS7oq+KD8RQV17mS
	IsLDecmIbjBCOXD7fhZ5XRxFpwxTLJ7vdKpT57SLe5UEq9C/QUPd0NVEzOMaBcMsiF8DshISDCah8
	ov2m1ORJ8f79FdETUT1s6sJCahsjIBjhbRKcalBjxcoNCADN1BZSnL0T2Z/rVtSO7IONgQwDKyuK/
	OWJv0vJZJ4ZCdDPNe+12TNoRzBnHYW6CrSq7iXd7utIe7tJqhWC5SSsW3WaSe2qk2w3uvpATia5Fh
	gjzCfecHIYdj+z3fsbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXh4-00000009Jqz-2DgS;
	Wed, 09 Jul 2025 16:30:50 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVrv-00000008zr9-30CN
	for linux-mtd@lists.infradead.org;
	Wed, 09 Jul 2025 14:33:56 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 347636C7;
	Wed,  9 Jul 2025 16:33:42 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 09 Jul 2025 16:33:41 +0200
Message-Id: <DB7LJZF3AZQJ.2I5EWYORV6K33@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <khairul.anuar.romli@altera.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Matthew Gerlach"
 <matthew.gerlach@altera.com>
Subject: Re: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
X-Mailer: aerc 0.16.0
References: <cover.1752024352.git.khairul.anuar.romli@altera.com>
 <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>
In-Reply-To: <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073355_893375_6BAB9585 
X-CRM114-Status: GOOD (  19.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Ensure that the pointer passed to module_put() in spi_nor_put_device() is
> not NULL before use. This change adds a guard clause to return early,
> preventing the kernel crash below when the cadence-qspi driver is removed
> during a dd operation:
>
> [  200.448732] Unable to handle kernel NULL pointer deref
> erence at virtual address 0000000000000010
> [  200.457576] Mem abort info:
> [  200.460370]   ESR = 0x0000000096000004
> [  200.464136]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  200.469527]   SET = 0, FnV = 0
> [  200.472609]   EA = 0, S1PTW = 0
> [  200.475904]   FSC = 0x04: level 0 translation fault
> [  200.480786] Data abort info:
> [  200.483659]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [  200.489141]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  200.494189]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  200.499500] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000185df8000
> [  200.505932] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
> [  200.512720] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [  200.518968] Modules linked in: 8021q garp mrp stp llc bluetooth ecdh_generic
> ecc rfkill crct10dif_ce rtc_ds1307 at24 stratix10_soc soc64_hwmon gpio_altera of
> _fpga_region fpga_region fpga_bridge uio_pdrv_genirq uio fuse drm backlight ipv6
> [  200.540016] CPU: 0 UID: 0 PID: 372 Comm: dd Not tainted 6.12.19-altera-gb6b26
> c4179a6 #1
> [  200.547996] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
> [  200.553292] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  200.560234] pc : spi_nor_put_device+0x30/0x60
> [  200.564594] lr : __put_mtd_device+0x8c/0x120
> [  200.568856] sp : ffff80008411bc20
> [  200.572161] x29: ffff80008411bc20 x28: ffff000185e2c500 x27: 0000000000000000
> [  200.579282] x26: 0000000000000000 x25: ffff000185e2cb00 x24: ffff000185e2cc88
> [  200.586404] x23: ffff00018034c620 x22: 0000000000000001 x21: ffff00018873e080
> [  200.593524] x20: 0000000000000000 x19: ffff00018873e080 x18: ffffffffffffffff
> [  200.600645] x17: 0030393d524f4a41 x16: 4d0064746d3d4d45 x15: ffff000185757700
> [  200.607767] x14: 0000000000000000 x13: ffff000180045010 x12: ffff0001857576c0
> [  200.614888] x11: 000000000000003a x10: ffff000180045018 x9 : ffff000180045010
> [  200.622009] x8 : ffff80008411bb70 x7 : 0000000000000000 x6 : ffff000181325048
> [  200.629129] x5 : 00000000820001cf x4 : fffffdffc60095e0 x3 : 0000000000000000
> [  200.636250] x2 : 0000000000000000 x1 : ffff00018873e080 x0 : 0000000000000000
> [  200.643371] Call trace:
> [  200.645811]  spi_nor_put_device+0x30/0x60
> [  200.649816]  __put_mtd_device+0x8c/0x120
> [  200.653731]  put_mtd_device+0x30/0x48
> [  200.657387]  mtdchar_close+0x30/0x78
> [  200.660958]  __fput+0xc8/0x2d0
> [  200.664011]  ____fput+0x14/0x20
> [  200.667146]  task_work_run+0x70/0xdc
> [  200.670718]  do_exit+0x2b4/0x8e4
> [  200.673944]  do_group_exit+0x34/0x90
> [  200.677512]  pid_child_should_wake+0x0/0x60
> [  200.681686]  invoke_syscall+0x48/0x104
> [  200.685432]  el0_svc_common.constprop.0+0xc0/0xe0
> [  200.690128]  do_el0_svc+0x1c/0x28
> [  200.693439]  el0_svc+0x30/0xcc
> [  200.696454] dw_mmc ff808000.mmc: Unexpected interrupt latency
> [  200.696485]  el0t_64_sync_handler+0x120/0x12c
> [  200.706552]  el0t_64_sync+0x190/0x194
> [  200.710213] Code: f9400000 f9417c00 f9402000 f9403400 (f9400800)
> [  200.716290] ---[ end trace 0000000000000000 ]---
> [  200.720948] Fixing recursive fault but reboot is needed!
>
> Fixes: be94215be1ab ("mtd: spi-nor: core: Fix an issue of releasing resources during read/write")
> CC: stable@vger.kernel.org # 6.12+
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  drivers/mtd/spi-nor/core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ac4b960101cc..501e48a342ad 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3213,6 +3213,9 @@ static int spi_nor_get_device(struct mtd_info *mtd)
>  	if (!try_module_get(dev->driver->owner))
>  		return -ENODEV;
>  
> +	if (!dev && !dev->driver && !dev->driver->owner)
> +		return -EINVAL;
> +
>  	return 0;
>  }
>  
> @@ -3227,7 +3230,8 @@ static void spi_nor_put_device(struct mtd_info *mtd)
>  	else
>  		dev = nor->dev;
>  
> -	module_put(dev->driver->owner);
> +	if (dev && dev->driver && dev->driver->owner)
> +		module_put(dev->driver->owner);

Why is dev->driver or dev->driver->owner NULL in the first place?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
