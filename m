Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F01D711BD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rknUvzVr3wBoA+WgUqKyw7oNVZBC7ihRu92Wg7mhKy8=; b=vgohIGGIvxQOGz
	gcYDgZCU7790bBZ99FGX7QPT9uRdkUvi7n6+B9Xs7QJpyJlz/HvR1P3MQAz/hEP30/9Ijfb9wKNK2
	1qAbTg3o2bu8lM0rKYggDcPyIsmeguLjMyA/nVczmIxa6zTtHncYl1WBbFuQeV5/p1CPsFYmlb+ax
	EFZlfVWDuxDp+WSWvktmE8AwBMggAg5jFE86pJs61Cjjis3f2QEX4uN9booy81nKQi7ZoeLdyOKyr
	U07yeHyVRuKiLrX2LXwfD300Jc+THQofBy9M8WjPO/JwJmnewx6FDLgUIarUPG+fknMFXOmbHSS05
	M9DVq5x0C84d5yqYCaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmzY-0000000FjDo-1Stt;
	Wed, 20 Nov 2024 15:51:44 +0000
Received: from lisa.dawes.za.net ([178.63.77.189])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmzU-0000000FjD4-1sN9
	for linux-mtd@lists.infradead.org;
	Wed, 20 Nov 2024 15:51:42 +0000
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
	id C652A1401AB; Wed, 20 Nov 2024 17:51:35 +0200 (SAST)
Date: Wed, 20 Nov 2024 17:51:35 +0200
From: Rogan Dawes <rogan@dawes.za.net>
To: linux-mtd@lists.infradead.org
Subject: Re: Parsing extracted i.MX NAND flash
Message-ID: <20241120155135.GA27335@lisa.dawes.za.net>
References: <20241118173939.GA11581@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118173939.GA11581@lisa.dawes.za.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_075140_771738_DFB30BF5 
X-CRM114-Status: GOOD (  23.20  )
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

On Mon, Nov 18, 2024 at 07:39:39PM +0200, Rogan Dawes wrote:
> Hi folks,
> 
> I have an i.MX6 target I am trying to get a shell on. It is using High
> Assurance Boot and various other configurations to prevent this. My
> current approach is to remove the flash, extract the filesystems, modify
> one that is not subject to HAB, then put it all back, in order to enable
> a shell.
> 
> I have removed the flash, and extracted its contents using an Xgecu
> flash reader. Now I need to parse the FCB and extract the actual data
> from the dump. I have found imx-nand-tools, but this doesn't work due to
> bitrot (the bchlib dependency has moved on while imx-nand-tools has not
> been updated).

I was able to get imx-nand-tools working by pinning the version of the
bchlib dependency to v0.14.0, and have been able to obtain a "clean"
flash image. Still trying to mount the various UBI filesystems, as I get
the following errors:

[360972.710050] ubi0: default fastmap pool size: 8
[360972.710055] ubi0: default fastmap WL pool size: 4
[360972.710056] ubi0: attaching mtd5
[360972.710099] ubi0 error: validate_ec_hdr [ubi]: bad VID header offset 2048, expected 512
[360972.710116] ubi0 error: validate_ec_hdr [ubi]: bad EC header
[360972.710127] Erase counter header dump:
[360972.710128]         magic          0x55424923
[360972.710129]         version        1
[360972.710130]         ec             4502
[360972.710132]         vid_hdr_offset 2048
[360972.710133]         data_offset    4096
[360972.710134]         image_seq      907378069
[360972.710135]         hdr_crc        0xa56c51f1
[360972.710136] erase counter header hexdump:
[360972.710138] 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 11 96 00 00 08 00 00 00 10 00 36 15 7d 95 00 00 00 00  UBI#....................6.}.....
[360972.710140] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 a5 6c 51 f1  .............................lQ.
[360972.710142] CPU: 3 PID: 25109 Comm: ubiattach Not tainted 6.8.0-48-generic #48~22.04.1-Ubuntu
[360972.710145] Hardware name: LENOVO Enter the machine type an/3136, BIOS M1UKT77A 04/10/2024
[360972.710146] Call Trace:
[360972.710148]  <TASK>
[360972.710150]  dump_stack_lvl+0x76/0xa0
[360972.710154]  dump_stack+0x10/0x20
[360972.710156]  validate_ec_hdr+0x86/0xd0 [ubi]
[360972.710166]  ubi_io_read_ec_hdr+0x246/0x2d0 [ubi]
[360972.710177]  scan_peb+0xa9/0x680 [ubi]
[360972.710189]  scan_fast+0x9a/0x1c0 [ubi]
[360972.710199]  ? kmem_cache_create+0x16/0x30
[360972.710204]  ubi_attach+0x231/0x2b0 [ubi]
[360972.710215]  ubi_attach_mtd_dev+0x3ad/0x7b0 [ubi]
[360972.710226]  ctrl_cdev_ioctl+0x121/0x200 [ubi]
[360972.710236]  __x64_sys_ioctl+0xa0/0xf0
[360972.710240]  x64_sys_call+0xa68/0x24b0
[360972.710243]  do_syscall_64+0x81/0x170
[360972.710246]  ? syscall_exit_to_user_mode+0x83/0x260
[360972.710249]  ? do_syscall_64+0x8d/0x170
[360972.710252]  ? do_user_addr_fault+0x337/0x670
[360972.710254]  ? irqentry_exit_to_user_mode+0x78/0x260
[360972.710257]  ? irqentry_exit+0x43/0x50
[360972.710258]  ? exc_page_fault+0x94/0x1b0
[360972.710260]  entry_SYSCALL_64_after_hwframe+0x78/0x80
[360972.710263] RIP: 0033:0x78da6251a94f
[360972.710277] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00
f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[360972.710279] RSP: 002b:00007ffeb0640dc0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[360972.710282] RAX: ffffffffffffffda RBX: 00007ffeb0642810 RCX: 000078da6251a94f[360972.710284] RDX: 00007ffeb0640f00 RSI: 0000000040186f40 RDI: 0000000000000003
[360972.710285] RBP: 0000000000000003 R08: 0000000000000000 R09: 00007ffeb0642810
[360972.710287] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffeb0640f00
[360972.710288] R13: 00007ffeb0640f00 R14: 000060790e11c2a0 R15: 0000000000000000
[360972.710292]  </TASK>
[360972.710293] ubi0 error: ubi_io_read_ec_hdr [ubi]: validation failed for PEB 0
[360972.710305] ubi0 error: ubi_attach_mtd_dev [ubi]: failed to attach mtd5, error -22

For clarity, this flash was written by a very old kernel, 3.14.52, so
there is probably no surprise that a more modern kernel is having
difficulty with it, presuming file formats to have changed significantly
since then?

> I was wondering whether there was a way to layer the existing linux
> drivers on top of nandsim, in order to actually interpret the dump
> correctly? This would seem to be the most future-proof way of solving
> this problem, since the Linux drivers would be kept up to date.

Is this at all possible? It would solve the problem of creating a
writable image that could be flashed back onto the chip, I'd think!

> Any suggestions?
> 
> Thanks and regards,
> 
> Rogan

Thanks for your time.

Rogan


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
