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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6300EC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 08:25:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBFE464F33
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBFE464F33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jkQtWmL16W9bewqRt8nWfKDDD9EgabGAuRVlJt88908=; b=m29tVZfE30J3CYfjZ8knY6Q2y
	Cu4d/fHqh32zQ2tfAzWbgWQfzz5q09RWjUAiJQ/yPB8lwuhg61pKS1YDaWHVe7a2/54B7negp67OE
	9ZfQKPhzr8FbnfO1F1Zf0ZD0Q6LR5XtJnbaEChNvuapzUcpuuKHJadlwA/Ag3wIwguaKtCzEq9HAa
	F+y+Qsqho8FEbw/t4Av/xTKlQJbbqK9AwGgmBjS7X0Hb5fsug/VLZ0Xo2onaYMYVrdbPzB85u+SHS
	ZA2ph5hVtuaZoejpD4jzudDRcBPSG4H/DXUL5yPNHBS11CyscuGu8NVktfQ2S80LjjvhJBCCaZ1pV
	n1aiuwjEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMny5-004mAa-26; Thu, 18 Mar 2021 08:25:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMnxX-004lqH-EN
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 08:24:49 +0000
Received: by mail-pg1-x52e.google.com with SMTP id u19so960994pgh.10
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KFXT42obRULVNG0a+C3Hq/ODZ0C8VYDXdQ9aTy3aaew=;
 b=r8ptEUVwF/ffBbd778TuiWEG39AgMcdnIp2Q1f8T0+9X5lMKZQS/ma+ifej6YFU4+G
 Qi600Ca1Or6WTiNcEIXWnN5MI3civGs2OtcfAz32mlBZ6gqgShOoCcOjjXmlnj4meXe/
 piiaZiCafFMfIYA8vO6WMLMx8FBoaOvyMYg27QTmOZECw+K88tqerVHj0AfmpfRq+Abh
 6UyJQfLJdeh0OiWPgWjsgC9xNC2TSyNJUFCIfMMYkbKdCQA1fm9abTQqgkARB0Hm79OQ
 QeuMYehiFzB4HNPGhDObAFN59pGmJFuXEAduuiKQ4ag+d+2hgSjzIKjTkiraAkNHj1o/
 tctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFXT42obRULVNG0a+C3Hq/ODZ0C8VYDXdQ9aTy3aaew=;
 b=V3keC08DVv38Na8jVcmMhD1g5R7fJudMmI33BgDI5Ggug7p0rTMSaEt6CiidUyZ5iM
 tH/OJGB3/c1KroEBhdOHp4uuZXnrtTbD6bzpIXzNlE1OuPq1ZQme5mR5dhSlTeOoTaiA
 s2WblSXBK553Iuzpkb+Zd4aq+Gw57iBrYh3PUiNkUNFE8RrsM6rNbLvX7K31JYV1+8bT
 mBCWyxGdpikj3R7y34R3o54L4BcKs0l+zbSWTf4Zyd1js0hN88E/k/AdUyNTtkpBBb0e
 OvJ1N+ksfjvNbxgfERuHtcrq6OCxyw5fsQFDqd3CelwcACa2SbkvsWMe6U8PAum2ZXed
 k4Gg==
X-Gm-Message-State: AOAM533TziXW8Qvw8uPmi3lxMjvcUH6dXAVkNmEKQ3pJcptkdumdQ867
 Nu5VFtnxWexIJmaHBoTHUIQ=
X-Google-Smtp-Source: ABdhPJzbqWxwEdSthwiOoGuMNGBz924ZjamE9Yz03BW/Sf1wwNoqWHDZQVgupETRXS7J2eFduim6Nw==
X-Received: by 2002:a62:cfc1:0:b029:200:1eed:462 with SMTP id
 b184-20020a62cfc10000b02902001eed0462mr2972008pfg.55.1616055885586; 
 Thu, 18 Mar 2021 01:24:45 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id z8sm1433619pjr.57.2021.03.18.01.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 01:24:45 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] mtd: spi-nor: spansion: Add support for volatile
 QE bit
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <dc9bc04fbfc9c913e37e8200f46ac4773acedce9.1615523176.git.Takahiro.Kuwano@infineon.com>
 <20210315114747.gzqvtikg23mebwmw@ti.com>
 <52310813-415e-69f0-cbe6-c03ed476fc8c@gmail.com>
 <20210318081918.vmex64kcnhc6udla@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <a49e55df-f268-ce8f-b042-1b7e6ea32593@gmail.com>
