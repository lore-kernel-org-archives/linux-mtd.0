Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E196C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 14:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C39FB60555
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 14:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C39FB60555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYrx82ULERg1x4LzGx27fMOyNypcGEeUW4F9vfEe21E=; b=ARqr9u6HMGuLJe
	syBV6U7PlcHLnGBQMldE5GaAPb/WBYLT3ACuiQUJovHQCbsvRSXk363ogjPwQ5ruUvOnx3G+qIsQo
	6XP54FSb/rAdjSrSPTXWriKdXjMlmiQNLpB2KKLAJjr38YuBNZbU8fphxvtm7MhUZUu1KhMLkzIoK
	HD5/eUx0rUWT22oOLEbQNj0OlQJSUtUsaC1h5KbxC3BGSPFzk3dtJhBuBgW1eBo7WxsDXZ2aIyQ1V
	VrMJxx+wMpdhrHaHSN9a7LyZ8bdb/ROwnGWVxhDBPcwMhIZUi/GDGz5hwvg9bdPnVvTrXoYTM0LIa
	aTPH8Gp42rssjoGXlz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvwC-009iTV-3g; Mon, 11 Oct 2021 14:05:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvw7-009iSD-O2
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 14:05:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9BFA21F42DAF;
 Mon, 11 Oct 2021 15:05:49 +0100 (BST)
Date: Mon, 11 Oct 2021 16:05:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211011160546.707b737b@collabora.com>
In-Reply-To: <20211011115253.38497-1-sean@geanix.com>
References: <20211011115253.38497-1-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_070553_108379_9FEFFAD1 
X-CRM114-Status: GOOD (  26.13  )
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

On Mon, 11 Oct 2021 13:52:50 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> Follow-up on discussion in https://lkml.org/lkml/2021/10/4/41
> 
> Changes since from rfc v1/v2:
>  - added access protection for all device access hooks in mtd_info.
>  - added Suggested-by to [1/3] patch.
>  - removed refereces to commit ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
>    from commit msg as commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") is 
>    to be blamed.
>  - tested on a kernel with LOCKDEP enabled.
> 
> @Miquel: I havn't covered every ioctl, to me it looks like they havn't
> direct device access.
> 
> One (small) issue still present. gpmi_nand.c uses the rwsem before it's
> initialized. Seems cumbersome to have every mtd/nand driver to call
> init_waitqueue_head() and init_rwsem(). Could we somehow move the call
> to mtd_set_dev_defaults() before nand_create_bbt()?

I have a nasty trick for that one, but I'm not sure Miquel will like it
(actually, I don't like it either, but it's so simple compared to the
other options we have that I'm tempted to go for this approach until
someone has time to invest in a cleaner solution :-)):

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..a9ac2d528a4d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6222,8 +6222,6 @@ static int nand_scan_tail(struct nand_chip *chip)
        mtd->_sync = nand_sync;
        mtd->_lock = nand_lock;
        mtd->_unlock = nand_unlock;
-       mtd->_suspend = nand_suspend;
-       mtd->_resume = nand_resume;
        mtd->_reboot = nand_shutdown;
        mtd->_block_isreserved = nand_block_isreserved;
        mtd->_block_isbad = nand_block_isbad;
@@ -6269,6 +6267,13 @@ static int nand_scan_tail(struct nand_chip *chip)
        if (ret)
                goto err_free_secure_regions;
 
+       /*
+        * Populate the suspend/resume hooks after the BBT has been scanned to
+        * avoid using the suspend lock and resume waitqueue which are only
+        * initialized when mtd_device_register() is called.
+        */
+       mtd->_suspend = nand_suspend;
+       mtd->_resume = nand_resume;
        return 0;
 
 err_free_secure_regions:



