Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7927DFA3740
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSYqJ0dE6xR9OCxWHk+nEp9MJZoJPD7ZdVtC675kFMU=; b=X7Qs37D5YpMkPC
	Z3yyHr1f4J6Qj+bRq6gxrkQVE17iIxk6V3S7ja0QQOJdrJuRSyQiG8Oficu/5Ehs+M32uKNbHkUo6
	8sIas3bx8Vfll3dRjtFHpwrCgFVxOu5KT9iEka40JGzkIcBFOD71bGXuQnP+GBBdlScrTqlWIrFEf
	KlbGEYORAp3P+1B5YMKiiY9Xnn0C2jG4mTp4krp5/Da8h13d3OmKot1GRxonQQkEwPCEKZWx3RL/O
	R8yexMs+p3s4Dtpcu0WDoovbx1Bw4lSOaS24gcSTeChQJ5HFDCFVQ5v2KcmYAPOcaA3wHnNwGhnQy
	ACoXnD0RxIddj2F+yWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIcv-0056SB-6n; Tue, 25 Oct 2022 12:01:49 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIck-0056P7-Gw
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 12:01:40 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id ml12so7332179qvb.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2022 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irIklGIGYXj1ZpFYPGwzEyqYr11Kn+bOOpv9KU220eg=;
        b=CE1udPBBHzcYvfFbmMXYXr+o9fUb4/nV33iGczLc86DfSioFDQZRE5EcrrF13eWZsB
         WkiyRKk3hckZKmhkBe12jDvJgITqWLlrnk0fUJk8EujMTwxFVFSIl8KvLJ2XfnutIrtK
         Y1mXqgruPwX3yQHF22C2wIK5r5hZpg2gLuM7LQFjZG4ptcLsfuRd259ZtJNyeOczdn8W
         qr+NItXglIYjazPVk3F1MBNOEIqFmiYljVeDedR/DcAg4dipEuU/OniJ55elsXZzit6O
         lLqecKMSswauSicYZUWDxE569FkdhPoGs0JyItBjjC4txkYfRuKBNGrXr6umGz5G0PBi
         IrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irIklGIGYXj1ZpFYPGwzEyqYr11Kn+bOOpv9KU220eg=;
        b=YGPYLetPvWFaHXJqjSRDuZKQKYc05nOI/GcBDY/bRhNo4kjxm6efjgMkvr3SFA+yM4
         lN5V8gAMpFGesVofiVE1zTsoHJfBybt6mtvJYMBVQeQtkweZAQgD8R2W/8QqpJp9CeQR
         9d35ru3sMy3SP6uMUckSGbDNugEKqrt1c/ICa01rfftbyxf1rKR9awnyQ3F1s8x0QB8Z
         tcV+H2UjUoxc1yv8eUVqKy7mZz0rzb06Q3FVVgQdIhwQzRrOCDrKF6IhBHCLArYl/9fk
         y7U8Vh6h0xeIvAfaIgGR3qvBqS/rSUvCr251EzDl2Smo0NVbX/9WbtK7z4kb5cZ30FB3
         2jEQ==
X-Gm-Message-State: ACrzQf2mzQoomkFBpO21iLXLB+VSlmwFNCfggN8LPTiZxhMfrsKzESsL
	Iw9MmjuBaErhK2B2fxht6F2+oQ==
X-Google-Smtp-Source: AMsMyM7ESZdgrvM4rWa6BYvH3NiQ7BTqC8+muJutk2WPeftZ+/+YHRs8dap/XPUFW4052axfxT+Ocg==
X-Received: by 2002:a0c:abc7:0:b0:4b4:8d4e:d2f8 with SMTP id k7-20020a0cabc7000000b004b48d4ed2f8mr31684205qvb.43.1666699286025;
        Tue, 25 Oct 2022 05:01:26 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id g10-20020ac8480a000000b0039cc9d24843sm1494377qtq.66.2022.10.25.05.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:01:25 -0700 (PDT)
Message-ID: <7574f8a0-2509-ab87-4f89-25e8589cbd77@linaro.org>
Date: Tue, 25 Oct 2022 08:01:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Vadym Kochan <vadym.kochan@plvision.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Elad Nachman <enachman@marvell.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <20221024210153.28852-1-vadym.kochan@plvision.eu>
 <20221024210153.28852-2-vadym.kochan@plvision.eu>
 <ae7c86fd-5bc9-4cdb-857c-e686225f5966@linaro.org>
 <VI1P190MB03170C4FC92ED25F78EF57FC95319@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1P190MB03170C4FC92ED25F78EF57FC95319@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_050138_613702_CDA710FB 
X-CRM114-Status: GOOD (  13.09  )
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

On 24/10/2022 20:29, Vadym Kochan wrote:

> [...]
> 
>>> +      nand-ecc-step-size:
>>> +        description: |
>>> +          Marvell's NAND flash controller does use fixed strength
>>> +          (1-bit for Hamming, 16-bit for BCH), so the actual step size
>>> +          will shrink or grow in order to fit the required strength.
>>> +          Step sizes are not completely random for all and follow certain
>>> +          patterns described in AN-379, "Marvell SoC NFC ECC".
>>> +
>>> +      label:
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +
>>> +      partitions:
>>> +        type: object
>>> +        $ref: /schemas/mtd/partitions/partition.yaml
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
>> Thank you.
>>
> 
> I see that I have to drop "label" and "partitions" properties.

Hm.... why?

I commented about missing unevaluatedProperties.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
