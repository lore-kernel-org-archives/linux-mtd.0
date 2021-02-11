Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67683C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 09:27:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03FC64DE2
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 09:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03FC64DE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3fS1D8dSEa2mgtHsv46TY5K59ycosoJ4cvQFz4dyA0E=; b=l3yzVYOFJL8ltixXmqab888Ga
	pknZzNoLg22uTe3o+0a8EXbgIPEXKjUiyRpXZggDKpMTvVXdhxxwEyFYJSmAqd5gdj1BhytnL2jCG
	9OP9GCwbFmWO+1cczqGXYc0Pvg0Q0fEW5vBgMVloQt8biU/MoniAqwxTMNGVko4zPBAhA4XHBHehf
	UlNP+cpXmPYrBgSfI0ky1/nm63yPQnk5ANSNu54wbvn7DtQDqSNXmo8BoQtXgss0lS3B6LfUzft29
	uyZvD9nw4R9eyPUds0Dcik7GHi7E2EXvCone/eN1+5fhirq46mjNLXleWzRHr0vfqvFjY336zpoE9
	GEfgRjmfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA8FP-0005lO-IK; Thu, 11 Feb 2021 09:26:51 +0000
Received: from mout-u-107.mailbox.org ([91.198.250.252])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA8FM-0005kP-22
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 09:26:50 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4DbrqP5SyHzQlF0;
 Thu, 11 Feb 2021 10:26:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 4PxdWl1cY6fk; Thu, 11 Feb 2021 10:26:34 +0100 (CET)
Subject: Re: [PATCH] mtd: nand: spi: Support GigaDevice GD5F1GQ5UExxG
To: Reto Schneider <code@reto-schneider.ch>, miquel.raynal@bootlin.com,
 richard@nod.at, linux-mtd@lists.infradead.org
References: <20210210170031.19753-1-code@reto-schneider.ch>
From: Stefan Roese <sr@denx.de>
Message-ID: <7ca8a5e9-8f6b-f82b-e696-0415f4d1aad0@denx.de>
Date: Thu, 11 Feb 2021 10:26:34 +0100
MIME-Version: 1.0
In-Reply-To: <20210210170031.19753-1-code@reto-schneider.ch>
Content-Language: de-DE
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.27 / 15.00 / 15.00
X-Rspamd-Queue-Id: 8B98D1856
X-Rspamd-UID: ce1394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_042648_233934_65E3578E 
X-CRM114-Status: GOOD (  28.48  )
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
Cc: Reto Schneider <reto.schneider@husqvarnagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10.02.21 18:00, Reto Schneider wrote:
> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
> 
> The relevant changes to the already existing GD5F1GQ4UExxG support has
> been determined by consulting the GigaDevice product change notice
> AN-0392-10, version 1.0 from November 30, 2020.
> 
> As the overlaps are huge, variable names have been generalized
> accordingly.
> 
> Apart form the lowered ECC strength (4 instead of 8 bits per 512 bytes),
> the new device ID, and the extra quad IO dummy byte, no changes had to
> be taken into account.
> 
> New hardware features are not supported, namely:
>   - Power on reset
>   - Unique ID
>   - Double transfer rate (DTR)
>   - Parameter page
>   - Random data quad IO
> 
> The inverted semantic of the "driver strength" register bits, defaulting
> to 100% instead of 50% for the Q5 devices, got ignored as the driver has
> never touched them anyway.
> 
> The no longer supported "read from cache during block erase"
> functionality I do not know how to reflect.
> 
> Implementation has been tested on MediaTek MT7688 based GARDENA smart
> Gateways using both, GigaDevice GD5F1GQ5UEYIG and GD5F1GQ4UBYIG.
> 
> Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

Looks very good, thanks:

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   drivers/mtd/nand/spi/gigadevice.c | 69 +++++++++++++++++++++++++++----
>   1 file changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index 33c67403c4aa..1dd1c5898093 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -13,7 +13,10 @@
>   #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
>   #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
>   
> -#define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
> +#define GD5FXGQ5XE_STATUS_ECC_1_4_BITFLIPS	(1 << 4)
> +#define GD5FXGQ5XE_STATUS_ECC_4_BITFLIPS	(3 << 4)
> +
> +#define GD5FXGQXXEXXG_REG_STATUS2		0xf0
>   
>   #define GD5FXGQ4UXFXXG_STATUS_ECC_MASK		(7 << 4)
>   #define GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS	(0 << 4)
> @@ -102,7 +105,7 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>   	return -EINVAL;
>   }
>   
> -static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
> +static int gd5fxgqx_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
>   				       struct mtd_oob_region *region)
>   {
>   	if (section)
> @@ -114,7 +117,7 @@ static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
> +static int gd5fxgqx_variant2_ooblayout_free(struct mtd_info *mtd, int section,
>   					struct mtd_oob_region *region)
>   {
>   	if (section)
> @@ -127,9 +130,10 @@ static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static const struct mtd_ooblayout_ops gd5fxgq4_variant2_ooblayout = {
> -	.ecc = gd5fxgq4_variant2_ooblayout_ecc,
> -	.free = gd5fxgq4_variant2_ooblayout_free,
> +/* Valid for Q4/Q5 and Q6 (untested) devices */
> +static const struct mtd_ooblayout_ops gd5fxgqx_variant2_ooblayout = {
> +	.ecc = gd5fxgqx_variant2_ooblayout_ecc,
> +	.free = gd5fxgqx_variant2_ooblayout_free,
>   };
>   
>   static int gd5fxgq4xc_ooblayout_256_ecc(struct mtd_info *mtd, int section,
> @@ -165,7 +169,7 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
>   					u8 status)
>   {
>   	u8 status2;
> -	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQ4UEXXG_REG_STATUS2,
> +	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
>   						      &status2);
>   	int ret;
>   
> @@ -203,6 +207,43 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
>   	return -EINVAL;
>   }
>   
> +static int gd5fxgq5xexxg_ecc_get_status(struct spinand_device *spinand,
> +					u8 status)
> +{
> +	u8 status2;
> +	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
> +						      &status2);
> +	int ret;
> +
> +	switch (status & STATUS_ECC_MASK) {
> +	case STATUS_ECC_NO_BITFLIPS:
> +		return 0;
> +
> +	case GD5FXGQ5XE_STATUS_ECC_1_4_BITFLIPS:
> +		/*
> +		 * Read status2 register to determine a more fine grained
> +		 * bit error status
> +		 */
> +		ret = spi_mem_exec_op(spinand->spimem, &op);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * 1 ... 4 bits are flipped (and corrected)
> +		 */
> +		/* bits sorted this way (1...0): ECCSE1, ECCSE0 */
> +		return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
> +
> +	case STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>   static int gd5fxgq4ufxxg_ecc_get_status(struct spinand_device *spinand,
>   					u8 status)
>   {
> @@ -282,7 +323,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     SPINAND_HAS_QE_BIT,
> -		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
> +		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
>   				     gd5fxgq4uexxg_ecc_get_status)),
>   	SPINAND_INFO("GD5F1GQ4UFxxG",
>   		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE, 0xb1, 0x48),
> @@ -292,8 +333,18 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     SPINAND_HAS_QE_BIT,
> -		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
> +		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
>   				     gd5fxgq4ufxxg_ecc_get_status)),
> +	SPINAND_INFO("GD5F1GQ5UExxG",
> +		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x51),
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
> +		     NAND_ECCREQ(4, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
> +				     gd5fxgq5xexxg_ecc_get_status)),
>   };
>   
>   static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
> 
> base-commit: 92bf22614b21a2706f4993b278017e437f7785b3
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
