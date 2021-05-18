Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E676C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 20:03:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91DC60FF3
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 20:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C91DC60FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sc5SvRG5tUFcyh2v99IW13NyeVJOG32qODK8yArjb+A=; b=MdP5EudErs2ofWi0a9sNK2Akv
	bntioW6Mlrct17alZbdJCQN9xBrv+BuT4STpb5wwP0Lyb9N8hiOhC7FNiLgWcbmzSYgeCSqv+iOgt
	M3z/lk0Yht15XLqXe05okckXAnJWFD3dZFLjAkO+cXcg3ac2LaOXFkVTWvDIZ+zuEnWTtpiTkTqV3
	BjizI1qaLLZnNBswpXYdMkkuKVRWrgth1MK3JZ2U3SRcY1rVT64t+aV4BVVDNR28ydEMgzzw3nU48
	Li2fB3XxoYlZeVZOYgq5vgEG92vkkmdYR41C5pE2stsyW7PJDFLRdQoflQub5sW2KHJ2VJjTOjkEd
	vHD83QbMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj5vM-001mXr-Bb; Tue, 18 May 2021 20:02:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5vK-001mXm-2D
 for linux-mtd@desiato.infradead.org; Tue, 18 May 2021 20:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=h0LHPW/w4IwpfoUIXaU9BCUDkKX5JEPEZ2uj7QpdpKw=; b=WQA4QRSRg5mq8aRCfeMrnGNEy1
 J3qyjqAuDuqMd7LTWaX6M0zvxrXpLdbUUnKQ8/TyMH/3UtacT+pQePHr6ZK9Zf7d629XJ49X+Dbzj
 CLBNpIQfPxPaGC7nFq0+FjbB8g55JCOHzXxf7dfCuzLIu4l0n6wig/ony/Up4i0mGKFZ/6IVsswmp
 BnmseWuN33AD4L89DeRuaX0JPJHVLXhR96Pt4sVocanOyc5UGpAnQe1erAP0gqI9bt0N6yAKQHVfE
 99l5ogZr0+b//ihCTRN8AKbr61oE2FjE9NUXQiyL9j1SiVWCWQzgSQDPHd6izgoX032ASVEQxJXiR
 WPAsFPLA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5vG-00EvnS-P4
 for linux-mtd@lists.infradead.org; Tue, 18 May 2021 20:02:36 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D145222239;
 Tue, 18 May 2021 22:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621368148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0LHPW/w4IwpfoUIXaU9BCUDkKX5JEPEZ2uj7QpdpKw=;
 b=oO4XsO814zzxDvKliFmFSX1r0OtStVP6JrmFmpcEoyroQcR4EUyXi90OuBxJ6bV67QPGgn
 impBl6M+4Qh+QN9EV7VJg4R2tUuvo2pWk6xJB+8kI7wh8h9Mp1hWCGwjn8yF5PwH2AFsnG
 Xh538qco49irr8Qd/oXPiuSIPdpBdDo=
MIME-Version: 1.0
Date: Tue, 18 May 2021 22:02:27 +0200
From: Michael Walle <michael@walle.cc>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mtd: core: Fix freeing of otp_info buffer
In-Reply-To: <20210518185503.162787-1-jonathanh@nvidia.com>
References: <20210424110608.15748-6-michael@walle.cc>
 <20210518185503.162787-1-jonathanh@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <016ead00625f91d1247190e7c68c2086@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_130235_002722_078729CE 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-05-18 20:55, schrieb Jon Hunter:
