Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D63C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rQjxTyyJjy9euqlB2Gq5bo6MvPQ8cMdFe2mkksHMk0=; b=u0i/r3iA9scVjYSylN3f+Gu5JH
	J0Kn7VXQFaS+riZXb/YiNJA6JVx6ossQFQym3k4aPw8BKJzjyBMreR8wSHj1y2Ckbp1X/gtKsasa5
	K2BshCPfXqeZudDa8jEMDlEiZA4ZkrgN4uvAKsN5iJYtvB4P4vbvHT6eg58nMlxk/pzACT5CwCgrv
	Qn4ecRLuI3uYoZ+DwqyWbxYbPJkGOKmmG/olY4jh82PRTPs4tNbsIjHFPFH0VG4mFAY/oEFH0Hva2
	6iCMNzf0DNXkdX4ClJkU9Ug10sytG8sTQmhPSgyhW1deLGK2HEp4OfLVLlsOhbFIOgjH7X3DI0U49
	TLYBYH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevfp-004rOg-Or; Thu, 14 Apr 2022 09:21:57 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevfn-004rNq-1y
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 09:21:56 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1719C2223A;
 Thu, 14 Apr 2022 11:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649928113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuHb8XTtomchg7Wt1V7cWuPTosd89yhrLtbFPGpuEFM=;
 b=iNm9G2cOC5ItU4EwMF4hlS6D+qlTkw1IuOESG7ITyrYAJE50h5DrFeiIIBGQNN6kuM5Dmv
 y+vvnsZzYPrnAIq0Sp8T/Rxfy0ZzGnNigU8v+huiowMW8cDnL+FpCJGFNG4h/qsHCd13fo
 KWKUIgmhNrYPxHs3wdOHT2B6xI8bW+E=
MIME-Version: 1.0
Date: Thu, 14 Apr 2022 11:21:52 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: Favor the BFPT-parsed
 set_4byte_addr_mode method
In-Reply-To: <20220411125346.118274-4-tudor.ambarus@microchip.com>
References: <20220411125346.118274-1-tudor.ambarus@microchip.com>
 <20220411125346.118274-4-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a6519a1ce39534c35760334cd69396b3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_022155_447214_BACB1124 
X-CRM114-Status: GOOD (  23.79  )
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

Am 2022-04-11 14:53, schrieb Tudor Ambarus:
> JESD216 SFDP defines in the BFPT standard methods to enter and exit the
> 4-Byte Address Mode. The flash parameters and settings that are 
> retrieved
> from SFDP have higher precedence than the static initialized ones, 
> because
> they should be more accurate and less error prone than those 
> initialized
> statically. Favor the BFPT-parsed set_4byte_addr_mode method and use 
> the
> generic core methods where possible.
> This patch may introduce regressions in case BFPT contains wrong data. 
> The
> fix is to introduce a post_bfpt() fixup hook and update the wrong BFPT
> data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> v3: no changes
> 
>  drivers/mtd/spi-nor/core.c      |  7 ++++++-
>  drivers/mtd/spi-nor/macronix.c  | 10 ++++++++--
>  drivers/mtd/spi-nor/micron-st.c |  9 ++++++---
>  3 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4d45cda4f9d3..888516d98884 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2416,6 +2416,8 @@ static void spi_nor_init_fixup_flags(struct 
> spi_nor *nor)
>   */
>  static void spi_nor_late_init_params(struct spi_nor *nor)
>  {
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>  	    nor->manufacturer->fixups->late_init)
>  		nor->manufacturer->fixups->late_init(nor);
> @@ -2423,6 +2425,10 @@ static void spi_nor_late_init_params(struct 
> spi_nor *nor)
>  	if (nor->info->fixups && nor->info->fixups->late_init)
>  		nor->info->fixups->late_init(nor);
> 
> +	/* Default method kept for backward compatibility. */
> +	if (!params->set_4byte_addr_mode)
> +		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;

Can this be moved past..

> +
>  	spi_nor_init_flags(nor);
>  	spi_nor_init_fixup_flags(nor);

.. these two lines, so it is next to the "set default
locking ops"?

> 
> @@ -2490,7 +2496,6 @@ static void spi_nor_init_default_params(struct
> spi_nor *nor)
>  	struct device_node *np = spi_nor_get_flash_node(nor);
> 
>  	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> -	params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
>  	params->otp.org = &info->otp_org;
> 
>  	/* Default to 16-bit Write Status (01h) Command */
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 85e8655d362c..c267cbcc7f1d 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -105,12 +105,18 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  static void macronix_nor_default_init(struct spi_nor *nor)
>  {
>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> -	nor->params->set_4byte_addr_mode =
> -		spi_nor_set_4byte_addr_mode_en4b_ex4b;
> +}
> +
> +static void macronix_nor_late_init(struct spi_nor *nor)
> +{
> +	if (!nor->params->set_4byte_addr_mode)
> +		nor->params->set_4byte_addr_mode =
> +			spi_nor_set_4byte_addr_mode_en4b_ex4b;

This is more of a general question. Can we have this in one
line? IMHO this looks awful and since linux nowadays relaxed the
80 chars rule a bit and we have such long names.. I think it makes
sense to allow some lines to be longer than 80 chars.

>  }
> 
>  static const struct spi_nor_fixups macronix_nor_fixups = {
>  	.default_init = macronix_nor_default_init,
> +	.late_init = macronix_nor_late_init,
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_macronix = {
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 2d1cbb1f37c8..9e9b107f2018 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -414,14 +414,17 @@ static void micron_st_nor_default_init(struct
> spi_nor *nor)
>  	nor->flags |= SNOR_F_HAS_LOCK;
>  	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  	nor->params->quad_enable = NULL;
> -	nor->params->set_4byte_addr_mode =
> -		spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
>  }
> 
>  static void micron_st_nor_late_init(struct spi_nor *nor)
>  {
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
>  	if (nor->info->mfr_flags & USE_FSR)
> -		nor->params->ready = micron_st_nor_ready;
> +		params->ready = micron_st_nor_ready;
> +	if (!params->set_4byte_addr_mode)
> +		params->set_4byte_addr_mode =
> +			spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;

same here.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
