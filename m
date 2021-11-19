Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E863C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94FE61B54
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E94FE61B54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqVb58dfBVgwNfd5oEM5yHgNptvKzi1KjcbQn4xlnLg=; b=zLwefeoq7Ae9t6
	7ZXQDbbEP63nTN16shOsoluJqwxmYNbjlikCTeB/GhsYsGEGHJk4BieTkEU3gYQr7nrUJUE/MzV0A
	79MG8sNWlveuIuNd1PRZLbXXulmkxkZ4pbCHHHWzaIoiS5QVq5Pt4KUcHfQANPJ1/WnBbtoNUMbGS
	udI7J7nlY8zfD3o5SEuPsvH2xpiz4sle7TTEEgCW/oCn1YEy5PMo5i5DQDm9wMu9v02JWMJC8sEGh
	XV23P0LNw0JddEJL/atXSvic8kosgpAhu0XyycqffIzZ+0HzF/OVh78LxZtZ1+75KZnKe4V/3wrW6
	1pJ8YCNvwSmmpzZDuAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8kJ-00BIbH-RJ; Fri, 19 Nov 2021 18:36:23 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8jL-00BID6-VQ
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 11A31240005;
 Fri, 19 Nov 2021 18:35:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: core: provide unique name for nvmem device
Date: Fri, 19 Nov 2021 19:35:19 +0100
Message-Id: <20211119183519.1329924-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211104134843.2642800-1-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cefe446f5e02a821f16d85c642c5c7c364b424ae'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103524_168305_044C9053 
X-CRM114-Status: GOOD (  10.97  )
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

On Thu, 2021-11-04 at 13:48:43 UTC, Michael Walle wrote:
> If there is more than one mtd device which supports OTP, there will
> be a kernel warning about duplicated sysfs entries and the probing will
> fail. This is because the nvmem device name is not unique. Make it
> unique by prepending the name of the mtd. E.g. before the name was
> "user-otp", now it will be "mtd0-user-otp".
> 
> For reference the kernel splash is:
> [    4.665531] sysfs: cannot create duplicate filename '/bus/nvmem/devices/user-otp'
> [    4.673056] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-next-20211101+ #1296
> [    4.680565] Hardware name: Kontron SMARC-sAL28 (Single PHY) on SMARC Eval 2.0 carrier (DT)
> [    4.688856] Call trace:
> [    4.691303]  dump_backtrace+0x0/0x1bc
> [    4.694984]  show_stack+0x24/0x30
> [    4.698306]  dump_stack_lvl+0x68/0x84
> [    4.701980]  dump_stack+0x18/0x34
> [    4.705302]  sysfs_warn_dup+0x70/0x90
> [    4.708973]  sysfs_do_create_link_sd+0x144/0x150
> [    4.713603]  sysfs_create_link+0x2c/0x50
> [    4.717535]  bus_add_device+0x74/0x120
> [    4.721293]  device_add+0x330/0x890
> [    4.724791]  device_register+0x2c/0x40
> [    4.728550]  nvmem_register+0x240/0x9f0
> [    4.732398]  mtd_otp_nvmem_register+0xb0/0x10c
> [    4.736854]  mtd_device_parse_register+0x28c/0x2b4
> [    4.741659]  spi_nor_probe+0x20c/0x2e0
> [    4.745418]  spi_mem_probe+0x78/0xbc
> [    4.749001]  spi_probe+0x90/0xf0
> [    4.752237]  really_probe.part.0+0xa4/0x320
> ..
> [    4.873936] mtd mtd1: Failed to register OTP NVMEM device
> [    4.894468] spi-nor: probe of spi0.0 failed with error -17
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
