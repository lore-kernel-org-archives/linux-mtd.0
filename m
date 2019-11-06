Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A0C5DF64
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 05:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D659D217D7
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 05:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hSQYI1Ol";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H2bAuAd9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D659D217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0odx+ft+/txzh+EZH1eYzfL/kc4HarzM8J2nlbsjiE=; b=hSQYI1OlkRAjqQ
	Hv9E+zA0ICg9/+gz1iOW4gf/LFA5WavMmkvH3jjhHRUKhg1Rlk28jDjtdfy2yuvBmAADyXga/eJg3
	LntMgbkizXEqbLK4wboZfMpnkaXeLTir1VsqqBcPfyHGb+xzT7G7e8SDqy1aMJLXEfxDFlHo37sLr
	O5ljicWrNfrzSFcLluGv3jzSg9lF71yQ/7kKJ9ENqPvWNJVf4Iloce1sPupF8GEtP3sXj6pY9Jh7H
	OC8sDxn0zLBzZsmaeIe4v08SODjQNNR9lAV03xjDPSVg8xWWWVEhFjqL/QSb5CfnRrgNQplnIQs7e
	r0jHGsgVsFXz5fUGKhGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSE8U-0005Z4-Cm; Wed, 06 Nov 2019 05:45:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSE8R-0005YX-6T
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 05:45:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA65jVnw066184;
 Tue, 5 Nov 2019 23:45:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573019131;
 bh=F+2KCiRVtt38KnE0aoSA04LjhA8ClGxqrZ5iELh5C9Q=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=H2bAuAd99tEJLZRqsLOArOvhB4rfFLkWxBK+PcW2rDeP2NFxxKx1mpCtULzqKSBSi
 4M9LGisJGMqDYqHpnyiePall+Jxt837DnmKxQ2VDpe2WVe6tAYTakAcw9FInjOuZdu
 m08A6LkWl5JKHfj3nsJcu+G1KvLb+Us5tOBnkNG4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA65jVh4040135
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Nov 2019 23:45:31 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 23:45:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 23:45:16 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA65jTIr128203;
 Tue, 5 Nov 2019 23:45:29 -0600
