Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F8CC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhrsrbFxR4usEfC6Vdoh5KTejQsGyhOnnoPWEem4c8U=; b=NpqiwYMT3arZsy
	PjEIbnYCCRdupLzxBt6V+Ii1llIRDU6DpwhtW4Le4H9ZdHF9OoMyDy0nqPSbN0G/wgC3GLOSAps+2
	Hsmb/FH9+5XQSAa7aEgySG3xtDn56PAh3FfCduMraR4MG6UbXUCIMp00lVj8UZQglLeb5/Npmsp22
	B8Mq/qZJU1Ch/G6vEMhAFPC5v7tg7qSC38socxSy6grjp/gaLPv4YlWCimwCWmAnOfKqxoGPX50mS
	UWEGVzup0KGAH+Vq1areFX2JxGaoebBeMjtIwREcg18OuR2SFSh5dspHKlD98kDD03EEGk4EzSOZe
	iyU+ILtVqJuYQ2ruijCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3z5-00000008ClH-4AZR;
	Mon, 04 Mar 2024 08:47:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3z2-00000008CjY-2eKp
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 08:47:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33d153254b7so2639557f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2024 00:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709542059; x=1710146859; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7+9yLwy4g/S76JKcShgQz5nAay8vl7nY3e7zyU60yw=;
        b=QxlObZ3QrBXP3bYiKbpOJ/9GKw3N7qPIMxn4Hs4D+1BaKOojJyJuonxPZrfleZW0lV
         ymKPcQal7ZwA1ttmbIbtqTbTjwgIrgIHWc8konZ3NE4IwZOAZiwTeDStmZ3VJadCvzcN
         m2jsLd2Y9mTLuDb3xNJiY/kwXqI9pm0fU7Gp7pUA6w/fxUblg5s1a9GZl6f6qbiJZASf
         lRWdOuTDIiy68Pa7bUSfiKf109q++nBFsT6HC8IaOIAHA2jTJPB5EbaQmJR9VMfU/xkv
         y2TYqQMvJZoOfKUDXw6JE7wVlLTArTU83/qfUE4wNHDBu1UqOP/6Qfyv5+T9WIGnUdah
         479g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542059; x=1710146859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7+9yLwy4g/S76JKcShgQz5nAay8vl7nY3e7zyU60yw=;
        b=Jdp/xh4uzS/XP2zT4Fe0u8Vwra3lfxWGkrnV6Bru7V0MPiPLMShXOPRfEDHbpgbX3g
         gcd76TOY5TXiEv/5s6tfw2edMAEBtcL4eAOEGgYWRMEr0vQSGFop3VvBjMEAqs9ql7Kx
         EkqZvWPgTZ7MimMgdnNTK0XsEGjbUWTmD3jo3ZfC5UaDzyKPD19yI6CGxYTkJsisakME
         FiO2KAZGDP4z8lj9cgxwWgicy39omDjuaRahPOJimXvrQbd5OmjgPmhZG0fbZzd+e+gA
         PskrD1wQaImAr95M2XIvi6YYA0b5Ve4AWQPW96wgB/zwuETr0EsssXsYQOO8U4ygHa4B
         qjBg==
X-Forwarded-Encrypted: i=1; AJvYcCWWqcTdpyyNNM9a0Y8oBCx10uaYY5Eiitk5eR87xio655pteph2NGzVxmFuRNNXKGAgc5lY0kqawAbembybWdTma+h9tRZVONJhcfKkgA==
X-Gm-Message-State: AOJu0YxPgyH7eHFJQVVRJTLlzgyzniZ9a0ZcVnCxbqevahiHk7hj0UrH
	VSZQkJ6hJ1e2SUKb/mqpvQnGnAiSkR0ABGAG2N1F4tBqINg1SIbLgkeiilmzAmo=
X-Google-Smtp-Source: AGHT+IH397C/IZeyTppuz1TsnzngdBmJHJmF2TTDC7zoptaIQdk9F1BQ2FnixeEQxkY215RjWKRjdg==
X-Received: by 2002:adf:c007:0:b0:33e:2a76:bb90 with SMTP id z7-20020adfc007000000b0033e2a76bb90mr4595757wre.65.1709542058727;
        Mon, 04 Mar 2024 00:47:38 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id v13-20020adfd04d000000b0033d202abf01sm11552763wrh.28.2024.03.04.00.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 00:47:38 -0800 (PST)
Message-ID: <2c2ba7e0-4861-46c7-992e-a201972ffce8@linaro.org>
Date: Mon, 4 Mar 2024 08:47:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
 <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
 <713393d5-13ef-4891-bf7c-d835edacef8a@linaro.org>
 <d6596dd7-4d80-4024-af2b-c4f6c9da1084@collabora.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d6596dd7-4d80-4024-af2b-c4f6c9da1084@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_004740_811620_EE7058B9 
X-CRM114-Status: GOOD (  13.33  )
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



On 3/4/24 08:46, Muhammad Usama Anjum wrote:
> On 3/4/24 12:51 PM, Tudor Ambarus wrote:
>>
>>
>> On 3/1/24 15:04, Michael Walle wrote:
>>> Hi,
>>>
>>> On Fri Mar 1, 2024 at 3:45 PM CET, Muhammad Usama Anjum wrote:
>>>> The i should be signed to find out the end of the loop. Otherwise,
>>>> i >= 0 is always true and loop becomes infinite.
>>>>
>>>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 65b32ea59afc6..46bc45b80883f 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -3373,7 +3373,7 @@ static u32
>>>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>>>  			     const struct spi_nor_erase_type *erase_type)
>>>>  {
>>>> -	u8 i;
>>>> +	s8 i;
>>>
>>> Can we just have an "int" here. So we don't shoot ourselves in the
>>
>> Muhammad, do you care to resubmit using int? Would be better indeed.
> I'm sending a v2 with int.

thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
