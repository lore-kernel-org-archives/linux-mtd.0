Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjG9zKTBChuR5rvvhZeKnprLFKu40BZP4rSGxkpzExA=; b=3BZLh2cMNJrX8u
	Dh8KHPin+DgWU+KVdtR+U0KhwLjCDprFk2UnsJ46Iz91xuviy+xSB/v8AgqSwxL86lTi7GPW7nug1
	6YhgZDYPAxaB0OFd/2Jq+P+uAXQLKThcId0rfcXAjw4riWMoyeIQqUk12SbNNOmshL5+ns8TI8Sry
	FTo8nwS6oiWpoxAxD8+QjWW7TTpap4lBa2I11xp2v8o2agpSAEJHCX59QGgsHUaOjYIChH64UAYRK
	zPc2dAS73rNK64Qv694IuYNPmFASsurEpjYwtPo57TPrQFl4J6JtA0gRRImzWIaJztxqKuwhMlu3D
	w4jSwykH9Zb/Fcpn8L8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltwI-006Mka-95; Tue, 03 May 2022 14:55:46 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltw4-006Mgq-Nc
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 14:55:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id n10so16540082ejk.5
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=59t7vn28D3yzCeD/SWs0WQWMWUokBjgyTL8jtIQ/mZ4=;
 b=wyYQAm/yL4YCxQZnJSalcQidq4K2VieDxkJ7UUhCt+AngFV8CNSTl1gULdZ8ouWH3a
 yN39Hd9vLvj5l98q1Q73+qN2XQluRsg/ZIxg1rCCkpBXOfXWyDoUFwsLg7q3raIuPL2M
 CbuHA1N2i4l5BWNS9Ad6NovhugumU5uXoOKIFAIOOY1EFIZgg8FDoLd+XEPJzjAWqaYK
 K+AK+4mF6Ew2tYA6877x1QYSEdUlpH6vE63HrDR9H/9KVh5NaUw3GNrC3ae8TkjeCKFn
 NyJoU946TQfwq1inDJpG7Um3nsvSVO+TVIixUPCsqBUjfbGv/QJbs/E5tk+B2/lsmilw
 X+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=59t7vn28D3yzCeD/SWs0WQWMWUokBjgyTL8jtIQ/mZ4=;
 b=2fND/nEmfayZJ7O/YPOgHubbFzGMPwdo26FOLfjw6DYkVp8PF1+tvb2KwtbT6AEoOp
 WUVppJVH96YUVkZDHZL91G+AF51LPyL+pyR/lQXbLmJN0Lb7EyxszqtvXPzAvdIQrldV
 W87gzYvMrm/lzyYeL95YLOVWL9JFL1pkT3/mEpiXlnkxkmeJ+FOz3DxbqWrrwxKXR0FS
 /DFN/PcCitLPzwg0a6fPUjzY2IwjKAINHn+Iogo1Y9JorXfQZ+t8/f54iyGChBodpSsz
 JCdjmZoCROFU/i/9xMILXEoK1tya3KDRvL7tcirb5rwsgP2+MdAhxZDBFzs6M9FOYYP/
 L7pw==
X-Gm-Message-State: AOAM532UK7vfTBxEJyIpFz0bnxuU1pU5KU7ExeaJCXhLPGPblMLDG8x5
 YAvgLI3sG7FxXOVjXWuj+dVyMQ==
X-Google-Smtp-Source: ABdhPJzrfLJwCJ3gQEW0hRsCRD17fpgu4Gejz8nnGLU7xiWLRfposWniK4q9adqoAsaMHEQW9ESexg==
X-Received: by 2002:a17:907:7209:b0:6da:9781:ae5d with SMTP id
 dr9-20020a170907720900b006da9781ae5dmr15134105ejc.73.1651589725490; 
 Tue, 03 May 2022 07:55:25 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s23-20020a056402037700b0042617ba639bsm7956855edw.37.2022.05.03.07.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 07:55:24 -0700 (PDT)
Message-ID: <75a48dfa-6fc9-aed9-b00e-d928bd9f33af@linaro.org>
Date: Tue, 3 May 2022 16:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 2/2] arm: hisi: enable Hi3521a soc
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
 devicetree@vger.kernel.org, gengdongjiu@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux@armlinux.org.uk, michael@walle.cc,
 miquel.raynal@bootlin.com, mturquette@baylibre.com, novikov@ispras.ru,
 olof@lixom.net, p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
 robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
 sumit.semwal@linaro.org, tudor.ambarus@microchip.com, vigneshr@ti.com,
 xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-3-hanetzer@startmail.com>
 <4cda3645-c4e8-1b3c-bd80-891afd56449a@linaro.org>
 <20220503134459.pplgvhcckja4ivcg@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503134459.pplgvhcckja4ivcg@proprietary-killer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_075532_869114_F63539B0 
