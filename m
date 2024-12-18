Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2123E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6VJ32mD/jhUqrc29ONya/z7YfM1Qv8CB6qRm+IgAfg=; b=kpwc5cp3i9Nrso
	i1S8FmbGos/Pq+9NHAGEWAXynolb5xiW1kSU/LtLzjblc6U5hT76mk7DrjCUuxBuusqykFGKdvILO
	xX+vC0iCbQ9sFVT6mq1bGbptgabusco74jKFEK4auqiHqlGa29ZYJart7VUX2yWAXeq/rlLuWXZvL
	UwaXiE17G6qMCZXQQP3PEvB39tJJHrxY/ci82r30V2HVnUfo3sW4BfCsqndx4a9aB1gAL7MnlSLuQ
	nBpV5+k7PokJgsPxrWGSOAbXrsXQoMytAgBZ9daGDj0I7IRnz/Q5ziWnPr4m6aAgpCT7cKawXrKYQ
	PjYbuEx1i7tmRgzWWPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrDO-0000000GFB8-26eQ;
	Wed, 18 Dec 2024 10:23:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrBm-0000000GEwP-2wxv
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 10:21:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385eed29d17so3174626f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734517317; x=1735122117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJrFuVoxxR4UWWMuZ0HLQsYBjKF3RT/r1rHKTzI8EMk=;
        b=MPgQ8dF2OdNNIjPUCXSzLy67AjwZkXTiAZMSG3HGnyiyQidqU0Zx9Ae2Medxzy2vhN
         TUKjrltdst/mKFGbIdSQVTN0dFUVkm2rwH5zD5AAUHtu+FXnbdnglxptfK2iE4Kc6/k5
         IhDwoZcdg3c/vllUKGGpsSE+wRJRzELjIK/5evsucZ7Xm76LoZj9Afo/ChiU9F/OIAPE
         OEV50Rv9SoluN4fwPIK2ksXk3tOiAtwuP9gtm9UB0ENZ0OJoF1YLThN3ec5umm11HdMa
         1KYR7sxRfDSWB44w7gz0tyVlk7EWTOrJNgDpHGpuIJ6K3PkO42VtDLcj9Lp6UzC764cF
         aCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734517317; x=1735122117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJrFuVoxxR4UWWMuZ0HLQsYBjKF3RT/r1rHKTzI8EMk=;
        b=MjL0VN9rmxL7z+q5SZeXt7yKz4+L5n3EG8kqxGwXcDyP0WmbqkYtYt/6d3t/TkWUg/
         kahcX4anbYMlHffm+tz7eYAk6SrRA9pWEqYrtTuNct+S80XxW+Tb6/MEEgaCQ6AXjj+t
         7aRTqfeuL90hETMmmhCludv6532dCGBH43cXDeWDuDhBXPSrY6XB/1+9NJ/oQ92Y8X/J
         Lbk9fjIOYDnM6qXVgbI1GNtgU4VGomrjsMvCy9IA1KkieOk33DRLVJinnK2VgDVbjHSa
         MSPFpAEGi5Vesr1UPesQlUsOJuJH0wGjnuArwqbxbZq0G0cevBZeWMhNid1cXLBBSRGo
         t9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUD1fnuH6Yv9zRRDe3ARGOeIcyN61/8xsJE4RnknQDMvLSAIzQoaFZqZ0pp9LvhFWtmWZZXiQ06iAU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0OARG8qRX65WEetcm2gIXP8DCfd3G4SyWTVeRcvL6bOW//Nuj
	/8AFqt3Jq/Py3IAWZCEhjZxrEqtGy6XxlpnhjF6gZS/GZylqBsR7QVPOEdiK4mM=
