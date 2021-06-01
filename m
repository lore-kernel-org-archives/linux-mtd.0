Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC37C4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 07:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2566124B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 07:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2566124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=b7kZPNs4/2VvO613Z8cVwMOvfASB06q7PGqktIV8UTM=; b=cWb69UzdsgH8s+uNomhpf1TIzF
	atlp8JxKnlEfCKsarsxk/GSgEdCIYa8gdwNG+EkJF62ufNLVDtJrYBLBvaFhQPaIT/IATc8xYe7/B
	MrEcHjgA2XC+AZvUVwXWRC8DLny8wO/lbfRoNrqcC9OsoCNhupmsJOUqffH7aww8jWjD464yVfHKF
	+FdBb/lYLCsIiUFCVawSLZJdqjmODmcCIakpedDylErnCM8WT0O07uu6SqatPtwfe8RbZQZCfIWXA
	7kZVorCDi1qj5NIZRNGOyZeBNAgwMD20aqU/9e2Pou9TqBDoj/SrE1ftZ4D0sFsJathUSsYCsGO90
	DHR5IhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzDy-00FCKB-8M; Tue, 01 Jun 2021 07:54:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzDs-00FCIy-RU
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 07:54:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso1381757pjb.5
 for <linux-mtd@lists.infradead.org>; Tue, 01 Jun 2021 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k6KJtS0jd27IXgLo8lA2iIuHT3n9zEEMK9zMW04lbnI=;
 b=ha7qie082AxoUwUuKwqfFq7l0vGNBHD8ShZq9wp8DRjt2EoVJsJzeFUYNbKrtGJg0X
 4GB/dRSSJQ/Z3i0uzt3dRC4Z8Q55Qe2LZZ2T4k27KD5cO8gxdT45MurO6oa5WLMJtLh/
 l93YyGXNbwB9MShqdbjc6C8nzQhqgspQrnoEROQJ8zJOYsJsxNRXG+2xYeEJueAP1TaN
 n5vqJCqzfsh2S7U9Ovpz/P0i8kfnkQddtxLITo3SssPY19NZSuRaqjSLNjgDMU1Eo1ta
 MdOK5CBhJ+P13Xi85fR6r3+oYHZZmaryXofdo0DS56Jo9CLOtu6mmGp2LhdZcceMIN9e
 GmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k6KJtS0jd27IXgLo8lA2iIuHT3n9zEEMK9zMW04lbnI=;
 b=W5lFdtEmetyDpEU88Uny6wAh6Y9b+af5yUa4Gw7VZ98qCT4gxGt+BaLVPu0W+KG3PP
 OfqXdzXoVjKFPFd9yDcDenoUrvI6H7TNfekuUpNa7FQfjdWbJihorNbed+OdVkALom6h
 sZZKZkGoRGscppVSmaknx0uN1m/FJid11YndNQf9HatZgncLnTzHj5EhvVV0XLAyf4EZ
 lN3RZzwl4bN37hH5WMx+ILM0uIj9JZZyU0N7uj6PIO9YfqwGJIp6g7HmfD1b6NMFftGR
 gO651+t2Qn+t1v4nji59/fFqfooPjCfhVIo+uMc1OVwIDR4wCSwBTV6OPMXv87II9rAt
 ExDw==
X-Gm-Message-State: AOAM530tU1xxmXEv9Uyp/+ZP4rumpgcSr42izTzv+eBi1xJrqXMboCZB
 U6KUhFkQQMiynyXVyFdVrfw=
X-Google-Smtp-Source: ABdhPJz9kIxn/FgnJPy1KlLAnm+An+3awNvw/8puLmZ+MVvYW4HyZgA9XJOmM07cBH4ssqDulzCMHQ==
X-Received: by 2002:a17:90a:6589:: with SMTP id
 k9mr3558248pjj.14.1622534036458; 
 Tue, 01 Jun 2021 00:53:56 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id 136sm12353950pfu.195.2021.06.01.00.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 00:53:56 -0700 (PDT)
Subject: Re: [PATCH v5 3/6] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
 <55919d6bce07a5b534edef10b56a6c1b3fecae9d.1619504535.git.Takahiro.Kuwano@infineon.com>
 <a5736c3f-d49e-2130-44e5-7dd8b4db21f4@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <e65ca95f-0f10-eef3-2f08-07a09ac080e4@gmail.com>
Date: Tue, 1 Jun 2021 16:53:44 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <a5736c3f-d49e-2130-44e5-7dd8b4db21f4@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_005400_937610_7C456216 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Vignesh,