> Commit 4b361cfa8624 ("mtd: core: add OTP nvmem provider support") is
> causing the following panic ...
> 
>  ------------[ cut here ]------------
>  kernel BUG at /local/workdir/tegra/linux_next/kernel/mm/slab.c:2730!
>  Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>  Modules linked in:
>  CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc2-next-20210518 #1
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  PC is at ___cache_free+0x3f8/0x51c
>  ...
>  [<c029bb1c>] (___cache_free) from [<c029c658>] (kfree+0xac/0x1bc)
>  [<c029c658>] (kfree) from [<c06da094>] (mtd_otp_size+0xc4/0x108)
>  [<c06da094>] (mtd_otp_size) from [<c06dc864>]
> (mtd_device_parse_register+0xe4/0x2b4)
>  [<c06dc864>] (mtd_device_parse_register) from [<c06e3ccc>]
> (spi_nor_probe+0x210/0x2c0)
>  [<c06e3ccc>] (spi_nor_probe) from [<c06e9578>] (spi_probe+0x88/0xac)
>  [<c06e9578>] (spi_probe) from [<c066891c>] (really_probe+0x214/0x3a4)
>  [<c066891c>] (really_probe) from [<c0668b14>] 
> (driver_probe_device+0x68/0xc0)
>  [<c0668b14>] (driver_probe_device) from [<c0666cf8>]
> (bus_for_each_drv+0x5c/0xbc)
>  [<c0666cf8>] (bus_for_each_drv) from [<c0668694>] 
> (__device_attach+0xe4/0x150)
>  [<c0668694>] (__device_attach) from [<c06679e0>] 
> (bus_probe_device+0x84/0x8c)
>  [<c06679e0>] (bus_probe_device) from [<c06657f8>] 
> (device_add+0x48c/0x868)
>  [<c06657f8>] (device_add) from [<c06eb784>] 
> (spi_add_device+0xa0/0x168)
>  [<c06eb784>] (spi_add_device) from [<c06ec9a8>]
> (spi_register_controller+0x8b8/0xb38)
>  [<c06ec9a8>] (spi_register_controller) from [<c06ecc3c>]
> (devm_spi_register_controller+0x14/0x50)
>  [<c06ecc3c>] (devm_spi_register_controller) from [<c06f0510>]
> (tegra_spi_probe+0x33c/0x450)
>  [<c06f0510>] (tegra_spi_probe) from [<c066abec>] 
> (platform_probe+0x5c/0xb8)
>  [<c066abec>] (platform_probe) from [<c066891c>] 
> (really_probe+0x214/0x3a4)
>  [<c066891c>] (really_probe) from [<c0668b14>] 
> (driver_probe_device+0x68/0xc0)
>  [<c0668b14>] (driver_probe_device) from [<c0668e30>]
> (device_driver_attach+0x58/0x60)
>  [<c0668e30>] (device_driver_attach) from [<c0668eb8>]
> (__driver_attach+0x80/0xc8)
>  [<c0668eb8>] (__driver_attach) from [<c0666c48>] 
> (bus_for_each_dev+0x78/0xb8)
>  [<c0666c48>] (bus_for_each_dev) from [<c0667c44>] 
> (bus_add_driver+0x164/0x1e8)
>  [<c0667c44>] (bus_add_driver) from [<c066997c>] 
> (driver_register+0x7c/0x114)
>  [<c066997c>] (driver_register) from [<c010223c>] 
> (do_one_initcall+0x50/0x2b0)
>  [<c010223c>] (do_one_initcall) from [<c11011f0>]
> (kernel_init_freeable+0x1a8/0x1fc)
>  [<c11011f0>] (kernel_init_freeable) from [<c0c09190>] 
> (kernel_init+0x8/0x118)
>  [<c0c09190>] (kernel_init) from [<c01001b0>] (ret_from_fork+0x14/0x24)
>  ...
>  ---[ end trace 0f652dd222de75d7 ]---
> 
> In the function mtd_otp_size() a buffer is allocated by calling
> kmalloc() and a pointer to the buffer is stored in a variable 'info'.
> The pointer 'info' may then be incremented depending on the length
> returned from mtd_get_user/fact_prot_info(). If 'info' is incremented,
> when kfree() is called to free the buffer the above panic occurs 
> because
> we are no longer passing the original address of the buffer allocated.
> Fix this by indexing through the buffer allocated to avoid incrementing
> the pointer.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

uhm.. yes of course. Two fixes for this function. Not my best day :/

I'm wondering why CONFIG_SLUB_DEBUG_ON doesn't catch this, whereas
slub_debug=f (or fzpu) as commandline parameter works as expected.

Reviewed-by: Michael Walle <michael@walle.cc>

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
