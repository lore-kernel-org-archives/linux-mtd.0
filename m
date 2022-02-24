Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4273C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTls3FN+d0h/uT4WWc1ty2HAu7E+BLpKaCATF2uecO0=; b=RBxmeYLrl7bGEO
	H+3rDtbfzkYQwden8iE+xJg1LvgTtIH97OZNMrYEb+J1787HNuyGRZOshs6gs0ijFFzwj7JO/Vogr
	sJIazSTJ85qsbEYc6EGQEuGeLC8UtUPi7gANrQEmo54DceiEj4PpPi+IkDLDxqXjSiLLVPTwmGml+
	3o9X3Fb1FjtORo4uudcbK9awe/Q0HOeZc+Eo54Agjw9/MQ8Ow7swRQEc6Svg2CsHNhhpm18tTXDsV
	YzQS7gBawz7PhsL5okzC2HSyFwwo7mSWvhO+gu8BXo7p34ZHDrPCYQv6TajRgKz1hYs4vs7hZ6sE8
	XK7FkvZYYP8gm/hoU8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKBE-002Cc4-5K; Thu, 24 Feb 2022 19:53:36 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKBA-002CbQ-Rj
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 19:53:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21OJrSIa023966;
 Thu, 24 Feb 2022 13:53:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645732408;
 bh=IAh7XQOCifRrvP10OkjMTkjARuhTTjmkVV69zXQFlTk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bnTvvMzIoUHpx+RbFTTfHZPM66u5EwyAW/5ZGRu8uydIWlmsyQTwECV6iLjVa5WTB
 ULI7fT5W6rfSs5Q6xFtY0LgNGHWbLqEt+6jcKonhITB71vQDr8Yw4g59ifWxdR+r0o
 qlSU/ZO/Ym8vjwDw12Dw4yM/aBmnEZF/sxvW7oZg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21OJrScN024602
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Feb 2022 13:53:28 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 13:53:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 13:53:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21OJrQh4090084;
 Thu, 24 Feb 2022 13:53:27 -0600
Date: Fri, 25 Feb 2022 01:23:26 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: spansion: Rework
 spi_nor_cypress_octal_dtr_enable()
Message-ID: <20220224195326.e6atop2vitnl3w4l@ti.com>
References: <20220210023334.408926-1-tudor.ambarus@microchip.com>
 <20220210023334.408926-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210023334.408926-4-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_115333_011135_3650C88A 
X-CRM114-Status: GOOD (  29.18  )
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

On 10/02/22 04:33AM, Tudor Ambarus wrote:
> Introduce template operation to remove code duplication.
> Split spi_nor_cypress_octal_dtr_enable() in
> spi_nor_cypress_octal_dtr_ena() spi_nor_cypress_octal_dtr_dis() as it no
> longer made sense to try to keep everything alltogether: too many
> "if (enable)" throughout the code, which made the code difficult to read.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 135 ++++++++++++++++++---------------
>  1 file changed, 72 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index d69a569f31e4..9bb239f1e142 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -19,85 +19,78 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  
> -/**
> - * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> - * @nor:		pointer to a 'struct spi_nor'
> - * @enable:              whether to enable or disable Octal DTR
> - *
> - * This also sets the memory access latency cycles to 24 to allow the flash to
> - * run at up to 200MHz.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +/* Spansion/Cypress SPI NOR flash operations. */
> +#define SPI_NOR_SPANSION_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\

Same comments as before for variable and function names.

> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> +
> +static int spi_nor_cypress_octal_dtr_en(struct spi_nor *nor)
>  {
>  	struct spi_mem_op op;
>  	u8 *buf = nor->bouncebuf;
>  	int ret;
>  
> -	if (enable) {
> -		/* Use 24 dummy cycles for memory array reads. */
> -		ret = spi_nor_write_enable(nor);
> -		if (ret)
> -			return ret;
> -
> -		*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> -		op = (struct spi_mem_op)
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> -				   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
> -						   1),
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -		if (ret)
> -			return ret;
> -
> -		ret = spi_nor_wait_till_ready(nor);
> -		if (ret)
> -			return ret;
> -
> -		nor->read_dummy = 24;
> -	}
> -
> -	/* Set/unset the octal and DTR enable bits. */
> -	ret = spi_nor_write_enable(nor);
> +	/* Use 24 dummy cycles for memory array reads. */
> +	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> +	op = (struct spi_mem_op)
> +		SPI_NOR_SPANSION_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR2V,
> +					       1, buf);
> +
> +	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
>  	if (ret)
>  		return ret;
>  
> -	if (enable) {
> -		buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> -	} else {
> -		/*
> -		 * The register is 1-byte wide, but 1-byte transactions are not
> -		 * allowed in 8D-8D-8D mode. Since there is no register at the
> -		 * next location, just initialize the value to 0 and let the
> -		 * transaction go on.
> -		 */
> -		buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> -		buf[1] = 0;
> -	}
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +
> +	nor->read_dummy = 24;
>  
> +	/* Set the octal and DTR enable bits. */
> +	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>  	op = (struct spi_mem_op)
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> -			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
> -					   SPINOR_REG_CYPRESS_CFR5V,
> -					   1),
> -			   SPI_MEM_OP_NO_DUMMY,
> -			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> +		SPI_NOR_SPANSION_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR5V,
> +					       1, buf);
>  
> -	if (!enable)
> -		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
>  
> -	ret = spi_mem_exec_op(nor->spimem, &op);
> +	/* Read flash ID to make sure the switch was successful. */
> +	ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
> +	if (ret)
> +		return ret;
> +
> +	if (memcmp(buf, nor->info->id, nor->info->id_len))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int spi_nor_cypress_octal_dtr_dis(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf;
> +	int ret;
> +
> +	/*
> +	 * The register is 1-byte wide, but 1-byte transactions are not allowed
> +	 * in 8D-8D-8D mode. Since there is no register at the next location,
> +	 * just initialize the value to 0 and let the transaction go on.
> +	 */
> +	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +	buf[1] = 0;
> +	op = (struct spi_mem_op)
> +		SPI_NOR_SPANSION_WR_ANY_REG_OP(4, SPINOR_REG_CYPRESS_CFR5V,
> +					       2, buf);
> +	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
>  	if (ret)
>  		return ret;
>  
>  	/* Read flash ID to make sure the switch was successful. */
> -	if (enable)
> -		ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
> -	else
> -		ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);
> +	ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);

As with previous patch, this won't work.

I have not tested on this flash yet. I will wait for a re-roll.

>  	if (ret)
>  		return ret;
>  
> @@ -107,6 +100,22 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  	return 0;
>  }
>  
> +/**
> + * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @enable:              whether to enable or disable Octal DTR
> + *
> + * This also sets the memory access latency cycles to 24 to allow the flash to
> + * run at up to 200MHz.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +	return enable ? spi_nor_cypress_octal_dtr_en(nor) :
> +			spi_nor_cypress_octal_dtr_dis(nor);
> +}
> +
>  static void s28hs512t_default_init(struct spi_nor *nor)
>  {
>  	nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
