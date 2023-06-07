Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF2DC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVbHSQRY/HAI01YCyszcFSp6QePwpKxvYwFupofz5zU=; b=X/543xc0ARmtQw
	ErWmrF3uRC2TicVmkH9GY8D+HM6yHfcXk+t/LQgjgB8SNr55hZVVZHK1/XtbK+F+QXwOc+1MCvhMz
	elBXLU+FY+gMJaE08sQ43BtW9s8t34AArTC9L+0hdKGBbyWGzMhtD71aKyZslhn1xMff2LAzpwGyP
	ZlO5Xuv01oNQ8JY+PY+wuzvQivrlohnxRneQuOhH13gDq2ETBnFSV7+kQrw7Yg8G6uaVxP469bh1/
	cS8+sChnKorH8KCve4x5bCFbujuKeoqwTJOtlEWqSHaP+Kb2DpOxs+ApIh8RGxRZ5r+nc9jUmdv4o
	QPLuZeDjaDXcWI2OGGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6yDD-006tM4-36;
	Wed, 07 Jun 2023 18:48:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6yDA-006tKs-1i
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 18:48:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9745c5fed21so1002197966b.3
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 11:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163727; x=1688755727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29OJvOdVP3cfctCNFEvqMHAvC+WSgkcfDomRRbTwfRI=;
        b=BYhKD8aiGexe+ybFIpMSTc4CnPKXfHx/fLqdreaTMszLmfINxfPq7uLgVjn9dAvoW9
         q2MpDREdmsFeEsjcFm/xPOQsQs0HC0zAputzOh7tLtzpFuRomomKCzaWAxYmsl8ZRuTD
         wzROqHF2/kQ2meahTSycbvcstDeMJWWs6b43h4TP7wcge98EpLGLsItbQCSI84peA07d
         URwyMNJ+V8DQjj8ADMthL0Kx7JrFq8v1DJfxB5VRPUVZ44oK9AegHUKUeX1LGhjPvTB7
         dTupgKfU45H0MSBjf+CpiAbiDVnOuf5E2PIqaslWYFwKlrhFQBxxjb12QfM9fVt2VdD3
         aaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163727; x=1688755727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29OJvOdVP3cfctCNFEvqMHAvC+WSgkcfDomRRbTwfRI=;
        b=XfdoqviNl1T9ODTbwEAHGciOUn3YsPSF4YhfYnbBXYvKEs1Pn3dhtyFMxgIC9XuXSn
         tbULFo2XiIe2POCUZzL8js4YwvOsiWF43eBBeDrrQS71/Nb/sjpjTnLSrig2a2eYGVa/
         TnCIo3flME7jD1JyV8EX+wScE/72+Vkcto2tl/fhdQJq2HtoRmgIh/PenyCDuf6mGtx0
         l+l98kXkDJC5RCCTKFvIUD7pkS1FG0wvWcoGJ9sUrTVwZJZdA1ysLYu+p9TtZxDNBLO5
         LuzPkiKwJaFm1d/UlxTZmaSh1cGBvzNM4CQ9bLVMjosu8YrpXGIZ5eTngWMKb55554wC
         HnWg==
X-Gm-Message-State: AC+VfDwfYDbypX8eR7rJfZG0ufNrfo8embzRuJjaIHVYuOjERo1AD9A7
	A//zhgCWpzlcKNcVlulcC7Rbdw==
X-Google-Smtp-Source: ACHHUZ5G2lDFndSHPtYEc/klD3MXZikJ6vTsoEEYPxFBS8uE9R981LfGT7qPfxA27Utx0Uo1dMwYeg==
X-Received: by 2002:a17:907:8a05:b0:96f:9608:da7c with SMTP id sc5-20020a1709078a0500b0096f9608da7cmr7722896ejc.36.1686163726685;
        Wed, 07 Jun 2023 11:48:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m15-20020aa7c2cf000000b00514a97b6b80sm6507254edp.78.2023.06.07.11.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:48:46 -0700 (PDT)
Message-ID: <bd2d1770-9856-d022-5e91-6a2cdc302b73@linaro.org>
Date: Wed, 7 Jun 2023 20:48:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 0/2] Meson NAND: waiting w/o wired ready/busy pin
Content-Language: en-US
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
 <a1e048aa-ec64-bd0b-aa17-e3e9bdf18090@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a1e048aa-ec64-bd0b-aa17-e3e9bdf18090@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_114848_576693_A27E9475 
X-CRM114-Status: GOOD (  17.28  )
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

On 07/06/2023 17:18, Arseniy Krasnov wrote:
> 
> 
> On 07.06.2023 17:50, Arseniy Krasnov wrote:
>> Main thing that this patchset adds is support for waiting for command
>> completion when there is no wired ready/busy pin. This is implemented
>> by using Meson specific command which operates without wired pin, but
>> supports interrupt driven waiting (default way for waiting without
>> hardware pin is 'nand_soft_waitrdy()' which uses software loop instead
>> of interrupt). To select which mode to use during driver initialization,
>> common NAND controller property is used - 'nand-rb'. It is described in
>> 'nand-controller.yaml'. But for Meson, its description was missed in
>> 'amlogic,meson-nand.yaml', so this patchset also adds support for it.
>>
>> Patch for bindings was tested with dt_binding_check and dtbs_check.
>>
>> Arseniy Krasnov (2):
>>   dt-bindings: nand: meson: Fix 'nand-rb' property
>>   mtd: rawnand: meson: waiting w/o wired ready/busy pin
>>
>>  .../bindings/mtd/amlogic,meson-nand.yaml      |  7 ++
>>  drivers/mtd/nand/raw/meson_nand.c             | 82 ++++++++++++++++++-
>>  2 files changed, 85 insertions(+), 4 deletions(-)
>>
> 
> Changelog:
> * Two separate patches:
>   For bindings: https://lore.kernel.org/linux-mtd/20230606193507.35024-1-AVKrasnov@sberdevices.ru/
>   For driver: https://lore.kernel.org/linux-mtd/20230607073015.1280085-1-AVKrasnov@sberdevices.ru/
>   Now fixed/updated and combined to this patchset with v1 version.
> 
> * In binding patch:
>   * Invalid type of 'nand-rb' is fixed, it was 'bool', now it is 'uint32 array' as required. Also
>     new declaration of 'nand-rb' contains several restrictions like number of elements and min/max
>     value of elements.
>   * Location of 'nand-rb' is moved from the controller object to the chip object as required.

Version your patchsets. This is v2, not v1.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