X-Gm-Gg: ASbGncvcF71/YKeq3MtZzjahxRQqRQhs/U8Zps6CgfMtcx0kYhq+lVdBIFfcJjQIOtS
	4VUW0lCSujD05WAVSsA+8wHjmmhiYGGw2pW4/W8gpr6VuVUVvD3E4PWvhJaXq+pqpoMtVyL5A+i
	/7xjjmA+ji794V3V4h2xkFS4y9sWNFDjV/hOdqeg/bYge87vImj48+eyqAiGo7BX+Eck+xvCzmp
	f4DOGKdJD/dsC0M7JrYVQrFHCWlhKKEwomYYi1efcuafd6cvSnSD/apjxgtjz4I
X-Google-Smtp-Source: AGHT+IEeObS6BkwBM7Lew+oHxilbmEwDIMCj+h4CLtgguQuuDz2PWjV1ULyU++iL1sum1joUkK/4rw==
X-Received: by 2002:a5d:6c6d:0:b0:385:e411:c894 with SMTP id ffacd0b85a97d-388e4da50eamr1721095f8f.43.1734517316820;
        Wed, 18 Dec 2024 02:21:56 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012034sm13479845f8f.22.2024.12.18.02.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:21:56 -0800 (PST)
Message-ID: <4ca13ef9-062f-4952-9588-c14f22867bf3@linaro.org>
Date: Wed, 18 Dec 2024 10:21:54 +0000
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
 <e2fcc787-8fb3-4023-af76-c0db3f4b40d6@linaro.org>
 <87pllpe3nl.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87pllpe3nl.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_022158_755913_90A2D2C9 
X-CRM114-Status: GOOD (  19.61  )
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



On 12/18/24 9:33 AM, Miquel Raynal wrote:
> On 18/12/2024 at 08:14:36 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 12/13/24 12:25 PM, Miquel Raynal wrote:
>>> On 11/11/2024 at 14:38:53 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>
>>>> On 10/25/24 5:15 PM, Miquel Raynal wrote:
>>>>> Make the link between the core macros and the datasheet.
>>>>>
>>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>> ---
>>>>>  drivers/mtd/nand/spi/winbond.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
>>>>> index 686e872fe0ff..9e2562805d23 100644
>>>>> --- a/drivers/mtd/nand/spi/winbond.c
>>>>> +++ b/drivers/mtd/nand/spi/winbond.c
>>>>> @@ -18,6 +18,11 @@
>>>>>  
>>>>>  #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
>>>>>  
>>>>> +/*
>>>>> + * "X2" in the core is equivalent to "dual output" in the datasheets,
>>>>> + * "X4" in the core is equivalent to "quad output" in the datasheets.
>>>>> + */
>>>>
>>>> doesn't help great for an outsider like me. Is quad referring to cmd,
>>>> addr or data? Or maybe of all? I need to read the code anyway.
>>>
>>> I also don't like these terms. IIRC "output" is referring to the data cycles,
>>> otherwise it means address (dummy) and data cycles.
>>>
>>> In single, dual or quad mode the naming is unclear but "okay". But octal
>>> DDR modes can require the opcode to be sent in octal mode as well, which
>>> is new. If we support that, I'll take care of using a more
>>> understandable naming for all macros like Xy-Xy-Xy, X being the
>>> buswidth, y being S (sdr) or D (ddr) and the three members being
>>
>> 8d-8d-8d is common and covered by few standards, yes.
>>
>>> Command-Address-Data. I might even be tempted to include dummy cycles as
>>> well, because it is important to be clear if eg. in octal mode "1" means
>>> "1 cycle" or "8 cycles".
>> I find the info about dummy cycles useful. I wonder if such terminology
>> is already specified in a standard. If not, maybe we can put the dummy
>> cycles after the mode, in parenthesis? I would refrain custom terminology.
> 
> I see you concern, but would you mind giving an example of what you have
> in mind?
> 

on a second thought, the number of dummy cycles can vary depending on
frequency, so better to stick just to the
	Xy-Xy-Xy, X = {1,2,4,8}, y = {S, D} terminology.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