Date: Thu, 18 Mar 2021 17:24:42 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318081918.vmex64kcnhc6udla@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_082447_717908_43AB1658 
X-CRM114-Status: GOOD (  22.18  )
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

On 3/18/2021 5:19 PM, Pratyush Yadav wrote:
> On 18/03/21 05:00PM, Takahiro Kuwano wrote:
>> On 3/15/2021 8:47 PM, Pratyush Yadav wrote:
>>> On 12/03/21 06:44PM, tkuw584924@gmail.com wrote:
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>
>>>> Some of Spansion/Cypress chips support volatile version of configuration
>>>> registers and it is recommended to update volatile registers in the field
>>>> application due to a risk of the non-volatile registers corruption by
>>>> power interrupt. This patch adds a function to set Quad Enable bit in CFR1
>>>> volatile. The function supports multi-die package parts that require to
>>>> set the Quad Enable bit in each die.
>>>>
>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>> ---
>>>> Changes in v3:
>>>>   - Add multi-die package parts support
>>>>
>>>>  drivers/mtd/spi-nor/spansion.c | 58 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>> index 1bce95cb7896..b5b5df4836c6 100644
>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>> @@ -10,6 +10,8 @@
>>>>  
>>>>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>>>>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>>>> +#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
>>>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>>>>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>>>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
>>>>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
>>>> @@ -121,6 +123,62 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +/**
>>>> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
>>>> + * @nor:	pointer to a 'struct spi_nor'
>>>> + * @reg_dummy:	number of dummy cycles for register read
>>>> + * @die_size:	size of each die to determine the number of dies
>>>> + *
>>>> + * It is recommended to update volatile registers in the field application due
>>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>>> + * also set during Flash power-up. This function supports multi-die package
>>>> + * parts that require to set the Quad Enable bit in each die.
>>>> + *
>>>> + * Return: 0 on success, -errno otherwise.
>>>> + */
>>>> +static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
>>>> +					 u32 die_size)
>>>> +{
>>>> +	int ret;
>>>> +	u32 base, reg_addr;
>>>> +	u8 cfr1v, cfr1v_written;
>>>> +
>>>> +	for (base = 0; base < nor->params->size; base += die_size) {
>>>> +		reg_addr = base + SPINOR_REG_CYPRESS_CFR1V;
>>>> +
>>>> +		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
>>>
>>> I didn't notice it when reviewing the U-Boot series. How does register 
>>> read work here? This will be issued in 1-1-4 mode since the 
>>> nor->read_proto should be set to that protocol. But the flash is still 
>>> in 1-1-1 mode. So the flash will output data on 1 line and the 
>>> controller will read it on 4 lines, giving us a bogus register value. In 
>>> fact I see this with pretty much every quad_enable() hook. What am I 
>>> missing?
>>>
>> The nor->reg_proto is used for register access and it is 1-1-1 at this
>> point.
> 
> Ah, right. Also...
> 
>>
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
>>>> +			continue;
>>>> +
>>>> +		/* Update the Quad Enable bit. */
>>>> +		cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
>>>> +
>>>> +		ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		cfr1v_written = cfr1v;
>>>> +
>>>> +		/* Read back and check it. */
>>>> +		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
>>>> +		if (ret)
>>>> +			return ret;
> 
> ... this would still send data in 1-1-1 even after quad mode being 
> enabled, right? If so,
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
Yes, the Flash works in 1-1-1 for register access even if quad mode
is enabled.

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
