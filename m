Return-Path: <SRS0=Xvxm=DK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DEFC41604
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Oct 2020 15:22:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529CE206DD
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Oct 2020 15:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sWP32G87";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="vP0oN7Jz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529CE206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5bOBXwDTIXB9gsTwyVzPv9p+LdGBQKZQ4/dqLj2GEyY=; b=sWP32G87DAiTsPAX6H7P8PrOF
	hmN4nyqADalDWYMwxccwd7Zelkn3APAASlzn9ZNgRSj7vAgCUl3+3ieUjEDDkxVl7ITMb/YpMmsDy
	B5W6Y/gl+NcAK1Uv8GJXi/E3bMYv3IaQpAc42WWnwunNARYUhNDdp/rpGd0gGctLULpXBmXhyKc+1
	MWT8YmM+Api4etvuD2kvAvp9hazcgSkT0lr6EyqedEzuKKSIi5Ee1kZfE/jT5Sy7pF5iOtBtEj3FZ
	vXAzKfy9HI/34MJAyHj4PgxGwf5LV2ZWM5hb4xJm4RmLrYefVrW4eqjpvby+0Bt6Il4Nua7VHNIJZ
	QcazjcX0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOjMK-0001cg-Mz; Sat, 03 Oct 2020 15:22:04 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOjMI-0001bd-AP
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2020 15:22:03 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 00E0322F9C;
 Sat,  3 Oct 2020 17:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601738518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OMVzLzF22otUV7jRiX3BFoLqyQQ2OlLO8XH+BnajFk=;
 b=vP0oN7Jz6aMb80wRaolDqQfEhwqCLS+3zUQfcEVa5k9UcyfyjNl7Lm50VldLdmCS/H4s+H
 kHmC+5QF+FBIYPLlh6e/EIkreXjZIm54IkiCUYBOQ5KxS2RrHOVDn14VEXOhKMaY3+s2IA
 iKpRR/BgNcaMxsFdQACWwwPegRAmTp8=
From: Michael Walle <michael@walle.cc>
To: dianders@chromium.org
Subject: Re: [PATCH] mtd: spi-nor: Prefer asynchronous probe
Date: Sat,  3 Oct 2020 17:06:33 +0200
Message-Id: <20201003150633.23416-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
References: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_112202_592814_66EFD978 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Douglas,

> On my system the spi_nor_probe() took ~6 ms at bootup.  That's not a
> lot, but every little bit adds up to a slow bootup.  While we can get
> this out of the boot path by making it a module, there are times where
> it is convenient (or even required) for this to be builtin the kernel.
> Let's set that we prefer async probe so that we don't block other
> drivers from probing while we are probing.
> 
> This is a tiny little change that is almost guaranteed to be safe for
> anything that is able to run as a module, which SPI_NOR is.
> Specifically modules are already probed asynchronously.  Also: since
> other things in the system may have enabled asynchronous probe the
> system may already be doing other things during our probe.
> 
> There is a small possibility that some other driver that was a client
> of SPI_NOR didn't handle -EPROBE_DEFER and was relying on probe
> ordering and only worked when the SPI_NOR and the SPI bus were
> builtin.  In that case the other driver has a bug that's waiting to
> hit and the other driver should be fixed.

linux-next now triggers the following warning in kernel/kmod.c:136 on my
board. I've bisected this to this patch.

kmod.c:
        /*
         * We don't allow synchronous module loading from async.  Module
         * init may invoke async_synchronize_full() which will end up
         * waiting for this task which already is waiting for the module
         * loading to complete, leading to a deadlock.
         */
        WARN_ON_ONCE(wait && current_is_async());

