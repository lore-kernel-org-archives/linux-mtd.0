Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC5BC04A95
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6tlg5gVhMcNbBrJblPbaRICn9mWOhYYWfw611oAqcc=; b=CnCmoqjFh+g6Nc
	ghE4ZvALvo4iyqvUCQOfJUmqj0S+nKsz1sTgH8zRSO4PZFMi1o49pgK1Fw0EIgd7Kpv5A1ZhXG8M1
	ZPU453p8+NXIwQSk/jItl3YJsb6NfQ5bZ+7b8hgU5VBxvJxVYWytCKlgNAoE+yp3HyGV/E49cUR7U
	FJYceyR7EHGum9avJpWuXR5+EdU5DtdeHxb5hK/Nx3iUQNOerCCEZ6RVZMw9NBQVPwYU9X9lhlEGY
	MkM2z0OW9GCNOLhlrdrkGgaPRqRFLPIsuYCK7yoEuN8w0bXFB5sM0CR84p3mwWA0I9vV1aDv3TVFb
	GCn4TrVFjVeiI++9Th4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIzW-0059kQ-85; Tue, 25 Oct 2022 12:25:10 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIzS-0059ix-NV
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 12:25:08 +0000
Received: by mail-qt1-x834.google.com with SMTP id g11so7357985qts.1
        for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2022 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRvNij7ZOIekp+J81NtM1ZKFkAXFSj+/+Qrfb79WT7o=;
        b=VoH0weBN/SoMr1M/mpxKzE/2RftN/KUPBJ8bTLo5sMZSu/nxHvLl7ZWGDyHo2+oDKP
         c6xRxDTGFpNlt0rBh8LlaY/GyI0bD2HFEp36CNMnB5RMJ/zu+/RGQSZfFvZLClVHhBVp
         Q1g3R7G9ZiGO6miRfFuFRlFveBd0ZEj7s0p3MKZYKEUZ+f4SKi9iuWrm+pPhe2s7QK+r
         fNjgS4Y9O6y2/ZLF9NVNh+NOaBkw220XrA3kGua/aHE5DS6AIKL0KOR3hWlk92AnayPA
         5Ldq03oCapJszTtAv2P+2GvHNOFMnti8liZFkCjsk3sqtt3p6eFbMjFBGdOFEjL65EbR
         anDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRvNij7ZOIekp+J81NtM1ZKFkAXFSj+/+Qrfb79WT7o=;
        b=OJxSNWq5rbbnTLT23nFi0LaxnCFzAgoR6gNH+UwDnYz8P7IerMG81PFsJKgE+6z3Sr
         2IRUrA1fk1/onNawD4qko+KvS1B7B61jKiZLy6BQrjA2B5Ce5+AtLg+4uKoHR4djsEbx
         j8x7HGvEPZkxM+KOiiaXcf+eT2xPLcbyymz1naaPqbb+6F1d1EFY2TrmaE/KTys3Va78
         IyrN70LqrIZ6bBQe9UQdj8KruPggjZbKDBgwva26t+fwu+tEMRnb7um3CJfRTUTUhx/q
         TO39RWYzP+7ulOaRnybK2/lN0EyWqVPRCTX/RWyOQJmJiI5jMWkwS03vqehJ5HaILmoc
         Xxyw==
X-Gm-Message-State: ACrzQf3NnjNUvFG2/j3z7iUA221Q8F3u03i//W3VCFPCcNlgzBasIeB0
	7QXyv5Wc5wXaIDXsxy+w37BkSg==
X-Google-Smtp-Source: AMsMyM6txyZvLp+XIQgGwi6nnoaZ782KMl4c3wdGT5paqUoILle4KcYW+NMfUd+MT4R3iIbCSz4PIQ==
X-Received: by 2002:a05:622a:647:b0:39c:f902:0 with SMTP id a7-20020a05622a064700b0039cf9020000mr30072243qtb.277.1666700704433;
        Tue, 25 Oct 2022 05:25:04 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id y9-20020a37f609000000b006b8e8c657ccsm1847920qkj.117.2022.10.25.05.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:25:03 -0700 (PDT)
Message-ID: <a980821f-9177-8eb7-ee36-1b1e614d30fc@linaro.org>
Date: Tue, 25 Oct 2022 08:25:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
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
References: <20221025101713.11893-1-vadym.kochan@plvision.eu>
 <20221025101713.11893-2-vadym.kochan@plvision.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025101713.11893-2-vadym.kochan@plvision.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_052506_804041_12B0C7F1 
X-CRM114-Status: GOOD (  21.24  )
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

On 25/10/2022 06:17, Vadym Kochan wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> 
> v4:
>    1) Remove "label" and "partitions" properties

I think you did not read the feedback.


(...)

> +
> +  marvell,system-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Syscon node that handles NAND controller related registers
> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-rb:
> +        minimum: 0
> +        maximum: 1
> +
> +      nand-ecc-strength:
> +        enum: [1, 4, 8]
> +
> +      nand-on-flash-bbt: true
> +
> +      nand-ecc-mode: true
> +
> +      nand-ecc-algo:
> +        description: |
> +          This property is essentially useful when not using hardware ECC.
> +          Howerver, it may be added when using hardware ECC for clarification
> +          but will be ignored by the driver because ECC mode is chosen depending
> +          on the page size and the strength required by the NAND chip.
> +          This value may be overwritten with nand-ecc-strength property.
> +
> +      nand-ecc-step-size:
> +        description: |
> +          Marvell's NAND flash controller does use fixed strength
> +          (1-bit for Hamming, 16-bit for BCH), so the actual step size
> +          will shrink or grow in order to fit the required strength.
> +          Step sizes are not completely random for all and follow certain
> +          patterns described in AN-379, "Marvell SoC NFC ECC".
> +
> +      marvell,nand-keep-config:
> +        description: |
> +          Orders the driver not to take the timings from the core and
> +          leaving them completely untouched. Bootloader timings will then
> +          be used.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      marvell,nand-enable-arbiter:
> +        description: |
> +          To enable the arbiter, all boards blindly used it,
> +          this bit was set by the bootloader for many boards and even if
> +          it is marked reserved in several datasheets, it might be needed to set
> +          it (otherwise it is harmless) so whether or not this property is set,
> +          the bit is selected by the driver.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        deprecated: true
> +
> +    required:
> +      - reg
> +      - nand-rb

I have no clue why you are doing some random changes. Now you dropped
additionalProperties for nand@ about which no one asked you to drop.

No. It *must* be here.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
