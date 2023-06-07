Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F077C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAbHuUqT/VnIea7PNMgVUXNWKmeoV0eMJIfVkOnH2Iw=; b=Z/u3J4nOFwYzKi
	Str9RPJPC1qKDSQo6mjbX6LRTLVpLT2e2U56bxbulbjgbtU0jM2A748LCiUWgHgtNeGkkfXOzhvSG
	vWoPDwu9X72tY7PqvAkTupkciTfdbdRJbTHDGA3rrNgGB64gEl7GslRseyW+4R8xNyXxDVTq0r0k4
	04+Qa8uW7TAEfIQiEc2g/wxWb3U6g50dPAqM2oUI2u2uSG053LD8RaBqbxxdAqrid03iclomKuVHg
	FlnwTEz9h2Q52+ejX2Bi19lSqCc00h2gIPMndUHY/u4gXlOSjsojgN/AqK4yIdJ8ceY7VQOJmGx57
	BJoJTId2e/aOCJCFr2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6yRb-006vdd-1S;
	Wed, 07 Jun 2023 19:03:43 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6yRT-006vb7-2q;
	Wed, 07 Jun 2023 19:03:40 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 60FB15FD05;
	Wed,  7 Jun 2023 22:03:28 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686164608;
	bh=wt1HwINmc7U0q2LSsk2GPrtGj8yXHDwpkKdceOnG6Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=FIy47jn+U+y0e9M9AW8GTjok9l0tt+7nIHy7lMrSPSp9TGaaWXUfB4RgF5HlvHdk7
	 4AknVxtuGEWWUo78yxdctTIVBcQ+i/Qz43TBhw7QJg0/o6YkUtldpOn2nSOtf8/qak
	 dcZ178suDSV4i5839U/WEXSut14reoOM4Qwm10tziH2vkSZ62GUz2Kp53nkPYX5dwV
	 4Rk82+iW1cKFPaSrhcPUZs2wLd96ysoyWyNvqOX/WPwgIockh6Z0EO21SdB7oJOD/U
	 TYrjKWCbvjgv0aHpXlDHlZA59Ns8DSjCiV2klkyit3UtYczH5YoFTiM8fsCrQ8Jnon
	 2GIUFeLlkeogw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 22:03:26 +0300 (MSK)
Message-ID: <cb316711-7792-a4f6-9491-2529cfd5cba6@sberdevices.ru>
Date: Wed, 7 Jun 2023 21:58:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 0/2] Meson NAND: waiting w/o wired ready/busy pin
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liang Yang
	<liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
 <a1e048aa-ec64-bd0b-aa17-e3e9bdf18090@sberdevices.ru>
 <bd2d1770-9856-d022-5e91-6a2cdc302b73@linaro.org>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <bd2d1770-9856-d022-5e91-6a2cdc302b73@linaro.org>
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
X-CRM114-CacheID: sfid-20230607_120336_640072_EADD48E7 
X-CRM114-Status: GOOD (  14.86  )
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



On 07.06.2023 21:48, Krzysztof Kozlowski wrote:
> On 07/06/2023 17:18, Arseniy Krasnov wrote:
>>
>>
>> On 07.06.2023 17:50, Arseniy Krasnov wrote:
>>> Main thing that this patchset adds is support for waiting for command
>>> completion when there is no wired ready/busy pin. This is implemented
>>> by using Meson specific command which operates without wired pin, but
>>> supports interrupt driven waiting (default way for waiting without
>>> hardware pin is 'nand_soft_waitrdy()' which uses software loop instead
>>> of interrupt). To select which mode to use during driver initialization,
>>> common NAND controller property is used - 'nand-rb'. It is described in
>>> 'nand-controller.yaml'. But for Meson, its description was missed in
>>> 'amlogic,meson-nand.yaml', so this patchset also adds support for it.
>>>
>>> Patch for bindings was tested with dt_binding_check and dtbs_check.
>>>
>>> Arseniy Krasnov (2):
>>>   dt-bindings: nand: meson: Fix 'nand-rb' property
>>>   mtd: rawnand: meson: waiting w/o wired ready/busy pin
>>>
>>>  .../bindings/mtd/amlogic,meson-nand.yaml      |  7 ++
>>>  drivers/mtd/nand/raw/meson_nand.c             | 82 ++++++++++++++++++-
>>>  2 files changed, 85 insertions(+), 4 deletions(-)
>>>
>>
>> Changelog:
>> * Two separate patches:
>>   For bindings: https://lore.kernel.org/linux-mtd/20230606193507.35024-1-AVKrasnov@sberdevices.ru/
>>   For driver: https://lore.kernel.org/linux-mtd/20230607073015.1280085-1-AVKrasnov@sberdevices.ru/
>>   Now fixed/updated and combined to this patchset with v1 version.
>>
>> * In binding patch:
>>   * Invalid type of 'nand-rb' is fixed, it was 'bool', now it is 'uint32 array' as required. Also
>>     new declaration of 'nand-rb' contains several restrictions like number of elements and min/max
>>     value of elements.
>>   * Location of 'nand-rb' is moved from the controller object to the chip object as required.
> 
> Version your patchsets. This is v2, not v1.

Ack, next will be v3

Thanks, Arseniy

> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
