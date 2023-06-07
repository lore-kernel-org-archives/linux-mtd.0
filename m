Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3BDC7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANW5kGYy7UTWtQw+AaHzvNYARWPa1A4i/cm271Hn+l4=; b=xc/n2kqAsdC40t
	u1ImPLee5GWDtS9ry9slFJ8Mn888Ozt8S4+SZGUqaR7fjPzPU9Js0yF2/o9uznMcyu70VglrLtwQJ
	wCUg39u+ezRZVFX99CAIo2txfvibKZk4+WB4DLgA887a7uLYvgIrKmRcy3WZ3iXWYg+ARk79MYfQ3
	qpoP/5mCRb3z0TSoDDSrJr+sFRYoJV1aZ3+y2nkI9qJWm6o4/ALNZAAMig4nctoeoIpROucLtYRc9
	Zx2vCIQrJuknrVVON4+mw6667tQNovd9+OCv4K2fi9gZ+QUMdgJS0nZZA8Fr8YMZGNpOC+QSzMvyr
	nZrOxwDzn08bGMLvqf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6v3k-006PSQ-0J;
	Wed, 07 Jun 2023 15:26:52 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6v3f-006PPg-1E;
	Wed, 07 Jun 2023 15:26:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 24EB75FD6F;
	Wed,  7 Jun 2023 18:26:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686151605;
	bh=0H1VfG+WwRagxPnCOr1EoEXeHg70Bxoo+8m46PTHcVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=m1ahG5VJKRuSw14B2T7kAr90dKEzHZAC65e2ev+klnDs11HUqGRlHm9tiyumQuqQl
	 YLeyb/ydLYnsaeItX34wx19yyF8q9jfkhUC9tzYSO3/HoFdzleiu6fvRVsKkxhxcpq
	 HDO/ItS7em96e+horSHjnPzKEQJZ0jmQBF7AfUKxSFgDk/Z/pDrvAdVy/HlnGqwDXY
	 Tv/pjwKZBSZlqcMvrYi9k/qkhHv1yjbjjrlrT317WEtPRp4KMsoBaM6IoOy5XiW51w
	 eujmSpxH2HY83DvI6cMrXxLSoro0ZDSfz33gt9A0AkUat9+gEl5PMca0Zz12gfE3sO
	 SXfUkSnGrlyCw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 18:26:44 +0300 (MSK)
Message-ID: <a6d96280-e222-1aaa-4e07-5fc4f0cde866@sberdevices.ru>
Date: Wed, 7 Jun 2023 18:21:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
 <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
 <08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
 <835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
 <2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
 <5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
 <20230607113605.50a992bb@xps-13>
 <6c1973d1-38c0-6048-90ad-da2f60df8238@sberdevices.ru>
 <9105207b-0dfb-346f-422f-984cf3454f90@linaro.org>
 <57ccf7ac-7d94-8a66-7a0e-abfe14f7df2c@sberdevices.ru>
 <88740a95-d7b0-e5d0-62db-65b41c66c5bc@linaro.org>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <88740a95-d7b0-e5d0-62db-65b41c66c5bc@linaro.org>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 13:30:00 #21453197
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_082647_756048_EB769484 
X-CRM114-Status: GOOD (  11.96  )
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



On 07.06.2023 18:07, Krzysztof Kozlowski wrote:
> On 07/06/2023 16:55, Arseniy Krasnov wrote:
>>>>> The bindings and your driver internal representation are two different
>>>>> things. Anyway, as mentioned above, wiring the RB line to one die and
>>>>> not the other would be valid hardware design and would require the rb
>>>>> property to be in the chip node. Please perform a per-chip property read
>>>>> in the driver as well.
>>>>
>>>> Done, I resend both patches (bindings + driver update) as a single patchset. Your review comments
>>>> for driver code were also fixed.
>>>
>>> No, please send new version, not the same. New version means with fixed
>>> comments and with patch changelog.
>>
>> Sorry, Yes, I mean new version, here it is:
>> https://lore.kernel.org/linux-mtd/20230607145026.2899547-1-AVKrasnov@sberdevices.ru/
>>
>> There I fixed bindings and tested it.
> 
> I still see v1 and there is no changelog. So it's the same?

No, v1 is for new patchset from the link above. Both patches (bindings and driver) are updated there.
I attached changelog here as reply for cover letter of the patchset:
https://lore.kernel.org/linux-mtd/a1e048aa-ec64-bd0b-aa17-e3e9bdf18090@sberdevices.ru/

Thanks, Arseniy

> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