X-CRM114-Status: GOOD (  24.28  )
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

On 03/05/2022 15:44, Marty E. Plummer wrote:
> On Tue, May 03, 2022 at 01:47:01PM +0200, Krzysztof Kozlowski wrote:
>> On 01/05/2022 19:34, Marty E. Plummer wrote:
>>> Enable Hisilicon Hi3521A/Hi3520DCV300 SoC. This SoC series includes
>>> hardware mutlimedia codec cores, commonly used in consumer cctv/dvr
>>> security systems and ipcameras. The arm core is a Cortex A7.
>>>
>>> Add hi3521a.dtsi and hi3521a-rs-dm290e.dts for RaySharp CCTV systems,
>>> marketed under the name Samsung SDR-B74301N.
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>>
>>> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile              |   2 +
>>>  arch/arm/boot/dts/hi3521a-rs-dm290e.dts | 134 ++++++++
>>>  arch/arm/boot/dts/hi3521a.dtsi          | 423 ++++++++++++++++++++++++
>>
>> DTSes go to separate patches.
> Do you mean dts and dtsi need to be separate patches?

I mean that any changes to "arch/arm/boot/dts/" have to be separate from
other changes. These can be still one patch. See other examples on
mailing lists.

>>
>>>  arch/arm/mach-hisi/Kconfig              |   9 +
>>>  4 files changed, 568 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/hi3521a-rs-dm290e.dts
>>>  create mode 100644 arch/arm/boot/dts/hi3521a.dtsi
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 7c16f8a2b738..535cef3b14ab 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -242,6 +242,8 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
>>>  	gemini-ssi1328.dtb \
>>>  	gemini-wbd111.dtb \
>>>  	gemini-wbd222.dtb
>>> +dtb-$(CONFIG_ARCH_HI3521A) += \
>>> +	hi3521a-rs-dm290e.dtb
>>>  dtb-$(CONFIG_ARCH_HI3xxx) += \
>>>  	hi3620-hi4511.dtb
>>>  dtb-$(CONFIG_ARCH_HIGHBANK) += \
>>> diff --git a/arch/arm/boot/dts/hi3521a-rs-dm290e.dts b/arch/arm/boot/dts/hi3521a-rs-dm290e.dts
>>> new file mode 100644
>>> index 000000000000..b24fcf2ca85e
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/hi3521a-rs-dm290e.dts
>>> @@ -0,0 +1,134 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Copyright (C) 2017-2022 Marty Plummer <hanetzer@startmail.com>
>>> + */
>>> +
>>> +#include "hi3521a.dtsi"
>>> +
>>> +/ {
>>> +	model = "RaySharp RS-DM-290E DVR Board";
>>> +	compatible = "raysharp,rs-dm-290e", "hisilicon,hi3521a";
>>
>> Please run checkpatch and fix the warnings.
>>
> sunova. I could have sworn I had my editor setup right for whitespace
> and such.

It's not about whitespace but:

WARNING: DT compatible string "raysharp,rs-dm-290e" appears
un-documented -- check ./Documentation/devicetree/bindings/


WARNING: DT compatible string vendor "raysharp" appears un-documented --
check ./Documentation/devicetree/bindings/vendor-prefixes.yaml


(...)

> Ah gotcha.
>>> +	};
>>> +
>>> +	xtal24m: xtal24m {
>>
>> Generic node names, so one of: "clock-0" "clock-xtal24m"
>>
> Will do.
>>> +		compatible = "fixed-clock";
>>> +		#clock-cells = <0>;
>>> +		clock-frequency = <24000000>;
>>
>> This does not look like property of the SoC, so should be defined by boards.
>>
> SoC requires a 24Mhz osc (and a 32khz one as well), so it'll always be
> present regardless.

Sure, but DTS/DTSI describes hardware. If the clock is not in the SoC
but on the board, it should be in the board DTSI. Many times such clocks
are put partially in DTSI and only their specific parts - frequency - in
the board DTS, to indicate that implementation is relevant to the board,
not SoC.

>>> +	};
>>> +
>>> +	clk_3m: clk_3m {
>>
>> No underscores in node names, generic node name (see above).
>>
> early debugging clock, will be removed.
>>> +		compatible = "fixed-clock";
>>> +		#clock-cells = <0>;
>>> +		clock-frequency = <3000000>;
>>
>> This does not look like property of the SoC, so should be defined by boards.

(...)

>>
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		dual_timer0: timer@12000000 {
>>> +			compatible = "arm,sp804", "arm,primecell";
>>> +			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>>
>> A bit weird interrupts... the same?
>>
> Yes, though I am aware that some sp804 timers do have a separate
> interrupts per pair.

They have also separate interrupts, one combined interrupt or one sole
interrupt. However what you described here is one interrupt line
physically connected to two separate pins on the device yet still not
being somehow shared (shared as "combined interrupt"). I don't think it
is your case...



Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
