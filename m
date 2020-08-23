Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B590C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 13:32:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD322078A
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 13:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZcL9d8m7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD322078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qtj9qNN6/fi2FrKaOsDtj1ziE7tHWMllnQ849h468Gg=; b=ZcL9d8m7UXbp8GfwmAFRZDfGD
	vrZQ+pdTPNyuW81ncJvTqTqRqNfNWCM4O0DdTsjjpo4HS0krGUSUaRchhrVcduDVusFGNoY0byF0A
	FE/uOJr95YRBOX3daDo0F67tM2UkJII95pN22f1kBA7ltmdkw1kmTHp7s5JIVd0A/4t7drU4tFJHP
	SrvmmYvX+ULuDachdcMpTPlrnsKbLiPdXuzxKPsS55Dqf7awpIutaenZdbQ3XAMNYNDSAzekc2SwR
	L5vYHBRQ3DKCXj0sR06r2RH3+syMytGZkEZuaZp70PIcXYT4zxw22HGaG7r7J0vziWoyxY5sHLnhN
	lLpj70XFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9q5v-0000jF-LV; Sun, 23 Aug 2020 13:31:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9q5s-0000ih-Bm
 for linux-mtd@lists.infradead.org; Sun, 23 Aug 2020 13:31:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E3DAD298604;
 Sun, 23 Aug 2020 14:31:30 +0100 (BST)
Date: Sun, 23 Aug 2020 15:31:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: micron: add support for MT29F2G01AAAED
Message-ID: <20200823153127.7498f0c0@collabora.com>
In-Reply-To: <20200823111410.13049-1-nthirumalesha7@gmail.com>
References: <20200823111410.13049-1-nthirumalesha7@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_093132_489831_6C7535F9 
X-CRM114-Status: GOOD (  25.45  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 23 Aug 2020 19:14:10 +0800
Thirumalesha Narasimhappa <nthirumalesha7@gmail.com> wrote:

> The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
> ECC
> 
> Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
> ---
>  v2: removed SPINAND_SELECT_TARGET as per the comments & fixed typo errors
> 
>  drivers/mtd/nand/spi/micron.c | 78 +++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 5d370cfcdaaa..c21ca395d657 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -18,6 +18,9 @@
>  #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
>  #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
>  
> +/* For Micron MT29F2G01AAAED Device */
> +#define MICRON_STATUS_ECC_1TO4_BITFLIPS	(1 << 4)
> +

You shouldn't need that new definition (see below).

>  #define MICRON_CFG_CR			BIT(0)
>  
>  /*
> @@ -44,6 +47,19 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
>  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
>  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
>  
> +/* Micron  MT29F2G01AAAED Device */
> +static SPINAND_OP_VARIANTS(read_cache_variants_mt29f2g01aaaed,
> +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(write_cache_variants_mt29f2g01aaaed,
> +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(update_cache_variants_mt29f2g01aaaed,
> +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> +

Okay, I'd suggest picking more generic names. How about renaming the
existing variants into quadio_read_cache_variants,
x4_write_cache_variants and x4_update_cache_variants and naming the new
ones x4_read_cache_variants, x1_write_cache_variants and
x1_update_cache_variants.

>  static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				  struct mtd_oob_region *region)
>  {
> @@ -69,11 +85,41 @@ static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> +static int mt29f2g01aaaed_ooblayout_ecc(struct mtd_info *mtd, int section,
> +					struct mtd_oob_region *region)
> +{
> +	if (section >= 4)
> +		return -ERANGE;

Hm, I'd try to deduce the max section based on the
pagesize/ecc-step-size so we can re-use the same ooblayout def for different
pagesize/ecc-step-size combinations.

> +
> +	region->offset = (section * 16) + 8;
> +	region->length = 8;
> +
> +	return 0;
> +}
> +
> +static int mt29f2g01aaaed_ooblayout_free(struct mtd_info *mtd, int section,
> +					 struct mtd_oob_region *region)
> +{
> +	if (section >= 4)
> +		return -ERANGE;
> +
> +	/* Reserve 2 bytes for the BBM. */
> +	region->offset = (section * 16) + 2;

You should probably only reserve those 2 bytes in section 0 (where the
BBM is).

> +	region->length = 6;
> +
> +	return 0;
> +}
> +
>  static const struct mtd_ooblayout_ops micron_8_ooblayout = {
>  	.ecc = micron_8_ooblayout_ecc,
>  	.free = micron_8_ooblayout_free,
>  };
>  
> +static const struct mtd_ooblayout_ops mt29f2g01aaaed_ooblayout = {

Maybe name that one micron_interleaved_ooblayout, and rename
micron_8_ooblayout into micron_grouped_ooblayout.

> +	.ecc = mt29f2g01aaaed_ooblayout_ecc,
> +	.free = mt29f2g01aaaed_ooblayout_free,
> +};
> +
>  static int micron_select_target(struct spinand_device *spinand,
>  				unsigned int target)
>  {
> @@ -114,6 +160,27 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
>  	return -EINVAL;
>  }
>  
> +static int mt29f2g01aaaed_ecc_get_status(struct spinand_device *spinand,
> +					 u8 status)
> +{
> +	switch (status & MICRON_STATUS_ECC_MASK) {
> +	case STATUS_ECC_NO_BITFLIPS:
> +		return 0;
> +
> +	case STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +
> +	/* 1 to 4-bit error detected and corrected */
> +	case MICRON_STATUS_ECC_1TO4_BITFLIPS:
> +		return 4;
> +
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}

Looks like you're duplicating spinand_check_ecc_status(). Just leave the
get_status hook to NULL, that should do trick.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