Subject: Re: [PATCH v4 17/20] mtd: spi-nor: Merge spansion Quad Enable methods
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-18-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b82f9dd6-5b49-21a0-0720-5f46f53f8cc0@ti.com>
Date: Wed, 6 Nov 2019 11:16:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191102112316.20715-18-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_214539_319793_230FAC5B 
X-CRM114-Status: GOOD (  24.66  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Merge
>     spansion_no_read_cr_quad_enable()
>     spansion_read_cr_quad_enable()
> into
>     spi_nor_sr2_bit1_quad_enable().
> 
> Reduce code duplication by introducing spi_nor_write_16bit_cr_and_check().
> The Configuration Register contains bits that can be updated in future:
> FREEZE, CMP. Provide a generic method that allows updating all bits
> of the Configuration Register.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 165 +++++++++++++++++-------------------------
>  1 file changed, 68 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e367a4862ec1..8bc29cc073a0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1055,6 +1055,59 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
>  }
>  
>  /**
> + * spi_nor_write_16bit_cr_and_check() - Write the Status Register 1 and the
> + * Configuration Register in one shot. Ensure that the byte written in the
> + * Configuration Register match the received value, and that the 16-bit Write
> + * did not affect what was already in the Status Register 1.
> + * @nor:	pointer to a 'struct spi_nor'.
> + * @cr:		byte value to be written to the Configuration Register.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
> +{
> +	int ret;
> +	u8 *sr_cr = nor->bouncebuf;
> +	u8 sr_written;
> +
> +	/* Keep the current value of the Status Register 1. */
> +	ret = spi_nor_read_sr(nor, sr_cr);
> +	if (ret)
> +		return ret;
> +
> +	sr_cr[1] = cr;
> +
> +	ret = spi_nor_write_sr(nor, sr_cr, 2);
> +	if (ret)
> +		return ret;
> +
> +	sr_written = sr_cr[0];
> +
> +	ret = spi_nor_read_sr(nor, sr_cr);
> +	if (ret)
> +		return ret;
> +
> +	if (sr_written != sr_cr[0]) {
> +		dev_dbg(nor->dev, "SR: Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	if (nor->flags & SNOR_F_NO_READ_CR)
> +		return 0;
> +
> +	ret = spi_nor_read_cr(nor, &sr_cr[1]);
> +	if (ret)
> +		return ret;
> +
> +	if (cr != sr_cr[1]) {
> +		dev_dbg(nor->dev, "CR: read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
>   * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure that
>   * the byte written match the received value without affecting other bits in the
>   * Status Register 1 and 2.
> @@ -2051,111 +2104,29 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  }
>  
>  /**
> - * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
> - * @nor:	pointer to a 'struct spi_nor'
> + * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
> + * Register 2.
> + * @nor:       pointer to a 'struct spi_nor'.
>   *
> - * Set the Quad Enable (QE) bit in the Configuration Register.
> - * This function should be used with QSPI memories not supporting the Read
> - * Configuration Register (35h) instruction.
> - *
> - * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
> - * memories.
> + * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
> +static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
>  {
> -	u8 *sr_cr = nor->bouncebuf;
>  	int ret;
> -	u8 sr_written;
> -
> -	/* Keep the current value of the Status Register. */
> -	ret = spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	sr_cr[1] = SR2_QUAD_EN_BIT1;
> -
> -	ret = spi_nor_write_sr(nor, sr_cr, 2);
> -	if (ret)
> -		return ret;
>  
> -	sr_written = sr_cr[0];
> -
> -	ret = spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	if (sr_cr[0] != sr_written) {
> -		dev_err(nor->dev, "SR: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * spansion_read_cr_quad_enable() - set QE bit in Configuration Register.
> - * @nor:	pointer to a 'struct spi_nor'
> - *
> - * Set the Quad Enable (QE) bit in the Configuration Register.
> - * This function should be used with QSPI memories supporting the Read
> - * Configuration Register (35h) instruction.
> - *
> - * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
> - * memories.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spansion_read_cr_quad_enable(struct spi_nor *nor)
> -{
> -	u8 *sr_cr = nor->bouncebuf;
> -	int ret;
> -	u8 sr_written;
> +	if (nor->flags & SNOR_F_NO_READ_CR)
> +		return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
>  
> -	/* Check current Quad Enable bit value. */
> -	ret = spi_nor_read_cr(nor, &sr_cr[1]);
> +	ret = spi_nor_read_cr(nor, nor->bouncebuf);
>  	if (ret)
>  		return ret;
>  
> -	if (sr_cr[1] & SR2_QUAD_EN_BIT1)
> +	if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
>  		return 0;
>  
> -	sr_cr[1] |= SR2_QUAD_EN_BIT1;
> -
> -	/* Keep the current value of the Status Register. */
> -	ret = spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	ret = spi_nor_write_sr(nor, sr_cr, 2);
> -	if (ret)
> -		return ret;
> -
> -	sr_written = sr_cr[0];
> -
> -	ret = spi_nor_read_sr(nor, sr_cr);
> -	if (ret)
> -		return ret;
> -
> -	if (sr_written != sr_cr[0]) {
> -		dev_err(nor->dev, "SR: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	sr_written = sr_cr[1];
> -
> -	/* Read back and check it. */
> -	ret = spi_nor_read_cr(nor, &sr_cr[1]);
> -	if (ret)
> -		return ret;
> -
> -	if (sr_cr[1] != sr_written) {
> -		dev_dbg(nor->dev, "CR: Read back test failed\n");
> -		return -EIO;
> -	}
> -
> -	return 0;
> +	return spi_nor_write_16bit_cr_and_check(nor, nor->bouncebuf[0]);
>  }
>  
>  /**
> @@ -2235,7 +2206,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
>   *
>   * Read-modify-write function that clears the Block Protection bits from the
>   * Status Register without affecting other bits. The function is tightly
> - * coupled with the spansion_read_cr_quad_enable() function. Both assume that
> + * coupled with the spi_nor_sr2_bit1_quad_enable() function. Both assume that
>   * the Write Register with 16 bits, together with the Read Configuration
>   * Register (35h) instructions are supported.
>   *
> @@ -3753,7 +3724,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		 * supported.
>  		 */
>  		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
> -		params->quad_enable = spansion_no_read_cr_quad_enable;
> +		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>  		break;
>  
>  	case BFPT_DWORD15_QER_SR1_BIT6:
> @@ -3775,7 +3746,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		 */
>  		nor->flags |= SNOR_F_HAS_16BIT_SR;
>  
> -		params->quad_enable = spansion_read_cr_quad_enable;
> +		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>  		break;
>  
>  	default:
> @@ -4738,7 +4709,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	u8 i, erase_mask;
>  
>  	/* Initialize legacy flash parameters and settings. */
> -	params->quad_enable = spansion_read_cr_quad_enable;
> +	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>  	params->set_4byte = spansion_set_4byte;
>  	params->setup = spi_nor_default_setup;
>  	/* Default to 16-bit Write Status (01h) Command */
> @@ -4955,7 +4926,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  	int err;
>  
>  	if (nor->clear_sr_bp) {
> -		if (nor->params.quad_enable == spansion_read_cr_quad_enable)
> +		if (nor->params.quad_enable == spi_nor_sr2_bit1_quad_enable)
>  			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>  
>  		err = nor->clear_sr_bp(nor);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