On 5/27/2021 8:06 PM, Vignesh Raghavendra wrote:
> Hi,
> 
> On 4/27/21 12:38 PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Some of Spansion/Cypress chips support Read/Write Any Register commands.
>> These commands are mainly used to write volatile registers and access to
>> the registers in second and subsequent die for multi-die package parts.
>>
>> The Read Any Register instruction (65h) is followed by register address
>> and dummy cycles, then the selected register byte is returned.
>>
>> The Write Any Register instruction (71h) is followed by register address
>> and register byte to write.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>> Changes in v5:
>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>
>> Changes in v4:
>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>   - Modify comment for spansion_write_any_reg()
>>   
>> Changes in v3:
>>   - Cleanup implementation
>>
>>  drivers/mtd/spi-nor/spansion.c | 106 +++++++++++++++++++++++++++++++++
>>  1 file changed, 106 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index b0c5521c1e27..436db8933dcf 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -19,6 +19,112 @@
>>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>>  
>> +/**
>> + * spansion_read_any_reg() - Read Any Register.
>> + * @nor:	pointer to a 'struct spi_nor'
>> + * @reg_addr:	register address
>> + * @reg_dummy:	number of dummy cycles for register read
>> + * @reg_val:	pointer to a buffer where the register value is copied into
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
>> +				 u8 reg_dummy, u8 *reg_val)
>> +{
>> +	ssize_t ret;
>> +
>> +	if (nor->spimem) {
>> +		struct spi_mem_op op =
>> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
>> +				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
>> +				   SPI_MEM_OP_DUMMY(reg_dummy, 0),
>> +				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
> 
> This isn't compatible with DDR mode. We should able to use
> spansion_read_any_reg() helper in place of some of the open coding being
> done today in spi_nor_cypress_octal_dtr_enable(). Same applies for
> spansion_write_any_reg().
> 
I don't see why this isn't compatible with DDR mode.
The spi_nor_spimem_setup_op() and dummy adjustment take care of DDR.

To use this helper in spi_nor_cypress_octal_dtr_enable(), addr_width needs
to be passed by parameter instead of using 'nor->addr_width'. Please let
me know if any other changes are required.

>> +
>> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +
> 
> 
>> +		op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
>> +		if (spi_nor_protocol_is_dtr(nor->reg_proto))
>> +			op.dummy.nbytes *= 2;
> 
> spi_nor_spimem_setup_op() should care of above right?
> 
This is same as spi_nor_spimem_read_data() in core.c. We need to convert
the dummy 'cycles' to the dummy 'bytes' after spi_nor_spimem_setup_op().
I will add a comment about it.

>> +
>> +		ret = spi_mem_exec_op(nor->spimem, &op);
> 
> 		return spi_mem_exec_op(nor->spimem, &op);
> 
> Thus avoid extra level indentation below.
> 
>> +	} else {
>> +		enum spi_nor_protocol proto = nor->read_proto;
>> +		u8 opcode = nor->read_opcode;
>> +		u8 dummy = nor->read_dummy;
>> +
>> +		nor->read_opcode = SPINOR_OP_RD_ANY_REG;
>> +		nor->read_dummy = reg_dummy;
>> +		nor->read_proto = nor->reg_proto;
>> +
>> +		ret = nor->controller_ops->read(nor, reg_addr, 1, reg_val);
>> +
>> +		nor->read_opcode = opcode;
>> +		nor->read_dummy = dummy;
>> +		nor->read_proto = proto;
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +		if (ret != 1)
>> +			return -EIO;
>> +
> 
> 
>> +		ret = 0;
> 
> 		return 0;
> 
For better readability, how about adding a helper of controller ops?

	if (nor->spimem) {
		[...]
		return spi_mem_exec_op(nor->spimem, &op);
	}

	return spansion_controller_ops_read_any_reg(nor, reg_addr, reg_dummy, reg_val);


>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * spansion_write_any_reg() - Write Any Register.
>> + * @nor:	pointer to a 'struct spi_nor'
>> + * @reg_addr:	register address (should be a volatile register)
> 
> 
> To be safe, lets explicitly reject writes to non-volatile register
> addresses.
> 
OK.

>> + * @reg_val:	register value to be written
>> + *
>> + * Volatile register write will be effective immediately after the operation so
>> + * this function does not poll the status.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
>> +{
>> +	ssize_t ret;
>> +
>> +	ret = spi_nor_write_enable(nor);
>> +	if (ret)
>> +		return ret;
> 
> 
> Hmm, I don't see spi_nor_write_disable().
> 
> Either both spi_nor_write_enable() and spi_nor_write_disable() should be
> responsibility of caller or both needs to be taken care of here.
> 
> And the same needs to be documented in the function description
> 
OK. I will call both from outside.

>> +
>> +	if (nor->spimem) {
>> +		struct spi_mem_op op =
>> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),
>> +				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
>> +				   SPI_MEM_OP_NO_DUMMY,
>> +				   SPI_MEM_OP_DATA_OUT(1, &reg_val, 0));
>> +
>> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +
>> +		ret = spi_mem_exec_op(nor->spimem, &op);
>> +	} else {
>> +		enum spi_nor_protocol proto = nor->write_proto;
>> +		u8 opcode = nor->program_opcode;
>> +
>> +		nor->program_opcode = SPINOR_OP_WR_ANY_REG;
>> +		nor->write_proto = nor->reg_proto;
>> +
>> +		ret = nor->controller_ops->write(nor, reg_addr, 1, &reg_val);
>> +
>> +		nor->program_opcode = opcode;
>> +		nor->write_proto = proto;
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +		if (ret != 1)
>> +			return -EIO;
>> +
>> +		ret = 0;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:		pointer to a 'struct spi_nor'
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
