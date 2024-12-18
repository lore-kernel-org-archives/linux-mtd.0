Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E13E77183
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBwymu+t214vAuCgsuZpD2R8Y3EfIEvaX4gxxd/isCw=; b=uufOXv2w8yIQNO
	9hxuQrPrtaNiCTykdMO9H1XKrycQt5AAmo+poKx+zPYuCTmgLiWZ7gk4fK+o9Z1MV1T13NiNd4+7R
	Gm+fdielpEJfGxGPHFOP2A5/tf3vt4JaIz3Tp75VXFmU69mjXaxF2DEa8CxvLwqwH1xVtn8tm1ow3
	MLboIiWWupmBWkw+dv+oyH8AbwI2b/2wuyTRqG9AAxlW34Fq2ncTDzHAl0Z36KKzje2VcfeDayQo+
	WmUUHiSiW1nIkRN205kNgKoo8UvA/5MHAqkSlMbN3rzM4HJLK/xMwKncmNO2IwFH3G1C5adOBxAgz
	GoQwnvNB85d9IrzHSrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpCe-0000000FuQB-18QT;
	Wed, 18 Dec 2024 08:14:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpCb-0000000FuPn-20S0
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 08:14:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so8174306a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 00:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734509680; x=1735114480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLshIda1SzJ3vEMtXnstyNooyVa33Af0YFLEb1I/GJY=;
        b=Q31AlB5P/uoB5g7gWN0oRXxDZHHNV4JLE9PkyhKTdisMkbfLj9FkPXTS/VZRYkK1d6
         CrUCfECUgSrBkkRy4M85e6o5KqYlZcNFM3QBQrsKBEmO3bdjxdXk8ss3kTSNXfkNx60R
         Hc3t7kAwshYTltq6SqXeZC9nKGO2g2mXLy5U6g/3A4ad44ietklfCLp4xQFVIh3YL35q
         M1XJCBNG1q0++JHQt1wWJXvX/XWadRcdiGhWyPSB1z4HdAamL+1cV1fTEL3IKW6R9EDv
         gQil7ISkBnYwwTVLPU8o86E2MXMhuHcBd4tEerzel2I4FIFwAth81uB1cvZKFHVsSLlr
         CPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734509680; x=1735114480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLshIda1SzJ3vEMtXnstyNooyVa33Af0YFLEb1I/GJY=;
        b=fSI7IaeVBwluN+oMa2V0FO2ZnyIoT9WOuaGafS/2hqHvGM1srEEW3GdL+HL4kwEBqN
         0TsFi0B6qUq0ZFa86AG4QT3SeqDWO291zIeYMqk5FgLIrmrtsomaAlrRPkN5mwn2xLCn
         UaPfe090ToH82ylBm4u3ezMakTb5V9c8rLwuT+wb9cN700AGn0SGIZ2XyHtbvAe3TatA
         BqIXcTadUVDyJFca6+woiweVK47utttAqEkJqph/WDGeRpU/j59u7U9Bgvsjux+K0uiC
         HCfpBX6CSaWmUUyN0GIYy20+MZLgKHrdiFcMn2T+V7vSnKIIHO8Leg6me8Nutw632jPV
         FOLA==
X-Forwarded-Encrypted: i=1; AJvYcCUxrG1NV9Zb7cb9NhbI0Q4u8e8iTvHHqD0oAJQx3N5fUKZIacWLNhjeKBVQNGz3negmdNT36R0T3eI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Ii2/QPLGcLm5dlLjAy5jC4J6CDIYowjVvpyK3CDOix9/f+6L
	jgkWZgt1SDDWz6FP+je9KapIxe4+dRhP8vBLwSFsY9mHO1rjhJtl+GU0hRjXBCo=
X-Gm-Gg: ASbGncvU/TJVgYbzn/dTj1n2CTO0Jn+tmAYD6IKQ+oiwMywpq/xTIxA1SISSMLpMIUq
	9rjQR9LKEXBpHZBtGd7wzREnr0CQQWfbPpeOp3Q6LbD1OLuCxH2GLH8yHpIy7r/SOVGCzra1Ler
	zYvqm0FMKM8w/d0Ah0Eyx/5F70Qedc0PEeXkh+y1ehKEbaKvadSE6QlhPgA9r3zjYA7T74tE/i5
	U46OW/0JUcT4EEB93eRlKWSropXuUMRmdSwjcPSMey6abDf/7ujfwNnAERHxsg6
X-Google-Smtp-Source: AGHT+IHhxI1Zr2mYA29SpEH95vNXNub6qcj7eCX6FH7pRb6bOEwBLTqGGOoN5lOsuLYigCMF4VpDpQ==
X-Received: by 2002:a05:6402:3814:b0:5d3:ff93:f5f9 with SMTP id 4fb4d7f45d1cf-5d7ee3b6194mr4832155a12.20.1734509679654;
        Wed, 18 Dec 2024 00:14:39 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960071edsm535623766b.27.2024.12.18.00.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 00:14:39 -0800 (PST)
Message-ID: <e2fcc787-8fb3-4023-af76-c0db3f4b40d6@linaro.org>
Date: Wed, 18 Dec 2024 08:14:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] mtd: spinand: winbond: Add comment about naming
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-24-miquel.raynal@bootlin.com>
 <71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org>
 <87wmg3kbxa.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87wmg3kbxa.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_001441_534242_6F341430 
X-CRM114-Status: GOOD (  19.63  )
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



On 12/13/24 12:25 PM, Miquel Raynal wrote:
> On 11/11/2024 at 14:38:53 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/25/24 5:15 PM, Miquel Raynal wrote:
>>> Make the link between the core macros and the datasheet.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  drivers/mtd/nand/spi/winbond.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
>>> index 686e872fe0ff..9e2562805d23 100644
>>> --- a/drivers/mtd/nand/spi/winbond.c
>>> +++ b/drivers/mtd/nand/spi/winbond.c
>>> @@ -18,6 +18,11 @@
>>>  
>>>  #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
>>>  
>>> +/*
>>> + * "X2" in the core is equivalent to "dual output" in the datasheets,
>>> + * "X4" in the core is equivalent to "quad output" in the datasheets.
>>> + */
>>
>> doesn't help great for an outsider like me. Is quad referring to cmd,
>> addr or data? Or maybe of all? I need to read the code anyway.
> 
> I also don't like these terms. IIRC "output" is referring to the data cycles,
> otherwise it means address (dummy) and data cycles.
> 
> In single, dual or quad mode the naming is unclear but "okay". But octal
> DDR modes can require the opcode to be sent in octal mode as well, which
> is new. If we support that, I'll take care of using a more
> understandable naming for all macros like Xy-Xy-Xy, X being the
> buswidth, y being S (sdr) or D (ddr) and the three members being

8d-8d-8d is common and covered by few standards, yes.

> Command-Address-Data. I might even be tempted to include dummy cycles as
> well, because it is important to be clear if eg. in octal mode "1" means
> "1 cycle" or "8 cycles".
I find the info about dummy cycles useful. I wonder if such terminology
is already specified in a standard. If not, maybe we can put the dummy
cycles after the mode, in parenthesis? I would refrain custom terminology.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
