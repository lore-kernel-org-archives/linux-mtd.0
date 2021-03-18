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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E3FC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 08:02:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BB364F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 08:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BB364F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xBv3P7nd3lu6HptS1Q1uI5Ha23pz7NoQrokrHQi2emk=; b=LccLVamp6EnHapeUz0yO/EYT+
	j6bMXdAaFJFTLUhnw+pV4yKRB7qw6nim9wzUuqbSMUKmqkJC9Vwtoq22OlykzuMEv3zpW1rECdIZw
	7S5tH8EFCvRFzc9aTypexBTpCvgnSVBGFxVnITpjS1xiR8FfF+fog4ilFJBZR4/OfUM3PIKL8vkxK
	iW7PjLIRXdhdLh2rrb0fwk5cShVCIEvUZfaZguswGytqubrCiQXLPqw1e1zwFWsec4XOepRqMXkkR
	Pdw4spk/he8Df6bGDSI43JyuXDXjw0XdccNbASRYSrowGPAZMQmBVXK0Pl4BTewS5yzCu3GI1HaFk
	BfaTVt9Qg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMnau-004iQX-QQ; Thu, 18 Mar 2021 08:01:24 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMnaG-004iJU-Tx
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 08:00:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id e33so923727pgm.13
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PA3ICCol8UzVqkC1KhAMZYDEk+gpz4kI0EeZZq3FHO0=;
 b=goSf7UTHEDJMI6Zc7Ea6vw+EyauEXReyKLvAU3/xX0rJDEYEDvm0VuGkNWsPfhTIn9
 knelKle9kcmoKXdCoGdgKRvPwSvAew2byBMSl3cNK/FYe64Iv/drvJ2ndhrykWYNXbI2
 IGa6sLUZf/1hTKsvT85XNooYfH0Z9eaGOPX+qN78YveUZstN1UbVkDfHgx2ZCMVWwTF2
 NDa7tqe8pK7WmEb4WJ9rlEJHhDpaSg/+KxnHo4dheEspeGur2jvya39OKcREOcdHAJdT
 NiU9L8CWmpZVOplZn+JxjsL19rjJ6ma/RCQnXRjCqgxQAcjkCOzjiKVvbf1dLwxKk09L
 cmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PA3ICCol8UzVqkC1KhAMZYDEk+gpz4kI0EeZZq3FHO0=;
 b=JaYshhf77lnYOZGcsNmoyafsE71lP5FyWZXsTEDJIA5XloyiSVLdqHyWld+elglaHJ
 vN0M93a7Eb1ciGsTrEqysOiq8M4hg9qGs2mmMRiiu1mfeM32BXiVJMGbWde7iRZDMgv7
 mJHsoVhyZEqvQx4hLGGCHm+bbjoKqsMLnHHFgJbupRZqtiAo/P2NPMVGtKuFXzwKq6F9
 NH//ivAjZn3Mg366tKE4C+gJDiJZLilWPPx/Z/me5Loc507O9sBhyPaTtHKLrN382Ihm
 Hd1sTX2GCdl19s3bSNUTiIFuKDYXl0pHkbR283huWNIoPNF7GWog4nLDRuBjWhsrYnRw
 9Qhw==
X-Gm-Message-State: AOAM531XME2hSe/bUwd6Botsq293Hbkm+u5nk49rpFG4LftGz4oX716z
 CWF0+EEVF8MbdNJD9Wci8IURyvY21im3cg==
X-Google-Smtp-Source: ABdhPJzLNGecqjmLs2Jjh53esMYeYsrl9/23jIETYX5SQzHPwADUS1NLz4amqU2537AJEOf3nPLn3A==
X-Received: by 2002:aa7:91d1:0:b029:1fe:2a02:73b9 with SMTP id
 z17-20020aa791d10000b02901fe2a0273b9mr2972850pfa.2.1616054443395; 
 Thu, 18 Mar 2021 01:00:43 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u66sm1293591pfu.186.2021.03.18.01.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 01:00:43 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] mtd: spi-nor: spansion: Add support for volatile
 QE bit
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <dc9bc04fbfc9c913e37e8200f46ac4773acedce9.1615523176.git.Takahiro.Kuwano@infineon.com>
 <20210315114747.gzqvtikg23mebwmw@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <52310813-415e-69f0-cbe6-c03ed476fc8c@gmail.com>
Date: Thu, 18 Mar 2021 17:00:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315114747.gzqvtikg23mebwmw@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_080045_272257_34BF1EF2 
X-CRM114-Status: GOOD (  27.87  )
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

On 3/15/2021 8:47 PM, Pratyush Yadav wrote:
> On 12/03/21 06:44PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Some of Spansion/Cypress chips support volatile version of configuration
>> registers and it is recommended to update volatile registers in the field
>> application due to a risk of the non-volatile registers corruption by
>> power interrupt. This patch adds a function to set Quad Enable bit in CFR1
>> volatile. The function supports multi-die package parts that require to
>> set the Quad Enable bit in each die.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v3:
>>   - Add multi-die package parts support
>>
>>  drivers/mtd/spi-nor/spansion.c | 58 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 1bce95cb7896..b5b5df4836c6 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -10,6 +10,8 @@
>>  
>>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>> +#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
>>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
>> @@ -121,6 +123,62 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
>> + * @nor:	pointer to a 'struct spi_nor'
>> + * @reg_dummy:	number of dummy cycles for register read
>> + * @die_size:	size of each die to determine the number of dies
>> + *
>> + * It is recommended to update volatile registers in the field application due
>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>> + * also set during Flash power-up. This function supports multi-die package
>> + * parts that require to set the Quad Enable bit in each die.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
>> +					 u32 die_size)
>> +{
>> +	int ret;
>> +	u32 base, reg_addr;
>> +	u8 cfr1v, cfr1v_written;
>> +
>> +	for (base = 0; base < nor->params->size; base += die_size) {
>> +		reg_addr = base + SPINOR_REG_CYPRESS_CFR1V;
>> +
>> +		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
> 
> I didn't notice it when reviewing the U-Boot series. How does register 
> read work here? This will be issued in 1-1-4 mode since the 
> nor->read_proto should be set to that protocol. But the flash is still 
> in 1-1-1 mode. So the flash will output data on 1 line and the 
> controller will read it on 4 lines, giving us a bogus register value. In 
> fact I see this with pretty much every quad_enable() hook. What am I 
> missing?
> 
The nor->reg_proto is used for register access and it is 1-1-1 at this
point.

>> +		if (ret)
>> +			return ret;
>> +
>> +		if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
>> +			continue;
>> +
>> +		/* Update the Quad Enable bit. */
>> +		cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
>> +
>> +		ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
>> +		if (ret)
>> +			return ret;
>> +
>> +		cfr1v_written = cfr1v;
>> +
>> +		/* Read back and check it. */
>> +		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (cfr1v != cfr1v_written) {
>> +			dev_err(nor->dev, "CFR1: Read back test failed\n");
>> +			return -EIO;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 
> Rest of the patch looks good.
> 
>>  /**
>>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:		pointer to a 'struct spi_nor'
>> -- 
>> 2.25.1
>>
> 

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
