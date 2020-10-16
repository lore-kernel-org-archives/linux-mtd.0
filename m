Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884C6C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:54:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 828D420848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m412bSA9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 828D420848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RCF1vMIbBIfK3oOkgwyOrrNsPUAPy7KJvKWFadeZwCQ=; b=m412bSA9g8yLWgYangBYKljbR
	U49ABaIotkqkq2vcRuKlourdbimCNw07Q5dMxdO5tp0/hzM37bsgiI7yN7iMEDa59ip2E6X4HMJxK
	VAfBIdbKlPERoAnvC7rVZu7Y+sjE6XOKNyZGtrAzNAiGHi8otbHZrmZmeNgU5hPNXGzSWZJ56+D6z
	/vCI0CnXkpXPjTRFSEUTX4bjEH8dLGlhp7TwZmczfOc4xEehKWO5uIcHnn+w/hjkr+P9u5pfWCwFc
	ISYCWT6CGkoGYIqKfOhZJppWkYltXmTDHHkIdt0tYt0F1nxTR9AxtffL8Rg8l9Vyq6Ou6V/UNyQ2m
	kf9rvji9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTQBH-0003TG-Bi; Fri, 16 Oct 2020 13:54:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTQBF-0003Ss-Hy
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 13:54:02 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kTQB7-0007fe-1K; Fri, 16 Oct 2020 15:53:53 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kTQB5-00019N-OX; Fri, 16 Oct 2020 15:53:51 +0200
Date: Fri, 16 Oct 2020 15:53:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
Message-ID: <20201016135351.GL13710@pengutronix.de>
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016074942.29650-1-miquel.raynal@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:49:26 up 239 days, 21:19, 147 users,  load average: 0.01, 0.08,
 0.13
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_095401_599720_5D99AFF8 
X-CRM114-Status: GOOD (  18.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Fri, Oct 16, 2020 at 09:49:42AM +0200, Miquel Raynal wrote:
> No ECC initialization should happen during the host controller probe.
> 
> Indeed, we need the probe to call nand_scan() in order to:
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
> 
> Moving these lines to mxcnd_attach_chip() fixes a regression caused by
> a previous commit supposed to clarify these steps.
> 
> Fixes: TODO
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Hi Han,
> 
> Could you please give this patch a shot? It is supposed to fix
> the LS1043A issue we have seen in robots reports the last weeks.

With this there's no longer a division by zero in the kernel, but NAND
now fails with the following. Also I can confirm that "mtd: rawnand:
Use the ECC framework user input parsing bits" in next breaks it, without
this patch the driver runs well.

Sascha

nand: device found, Manufacturer ID: 0x20, Chip ID: 0xa1
nand: ST Micro NAND01GR3B2CZA6
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/mxc_nand.c:1390 mxc_nand_command+0xc4/0x26c
Unimplemented command (cmd=0)
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.9.0-rc2-00020-g2e00450a5852 #20
Hardware name: Freescale i.MX27 (Device Tree Support)
[<c00106a4>] (unwind_backtrace) from [<c000dd08>] (show_stack+0x10/0x18)
[<c000dd08>] (show_stack) from [<c037950c>] (dump_stack+0x20/0x2c)
[<c037950c>] (dump_stack) from [<c001c68c>] (__warn+0xb8/0xec)
[<c001c68c>] (__warn) from [<c001ca54>] (warn_slowpath_fmt+0x90/0xbc)
[<c001ca54>] (warn_slowpath_fmt) from [<c0494cb8>] (mxc_nand_command+0xc4/0x26c)
[<c0494cb8>] (mxc_nand_command) from [<c0489f50>] (nand_read_page_op+0x28c/0x300)
[<c0489f50>] (nand_read_page_op) from [<c048a0d4>] (nand_read_page_raw+0x2c/0x6c)
[<c048a0d4>] (nand_read_page_raw) from [<c0486b68>] (nand_read_page_swecc+0x38/0x11c)
[<c0486b68>] (nand_read_page_swecc) from [<c0487f5c>] (nand_read_oob+0x238/0x730)
[<c0487f5c>] (nand_read_oob) from [<c047650c>] (mtd_read_oob+0x84/0x14c)
[<c047650c>] (mtd_read_oob) from [<c048eb7c>] (scan_read+0xd0/0x138)
[<c048eb7c>] (scan_read) from [<c048fe18>] (search_bbt+0x254/0x2cc)
[<c048fe18>] (search_bbt) from [<c0490068>] (nand_create_bbt+0x1d8/0x6ec)
[<c0490068>] (nand_create_bbt) from [<c048d20c>] (nand_scan_with_ids+0x10fc/0x164c)
[<c048d20c>] (nand_scan_with_ids) from [<c0495dd8>] (mxcnd_probe+0x2bc/0x3b4)
[<c0495dd8>] (mxcnd_probe) from [<c041c2b4>] (platform_drv_probe+0x4c/0xa0)
[<c041c2b4>] (platform_drv_probe) from [<c0419e18>] (really_probe+0x1e8/0x3d0)
[<c0419e18>] (really_probe) from [<c041a170>] (driver_probe_device+0x54/0xb0)
[<c041a170>] (driver_probe_device) from [<c041a384>] (device_driver_attach+0x5c/0x64)
[<c041a384>] (device_driver_attach) from [<c041a3e8>] (__driver_attach+0x5c/0xcc)
[<c041a3e8>] (__driver_attach) from [<c0417f30>] (bus_for_each_dev+0x78/0xc4)
[<c0417f30>] (bus_for_each_dev) from [<c0419734>] (driver_attach+0x18/0x24)
[<c0419734>] (driver_attach) from [<c04191b4>] (bus_add_driver+0x178/0x1d8)
[<c04191b4>] (bus_add_driver) from [<c041af74>] (driver_register+0x74/0x114)
[<c041af74>] (driver_register) from [<c041c20c>] (__platform_driver_register+0x30/0x48)
[<c041c20c>] (__platform_driver_register) from [<c090ecb8>] (mxcnd_driver_init+0x10/0x1c)
[<c090ecb8>] (mxcnd_driver_init) from [<c000a1dc>] (do_one_initcall+0x50/0x278)
[<c000a1dc>] (do_one_initcall) from [<c08ebffc>] (kernel_init_freeable+0x13c/0x1c0)
[<c08ebffc>] (kernel_init_freeable) from [<c070e150>] (kernel_init+0x8/0xf8)
[<c070e150>] (kernel_init) from [<c0008560>] (ret_from_fork+0x14/0x34)
Exception stack(0xc783dfb0 to 0xc783dff8)
dfa0:                                     00000000 00000000 00000000 00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end trace 0f9701f8ecf348de ]---
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
Bad block table not found for chip 0
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
