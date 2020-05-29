Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF24CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 09:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 828502072D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 09:25:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUqeW0U8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 828502072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRbBhnpZeEl9RmNmUEl/ZjS7SeAL1TUyHGaniL88iN4=; b=YUqeW0U8GQHB/i
	THG6TN7r675OL0sr28/NvKpZEL5buC+EwvKqCwbUjuUbncgYj25Li6qiyLOKL2W33HeDiyZBDU+LT
	OYnYHlJHJQatk3LIaLyQuxpTSsKCrkq9V2MU9tPLNKqzxrkJ5ajslCU+6fvef/4nbPPJaS236PoD+
	kAcWgELp9y0kC8FWomHDEyxvwuxCY5oPe982UurnBogFZiVnhdnhkqsh86JD/SbIKSou1DtnOSxBN
	sB1SXxin4KnWzzXnRZj4+yE/7wP4yKmdbdQAy0eYDLecYA7L/wTbh7gWipwGrIzdH5/eRa7JM1Fus
	opPfHrtJdr8ZZXDWCECg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jebGd-0001Da-1u; Fri, 29 May 2020 09:25:31 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jebFF-0005xG-Oq
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 09:24:07 +0000
X-Originating-IP: 42.109.222.225
Received: from localhost (unknown [42.109.222.225])
 (Authenticated sender: me@yadavpratyush.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 86FD1240004;
 Fri, 29 May 2020 09:24:00 +0000 (UTC)
Date: Fri, 29 May 2020 14:53:53 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 1/7] mtd: spi-nor: sfdp: get octal mode maximum speed
 from BFPT
Message-ID: <20200529092353.56nfczya6ygfbki2@yadavpratyush.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-2-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590737775-4798-2-git-send-email-masonccyang@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_022406_103791_FB270EF9 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, boris.brezillon@collabora.com, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/05/20 03:36PM, Mason Yang wrote:
> Get maximum operation speed of device in octal mode from
> BFPT 20th DWORD.

I don't like the idea of getting the maximum operation speed from BFPT 
when the Profile 1.0 table already tells us that. For example, the 
200MHz operation dummy cycles field in the 4th DWORD says that a value 
of 0 means the frequency is not supported. So the Profile 1.0 table 
already tells us what frequencies the flash can run at in xSPI Profile 
1.0 mode.

So IMO we should use the Profile 1.0 table for this instead because
it will be a localized change which is easier to maintain. I also get 
the feeling it will be less prone to mis-interpretations.
 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.h |  2 ++
>  drivers/mtd/spi-nor/sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h |  4 ++++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b2..7a36b22 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -190,6 +190,7 @@ struct spi_nor_locking_ops {
>   *
>   * @size:		the flash memory density in bytes.
>   * @page_size:		the page size of the SPI NOR flash memory.
> + * @octal_max_speed:	maximum operation speed of device in octal mode.
>   * @hwcaps:		describes the read and page program hardware
>   *			capabilities.
>   * @reads:		read capabilities ordered by priority: the higher index
> @@ -212,6 +213,7 @@ struct spi_nor_locking_ops {
>  struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				page_size;
> +	u16				octal_max_speed;
>  
>  	struct spi_nor_hwcaps		hwcaps;
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index f6038d3..4d13f66 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2014, Freescale Semiconductor, Inc.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
>  #include <linux/mtd/spi-nor.h>
> @@ -26,6 +27,12 @@
>  #define SFDP_JESD216A_MINOR	5
>  #define SFDP_JESD216B_MINOR	6
>  
> +/* Basic Flash Parameter Table 20th DWORD, Max operation speed of device */
> +struct octal_max_speed {
> +	u8 idx; /* Bits value */
> +	u16 hz; /* MHz */
> +};
> +
>  struct sfdp_header {
>  	u32		signature; /* Ox50444653U <=> "SFDP" */
>  	u8		minor;
> @@ -440,6 +447,22 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	u32 addr;
>  	u16 half;
>  	u8 erase_mask;
> +	static const struct octal_max_speed max_hz[] = {
> +		/* Bits value, MHz */
> +		{ 0x0c, 400 },
> +		{ 0x0b, 333 },
> +		{ 0x0a, 266 },
> +		{ 0x09, 250 },
> +		{ 0x08, 200 },
> +		{ 0x07, 166 },
> +		{ 0x06, 133 },
> +		{ 0x05, 100 },
> +		{ 0x04,  80 },
> +		{ 0x03,  66 },
> +		{ 0x02,  50 },
> +		{ 0x01,  33 },
> +	};
> +	u8 idx;
>  
>  	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
>  	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> @@ -604,6 +627,19 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		return -EINVAL;
>  	}
>  
> +	/* Octal mode max speed */
> +	idx = max(FIELD_GET(BFPT_DWORD20_OCTAL_DTR_MAX_SPEED,
> +			    bfpt.dwords[BFPT_DWORD(20)]),
> +		  FIELD_GET(BFPT_DWORD20_OCTAL_STR_MAX_SPEED,
> +			    bfpt.dwords[BFPT_DWORD(20)]));
> +
> +	for (i = 0; i < ARRAY_SIZE(max_hz); i++) {
> +		if (max_hz[i].idx == idx) {
> +			params->octal_max_speed = max_hz[i].hz;
> +			break;
> +		}
> +	}
> +
>  	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
>  }
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index e0a8ded..8ae6d9a 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -83,6 +83,10 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
>  
> +#define BFPT_DWORD20_OCTAL_MAX_SPEED_MASK       GENMASK(31, 16)
> +#define BFPT_DWORD20_OCTAL_DTR_MAX_SPEED        GENMASK(31, 28)
> +#define BFPT_DWORD20_OCTAL_STR_MAX_SPEED        GENMASK(19, 16)
> +
>  struct sfdp_parameter_header {
>  	u8		id_lsb;
>  	u8		minor;

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
