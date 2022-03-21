Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20714C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 22:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnDHpU3eV8IlI3ejCJ1gAa9vFc2yivVvFtda+dliL1s=; b=vd4gVqlIxjqVRfPO6PC4sFAjDP
	67jhpyLkv5M7EZBlsOn2vClbNQ3qklzo5VuGMXZotQf9oesX4KgVx8aNuj2UIi98/sHzeIThdTox6
	A1aw+Tb5RSL4VJRHlXcESuOFDj7PmdKlzcgr+jwG0dCNN4dEflk02UsXNqExfgZGpMI9ukBYl22wB
	24C10koFlRvk+wBKUJjB/sJzd0oiBc4Qx+9DwhoFklDPwUNzweBA1o28m3PEwLUH3VMdcaE4Btv5R
	AIlnqmDtZkRSlAt4Gup+3b8eBjAUHML1OfyRJlR/ivh+YbJtjHB0Nycy4e1ATp3g1VeoLgum5Pawj
	mB6xrY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQx6-009Kef-7o; Mon, 21 Mar 2022 22:56:40 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQx2-009KdX-LW
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 22:56:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 960D022175;
 Mon, 21 Mar 2022 23:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647903393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+5AxZS2v0QEhyDGe/oHcf9cHqL61ODkbOB80EmEliM=;
 b=TriGWu9bh10ofU/uWYYLsHC6kUBlIQgOI41JBeXIU9OaZ54ziQ02DYc5yTCtXM5I1dtGjQ
 8q/chhRTxdO95xuz8F+WglTzxEwDukJAata3KF7NxXc9Rh5ehZkR9pm9fZTF348RJ/GvQR
 JmX89bds/wLn0v8vocG9eXPx8GCFAOQ=
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 23:56:33 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
In-Reply-To: <20220228111712.111737-5-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-5-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0bdbe6ad8f39996df6345bb249e4a2e8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_155637_057267_907B04DE 
X-CRM114-Status: GOOD (  30.09  )
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

Am 2022-02-28 12:17, schrieb Tudor Ambarus:
> RDID is used in the core to auto detect the flash, but also by some
> manufacturer drivers that contain flashes that support Octal DTR mode,
> so that they can read the flash ID after the switch to Octal DTR was 
> made
> to test if the switch was successful. Introduce a core method for RDID 
> op
> to avoid code duplication.

Some or all? Is that specific to the flash or can we just check that
readid works in spi_nor_octal_dtr_enable()? That way we could also
just get rid of the proto parameter for the read_id because it can
be called after we set the reg_proto.

-michael

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 58 ++++++++++++++++++++++++++------------
>  drivers/mtd/spi-nor/core.h |  9 ++++++
>  2 files changed, 49 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b1d6fa65417d..281e3d25f74c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -369,6 +369,41 @@ int spi_nor_write_disable(struct spi_nor *nor)
>  	return ret;
>  }
> 
> +/**
> + * spi_nor_read_id() - Read the JEDEC ID.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @naddr:	number of address bytes to send. Can be zero if the 
> operation
> + *		does not need to send an address.
> + * @ndummy:	number of dummy bytes to send after an opcode or address. 
> Can
> + *		be zero if the operation does not require dummy bytes.
> + * @id:		pointer to a DMA-able buffer where the value of the JEDEC ID
> + *		will be written.
> + * @reg_proto:	the SPI protocol for register operation.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +		    enum spi_nor_protocol reg_proto)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_NOR_READID_OP(naddr, ndummy, id, SPI_NOR_MAX_ID_LEN);
> +
> +		spi_nor_spimem_setup_op(nor, &op, reg_proto);
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
> +						    SPI_NOR_MAX_ID_LEN);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
> +
> +	return ret;
> +}
> +
>  /**
>   * spi_nor_read_sr() - Read the Status Register.
>   * @nor:	pointer to 'struct spi_nor'.
> @@ -1649,28 +1684,15 @@ static const struct flash_info
> *spi_nor_match_id(struct spi_nor *nor,
>  	return NULL;
>  }
> 
> -static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
> +static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
>  {
>  	const struct flash_info *info;
>  	u8 *id = nor->bouncebuf;
>  	int ret;
> 
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
> -						    SPI_NOR_MAX_ID_LEN);
> -	}
> -	if (ret) {
> -		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
> +	ret = spi_nor_read_id(nor, 0, 0, id, nor->reg_proto);
> +	if (ret)
>  		return ERR_PTR(ret);
> -	}
> 
>  	info = spi_nor_match_id(nor, id);
>  	if (!info) {
> @@ -2900,7 +2922,7 @@ static const struct flash_info
> *spi_nor_get_flash_info(struct spi_nor *nor,
>  		info = spi_nor_match_name(nor, name);
>  	/* Try to auto-detect if chip name wasn't specified or not found */
>  	if (!info) {
> -		detected_info = spi_nor_read_id(nor);
> +		detected_info = spi_nor_detect(nor);
>  		info = detected_info;
>  	}
>  	if (IS_ERR_OR_NULL(info))
> @@ -2913,7 +2935,7 @@ static const struct flash_info
> *spi_nor_get_flash_info(struct spi_nor *nor,
>  	if (name && !detected_info && info->id_len) {
>  		const struct flash_info *jinfo;
> 
> -		jinfo = spi_nor_read_id(nor);
> +		jinfo = spi_nor_detect(nor);
>  		if (IS_ERR(jinfo)) {
>  			return jinfo;
>  		} else if (jinfo != info) {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index b7fd760e3b47..f952061d5c24 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -11,6 +11,13 @@
> 
>  #define SPI_NOR_MAX_ID_LEN	6
> 
> +/* Standard SPI NOR flash operations. */
> +#define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 0),			\
> +		   SPI_MEM_OP_ADDR(naddr, 0, 0),			\
> +		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 0))
> +
>  enum spi_nor_option_flags {
>  	SNOR_F_HAS_SR_TB	= BIT(0),
>  	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
> @@ -534,6 +541,8 @@ void spi_nor_unlock_and_unprep(struct spi_nor 
> *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
> +		    enum spi_nor_protocol reg_proto);
>  int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
>  int spi_nor_sr_ready(struct spi_nor *nor);
>  int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
