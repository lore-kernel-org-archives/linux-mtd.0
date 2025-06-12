Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F014C71136
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A4Qzw2mAWOCLV3SkmINUghfoXyz0ekxGKesGqmNLLs=; b=kZ7auG2pJIOuRX
	FcynCc+/TOniu0aQrxdsv0PmZq0pZbmu3wix/1KR1TrOYjTjisXps6cQTpxZnKfgGYFXMr9/sREGX
	Gg+tb2fq5vnlWOq/tfeK0I+Xv2y/VWhXonhVHscIBgGd5F+neyA2Mtf3E9XjXdFPDKQ5CyKCu9nqf
	ZChgbH2N3t54BhBqt0mfDCpL9Z1jAJBKqS5ClD1H7ULQmNcUaMEO60q7J+OiOUOE0niuejcnaND+O
	Fl/JMihWV3GJ3jnEB2DNZhIvXs+KBcr3f4hwlDm8S+G69hQwBUKoJ7GJF1gm8ZRxYUZalimCD4WwN
	oo6TuOEieLgSzrOcFQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbvx-0000000CO3O-1EYg;
	Thu, 12 Jun 2025 07:01:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbvu-0000000CO2z-38P5
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 07:01:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742c27df0daso532619b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2025 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749711665; x=1750316465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xk44NAJUy9DHfVvbiafUGTqxf73hdpOsqbAQW3O9xS8=;
        b=EhegnbZaRxYu/dbZ9v+MG/daPuUpTpR4pXZRFWIw3ZaG1ZD88MQ+xWpQWngm9xkaOY
         OZHWgjHpUoyKY9YHCJF6yx168hwQKIrnEpfQp7tsqiknrxysKzTfW8HNhErCwWoFmIUS
         vE64c+BeNjzwm0vQrBHRD5XgiLajaZw3wJOJBO0QlKx1e5MTWJLa1Pegqlt1CtOepxSd
         D7noYBaurgx+BcC//ezT9WKEk5lhEktAY2JNlRb42/I5f/CE2GjozmPliZsCZG/iRviF
         HsWSnKL+iJPeQzoc9Wj2JOKAY+oib2Da+fuIF4oNIHV9qs/ZeMEgvQhu6C/i2OhT/qv+
         j8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711665; x=1750316465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk44NAJUy9DHfVvbiafUGTqxf73hdpOsqbAQW3O9xS8=;
        b=e0IJ6+sAse3u8OEyg/rYMYWjlbl4793NqfVM0UZ3lzjmiAbpGX+RDJdHC3jfiayDSK
         KExOOCDu/xp5RjEIouzftl5XjgkHsLpASKS6gxb0O1bOq5qPOTxZC2uzf11F93NP5mMK
         kjavIDI6tlgGHUy2U1p45G0bjXOxqJUu6ZnaHUncSXJB/t3GQeohkwJ1un3DQoAixtY0
         IyWtT3rHykA9rfmSPA3qMNpAwrZDWEaRPw66iJsZ1GUFOKa7MUIotzgOZkv66GsSZ1WH
         lU34T3pA3PyeGcrbJQj327/dYLQjTMbjKg4IwpN/wQPduL9VY/FXcKE8vTl+83uVqmXU
         x7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGAbSbJCbZTDnBFQCfMa6Jc4n0+MykeCCBQX6NIOWlVM3pf8aQ4aOuid2oPPUqAhlIItQz/gdPyPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBFz8OPgtim/zlroxhid+GW07zQQlSQ0NSP90Ht4fKuc2K7k1W
	Jmo/RfP+4emL9aWtzaU4tagHOkhpeq+6EuAt4itaWb7A2Z2di1a5SQ1X
