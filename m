Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2E2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTzgQI9mIAmBm2hdeQ3uf3UgjSTBsZyUifaFYmBIGMw=; b=yxbSRJE+lPkEbwxD2isMBBs08O
	/zFhqK4S2QpRcFGtmoCiweb71DLRTShg22UGrrLSm9Mhb6pDkYyTZ08VB9n0/mVFe5rbXkgAVHUJR
	cjXPkRWnCIi7ZwakGJ3t9CCKLRtvtyoT2QJBhSoleg2lfPgcRHQ2BdGLa5aOq2sOvHZoopDw4tdfp
	5H+66kCYG0SnmZJf6JYUpZ5nj3QI8j1iv+uD3gwlsmHRK9Q30dAyGJ8n8s4LkLYRMa4xpECDC0vQ5
	85ltQr+aihGjgiYkqqTBSottVm8CKzfq/247IYtLDgAMTmeXR0bUiUO5c3EDwXxxPL+nk2xmVLo1p
	Q2oSxsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3Yw-002UTU-Cd; Mon, 23 May 2022 08:37:14 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt32A-002GiE-KW
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 08:03:24 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BEEB62223E;
 Mon, 23 May 2022 10:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653292998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viZm/10OcsyYDfI4zcvzPEqIUAuMcVQMGHS11NyoqCU=;
 b=rzyRiyMplNYpkNlTswdcfFl/9ZAlOULv3f4nYk5h8RoA8pS+DopSACMlctDaiwRs9rbBdW
 /tCLruXOiw5IZOCTpTkUS8LyV1DNhPsGmQHem8grzTsQQuy9zC9rACRQ/XgoCtTGppIQ23
 Thphe6d75F+ROTnQbFgL1UeHRHKnSqE=
MIME-Version: 1.0
Date: Mon, 23 May 2022 10:03:16 +0200
From: Michael Walle <michael@walle.cc>
To: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Martijn
 Braam <martijn@brixit.nl>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add support for gd25lq128e
In-Reply-To: <20220523055541.724422-1-tom@tom-fitzhenry.me.uk>
References: <20220523055541.724422-1-tom@tom-fitzhenry.me.uk>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <65339d49135ffb578b5cd5ae459cea8a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_010322_898052_A06026DF 
X-CRM114-Status: GOOD (  18.98  )
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

Am 2022-05-23 07:55, schrieb Tom Fitzhenry:
> The GD25LQ128EWIGR[0] reports an JEDEC id with a different vendor,
> otherwise it seems to fit neatly in the gigadevice list.

According to JEP106BC the vendor code 0x25 is Tristar. I'm
not sure what is going on here.

> Tested to work on the Pine64 PinePhone Pro[1].
> 
> Attribution: initial version was written by
> Martijn Braam <martijn@brixit.nl> for the Pine64 vendor kernel[2].
> 
> Also in use in vendor u-boot builds[3].
> 
> 0. https://www.gigadevice.com/flash-memory/gd25lq128e/
> 1. https://wiki.pine64.org/wiki/PinePhone_Pro
> 2. https://gitlab.com/pine64-org/linux/-/merge_requests/29
> 3.
> https://github.com/Tow-Boot/Tow-Boot/blob/b94838dfb8971cdeb841d3922051aaa8e108b085/boards/pine64-pinephonePro/0001-mtd-spi-nor-ids-Add-GigaDevice-GD25LQ128E-entry.patch

Do we need this? If you like you can provide a datasheet
with the Link: tag at the end of the commit.

This flash supports SFDP, please provide an SFDP dump, see [1].

> Signed-off-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c 
> b/drivers/mtd/spi-nor/gigadevice.c
> index 33895002eeea..871c9dee11dc 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -56,6 +56,10 @@ static const struct flash_info 
> gigadevice_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "gd25lq128e", INFO(0x257018, 0, 64 * 1024, 256)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)

Did you test locking?

> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },

As this flash supports SFDP, please use SNOR_ID3(0x257018)
and drop both the INFO() and the NO_SFDP_FLAGS(). You'll
need my SNOR_ID3() patches [2].

>  	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/
[2] 
https://lore.kernel.org/linux-mtd/20220510140232.3519184-1-michael@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