[    1.849801] ------------[ cut here ]------------
[    1.854271] mscc_felix 0000:00:00.5: device is disabled, skipping
[    1.858753] WARNING: CPU: 1 PID: 7 at kernel/kmod.c:136 __request_module+0x3a4/0x568
[    1.858755] Modules linked in:
[    1.865028] fsl_enetc 0000:00:00.0: Adding to iommu group 1
[    1.872640] CPU: 1 PID: 7 Comm: kworker/u4:0 Not tainted 5.9.0-rc6-00001-g03edda0e1eda #113
[    1.872642] Hardware name: Kontron SMARC-sAL28 (Single PHY) on SMARC Eval 2.0 carrier (DT)
[    1.872647] Workqueue: events_unbound async_run_entry_fn
[    1.876013] spi-nor spi0.0: w25q32dw (4096 Kbytes)
[    1.881294] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
[    1.881297] pc : __request_module+0x3a4/0x568
[    1.881299] lr : __request_module+0x39c/0x568
[    1.881302] sp : ffff8000113a3920
[    1.925739] x29: ffff8000113a3920 x28: ffff800010c7b000 
[    1.931068] x27: ffff00207ae05648 x26: ffff800010a41a88 
[    1.936397] x25: 0000000000000000 x24: 0000000000000000 
[    1.941727] x23: ffff800010c35140 x22: 0000000000000001 
[    1.947055] x21: ffff800011149948 x20: ffff800010615bdc 
[    1.952383] x19: 00000000ffffffff x18: 0000000000000000 
[    1.957447] fsl_enetc 0000:00:00.0: enabling device (0400 -> 0402)
[    1.957711] x17: ffff800010a3e618 x16: ffff800010a3e5f8 
[    1.964175] libphy: Freescale ENETC MDIO Bus: probed
[    1.969238] x15: ffffffffffffffff x14: ffff800011149948 
[    1.969241] x13: ffff8000113a3918 x12: 0000000000000018 
[    1.969245] x11: 0000000000000005 x10: 0101010101010101 
[    1.975241] 10 fixed-partitions partitions found on MTD device 20c0000.spi
[    1.979550] x9 : ffff80001005f6a4 x8 : 0000000000000000 
[    1.979553] x7 : 606f2c6364776865 x6 : 05041c090d431511 
[    1.979556] x5 : 1115430d091c0405 x4 : 0000000000000000 
[    1.979558] x3 : 6dac8d8d2dccae00 x2 : ffff800010c956e8 
[    1.979561] x1 : ffff80001005fa58 x0 : 0000000000000001 
[    1.979564] Call trace:
[    1.979571]  __request_module+0x3a4/0x568
[    1.984914] Creating 10 MTD partitions on "20c0000.spi":
[    1.990227]  parse_mtd_partitions+0x2ec/0x3c0
[    1.990232]  mtd_device_parse_register+0xdc/0x1c8
[    1.997133] 0x000000000000-0x000000010000 : "rcw"
[    2.002454]  spi_nor_probe+0x29c/0x2f0
[    2.002458]  spi_mem_probe+0x74/0xb0
[    2.017759] 0x000000010000-0x000000100000 : "failsafe bootloader"
[    2.018433]  spi_drv_probe+0x88/0xe8
[    2.018439]  really_probe+0xec/0x3c0
[    2.033744] 0x000000100000-0x000000140000 : "failsafe DP firmware"
[    2.035555]  driver_probe_device+0x60/0xc0
[    2.035559]  __device_attach_driver+0x8c/0xd0
[    2.040455] 0x000000140000-0x0000001e0000 : "failsafe trusted firmware"
[    2.044642]  bus_for_each_drv+0x84/0xd8
[    2.044645]  __device_attach_async_helper+0xc4/0xe8
[    2.044648]  async_run_entry_fn+0x4c/0x150
[    2.044653]  process_one_work+0x1f4/0x4b8
[    2.057751] 0x0000001e0000-0x000000200000 : "reserved"
[    2.062814]  worker_thread+0x50/0x480
[    2.062817]  kthread+0x160/0x168
[    2.062821]  ret_from_fork+0x10/0x34
[    2.073748] 0x000000200000-0x000000210000 : "configuration store"
[    2.076185] ---[ end trace 44224cc02e4e53d2 ]---

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