X-Gm-Gg: ASbGncuEOhPNSbh+pNm4iAHYMlzM/B4wzQNv7+BixJAleV0DFa+ZYLi0mkBvhm6/cHn
	0lkDEEh4v7hAgpAT9JyJK61uI1IHahP3R6xOtdRICkprrATxWMqEne3+jubguqa/79WlGoXTtce
	YpCnmfWSmLoBhl4O3OrSZbZHAcFwnKR4/h/XJa/QUdNFxfwVD23hqysz7Ve4GU4MxzgKeiZHMHy
	2SiFJZ1eLcOXD/m9UaMTWGI+v0KSgd0yOapGWsLhD4UV6XeHVXrxlzLHPO29WoQePAliA0s5UyY
	VA/TM9UDTKK2hkbwazuVhKhmD2DKjhW+2RWZtgvD2icNanwW7Zbjv3J345VglvSaqh/qvUlbeSk
	I7EDRDTTwaGwn98f9clsRyihF1OGtxU4s4ZT64Q==
X-Google-Smtp-Source: AGHT+IEt+A2IXWFK9su5kcFeuQl2h9FWbLo3O+rikFjbZPDXElDNn1rvgIS2UTsIEhGpQK4JUFuoyg==
X-Received: by 2002:a05:6a00:806:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-7486cde0b49mr8303282b3a.21.1749711664988;
        Thu, 12 Jun 2025 00:01:04 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a0ec02sm732863b3a.148.2025.06.12.00.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:01:04 -0700 (PDT)
Message-ID: <c1088cb5-2f12-4dd1-b3cd-42e4709ef05d@gmail.com>
Date: Thu, 12 Jun 2025 16:01:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode
 for SEMPER
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20250605085535.17963-1-Takahiro.Kuwano@infineon.com>
 <0b0cc45f-e6c0-4020-9324-758cb815400b@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <0b0cc45f-e6c0-4020-9324-758cb815400b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_000106_789737_6B9BA99F 
X-CRM114-Status: GOOD (  18.50  )
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

On 6/10/2025 12:19 AM, Tudor Ambarus wrote:
> Hi, Takahiro,
> 
> On 6/5/25 9:55 AM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
>> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
>> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
>> and function.
>>
>> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index bf08dbf5e742..9162b9297ce8 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -17,6 +17,7 @@
>>  
>>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>>  #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
>> +#define SPINOR_OP_CYPRESS_EX4B	0xB8	/* Exit 4-byte address mode */
>>  #define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
>>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>> @@ -58,6 +59,13 @@
>>  		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
>>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))
>>  
>> +#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
>> +					   SPINOR_OP_CYPRESS_EX4B, 0),	\
> 
> I wonder if it would make sense to have per vendor opcodes. Updating the
> set_4byte_addr_mode() method wouldn't be needed in this case, you would
> just need to use some nor->vendor->ops->ex4b opcode, right?
> 
Do you mean introducing new vendor opcodes structure into nor or
nor->params?

>> +		   SPI_MEM_OP_NO_ADDR,					\
>> +		   SPI_MEM_OP_NO_DUMMY,					\
>> +		   SPI_MEM_OP_NO_DATA)
>> +
>>  #define SPANSION_OP(opcode)						\
>>  	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
>>  		   SPI_MEM_OP_NO_ADDR,					\
>> @@ -356,6 +364,20 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>  	return 0;
>>  }
>>  
>> +static int cypress_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>> +{
>> +	int ret;
>> +	struct spi_mem_op op = CYPRESS_NOR_EN4B_EX4B_OP(enable);
>> +
>> +	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +
>> +	ret = spi_mem_exec_op(nor->spimem, &op);
>> +	if (ret)
>> +		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
>>   *                                            (3 or 4-byte) by querying status
>> @@ -424,6 +446,13 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
> 
>>  	u8 addr_mode;
>>  	int ret;
>>  
>> +	/*
>> +	 * 4-byte address mode method is not determined by BFPT parse as SEMPER
>> +	 * does not support EX4B(E9h). Assign device-specific method before
>> +	 * spi_nor_set_4byte_addr_mode() is called.
>> +	 */
>> +	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
> 
> not here please, but in the post_bfpt fixup hook.
> addr_mode_nbytes is described in BFPT_DWORD[1], while
> set_4byte_addr_mode in BFPT_DWORD[16], 2 different things.
> 
Noted.

Thanks,
Takahiro

> Cheers,
> ta
> 
>> +
>>  	/*
>>  	 * Read SR1 by RDSR1 and RDAR(3- AND 4-byte addr). Use write enable
>>  	 * that sets bit-1 in SR1.
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
