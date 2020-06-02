Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ABDC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CEC207D5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 16:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ahaNmrh4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39CEC207D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwU1j1xF9U2a0+QefDyHU7AWG5Eh/UUXZRQISp/HUCk=; b=ahaNmrh4InHtMX
	H9yNRGYKRCwajSRqkJKX0rf1wrVt2vdETUV0hf9gstQvDBDnk8cRWM6L51PRT7QXfoxDK09tTtnWa
	5BO/kSQJlnuwbfHTLUH8CsA/05WJ9zBpZl4N7wFpsHyXj/BrFoUYED2CtK8nEVFBjZZgpEijJL8CV
	ymn797gKA71eElQEBLc9ergld91Kfa3jkPNf8EN3DVPT19SFG19PhKjNigAuefSq+v7Xw7wLPjl1c
	2AgUHUzVZRv5Tr/D29mmRhh5xHbMXjf8CFx8rK+tCH6mIJ54KADjg2NxOC/JNQY/Gg6ia1X9D3S68
	CRJFBAfSHGHym14KHVwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9rH-00056a-LJ; Tue, 02 Jun 2020 16:33:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg9rA-0004zu-O0; Tue, 02 Jun 2020 16:33:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 403F42A366D;
 Tue,  2 Jun 2020 17:33:39 +0100 (BST)
Date: Tue, 2 Jun 2020 18:33:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v9 0/9] Preparation to the generic ECC engine abstraction
Message-ID: <20200602183336.5447d34a@collabora.com>
In-Reply-To: <20200602143124.29553-1-miquel.raynal@bootlin.com>
References: <20200602143124.29553-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_093340_909536_9E2DB882 
X-CRM114-Status: GOOD (  15.75  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue,  2 Jun 2020 16:31:15 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This is a respin of the end of my previous series, just the patches which needed to be fixed.
> 
> Changes in v9:
> * This time sending the additional patchs, not just the old ones with
>   corrections. v8 should be ignored, sorry for the noise.
> 
> Changes in v8:
> * Split "Convert generic NAND bits to ECC framework" into several peaces:
>   > added two helpers
>   > converted SPI-NAND then raw-NAND.  
> * Fixed a comment.
> * Used the _ooblayout suffix instead of _layout.
> 
> 
> Miquel Raynal (9):
>   mtd: nand: Create a helper to extract the ECC configuration
>   mtd: spinand: Use nanddev_get_ecc_conf() when relevant
>   mtd: nand: Create a helper to extract the ECC requirements
>   mtd: rawnand: Use nanddev_get_ecc_requirements() when relevant
>   mtd: nand: Convert generic NAND bits to use the ECC framework
>   mtd: rawnand: Hide the generic OOB layout objects behind helpers
>   mtd: rawnand: Write a compatibility layer
>   mtd: rawnand: Move generic OOB layouts to the ECC framework
>   mtd: rawnand: Move the user input parsing bits to the ECC framework

Sorry, but I keep thinking you should re-order things so we don't have
code blocks introduced and then moved around in the same patchset.
What's the point of introducing new props/helpers in rawnand if the
ultimate goal is to move them to nand.h, especially since none of the
existing rawnand drivers (or the rawnand core) need those new DT props
right now. You should really consider doing that in 3 distinct steps:

1/ Introduce ECC related fields/defs/... at the generic NAND level
2/ Patch rawnand to use those fields/new defs and deprecate the old ones
3/ Move rawnand defs/code that can be made generic and be useful to
   !rawnand users

> 
>  drivers/mtd/nand/ecc.c                        | 314 ++++++++++++++
>  drivers/mtd/nand/raw/Kconfig                  |   1 +
>  drivers/mtd/nand/raw/arasan-nand-controller.c |   2 +-
>  drivers/mtd/nand/raw/atmel/nand-controller.c  |  15 +-
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c      |   8 +-
>  drivers/mtd/nand/raw/davinci_nand.c           |   3 +-
>  drivers/mtd/nand/raw/denali.c                 |   3 +
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  13 +-
>  .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |   6 +-
>  drivers/mtd/nand/raw/marvell_nand.c           |   8 +-
>  drivers/mtd/nand/raw/mtk_nand.c               |   6 +-
>  drivers/mtd/nand/raw/nand_base.c              | 395 ++++--------------
>  drivers/mtd/nand/raw/nand_esmt.c              |  14 +-
>  drivers/mtd/nand/raw/nand_hynix.c             |  43 +-
>  drivers/mtd/nand/raw/nand_jedec.c             |   7 +-
>  drivers/mtd/nand/raw/nand_micron.c            |  17 +-
>  drivers/mtd/nand/raw/nand_onfi.c              |  14 +-
>  drivers/mtd/nand/raw/nand_samsung.c           |  21 +-
>  drivers/mtd/nand/raw/nand_toshiba.c           |  15 +-
>  drivers/mtd/nand/raw/sunxi_nand.c             |   9 +-
>  drivers/mtd/nand/raw/tegra_nand.c             |  15 +-
>  drivers/mtd/nand/raw/vf610_nfc.c              |   2 +-
>  drivers/mtd/nand/spi/core.c                   |  10 +-
>  drivers/mtd/nand/spi/macronix.c               |   7 +-
>  drivers/mtd/nand/spi/toshiba.c                |   6 +-
>  include/linux/mtd/nand.h                      |  40 +-
>  include/linux/mtd/rawnand.h                   |  17 +-
>  27 files changed, 587 insertions(+), 424 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
