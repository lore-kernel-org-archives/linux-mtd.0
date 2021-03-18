Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D864CC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:32:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5992C64F04
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5992C64F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MSCPRhXDzediScDEa3phH4O1BAoqZ/f4clgNQxd6xJE=; b=VEtd+Lyfvi2nRY64LiAxHGcr2
	7lNVcv6jmRxVPpplQDMEvZY4Rec9OCGJViE70scxRnBVEAanH6G2jtaxUKN8IlQgqmeDQAv8qCXfC
	dSr9kLkR/xNHBj9ne2NhfF3BsPfNgpFeoEwuDortY1ksYlji6meLvc/ykFWCQuGmWfNvHiiZQDlhW
	Sre4qfdNGYA+YnPLWFukSOkHGWQzWVX3uPJCjwv8uzjDtRYMYur/n5gZzBBy/Ai/JuQEQAZM9aQBF
	i6g4dnJzkF8NazrBBxOrgFpXyUTS/OIiwdkcpSaC0lepTpF83EyiUWgwPVBBVwKLw4qJpTwgVw0x3
	KViklpblA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMmC3-004ceK-QH; Thu, 18 Mar 2021 06:31:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMmBw-004cdp-2f
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 06:31:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id l3so2787841pfc.7
 for <linux-mtd@lists.infradead.org>; Wed, 17 Mar 2021 23:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wNfktqIsvUH5CzXfC/FU7wHGoxk0XQMngWyyLFZyZnw=;
 b=em1NGY5XN1gmPCI7ym3cQCKASMfaSgQTyKUKvq22igP38tRwJlNXzDhfisRB5jkwr6
 cxsyMGEfGfhUMz9rlzoxNaUdoYiXkEgrmLdNxuOdPeLPoDQgmahvKh+BVySG9iZ64o+k
 /w5CX+wlF/tYoj4nu7eJ8K1da2mRehtgfhB2csd3L0LNExdG0aBfD2hyXHb6Oj3faHmU
 YEepc+CbDH3R8ApYGjldg9GTDMmEz0enF5YuuQpw92Hhym4AmZFGKUkVW5Jjiqy9jaUt
 KGxk0Zick10nbBXW/SKDWJsr1mMHfkyYSbSVxyEAAoUyC8fRkOzSxQt43aewSN9F8hF2
 HYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wNfktqIsvUH5CzXfC/FU7wHGoxk0XQMngWyyLFZyZnw=;
 b=ItEwRYRYW+JoBr/+HKg9dJEj8yR4zhfn2K4hLDbmGu/UertP96AoSmEmVL8hjnWqnm
 NyguXJvgTjdK91VQiTHAjh3vlTt7wuwvuqKnk1hffqET5p+MalLVTNhZcdcpTp3fzDff
 xdlBe7CdiShuK2yl7+wRTtMmpvFIkvUNbM7eTDiX6XOtyDaYh71dm7CnrbqtqV88EfUb
 d4WAjUOCNWFRMa1UBFF+oXNojByFqS7g7uu9XjVWCc244HAYv36x+pKAZHg3cChAkXRf
 SmngdVrOwekOTvjCcYO+qswFptipXG5LXa3vnMX+YDBikekTgdaoJWCDq4MMk6XZsezn
 5s0Q==
X-Gm-Message-State: AOAM530tqRW/sB1/Db5DNkf3DDKsaRwwrAE3m3eTw0m6KJ/+2e6Aexo2
 vdqifRB2BkKoxrCLHGTko60=
X-Google-Smtp-Source: ABdhPJzulWnRF3BYcPm4qCoG1y7FMi3AJwIXdyb0TJc7qg/oRCGyp94ZdJpXsBMiLNbPabXoQiSxDQ==
X-Received: by 2002:a65:6a0c:: with SMTP id m12mr5588228pgu.161.1616049089552; 
 Wed, 17 Mar 2021 23:31:29 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id 4sm954979pgh.71.2021.03.17.23.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 23:31:29 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <1c8662f53f13c6e40b2383d7e7a1fe74ab1c3335.1615523176.git.Takahiro.Kuwano@infineon.com>
 <20210315112730.gzo46wyekyudsxto@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <a30d75f5-da39-0c0f-0d65-065ab31a841f@gmail.com>
Date: Thu, 18 Mar 2021 15:31:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315112730.gzo46wyekyudsxto@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_063132_320229_FD6CDB29 
X-CRM114-Status: GOOD (  25.84  )
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

On 3/15/2021 8:27 PM, Pratyush Yadav wrote:
> On 12/03/21 06:44PM, tkuw584924@gmail.com wrote:
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
>> ---
>> Changes in v3:
>>   - Cleanup implementation
>>   
>>  drivers/mtd/spi-nor/spansion.c | 102 +++++++++++++++++++++++++++++++++
>>  1 file changed, 102 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index b0c5521c1e27..1bce95cb7896 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -19,6 +19,108 @@
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
>> +				   SPI_MEM_OP_DUMMY((reg_dummy/8), 0),
> 
> This is only correct when dummy buswidth is 1. It will lead to some very 
> nasty and hard-to-catch bugs when someone uses it for a flash that has a 
> different dummy buswidth. See how dummy nbytes are calculated in 
> spi_nor_spimem_read_data().
> 
Yes, I will fix in v4.

>> +				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
>> +
>> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +
>> +		ret = spi_mem_exec_op(nor->spimem, &op);
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
>> +		if (ret == 1)
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
>> +/**
>> + * spansion_write_any_reg() - Write Any Register.
>> + * @nor:	pointer to a 'struct spi_nor'
>> + * @reg_addr:	register address
>> + * @reg_val:	register value to be written
>> + *
>> + * Volatile register write will be effective immediately after the operation so
>> + * this function does not poll the status.
> 
> The same opcode can be used to write to non-volatile registers as well, 
> you just need to change the address passed. It is not recommended to 
> write to non-volatile registers in SPI NOR though. Maybe add "(should be 
> a volatile register)" after "register address" above?
> 
Yes, it is better to add such comment.

> As for not polling the status, can a volatile register write cause a 
> program error? If so, you should check the status to know if any error 
> bits were set.
> 
No, writing to volatile registers does not cause a program error.

Best Regards,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
