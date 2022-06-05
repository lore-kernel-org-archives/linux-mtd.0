Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B41BC43334
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jun 2022 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Yc46tW+T4DqmQ5iTvc+NbI3j0hXTAfjaA1uGXhp/mQ=; b=yY3ZZL+LzxUNKm
	EsEgoVVcBtdJa+dEJ9Pt0rvWlcVlLQLOrnB56PCb5bQJWXS5WEoZkI+z+4HF2sKkJYeVFRIk2lN91
	wFHGr5zFsE+yLCzOL+BAzbyyjMkin6O8fdObrn0FfAjF79KbrtXS1TNuygHkTt7AAFwWrgS1pOKdg
	1SFPRNf/dElomA4q4d5GmR+zgKtA85Aw58UMGbm6cMoqTOOXWlX258lFuzdsQVV08d35DbWU3qZM9
	Wvn+X/Q9hiCBu0qw3D/j5JL1w+PArHuN4LeN4XSuJjGsy1256TANT37lYC7WNGZENudg1iU1Z53Gb
	nfxPkJr04Gyj8czDcBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxreW-00Eg7E-Ii; Sun, 05 Jun 2022 14:54:52 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxreR-00Eg5x-Ps
	for linux-mtd@lists.infradead.org; Sun, 05 Jun 2022 14:54:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id gl15so10657838ejb.4
        for <linux-mtd@lists.infradead.org>; Sun, 05 Jun 2022 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nr9goO6JCR6ynsOrkzdJyNSIrUg9yZwLsbH12VXCnv0=;
        b=nrithu8KVe+0Ef6h0ePei9GiCMv2WDKM8GSaIfn0Ar6bNX8ASc1AN2K35a49/JrU3Y
         j7k1YP5G4ugVlQjqD7hAuCd2aeuhbtK5rX6bFyzvxtHlkP8M/y5F145phmQbiR4J3Jvl
         R85UOsOC9MPCyuuEjTYVXzl71SqvDMby/ip4U7POqd0Bra5XOdQ20YGXgH53LrsGPh59
         gaeHsgWIzTUjQj+iouDOtdS6cR7/jwTbqvSsWJPR03Wh9u0yKHTDO7v4BwhVD5myoo4K
         i17inQ2rz0Q/j8o8eagXaXgmEB/kFnFtQJ2FfBE+qb1ojXv8ba+1MEVFeWTTPR7YewC8
         d02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nr9goO6JCR6ynsOrkzdJyNSIrUg9yZwLsbH12VXCnv0=;
        b=J4xQlNB+g7+A1V6Y3S5w8bCZ86+WInODUAMz/xd4jUJTfzagM/kxOfW0tMmfyXfR0W
         lx1wvNDkddqMZOneUgV6zzsEueQPSb1N1Wpe5yGRC5fZjIdXVNHM027WuMUJVphJ/lLh
         lPQX3ODLNh1RTHHW8ZqtlusdPF7t4WZv7t679ze/ZRxCFAXstBwDcW6dCiQOLCAOKkLm
         oCc3iGK3+LUFR+pJ/zYDaiJF/EahzlYkYlFTrBBaCqLxjOEGyxUBJEXIsLA+4UcNFT6+
         b+k8sZKJHi7t7W4kZUI4GbPoKeJy7wcuo+1FfdaBSMkIMUuzWUhBDHS8GsOQYpEHoYK9
         BpEA==
X-Gm-Message-State: AOAM530tneHNWRFfyrZicC7UP1FE+h5BTnsKmDNNGF7aLGYhHDm3JNrP
	gBiwCtCUBI6vsIX43tTY6OaNzw==
X-Google-Smtp-Source: ABdhPJzJldMnVHXS3QDl/dM42X4k0XAaCUYXOZ4XIGmGG7wyaMi/VlfLe5nM4rkal6LkB6xfrPpcNQ==
X-Received: by 2002:a17:907:3f9f:b0:6fe:f9e2:9c6a with SMTP id hr31-20020a1709073f9f00b006fef9e29c6amr18158922ejc.479.1654440885697;
        Sun, 05 Jun 2022 07:54:45 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a23-20020aa7cf17000000b0042dc882c823sm7009190edy.70.2022.06.05.07.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 07:54:45 -0700 (PDT)
Message-ID: <34e6715e-795c-3d64-1341-31da9bd27563@linaro.org>
Date: Sun, 5 Jun 2022 16:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
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
 <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
 <20220601182418.okoofgannw6vbcxo@proprietary-killer>
 <b1b87be5-a048-b713-c9f2-84b948aa6718@linaro.org>
 <20220603112227.hmzwy7xxl6ddezqh@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603112227.hmzwy7xxl6ddezqh@proprietary-killer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_075447_921511_81704514 
X-CRM114-Status: GOOD (  14.82  )
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

On 03/06/2022 13:22, Marty E. Plummer wrote:
> On Thu, Jun 02, 2022 at 08:37:43AM +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 20:24, Marty E. Plummer wrote:
>>
>>>>> Either or. Whatever makes the workload easier is what I'm looking for.
>>>>
>>>> Sorry, you need to be more specific. Apply is not a job for you, for the
>>>> patch submitter.
>>>>
>>>> Then you miss here important piece - which is the first patch. DTS goes
>>>> always via separate branch (or even tree) from driver changes. That's
>>>> why bindings are always separate first patches.
>>>>
>>> So, add a 4: arch/arm/boot/dts/soc.dtsi and 5: arch/arm/boot/dts/board.dts
>>> to the above list, or should those be the same patch as well?
>>
>> For me does not matter, sub architecture maintainer might have preference.
>>
> Fair enough. That being said, for the dt-bindings patch, is it
> permissible to include #define CLOCK_FOO 1337 and so on for clocks which
> haven't been wired up in the driver yet? As in, you know they're there,
> and are important enough to model, but you haven't gotten to that point
> yet?

What would be the benefit to include them now? I imagine that if you
plan to add such clocks to the driver in next week or something, and you
need to use them in DTS, then it's fine. If that's not the case,
probably there is little sense in defining them upfront...


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
