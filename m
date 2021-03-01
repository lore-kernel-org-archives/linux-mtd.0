Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C31FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 19:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF9B601FD
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 19:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF9B601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5JPG+2eMD6/Bm56dNatSbbcZEsAr3us1zXtZ6Ia39Y=; b=lRLq2RBKhNYvqYWHKkq8qelz5
	NE9N6UHyjlPDl5PBD7blJaf1+qD0ruFT607v/+/EZJCa3zYqpOYVYaaFH+YZjzmobOzdfKOqESlMT
	vt6/8Pp+/PlolE1ywNLetDFWuewHs8LlNYa976BscopVPas/EpMSvT5gDn53dA5Gc3NDJYVGrncxD
	gSw7gzjjKgXpjFecJKncG+AfLI8v3KvAD1o6CblA0w7mCX96TJEd2ZHDCs8ZV1VFwCwiU2lpOC8Jw
	Mb0oKgphl6079v+pHMjUtAItNZIIllui727+KG5jNeFARv7PvS2x4dlcdjRcet6OQ0msYHPk97wh2
	SZptbDyMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGnuJ-0002Ao-RM; Mon, 01 Mar 2021 19:08:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGnuG-00029i-Ly
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 19:08:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 121J8V0p049192;
 Mon, 1 Mar 2021 13:08:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614625711;
 bh=ht3TgMuT1VuVNApt7hvVseYwaBIulr3jSaVla6AVM8s=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ICQZsR9LRjR7DyGYx1vLYrA6xLxn2SOAmSZWOTX1bFxhfDxKl/3YbKbTzmioNT1YM
 2Q7ZvARrMrOKgwlRTfifG0OvcAz/br45GEYX5ldt7qo/cFJLl66Awx1OniOwf9jl3D
 D/UGD/PPNa4VUGakIaGXCtxMowf0eQmWAdZbI6H8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 121J8VSA048715
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Mar 2021 13:08:31 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 13:08:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Mar 2021 13:08:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 121J8U99011438;
 Mon, 1 Mar 2021 13:08:30 -0600
Date: Tue, 2 Mar 2021 00:38:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <yaliang.wang@windriver.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: core: move Spansion SR ready codes out
 of core
Message-ID: <20210301190829.foqbaroznavsf7ka@ti.com>
References: <20210301142844.1089385-1-yaliang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301142844.1089385-1-yaliang.wang@windriver.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_140836_925488_C43A7499 
X-CRM114-Status: GOOD (  40.33  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/03/21 10:28PM, yaliang.wang@windriver.com wrote:
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> To move manufacture specific checking SR ready codes out of core, set up
> an extra method "sr_ready" in struct spi_nor_fixups, by doing this, the
> manufactures can fill in and initialize the method it in their own
> files, and leaves the core a relatively clean place.
> 
> Spansion's checking flash chip ready codes are moved out by applying
> forementioned "sr_ready" method. There will be several following-up
> patches for moving "xsr" and "fsr" related codes out of core.
> 
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---
>  drivers/mtd/spi-nor/core.c     | 84 ++++++++++------------------------
>  drivers/mtd/spi-nor/core.h     |  8 ++++
>  drivers/mtd/spi-nor/spansion.c | 70 ++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h    |  1 -
>  4 files changed, 101 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 20df44b753da..74729eb89947 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -157,7 +157,7 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
>  	return spi_mem_exec_op(nor->spimem, op);
>  }
>  
> -static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> +int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
>  					   u8 *buf, size_t len)
>  {
>  	if (spi_nor_protocol_is_dtr(nor->reg_proto))
> @@ -166,7 +166,7 @@ static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
>  	return nor->controller_ops->read_reg(nor, opcode, buf, len);
>  }
>  
> -static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>  					    const u8 *buf, size_t len)

The second line is not aligned with the open parenthesis in the above 3 
functions. You can pass "--strict" to checkpatch.pl to check for this.

>  {
>  	if (spi_nor_protocol_is_dtr(nor->reg_proto))
> @@ -175,7 +175,7 @@ static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>  	return nor->controller_ops->write_reg(nor, opcode, buf, len);
>  }
>  
> -static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
> +int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
>  {
>  	if (spi_nor_protocol_is_dtr(nor->write_proto))
>  		return -EOPNOTSUPP;
> @@ -649,32 +649,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
>  	return !!(nor->bouncebuf[0] & XSR_RDY);
>  }
>  
> -/**
> - * spi_nor_clear_sr() - Clear the Status Register.
> - * @nor:	pointer to 'struct spi_nor'.
> - */
> -static void spi_nor_clear_sr(struct spi_nor *nor)
> -{
> -	int ret;
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_NO_DATA);
> -
> -		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> -						       NULL, 0);
> -	}
> -
> -	if (ret)
> -		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> -}
> +static const struct flash_info *spi_nor_read_id(struct spi_nor *nor);

This forward declaration is not needed. More on this below.

