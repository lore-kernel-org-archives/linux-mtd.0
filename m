Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A53C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2l7Vv6pkDgwQXk6spLKwfThK+SPpNiM7HIKodwqBco=; b=Xv0+A8ByPEhQtH
	SWtZJXHjt8XgN6wDPFh3bc9TojYab8kVE1jA2SrCsA9sxP5+XW+h9yoGg2yXQyaDDhUKRqPAFFa8j
	8lS3QnQ3x2HFPnnNGYrrB6irARXQsE3BA25j202LDt6dHTcVnDeaEEYhryPvD8ItRw60V4YYHVeNm
	hutKQy9Eog7MUqW9MiExJJ7+4GgJ0AKFT58BFpqPyYHRydjTrK2y5UQFZIrgacZ0zFVhysvWRa6J6
	y0Dwh74rdOp82MIu6nnMH3+W01IPTrwFmswZBQ8NsQKQhsbgB6D4xfJftjN28btyXZ4JZ/0dFp7sV
	+ggGnXnf8P2JAtWxbFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ovi-0055FG-37;
	Wed, 07 Jun 2023 08:54:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ovf-0055BZ-2C
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 08:54:08 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977c88c9021so665552766b.3
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 01:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686128042; x=1688720042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X96dpBw8S4IY6Gzd4KpRfg7hYofA6lqYbeQBswygWX8=;
        b=Rub0Qx/sbOrUtTriSDzOsFqIWDAXZSm2DLB0RlGmTUNapdv6VM5lxilTBurtQiorNa
         vxKd47kcNmBomEu4Y57Jxuik9LkohylcEJjsxRXyAbQpbf9OzeICl3cUQrQzGN267+71
         dxZ5xN4030LlJtPIm8pI3kQtk5z+ABjbfOjfGRL11DR+jHpe8Nq6/BujsirGk0Rf7ksq
         t6MNLB8Z1pl9AWNn1W+G8AEnX3DLhSWhvEgYC41ccVEaC96qm2RUQ1AknQYkEyNgtVNy
         F1srZXKIbcXJJURehv9/tC6y0dciIv7xVeBVhdQE147nCZ1Pl76eEFyhRzEHkyv+PO6e
         8zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128042; x=1688720042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X96dpBw8S4IY6Gzd4KpRfg7hYofA6lqYbeQBswygWX8=;
        b=P9sfM/yp2N5VqpafJRn8jbA6L0oLpDmmzEUgDac9LRxzm9AlSmmlGnnERcNzXrfnVH
         RS4mB2WTu/DJrKdhw2bjoj/LypSIWcDLgPyCt3CbTA2k++M0hcFxTB/tgRKeBb7nDhi4
         reNhuGOPCbvd35D+gmx+xcCQ+fFFrtK2KaGKeTZ2uIqFTop22T3aUES0VO3x4p+6zzsG
         AkAgCLnzPfsoeTHkH9fNrhjT1YoIFQhwDTHqt2zGg4KYu69NeNYbu2Rk7lsrFn9hrenb
         h5+HepHm1HrhFZSjuOJkNmXjRNvCjvbzf5FbxdQ1u+wwQYaAl/ZXdB+Hs38aBw6d32tX
         8+Eg==
X-Gm-Message-State: AC+VfDzu9bRe3BAC0JB8Q8FxUKlxcVfHHPeQuOcTBcbMY3rCsWQ3EAme
	mreSMxr901x4p3ispQB2sqFJMA==
X-Google-Smtp-Source: ACHHUZ7yX1CFlPtzj5ye82i6EMSyNPrLJX5q2v+anBRmgx/s3kNd1PeNOoPKK0AdUrHHxO7MOx8/ZA==
X-Received: by 2002:a17:907:3da9:b0:973:f321:36a6 with SMTP id he41-20020a1709073da900b00973f32136a6mr4765561ejc.31.1686128042291;
        Wed, 07 Jun 2023 01:54:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i5-20020a170906850500b0097886843f75sm328645ejx.177.2023.06.07.01.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:54:01 -0700 (PDT)
Message-ID: <08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
Date: Wed, 7 Jun 2023 10:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
 <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_015407_716940_2333DBE2 
X-CRM114-Status: GOOD (  16.43  )
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

On 07/06/2023 10:40, Arseniy Krasnov wrote:
> Hello Miquel, 
> 
> On 07.06.2023 10:58, Miquel Raynal wrote:
> 
>> Hi Arseniy,
>>
>> AVKrasnov@sberdevices.ru wrote on Tue, 6 Jun 2023 22:35:07 +0300:
>>
>>> Add description of 'nand-rb' property. Use "Fixes" because this property
>>> must be supported since the beginning. For this controller 'nand-rb' is
>>> stored in the controller node (not in chip), because it has only single
>>> r/b wire for all chips.
>>
>> Sorry if I mislead you in the first place, but you could definitely
>> have two chips and only one with RB wired. It needs to be defined in
>> the chips.
> 
> Ok, so to clarify: is it ok, that in bindings this property will be placed in the
> chip, but in driver, i'm trying to read it from the controller node (thus  in
> dts file it will be also in controller node)?

No, because how would your DTS pass validation? I understand you did not
test the bindings, but this will improve, right?

> Because in driver there is no sense
> to store this value in chip structure. 

Driver does not shape the DTS. Hardware does.



Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
