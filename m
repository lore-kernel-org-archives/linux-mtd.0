Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368FBC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg0Kz+Sc+RNIuPh2Cdd9AQWKrE4WQ9CorzpuqwR7sdk=; b=kkRk9qr068ICBA
	pdORdeyQ97BpVJoh29B/ORhk1qiWY2IWiesIICevB8lgyP1+W2Cc8w8V41hUXzQgOBt2ShUzzclTV
	RkTZwIcXRC/L2fP6SnHiiNKo42sJEOTHOUd1DY4RJrLYUERMsqZwlA1q2N7LQcJnhTSyKFD7ES5Gr
	eXltnm51UWcuTKeOeIHcYYg2hJ1sQYwRhG26ratddL93nw+X+QCUEpe/0aO0+UzYgj8cVo+ZFEFw8
	Q0iuqrCJPO+Uqcvqwl59kO6kx7/OdUUJVJILpnXVrNUEUSE7KMXYbq1Ayc+qAjgD8u3QlUgvlbcUa
	Gn/O6U68yAeGakoms87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Fp8-00GMub-07;
	Wed, 31 May 2023 07:00:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Fp3-00GMrN-1h
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 07:00:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9741a0fd134so323405966b.0
        for <linux-mtd@lists.infradead.org>; Wed, 31 May 2023 00:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685516436; x=1688108436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hg0EUtzmiBB3xghUWgjyE0VeSwIKbDYvDD8loEwycbU=;
        b=xmNDQX5s+SO9QvIEjz7wvotCwDjE1/DWqSM0urOY8Jp6F4rit0SSDrGeXssANQQNd1
         ZXqw8ZNeIcCT3Lxe3+XYTWyVpG9YSRUZFmF8/vjve6PFXaMA/uuouoI2rf92gRZoRpYB
         Rxs29PpDYdoLvtkFXBCUgqxwXVr1bbjXCBr4OfER8lETDdRTGzg6or82BYs0hmgsndj1
         mEoPbYvIg34WTRa6lzkoFJzTPjVWiTjJM9240eBfe89UiHt7i1JaE1jnQeotgBtTNCTS
         ZmebRn88ZkYWj0vWAOssDvhbH8yJ+Slpn32t5ZG0ZaLtzOGGchuTq9NJZt/3DkKyj15C
         Wb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685516436; x=1688108436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg0EUtzmiBB3xghUWgjyE0VeSwIKbDYvDD8loEwycbU=;
        b=C7ck0bt5tpcRVRsyGtoNGipXB0qJypnZ/IcAtXFb9khRcN9V8Fw7I9gyI/vDcCxnQ1
         40pctLTBCHTMv9Q18uPAhmuw9tAbOamdYmsyMwirsOPFdAgzwHk7mGMzR6L6RWmm96qQ
         GMX5Kl7H9hjwxQKAiL4Tnz4xQN7qFcOO4hreL0jbid1uHAI/qSYtHO1yzhZYNejubEIK
         pWSyHIi0tl9uUimA743W+gxTNANiC1bP3chqLn8VHIyWoEGIWo0JK5/QWMFv3SOwbKIe
         Bol6C1ZMVZSD4PHK8H18kvuo73+oKGbD3/evNGl/DgmmUmvFhjz+VVw1u8N3Oyw+EMjL
         pt+Q==
X-Gm-Message-State: AC+VfDzvTlkXTapq7lNlo9R4F+vmmeJK3GJfS0Rgr8PB+MUQUXwIWjGe
	N22gasqTaf8e7rLI9uMMkzvjYQ==
X-Google-Smtp-Source: ACHHUZ6pOdpCN4WUvtvY0dlMQfZ7EoNYd7R0TNUotYT8Qi0DGSq9fNojwn2+H9QyjEJ2gKlV6YxheQ==
X-Received: by 2002:a17:907:72d4:b0:973:fe33:3622 with SMTP id du20-20020a17090772d400b00973fe333622mr5027241ejc.29.1685516436227;
        Wed, 31 May 2023 00:00:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090627c300b0096a1ba4e0d1sm8434832ejc.32.2023.05.31.00.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:00:35 -0700 (PDT)
Message-ID: <579dc9ff-e0a7-e3de-bb2c-a268bfa7fdeb@linaro.org>
Date: Wed, 31 May 2023 09:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "gregory.clement@bootlin.com"
 <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "vadym.kochan@plvision.eu" <vadym.kochan@plvision.eu>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "enachman@marvell.com" <enachman@marvell.com>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
 <a1b2caed-b314-59db-ee00-92fc983150f6@linaro.org>
 <bc538264-20f5-03e1-a4a6-6f9f076f15eb@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bc538264-20f5-03e1-a4a6-6f9f076f15eb@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_000041_562651_846D43CA 
X-CRM114-Status: GOOD (  10.84  )
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

On 31/05/2023 01:20, Chris Packham wrote:
> On 31/05/23 00:24, Krzysztof Kozlowski wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: marvell,armada-8k-nand-controller
>>> +          - const: marvell,armada370-nand-controller
>>> +      - enum:
>>> +          - marvell,armada370-nand-controller
>>> +          - marvell,pxa3xx-nand-controller
>> You miss here deprecated compatibles, which are BTW still used. Don't
>> drop properties and compatibles during conversion.
> Is there any way to indicate that a compatible value is deprecated? I 
> know how to mark a property as deprecated but how do I indicate this for 
> specific compatible values?

The same way. git grep -C 5 compatible. First result in the DT bindings...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