> 
> ---
> nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
> nand: Toshiba NAND 512MiB 3,3V 8-bit
> nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 128
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at kernel/locking/rwsem.c:1240 down_read+0x160/0x184
> DEBUG_RWSEMS_WARN_ON(sem->magic != sem): count = 0x0, magic = 0x0, owner = 0x0, curr 0xc40b0000, list not empty 
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc3-00002-g7eab985fa8cd-dirty #163 
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> [<c010fa90>] (unwind_backtrace) from [<c010b8fc>] (show_stack+0x10/0x14)
> [<c010b8fc>] (show_stack) from [<c0b34998>] (dump_stack_lvl+0x58/0x70)
> [<c0b34998>] (dump_stack_lvl) from [<c0123884>] (__warn+0xd4/0x154) 
> [<c0123884>] (__warn) from [<c0b2e9ac>] (warn_slowpath_fmt+0x94/0xbc)
> [<c0b2e9ac>] (warn_slowpath_fmt) from [<c0b428c8>] (down_read+0x160/0x184)
> [<c0b428c8>] (down_read) from [<c06df42c>] (mtd_read_oob+0xc8/0x284)
> [<c06df42c>] (mtd_read_oob) from [<c06f28cc>] (scan_block_fast+0x78/0xf4) 
> [<c06f28cc>] (scan_block_fast) from [<c06f3c14>] (search_bbt+0x268/0x304) 
> [<c06f3c14>] (search_bbt) from [<c06f3ef0>] (nand_create_bbt+0x240/0x6dc) 
> [<c06f3ef0>] (nand_create_bbt) from [<c06fa758>] (gpmi_nand_probe+0x568/0x6d0)
> [<c06fa758>] (gpmi_nand_probe) from [<c068731c>] (platform_probe+0x58/0xb8)
> [<c068731c>] (platform_probe) from [<c0684a48>] (really_probe.part.0+0x9c/0x32c)
> [<c0684a48>] (really_probe.part.0) from [<c0684d78>] (__driver_probe_device+0xa0/0x138) 
> [<c0684d78>] (__driver_probe_device) from [<c0684e40>] (driver_probe_device+0x30/0x10c) 
> [<c0684e40>] (driver_probe_device) from [<c0685510>] (__driver_attach+0xb4/0x174) 
> [<c0685510>] (__driver_attach) from [<c0682b84>] (bus_for_each_dev+0x78/0xb8) 
> [<c0682b84>] (bus_for_each_dev) from [<c0683ea4>] (bus_add_driver+0xf0/0x1d8) 
> [<c0683ea4>] (bus_add_driver) from [<c0686270>] (driver_register+0x88/0x118)
> [<c0686270>] (driver_register) from [<c0102108>] (do_one_initcall+0x74/0x378) 
> [<c0102108>] (do_one_initcall) from [<c1001304>] (kernel_init_freeable+0x2a4/0x348) 
> [<c1001304>] (kernel_init_freeable) from [<c0b3bc34>] (kernel_init+0x10/0x124)
> [<c0b3bc34>] (kernel_init) from [<c010011c>] (ret_from_fork+0x14/0x38)
> Exception stack(0xc40a7fb0 to 0xc40a7ff8) 
> 7fa0: ???????? ???????? ???????? ???????? 
> 7fc0: ???????? ???????? ???????? ???????? ???????? ???????? ???????? ???????? 
> 7fe0: ???????? ???????? ???????? ???????? ???????? ???????? 
> irq event stamp: 110936 
> hardirqs lastenabled at (110935): [<c0100b04>] __irq_svc+0x64/0x80
> hardirqs last disabled at (110936): [<c0100af0>] __irq_svc+0x50/0x80
> softirqs lastenabled at (110906): [<c093818c>] netlink_insert+0x60/0x8a4
> softirqs last disabled at (110904): [<c08ac6d4>] release_sock+0x18/0x98 
> ---[ end trace c70a1a8da23b619d ]---
> Bad block table found at page 131008, version 0x01
> Bad block table found at page 130944, version 0x01
> ---
> 
> Sean Nyekjaer (3):
>   mtd: core: protect access to MTD devices while in suspend
>   mtd: rawnand: remove suspended check
>   mtd: mtdconcat: add suspend lock handling

Patch 3 (with the suggested changes) should be moved at the beginning of
the series to keep things bisectable.

> 
>  drivers/mtd/mtdconcat.c          |  11 ++-
>  drivers/mtd/mtdcore.c            | 133 +++++++++++++++++++++++++++----
>  drivers/mtd/nand/raw/nand_base.c |  52 +++---------
>  include/linux/mtd/mtd.h          | 109 +++++++++++++++++++++----
>  include/linux/mtd/rawnand.h      |   5 +-
>  5 files changed, 234 insertions(+), 76 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
