Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236FCC4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 11:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E050C61028
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 11:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E050C61028
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IgY553xIWMtVla9MTWanKNl6Gc8VXbGwiz/ARMEcYiA=; b=LK6alc6+gvfWr74f+JJthrPQkI
	DFtymhbQDHivWUobOqCB3KG38aj7t3WqYRiFAJ33SDFAy3n3KJX1W/sDR2WH5vbbIW4RJsZ5w5BKO
	Ibg3cNt7XY4JE0sd6N8oZ/SRlgJuNeI9/fPJcGf6MqLXfwESiKCbjmLv5HkEJso2KeZAo/yRa8xip
	6CGzKxYMN6PF+H+NI/KoP5Cz9NSM7DoF6TYiTZc4QBD8E9SENBYrEvBg5rTBTnz7SOO1/1LvttJaY
	wP9bBjshiCzQjrYefXHgY4ZTosPC1yH2NRdoU7FAhfuv6GvbrvGKwDvcdn6McL7OrK5b0d9Rfdq4+
	WrEMEYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmDqy-0055bj-Mp; Thu, 27 May 2021 11:07:04 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmDqa-0055KG-5d
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 11:06:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RB6Rj5073201;
 Thu, 27 May 2021 06:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622113587;
 bh=MfrRac4mtVSD8QT/fa+ZLUbYoVYY1fgGCoBpxzq96hQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=GRm1tsAQG0iAfSLuH1jx7/lnr9FjzsZHN3BCCy3Z+WRFT3m1gD8z36y9ktwrFV1nr
 WEjerWGHUihWNO8u8SCYMHo21H7MNC7FCodX112957fiRcvSlKb8XD30tuVixa34eP
 os6jskwg/Eh/S7rvK/nDq9s+/SwdQzVGusddDkMY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RB6RqP090457
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 06:06:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 06:06:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 06:06:27 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RB6NKd081760;
 Thu, 27 May 2021 06:06:24 -0500
Subject: Re: [PATCH v5 3/6] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
 <55919d6bce07a5b534edef10b56a6c1b3fecae9d.1619504535.git.Takahiro.Kuwano@infineon.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a5736c3f-d49e-2130-44e5-7dd8b4db21f4@ti.com>
Date: Thu, 27 May 2021 16:36:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <55919d6bce07a5b534edef10b56a6c1b3fecae9d.1619504535.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_040640_393390_DF59A1AF 
X-CRM114-Status: GOOD (  28.17  )
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

Hi,

On 4/27/21 12:38 PM, tkuw584924@gmail.com wrote:
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
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> Changes in v5:
>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
> 
> Changes in v4:
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
>   
> Changes in v3:
>   - Cleanup implementation
> 
>  drivers/mtd/spi-nor/spansion.c | 106 +++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b0c5521c1e27..436db8933dcf 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -19,6 +19,112 @@
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
> +				   SPI_MEM_OP_DUMMY(reg_dummy, 0),
> +				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));

This isn't compatible with DDR mode. We should able to use
spansion_read_any_reg() helper in place of some of the open coding being
done today in spi_nor_cypress_octal_dtr_enable(). Same applies for
spansion_write_any_reg().

> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +


> +		op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
> +		if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +			op.dummy.nbytes *= 2;

spi_nor_spimem_setup_op() should care of above right?

> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);

		return spi_mem_exec_op(nor->spimem, &op);

Thus avoid extra level indentation below.

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
> +		if (ret < 0)
> +			return ret;
> +		if (ret != 1)
> +			return -EIO;
> +


> +		ret = 0;

		return 0;

> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * spansion_write_any_reg() - Write Any Register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_addr:	register address (should be a volatile register)


To be safe, lets explicitly reject writes to non-volatile register
addresses.

> + * @reg_val:	register value to be written
> + *
> + * Volatile register write will be effective immediately after the operation so
> + * this function does not poll the status.
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


Hmm, I don't see spi_nor_write_disable().

Either both spi_nor_write_enable() and spi_nor_write_disable() should be
responsibility of caller or both needs to be taken care of here.

And the same needs to be documented in the function description

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
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
