Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E67C433E6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:23:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5AB64EBD
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5AB64EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WItokatF/RKJgkEpMwenkuOsYzmpQoOI+KKG1HtRlnk=; b=qajICCr7oZi5jajmBH7M42MIV
	lr9RaJRkIELa34DXfaxOLtdWx1yKeQ9z0jzTZ/yW7AsoorIyWoKVqM5YuZ8KUmr/RMT2srHxM3cqn
	PF9zo5uJ9nzZGFx2NSwrvWxMRKwseM021kpLNQe4+Zc7KA6k8W2B+B71i1jZ7/v+gQl7zExEGABB+
	3pfPa2402GEfbWe1ZfubUdZer0Cxdy7OyfjzaPhARUllv3wLjxpZJfGZ8G9cBtMOBpNYaCwr7WFks
	YubFj+lFYHLyAYpDpbBr6/NVgzrn3yKaMN8zbxpHVwUnIix/YOdm8OPVBuobuXBAX5rQhH8nJoPMO
	wq38ZTTVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHW8I-005zyD-AW; Wed, 03 Mar 2021 18:22:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT0E-005GwC-M0
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LYpMlA4M+QLNytVVQ9CMO73yNXeyuyx7TK0Tlza0Q+o=; b=jXmHIJDeSNell6xr+O0Q1p91yV
 wn/F6ZPqgfiY47P42w5socOHBHNt6+b5bawAwqX6H0KfzX6r7vr4W3IvvmWxJlIIn8QcEEsvBxBMB
 uVcYcUjKruz8PogIhyFNxuw0wUAN9O0BPSOt1ZWa5ME1mXeYoETHicXeTunUTqYcnl1ItWaL1kgyv
 8EyXPCeEEMZCCWDT0nGDvTiaPZcliosb/1SBBUVzXFWXvJeLCvEdEH1ayw7SdwBcQRANsVrBQ77rB
 STnvd9Im3icX1XkxzxvG++k/S0uT1nYKP5TakBtVC9nxeX/TMTvB+I9H9HVjEixwtv+buyzR1Vh6W
 uelQad2w==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH315-00Gzr4-Bq
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 11:16:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 122BG0xJ071593;
 Tue, 2 Mar 2021 05:16:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614683760;
 bh=LYpMlA4M+QLNytVVQ9CMO73yNXeyuyx7TK0Tlza0Q+o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=x6SOvbmT1FltJjx868DfsWpd8ZzSxwQ0n7mVHaNk2Vx4gnF0A1hIVKcvxr1FnbxVd
 wRyFy3mYP/fJToNSxlQ9lNDfdm/UnljO/8YLfBwpYTESK6OvGnsJjRjwDYdpoeNnTQ
 zoCflOJlklk/t29rWpyeCZjFk064lc1Br798pPxQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 122BG01P012291
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Mar 2021 05:16:00 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Mar
 2021 05:15:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Mar 2021 05:15:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 122BFxiv123839;
 Tue, 2 Mar 2021 05:15:59 -0600
Date: Tue, 2 Mar 2021 16:45:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <yaliang.wang@windriver.com>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: uses CLSR command in
 S25FL{064|128|256}L chips
Message-ID: <20210302111556.efrayf6h3u46j5t7@ti.com>
References: <20210301142844.1089385-1-yaliang.wang@windriver.com>
 <20210301142844.1089385-2-yaliang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301142844.1089385-2-yaliang.wang@windriver.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_111648_202499_4092104B 
X-CRM114-Status: GOOD (  31.50  )
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

On 01/03/21 10:28PM, yaliang.wang@windriver.com wrote:
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> S25FL{064|128|256}L chips can't recover from errors when program error
> or erase error occurs, P_ERR or E_ERR bit will be set to one, WIP bit
> will remain set to one, A Clear Status Register command must be sent to
> return the device to STANDBY state.
> 
> First record of the can't recover error is in commit <c4b3eacc1dfe>
> ("mtd: spi-nor: Recover from Spansion/Cypress errors"). The error has
> been fixed by the commit, however, S25FL-L chips shifted P_ERR and E_ERR
> bits from SR1 to SR2, which makes the previous fix no longer work.
> 
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 96 ++++++++++++++++++++++++++++++++--
>  1 file changed, 93 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 67619b64c148..4ed98cb969a5 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -19,7 +19,10 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  #define SPINOR_OP_SPANSION_CLSR			0x30
> +#define SPINOR_OP_SPANSION_SR2			0x07
>  
> +#define S25FL_L_SR2_P_ERR BIT(5)
> +#define S25FL_L_SR2_E_ERR BIT(6)

Nitpick: Align the BIT() part with the lines above so it all looks nice.

>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -203,6 +206,38 @@ static void spansion_clear_sr(struct spi_nor *nor)
>  		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
>  }
>  
> +/**
> + * spansion_read_sr2() - Read the Status Register 2 using the
> + * SPINOR_OP_SPANSION_SR2 (07h) command.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @sr2:	pointer to DMA-able buffer where the value of the
> + *		Status Register 2 will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_read_sr2(struct spi_nor *nor, u8 *sr2)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SPANSION_SR2, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, sr2, 1));

The datasheet says that this command is not available in QPI mode. The 
flashes set SPI_NOR_QUAD_READ. So they will be put into QPI mode and 
will be unable to execute this, right? Why does this work then?

> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_SPANSION_SR2,
> +						    sr2, 1);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
> +
> +	return ret;
> +}
> +
>  /**
>   * spansion_sr_ready() - Spansion specific method for querying the flash to
>   * see if it is ready for new commands.
> @@ -244,6 +279,55 @@ static int spansion_sr_ready(struct spi_nor *nor)
>  	return !(sr[0] & SR_WIP);
>  }
>  
> +/**
> + * s25fl_l_sr_ready() - s25fl_l family specific method for querying the flash
> + * to see if it is ready for new commands.
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int s25fl_l_sr_ready(struct spi_nor *nor)
> +{
> +	u8 *sr = nor->bouncebuf;
> +	int ret;
> +
> +	ret = spi_nor_read_sr(nor, sr);
> +	if (ret)
> +		return ret;
> +
> +	ret = spansion_read_sr2(nor, &sr[1]);
> +	if (ret)
> +		return ret;

Since SR2 is only used when SNOR_F_USE_CLSR is set, only run 
spansion_read_sr2() when the flag is set to avoid running it for flashes 
that don't need it.

On that note, since this function is called s25fl_l_sr_ready(), you 
already know this flash can use CLSR. So why even check for the flag at 
all?

> +
> +	if (nor->flags & SNOR_F_USE_CLSR &&
> +			sr[1] & (S25FL_L_SR2_E_ERR | S25FL_L_SR2_P_ERR)) {

Align with open parenthesis.

> +		if (sr[1] & S25FL_L_SR2_E_ERR)
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
> +static struct spi_nor_fixups s25fl_l_fixups = {
> +	.sr_ready = s25fl_l_sr_ready,
> +};
> +
>  static int
>  s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -331,13 +415,19 @@ static const struct flash_info spansion_parts[] = {
>  			     SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SPI_NOR_4B_OPCODES | USE_CLSR)
> +		.fixups = &s25fl_l_fixups,
> +	},
>  	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SPI_NOR_4B_OPCODES | USE_CLSR)
> +		.fixups = &s25fl_l_fixups,
> +	},
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SPI_NOR_4B_OPCODES | USE_CLSR)
> +		.fixups = &s25fl_l_fixups,
> +	},
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>  			      SPI_NOR_NO_ERASE) },
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
