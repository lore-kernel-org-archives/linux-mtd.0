Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146B8C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtgrGgjNbPreX3axmjAZH/Lu9LWe8hKR+ZyrPFY1Tuw=; b=M00SQ4z6Iq5N3CCHqgKD10nPTZ
	/JNIWxcd4Z1cLmgH/D+Dd3OI93APpGuSzgijZODkh3NYM2wOtLBP0njpJmJtGn7emuLM23Gn2xxem
	T0+kTYvnNCkd/KPGucgbxPp91jzZE7dAxkO7L870zergW4QaxaG6ds9ne5TrGezHeTO7AWuvXoGEg
	nt045mOmY5PXio+X5WxFQohe5z/44Hew2VcGVjMmtf22Cm1xgDASDDOPq4d1Fg8QYWU7UwRa/rEdv
	0VuKAxeuDerAXT9qsDc4nRakF6AW3QhomI85vCBpTIM6lvadFrvKn5y3Nx4mRrlVLj8lqcguyL9A5
	Kxdi5/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnOm-003eLM-To; Tue, 19 Apr 2022 12:56:05 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmGj-003Dmk-SE
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 11:43:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E2EBE2223A;
 Tue, 19 Apr 2022 13:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650368620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8TbvehiI4QhP9rmHozbaaizn+p3c+Ev4QRAbCfNwFs=;
 b=jRkvkn5fsCJfu0zh8+DG9sxq0eU2t6d6YDhLhBxG1sOcAjxxCCrNvyWB41AcIje1v9U9e2
 ZzgI0ynF597ydPFFlsSCNChoXt7wYrKUubT/cUMLJN/sqzDLEjDOByN1gr1cvyd3YSnkzd
 W2EgaSJ/aHn44nI1RJWZTVh1JsE42dM=
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 13:43:39 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 7/9] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
In-Reply-To: <20220411091033.98754-8-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-8-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <87be34dac82aaeaf7c72c0c606b91723@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_044342_280099_30F13F83 
X-CRM114-Status: GOOD (  27.98  )
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

Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> Introduce template operation to remove code duplication.
> Split spi_nor_micron_octal_dtr_enable() in 
> spi_nor_micron_octal_dtr_en()
> and spi_nor_micron_octal_dtr_dis() as it no longer made sense to try to
> keep everything alltogether: too many "if (enable)" throughout the 
> code,
> which made the code difficult to follow. Add dev_dbg messages in case
> spi_nor_read_id() fails.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

There is now
micron_st_nor_octal_dtr_en()
micron_st_nor_octal_dtr_dis()
and
micron_st_nor_octal_dtr_enable()

Now what does what? :) Maybe we should rename that octal_dtr_enable
op. (Or use two?)

Reviewed-by: Michael Walle <michael@walle.cc>

> ---
> v3: collect R-b, update commit message, add dev_dbg message in case
> spi_nor_read_id() fails.
> 
>  drivers/mtd/spi-nor/micron-st.c | 111 +++++++++++++++++---------------
>  1 file changed, 60 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 41b87868ecf9..a447762c0d78 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -28,75 +28,78 @@
>  #define FSR_P_ERR		BIT(4)	/* Program operation status */
>  #define FSR_PT_ERR		BIT(1)	/* Protection error bit */
> 
> -static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool 
> enable)
> +/* Micron ST SPI NOR flash operations. */
> +#define MICRON_ST_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 0),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> +
> +static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
>  {
>  	struct spi_mem_op op;
>  	u8 *buf = nor->bouncebuf;
>  	int ret;
> 
> -	if (enable) {
> -		/* Use 20 dummy cycles for memory array reads. */
> -		ret = spi_nor_write_enable(nor);
> -		if (ret)
> -			return ret;
> -
> -		*buf = 20;
> -		op = (struct spi_mem_op)
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> -				   SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
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
> -	}
> +	/* Use 20 dummy cycles for memory array reads. */
> +	*buf = 20;
> +	op = (struct spi_mem_op)
> +		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
> +	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> 
> -	ret = spi_nor_write_enable(nor);
> +	buf[0] = SPINOR_MT_OCT_DTR;
> +	op = (struct spi_mem_op)
> +		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR0V, 1, buf);
> +	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
>  	if (ret)
>  		return ret;
> 
> -	if (enable) {
> -		buf[0] = SPINOR_MT_OCT_DTR;
> -	} else {
> -		/*
> -		 * The register is 1-byte wide, but 1-byte transactions are not
> -		 * allowed in 8D-8D-8D mode. The next register is the dummy
> -		 * cycle configuration register. Since the transaction needs to
> -		 * be at least 2 bytes wide, set the next register to its
> -		 * default value. This also makes sense because the value was
> -		 * changed when enabling 8D-8D-8D mode, it should be reset when
> -		 * disabling.
> -		 */
> -		buf[0] = SPINOR_MT_EXSPI;
> -		buf[1] = SPINOR_REG_MT_CFR1V_DEF;
> +	/* Read flash ID to make sure the switch was successful. */
> +	ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
> +	if (ret) {
> +		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling
> 8D-8D-8D mode\n", ret);
> +		return ret;
>  	}
> 
> -	op = (struct spi_mem_op)
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> -			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
> -					   SPINOR_REG_MT_CFR0V, 1),
> -			   SPI_MEM_OP_NO_DUMMY,
> -			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> +	if (memcmp(buf, nor->info->id, nor->info->id_len))
> +		return -EINVAL;
> 
> -	if (!enable)
> -		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +	return 0;
> +}
> +
> +static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf;
> +	int ret;
> 
> -	ret = spi_mem_exec_op(nor->spimem, &op);
> +	/*
> +	 * The register is 1-byte wide, but 1-byte transactions are not 
> allowed
> +	 * in 8D-8D-8D mode. The next register is the dummy cycle 
> configuration
> +	 * register. Since the transaction needs to be at least 2 bytes wide,
> +	 * set the next register to its default value. This also makes sense
> +	 * because the value was changed when enabling 8D-8D-8D mode, it 
> should
> +	 * be reset when disabling.
> +	 */
> +	buf[0] = SPINOR_MT_EXSPI;
> +	buf[1] = SPINOR_REG_MT_CFR1V_DEF;
> +	op = (struct spi_mem_op)
> +		MICRON_ST_NOR_WR_ANY_REG_OP(4, SPINOR_REG_MT_CFR0V, 2, buf);
> +	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
>  	if (ret)
>  		return ret;
> 
>  	/* Read flash ID to make sure the switch was successful. */
> -	if (enable)
> -		ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
> -	else
> -		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
> -	if (ret)
> +	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
> +	if (ret) {
> +		dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling
> 8D-8D-8D mode\n", ret);
>  		return ret;
> +	}
> 
>  	if (memcmp(buf, nor->info->id, nor->info->id_len))
>  		return -EINVAL;
> @@ -104,6 +107,12 @@ static int micron_st_nor_octal_dtr_enable(struct
> spi_nor *nor, bool enable)
>  	return 0;
>  }
> 
> +static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool 
> enable)
> +{
> +	return enable ? micron_st_nor_octal_dtr_en(nor) :
> +			micron_st_nor_octal_dtr_dis(nor);
> +}
> +
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
>  	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
