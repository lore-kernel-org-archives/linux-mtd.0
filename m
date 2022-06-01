Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49790C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8VBdFZmBZ5Cn1UoS9vKLbEYfc1Wl4N2Gc8y7/aJNyY=; b=Sl7cV1jauIznmX
	Ot/YK/uU0DEdncknCo0euG24UxZ4E9pJW76eaPjC4LjclC4At0Jp+Gb4jMlEn1f793ba93MQC6+mM
	qCaig2f0Whshv9n9BzIlJ3mV7RVEIEDU/GoSAVFMEQTzrVLD3un/PVquuPRvjgHZCDFL1MdaRGBkH
	Dxa3yc/jDjZ6PXo7jvUSmWzMZtEwiHppShLzT1GQGMovO7iophyPj93peJBt9Wui0a09Ket78NvoE
	lVjuk/7K/8se60o114R4uKY3x8YQPNiTg5x6W2HXoP7tRDoI+TCI+KIoyrm4kAKMf6n6nvEa/fg4H
	Bg4Ky84dn8DWso32rMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMEz-00FX67-M8; Wed, 01 Jun 2022 11:10:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMEI-00FWjp-9q
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 11:09:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id rs12so2951834ejb.13
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2022 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z68BPkHGmXG4mVETeBafciiA8RC/qdrJ/VFB7M66ZuE=;
        b=tqFGCJ4RTJkEK92PVGNoVh28xEJj+O7VYJlTwHo8Ex+LN1g3ttEtaR5yBGgp+NwdQA
         uEvtSphrWBkwxpsJauJj8Vs3u9uyps9R5QwNJVV/TzE/pKPUnm0MzUEg3jXms9hUoNt9
         93AIyMB/GQkj16HIlF+tY/USUtmVIoddsFUkG2eaKksAgyI7+Ugl3bm6YNpoANHHSIrj
         rJ0NCUi/wo0vk24/Nr+lSqphmvn3gGFLzsRph+HKDGaJ2FnLxngiYOpudXgVnNRk3ZqR
         n4dM63Kovfe7kSFz1y25kQe5OjdgjS1jsf2sAMJSRpTFIbTcE4yyHDGX4ZYXOVv4bYn1
         Qy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z68BPkHGmXG4mVETeBafciiA8RC/qdrJ/VFB7M66ZuE=;
        b=xTsWY4LV+iZ3WlspjrLcsYHM0aC2eV2NWaW/XtCaPy6CrZuVRamUvi4QgWlu+qgPx3
         BsDb+FhnwQ6YTaIfhiOYruNDCxRphll8i5lL+qWHbsJINdko5HQA2fNsUb+8G4k2JFPT
         AVwNfj8QMnZPHnI86JEGJinNXx4fII66WoefMXx1SbTaEANKnV/yKXC1t5gEWU5Ongft
         3CxmNxCI4UBMDdAEnpgR7FAWhVAInDKMYm0F0fAHCNyxpKG//Bpsyo5c0rDsb7usd5mp
         rE43PV5I8nzvINy7BJnuweYDPkzCwzzE6ny7SkJl5d5ESWn1mE3lI4Jfjyi9BX5ZdnDp
         1U/g==
X-Gm-Message-State: AOAM533MztQFpQrohON+8bI4oKvMtzD4jwbKA4/WensKCj2w+XpbZtR4
	WIBAKW9sPUULgGg1LuQ/Q520Kw==
X-Google-Smtp-Source: ABdhPJw2asZRW4TmqBmTFmIGcRc+9YuVnLYnMGhIYn+0EBLNBJi0x7ztJ0JcgXHC4UAKHMxJAiE5bQ==
X-Received: by 2002:a17:907:d86:b0:6ff:1557:a080 with SMTP id go6-20020a1709070d8600b006ff1557a080mr30424418ejc.678.1654081770533;
        Wed, 01 Jun 2022 04:09:30 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906081a00b006f39ffe23fdsm627514ejd.0.2022.06.01.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:09:30 -0700 (PDT)
Message-ID: <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
Date: Wed, 1 Jun 2022 13:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
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
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601110616.xmxih663kxgupszv@proprietary-killer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_040934_394048_C3C90097 
X-CRM114-Status: GOOD (  13.63  )
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

On 01/06/2022 13:06, Marty E. Plummer wrote:
> On Wed, Jun 01, 2022 at 01:00:38PM +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 12:58, Marty E. Plummer wrote:
>>> On Tue, May 03, 2022 at 01:37:42PM +0200, Krzysztof Kozlowski wrote:
>>>> On 01/05/2022 19:34, Marty E. Plummer wrote:
>>>>> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
>>>>> generates clock and reset signals used by other module blocks on SoC.
>>>>>
>>>>> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
>>>>> ---
>>>>>  drivers/clk/hisilicon/Kconfig             |   8 ++
>>>>>  drivers/clk/hisilicon/Makefile            |   1 +
>>>>>  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
>>>>>  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
>>>>
>>>> Bindings go to separate patch. Your patchset is unmerge'able.
>>>>
>>> So, assuming I have the following patches:
>>> 1: +include/dt-bindings/clock/hi3521a-clock.h
>>> 2: +drivers/clk/hisilicon/crg-hi3521a.c
>>> 3: +Documentation/devicetree/bindings/whatever
>>>
>>> In what order should they be applied?
>>
>> Applied or sent? The maintainer will apply them in proper order, this is
>> bisectable.
>>
>>
> Either or. Whatever makes the workload easier is what I'm looking for.

Sorry, you need to be more specific. Apply is not a job for you, for the
patch submitter.

Then you miss here important piece - which is the first patch. DTS goes
always via separate branch (or even tree) from driver changes. That's
why bindings are always separate first patches.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
