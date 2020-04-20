Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348C7C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 11:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19D2206D4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 11:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NSxvXu7u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19D2206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJRiAUyqEzQquzMV/F3wzoZMU+cnuG0bUGc1FNfIwBU=; b=NSxvXu7u37xZu1
	enq58ClVL64ooB5ABoAOy+2eYshYnaXZ44z4OOse5jyrz2gVAvD1BNaMLtosY7IXyraLO3kYNIGwB
	bz43bVm7Gu1pN+8/MPWzD5VBKauhwm67ZuCcBDT8Wq91k/kk38u4DL9iaGksZbXQbaj+BMkuX1BDA
	gmHlTY+yWZLwDj9rzz9lRIbifD3r2VxmFVM2CTpAPsVgBrle9EPWS6TXJ4fzL6dTyLMet+Z0HrmB4
	zY7tGFakp/XR3rxC8ze2nKYiABjiTf3IVGS+SZIbquH2FyFsmKRGkpPkk3alMwIegkl85MoyLLqng
	QrBnqTvm0sT+3WqA9Pmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQUeq-0006Hz-GM; Mon, 20 Apr 2020 11:32:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQUen-0006GP-PM
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 11:32:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 443C62A04B2;
 Mon, 20 Apr 2020 12:32:08 +0100 (BST)
Date: Mon, 20 Apr 2020 13:32:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH 9/9] mtd: rawnand: bcm47xx: Move the driver to
 drivers/mtd/nand/raw/
Message-ID: <20200420133205.5c068155@collabora.com>
In-Reply-To: <20200419125140.1307309-10-boris.brezillon@collabora.com>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
 <20200419125140.1307309-10-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_043209_957983_26314BED 
X-CRM114-Status: GOOD (  15.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 19 Apr 2020 14:51:40 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Now that we have a single we can move it to the directory where all
> single source file drivers live.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/mtd/nand/raw/Makefile                            | 1 +
>  drivers/mtd/nand/raw/{bcm47xxnflash => }/bcm47xxnflash.c | 0
>  drivers/mtd/nand/raw/bcm47xxnflash/Makefile              | 2 --
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  rename drivers/mtd/nand/raw/{bcm47xxnflash => }/bcm47xxnflash.c (100%)
>  delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/Makefile
> 
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 2d136b158fb7..703d696c2d61 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
>  obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
>  obj-$(CONFIG_MTD_NAND_MESON)		+= meson_nand.o
>  obj-$(CONFIG_MTD_NAND_CADENCE)		+= cadence-nand-controller.o
> +obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o

I forgot to remove the 

obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/

line. Will fix it in v2.

>  
>  nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
>  nand-objs += nand_onfi.o
> diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.c b/drivers/mtd/nand/raw/bcm47xxnflash.c
> similarity index 100%
> rename from drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.c
> rename to drivers/mtd/nand/raw/bcm47xxnflash.c
> diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/Makefile b/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
> deleted file mode 100644
> index 71a953078799..000000000000
> --- a/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
