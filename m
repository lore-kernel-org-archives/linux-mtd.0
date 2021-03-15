Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CABC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 11:29:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7456E64E20
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 11:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7456E64E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hh8viN7iYO2jusAzS6qPpRlu26HazRU935dmHdx/2Xs=; b=Prk7C0wImLNR5zinBbz8taPGy
	/lpmhy1GKYnXJFur+85U60eOayBHmFIElrhTc/FhkxUqrgyVJTl4gUhEThUy/KQk5x4X34UO69R72
	JPWUlLMZ6kyXeW+uI0idSgV0ahanq4eQQI7eQmAFgzsJfWvDmhSf7JtjMzrX3819Qa+ymfcGqC1Mt
	u8RpKgNGYwKBMI8yaWicjBL+vPBMq9Vv9HflKSEx2O4EDi/ChHqrBI9pj44PhP/uX6Wpdeaz1ZT6n
	PNquC6zgzWPFjoSWXyW+IE+2UfJ7z4xzoXbhLBc1TvpsRVwqScJsRMMKwleO7pwMUCRj6joEQeXNe
	1PXstt6NA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLlOC-00FfCn-MD; Mon, 15 Mar 2021 11:28:00 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLlNu-00FfAP-A3
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 11:27:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FBRYsj091392;
 Mon, 15 Mar 2021 06:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615807654;
 bh=jFvDFPl60zI8fKcb4XSbrp0GwbiaX3yT4AUI22KVtPY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fVhSOquyehcujAzwe1bGtI/GVBANfSiuTDY/B96qXcN5xBivxEkNmFCKPV4H6k7nY
 IGBW0dImCLcFmf5l876dXDExvmcnifDw3G3w1LMLV1bAyPnOR5WC9pMZ7CYvPNeN8R
 Kq28ajnQJzYn+F6W4luJK4fSIDWlQy330WX9igTM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FBRYEC113166
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 06:27:34 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 06:27:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 06:27:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FBRWd5032061;
 Mon, 15 Mar 2021 06:27:33 -0500
Date: Mon, 15 Mar 2021 16:57:32 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 3/6] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Message-ID: <20210315112730.gzo46wyekyudsxto@ti.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <1c8662f53f13c6e40b2383d7e7a1fe74ab1c3335.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c8662f53f13c6e40b2383d7e7a1fe74ab1c3335.1615523176.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_112744_646888_EF63CDFA 
X-CRM114-Status: GOOD (  27.02  )
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

On 12/03/21 06:44PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Spansion/Cypress chips support Read/Write Any Register commands.
> These commands are mainly used to write volatile registers and access to
> the registers in second and subsequent die for multi-die package parts.
> 
> The Read Any Register instruction (65h) is followed by register address
> and dummy cycles, then the selected register byte is returned.
> 
> The Write Any Register instruction (71h) is followed by register address
> and register byte to write.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - Cleanup implementation
>   
>  drivers/mtd/spi-nor/spansion.c | 102 +++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b0c5521c1e27..1bce95cb7896 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -19,6 +19,108 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  
> +/**
> + * spansion_read_any_reg() - Read Any Register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_addr:	register address
> + * @reg_dummy:	number of dummy cycles for register read
> + * @reg_val:	pointer to a buffer where the register value is copied into
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
> +				 u8 reg_dummy, u8 *reg_val)
> +{
> +	ssize_t ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
> +				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
> +				   SPI_MEM_OP_DUMMY((reg_dummy/8), 0),

This is only correct when dummy buswidth is 1. It will lead to some very 
nasty and hard-to-catch bugs when someone uses it for a flash that has a 
different dummy buswidth. See how dummy nbytes are calculated in 
spi_nor_spimem_read_data().

> +				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		enum spi_nor_protocol proto = nor->read_proto;
> +		u8 opcode = nor->read_opcode;
> +		u8 dummy = nor->read_dummy;
> +
> +		nor->read_opcode = SPINOR_OP_RD_ANY_REG;
> +		nor->read_dummy = reg_dummy;
> +		nor->read_proto = nor->reg_proto;
> +
> +		ret = nor->controller_ops->read(nor, reg_addr, 1, reg_val);
> +
> +		nor->read_opcode = opcode;
> +		nor->read_dummy = dummy;
> +		nor->read_proto = proto;
> +
> +		if (ret == 1)
> +			return ret;
> +		if (ret != 1)
> +			return -EIO;
> +
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * spansion_write_any_reg() - Write Any Register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_addr:	register address
> + * @reg_val:	register value to be written
> + *
> + * Volatile register write will be effective immediately after the operation so
> + * this function does not poll the status.

The same opcode can be used to write to non-volatile registers as well, 
you just need to change the address passed. It is not recommended to 
write to non-volatile registers in SPI NOR though. Maybe add "(should be 
a volatile register)" after "register address" above?

As for not polling the status, can a volatile register write cause a 
program error? If so, you should check the status to know if any error 
bits were set.

> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
> +{
> +	ssize_t ret;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),
> +				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(1, &reg_val, 0));
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		enum spi_nor_protocol proto = nor->write_proto;
> +		u8 opcode = nor->program_opcode;
> +
> +		nor->program_opcode = SPINOR_OP_WR_ANY_REG;
> +		nor->write_proto = nor->reg_proto;
> +
> +		ret = nor->controller_ops->write(nor, reg_addr, 1, &reg_val);
> +
> +		nor->program_opcode = opcode;
> +		nor->write_proto = proto;
> +
> +		if (ret < 0)
> +			return ret;
> +		if (ret != 1)
> +			return -EIO;
> +
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'
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
