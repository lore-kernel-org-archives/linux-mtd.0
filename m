Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28834C7EE2E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsCmvT3W5hf+QeJ/emHhi4UEruIQQTokmn9tC0Sc0Kg=; b=nXENt4hnwkAu6c
	ZIoPipuUoFz2HzlmTumfT3JOrq6N56nSCfDcOsk8sGGowfmHgRbX0gAhPYpcUX35vb1f8SYQevuTB
	82XF+vWlnRGSbRZbiebanexRBFSAvcZNm8UteGtY0rLyXYh3NGxC2PVff3qDEuI9FQmMUjTjRgO+o
	0a9vyjx+QOelzDEGqT7FEi6jttvMOenCBkEu22NInRHWlWc+n1IV4zR15Kw1ddsAbH2iXHlvUc4Fp
	tZr9x7xFu0+F9QIbqy5UfU7ZCAvLHpU0NIKDOo8Jz7JQD1frk7RPtBvrKve/HHkNBKtEmCGNWU1ur
	Djn5sDHIQS/R3KpsOrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pAZ-005B7C-1j;
	Wed, 07 Jun 2023 09:09:31 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pAU-005B3l-1z;
	Wed, 07 Jun 2023 09:09:29 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1F11E5FD63;
	Wed,  7 Jun 2023 12:09:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686128964;
	bh=CumwjAyNcOyROazwWORMZqL/SIkAMktzdgFYOvd0NSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=IB7yP8h2qdh0bCixWjI5oZn9LGUy+PRnJS7dRyHwKW3sK/wVCDgbL4nhfYMJQpX3h
	 mC6z2HwjdcEBikV+mwCJs8uRoT+wICXFLt7nhaVhh0RTi4tJA/1UpYw80kh62Uq/zM
	 NX0o4F5zic0eU4W1hYSafCX2wNxIDSEfdcsXjPsa+M0IvBjcFeRewL4nqbbhdwdbZ9
	 YQePE4I43do8UExk4IGbL5m8EzUXc1tybLUKD+K8rofQjy5cxlntWchp1juebuthG2
	 PVwtr1fylnlCslB0pKiGTIF3Rfkzrqmcv1xhRZygsCphdt+knOkioMTPMWDA1PVrpF
	 0s5GtRsO6zSZw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 12:09:23 +0300 (MSK)
Message-ID: <5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
Date: Wed, 7 Jun 2023 12:04:29 +0300
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 04:52:00 #21449589
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_020926_997032_5F8A9C29 
X-CRM114-Status: GOOD (  12.85  )
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



On 07.06.2023 12:08, Krzysztof Kozlowski wrote:
> On 07/06/2023 10:57, Arseniy Krasnov wrote:
>>
>>
>> On 07.06.2023 11:53, Krzysztof Kozlowski wrote:
>>> On 07/06/2023 10:40, Arseniy Krasnov wrote:
>>>> Hello Miquel, 
>>>>
>>>> On 07.06.2023 10:58, Miquel Raynal wrote:
>>>>
>>>>> Hi Arseniy,
>>>>>
>>>>> AVKrasnov@sberdevices.ru wrote on Tue, 6 Jun 2023 22:35:07 +0300:
>>>>>
>>>>>> Add description of 'nand-rb' property. Use "Fixes" because this property
>>>>>> must be supported since the beginning. For this controller 'nand-rb' is
>>>>>> stored in the controller node (not in chip), because it has only single
>>>>>> r/b wire for all chips.
>>>>>
>>>>> Sorry if I mislead you in the first place, but you could definitely
>>>>> have two chips and only one with RB wired. It needs to be defined in
>>>>> the chips.
>>>>
>>>> Ok, so to clarify: is it ok, that in bindings this property will be placed in the
>>>> chip, but in driver, i'm trying to read it from the controller node (thus  in
>>>> dts file it will be also in controller node)?
>>>
>>> No, because how would your DTS pass validation? I understand you did not
>>> test the bindings, but this will improve, right?
>>
>> Ok, i'll follow DTS layout in the driver, "test the bindings" You mean "make dt_binding_check"?
> 
> Yes. They were sent without testing.
> 
> But please also test your DTS with dtbs_check.

Got it!

Thanks, Arseniy

> 
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