>  
>  /**
>   * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
> @@ -690,28 +665,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	if (nor->flags & SNOR_F_USE_CLSR &&
> -	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
> -		if (nor->bouncebuf[0] & SR_E_ERR)
> -			dev_err(nor->dev, "Erase Error occurred\n");
> -		else
> -			dev_err(nor->dev, "Programming Error occurred\n");
> -
> -		spi_nor_clear_sr(nor);
> -
> -		/*
> -		 * WEL bit remains set to one when an erase or page program
> -		 * error occurs. Issue a Write Disable command to protect
> -		 * against inadvertent writes that can possibly corrupt the
> -		 * contents of the memory.
> -		 */
> -		ret = spi_nor_write_disable(nor);
> -		if (ret)
> -			return ret;
> -
> -		return -EIO;
> -	}
> -
>  	return !(nor->bouncebuf[0] & SR_WIP);
>  }
>  
> @@ -792,18 +745,27 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>   */
>  static int spi_nor_ready(struct spi_nor *nor)
>  {
> -	int sr, fsr;
> +	const struct flash_info *info = nor->info ? nor->info : spi_nor_read_id(nor);
> +
> +	if (IS_ERR_OR_NULL(info))
> +		return -ENOENT;

nor->info can't be NULL or invalid. The probe would fail in that case 
and this function would never get executed. No need to check anything 
before using nor->info.


> +
> +	/*Chip specific method for querying whether the flash is ready*/

Nitpick: Please add a space after the '*' when starting a comment and 
before it when ending a comment. Same for all other comments.

> +	if (info->fixups && info->fixups->sr_ready)
> +		return info->fixups->sr_ready(nor);
> +
> +	/*Manufacture specific method for querying whether the flash is ready*/

s/Manufacture/Manufacturer/

> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->sr_ready)
> +		return nor->manufacturer->fixups->sr_ready(nor);

I don't think nor->info->fixups is the correct place for this hook. 
Those should be about fixing up incorrect or missing information about 
the flash. It should instead be placed in nor->params.

This eliminates the need for the call to 
nor->manufacturer->fixups->sr_ready. Now you can simply call 
nor->params->sr_ready(). The fixup hooks will take care of populating it 
with the correct function based on the flash or manufacturer.

>  
>  	if (nor->flags & SNOR_F_READY_XSR_RDY)
> -		sr = spi_nor_xsr_ready(nor);
> -	else
> -		sr = spi_nor_sr_ready(nor);
> -	if (sr < 0)
> -		return sr;
> -	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> -	if (fsr < 0)
> -		return fsr;
> -	return sr && fsr;
> +		return spi_nor_xsr_ready(nor);
> +	if (nor->flags & SNOR_F_USE_FSR)
> +		return spi_nor_fsr_ready(nor);
> +
> +	/*Common method for querying whether the flash is ready*/
> +	return spi_nor_sr_ready(nor);

You are no longer taking into account the FSR status correctly. If a 
flash specifies the USE_FSR flag, then spi_nor_fsr_ready() directly 
returns and spi_nor_sr_ready() is not consulted at all. But if the flash 
then populates the sr_ready() hook then it directly the result of 
sr_ready() and spi_nor_fsr_ready() is not consulted at all.

>  }
>  
>  /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index d631ee299de3..36356f27ee92 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -253,6 +253,7 @@ struct spi_nor_flash_parameter {
>   *             parameters that could not be extracted by other means (i.e.
>   *             when information provided by the SFDP/flash_info tables are
>   *             incomplete or wrong).
> + * @sr_ready: special method for querying whether a flash chip is ready.

There is nothing "special" about this. Simply saying "queries whether a 
flash chip is ready or not" should be fine.

>   *
>   * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
>   * table is broken or not available.
> @@ -264,6 +265,7 @@ struct spi_nor_fixups {
>  			 const struct sfdp_bfpt *bfpt,
>  			 struct spi_nor_flash_parameter *params);
>  	void (*post_sfdp)(struct spi_nor *nor);
> +	int (*sr_ready)(struct spi_nor *nor);
>  };
>  
>  struct flash_info {
> @@ -471,6 +473,12 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  			     const struct sfdp_bfpt *bfpt,
>  			     struct spi_nor_flash_parameter *params);
>  
> +int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> +					   u8 *buf, size_t len);
> +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +					    const u8 *buf, size_t len);
> +int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs);
> +
>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>  	return mtd->priv;
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b0c5521c1e27..67619b64c148 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -18,6 +18,7 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
> +#define SPINOR_OP_SPANSION_CLSR			0x30
>  
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> @@ -175,6 +176,74 @@ static struct spi_nor_fixups s28hs512t_fixups = {
>  	.post_bfpt = s28hs512t_post_bfpt_fixup,
>  };
>  
> +/**
> + * spansion_clear_sr() - Clear the Status Register.
> + * @nor:	pointer to 'struct spi_nor'.
> + */
> +static void spansion_clear_sr(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SPANSION_CLSR, 0),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_SPANSION_CLSR,
> +						       NULL, 0);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> +}

Ok.

> +
> +/**
> + * spansion_sr_ready() - Spansion specific method for querying the flash to
> + * see if it is ready for new commands.
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spansion_sr_ready(struct spi_nor *nor)
> +{
> +	u8 *sr = nor->bouncebuf;
> +	int ret;
> +
> +	ret = spi_nor_read_sr(nor, sr);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->flags & SNOR_F_USE_CLSR &&
> +	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
> +		if (nor->bouncebuf[0] & SR_E_ERR)
> +			dev_err(nor->dev, "Erase Error occurred\n");
> +		else
> +			dev_err(nor->dev, "Programming Error occurred\n");
> +
> +		spansion_clear_sr(nor);
> +
> +		/*
> +		 * WEL bit remains set to one when an erase or page program
> +		 * error occurs. Issue a Write Disable command to protect
> +		 * against inadvertent writes that can possibly corrupt the
> +		 * contents of the memory.
> +		 */
> +		ret = spi_nor_write_disable(nor);
> +		if (ret)
> +			return ret;
> +
> +		return -EIO;
> +	}
> +
> +	return !(sr[0] & SR_WIP);
> +}
> +

Ok.

>  static int
>  s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -291,6 +360,7 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
>  
>  static const struct spi_nor_fixups spansion_fixups = {
>  	.post_sfdp = spansion_post_sfdp_fixups,
> +	.sr_ready = spansion_sr_ready,
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_spansion = {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index d13958de6d8a..43bd66204fdf 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -100,7 +100,6 @@
>  
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
> -#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
