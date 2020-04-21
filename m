Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3A1C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 09:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E3CC20857
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 09:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3s6ti2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E3CC20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4S+znOAxwpJNLrt4RHpICJYEu3PlDzC821OHr3ruZ2U=; b=o3s6ti2d0rcDbe
	luSGxDgMLt2ijIY4frfWAFH3k+pdC+5kqaqDpsA7gDauVs8IVuzy2oCkLBHmtndGQKhzQrQ2OdJuY
	mO/6lXdG9iUx6uzorZqeCYrXRLGdoY2XwX8vg4gBaGdn7JiRPRhxXDrxWXaRo17EZ2IOEi9Wr12BR
	L0U4m9YpiKFDCzFkseoUQkdJFlE9+5yMh2EVVNtmksp8zACdtREmtHrSdA7wTFA01HciPk/4VSI2/
	YiE/pgb3MWE0AZuyULDyNiwT1dbJYzggqpz9xII6RdHNIZzXwOZ2cEirau3J87UHAxDEjXdoa9KjW
	Eq8HouXrXI0jJyFO8HCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQp5P-0008HV-C8; Tue, 21 Apr 2020 09:20:59 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQp5M-0008Gk-0f
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 09:20:58 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 48C9271D5E1140AE2F6D;
 Tue, 21 Apr 2020 17:20:50 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 21 Apr 2020 17:20:46 +0800
Subject: Re: [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <bd614869-a5d5-eb2b-eb06-23c063abecaa@hisilicon.com>
Date: Tue, 21 Apr 2020 17:25:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_022056_246053_B1E110D8 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei,

I tested the flash and check the datasheet, s25fs128s0 may also need this fixup. So I
will add it in the next version of my patch.

Thanks,
Yicong

On 2020/4/21 3:13, Sergei Shtylyov wrote:
> Spansion S25FS-S family has an issue in the Basic Flash Parameter Table
> (BFPT): Dword-11 bits 7:4 specify a page size of 512 bytes.  Actually
> this is configurable in the vendor unique register (CR3V) and even the
> factory default setting is to "wrap at 256 bytes", so blindly relying
> on BFPT breaks the page writes on these chips. Add the post-BFPT fixup
> which restores the default page size of 256 bytes -- to properly read
> CR3V this early is quite intrusive and should better be done as a new
> feature; Alexander Sverdlin had the patch doing that:
>
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20200227123657.26030-1-alexander.sverdlin@nokia.com/
>
> Fixes: dfd2b74530e ("mtd: spi-nor: add Spansion S25FS512S ID")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'mtd/fixes' branch of the MTD 'linux.git' repo.
>
>  drivers/mtd/spi-nor/spansion.c |   25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> Index: linux/drivers/mtd/spi-nor/spansion.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spansion.c
> +++ linux/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,27 @@
>  
>  #include "core.h"
>  
> +static int
> +s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
> +			 const struct sfdp_parameter_header *bfpt_header,
> +			 const struct sfdp_bfpt *bfpt,
> +			 struct spi_nor_flash_parameter *params)
> +{
> +	/*
> +	 * The S25FS-S chip family reports 512-byte pages in BFPT but
> +	 * in reality the write buffer still wraps at the safe default
> +	 * of 256 bytes.  Overwrite the page size advertised by BFPT
> +	 * to get the writes working.
> +	 */
> +	params->page_size = 256;
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups s25fs_s_fixups = {
> +	.post_bfpt = s25fs_s_post_bfpt_fixups,
> +};
> +
>  static const struct flash_info spansion_parts[] = {
>  	/* Spansion/Cypress -- single (large) sector size only, at least
>  	 * for the chips listed here (without boot sectors).
> @@ -30,8 +51,8 @@ static const struct flash_info spansion_
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | USE_CLSR) },
>  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
> -			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			      USE_CLSR) },
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25fs_s_fixups, },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
