Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA089E7D0D6
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 07:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGzFPte2McJL6SQV/AIUTwDOU9905A4r+njQm4rhzOM=; b=am0Tzq7Eopl2Xw
	jJRwgRcezWYtD9uQ0TNqpTBp22orzt6mvgaHBWI5FwSlI9eR8fE7QosZkVeYcyJUuiBXnsZo4uup/
	Tdfsy7XhvS0HbHHQq2O51XFLMTJRx9fCwgotb1acRdSrhhtkrSEo4JkNGSsVDe6ClQl7H5R6K66Zd
	T1nY7H9AAz3Nz/WxejqaXwhf9dhiH/jn1tsVla96SYPQ+4Lf1e6JAKcNJz/n3FV5tviAuFjK3+JQd
	iP+FWUypuw63pcYEb/Xr8rrAquSlnYxUGyB1vm9D5gQ06o0e1xbK6HM8sKo0abF1QnD5zPP2UyWCw
	774LU8gMrzCrIttq2wpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaAw-0087LX-04;
	Fri, 22 Sep 2023 07:02:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaAs-0087KV-0T
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 07:02:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991c786369cso226675866b.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 00:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695366119; x=1695970919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jMuggZZvKYcFUdy/dK+81rshpboXDd4s3uqzGI3A5Y=;
        b=LBE4aOZAPzgQmAlt08O5Wd4zoiQd31yChFy2LQza6oxKNc0L67gtTMWuBL0HlHPZpd
         aYKChW3opkrR1Kqf/vQiczJuXpU6JrX5SmwEYv0rTygu+QnxIjHw3eaFawcQXU6/oBsc
         r1vvmAqmPvHi93dpsoVx3VR+zLUG7I+THIdxc2v0slLzfqhnEhkWFyxhuE02If1vaKvM
         ZBcveGELhgonVFdrRYWZ1JajQpxAuj6IRiMhFwOd5XXU/Xp2NXHNfc41DqBhX04yvJo+
         1F/nvzF8bgYeVa3SNfkYCfQGmqD1lIOYLM+iCgOxAGJJlXmscL0WpvP4+qbDetCHrZKG
         iYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695366119; x=1695970919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jMuggZZvKYcFUdy/dK+81rshpboXDd4s3uqzGI3A5Y=;
        b=XEj1vUlV81ABYOa4f6dSjs8yd6jAsWC8flR/4Qq7Ky9pir2z0Pqu+nnDulJ7xrslzB
         Vbv6BYllYooJ2LuvOK0LQTVwY1+DJOBA5Dxrd34qe6OunmfH1t9GFduGraEvQVn9cve/
         wQkrnVw7AaseUBYFz9Z1eRAEsbG4CqahQPl6mc3wmT+m0axOwqe+Re1L6dzxqgJNHHag
         SQBzbBIf+yqy00raYZ+hSxsADhqLjop/O2nDw6dO+jA6CexRZdNhR8wNHVcwEUY04qKC
         IltEVMxITQZy7rj1KDHLnD9W3Y407Uu0IJq/Fq69GliePVRzMGy/BJD66cbi00TKXVcN
         sm1g==
X-Gm-Message-State: AOJu0Yzp26vyOLk9houGA8BNZSjxTR3bq60GYGJg1YbHxe2cw6/csnYG
	q8fLHuxMaFj8R9ua6K2sZam/XQ==
X-Google-Smtp-Source: AGHT+IG0i7UDbq0G1Fggapv+viejE9QTHLY0IXIcvKnvjvzePXoImlcw3a294mo0jaA03y9ttLUk9Q==
X-Received: by 2002:a17:906:519c:b0:9ae:5be8:ff90 with SMTP id y28-20020a170906519c00b009ae5be8ff90mr3193946ejk.68.1695366119042;
        Fri, 22 Sep 2023 00:01:59 -0700 (PDT)
Received: from [10.41.192.245] ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906681400b0099bd046170fsm2220195ejr.104.2023.09.22.00.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:01:58 -0700 (PDT)
Message-ID: <da77e965-2893-097a-b438-85787c43dcb0@linaro.org>
Date: Fri, 22 Sep 2023 09:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dhruva Gole <d-gole@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_000202_205116_85EEF92B 
X-CRM114-Status: GOOD (  30.36  )
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

On 21/09/2023 20:45, Simon Glass wrote:
> Binman[1] is a tool for creating firmware images. It allows you to
> combine various binaries and place them in an output file.
> 
> Binman uses a DT schema to describe an image, in enough detail that
> it can be automatically built from component parts, disassembled,
> replaced, listed, etc.
> 
> Images are typically stored in flash, which is why this binding is
> targeted at mtd. Previous discussion is at [2] [3].
> 
> [1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
> [2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
> [3] https://www.spinics.net/lists/devicetree/msg626149.html
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  .../bindings/mtd/partitions/binman.yaml       | 50 +++++++++++++++
>  .../bindings/mtd/partitions/binman/entry.yaml | 61 +++++++++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml   |  1 +
>  MAINTAINERS                                   |  5 ++
>  4 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> new file mode 100644
> index 00000000000000..c792d5a37b700a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 Google LLC
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binman firmware layout
> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +
> +description: |
> +  The binman node provides a layout for firmware, used when packaging firmware
> +  from multiple projects. For now it just supports a very simple set of
> +  features, as a starting point for discussion.
> +
> +  Documentation for Binman is available at:
> +
> +  https://u-boot.readthedocs.io/en/latest/develop/package/binman.html
> +
> +  with the current image-description format at:
> +
> +  https://u-boot.readthedocs.io/en/latest/develop/package/binman.html#image-description-format
> +
> +properties:
> +  compatible:
> +    const: u-boot,binman
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware {
> +      binman {
> +        compatible = "u-boot,binman";
> +
> +        u-boot {

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.


> +          size = <0xa0000>;
> +        };
> +
> +        atf-bl31 {
> +          offset = <0x100000>;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
> new file mode 100644
> index 00000000000000..8003eb4f1a994f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 Google LLC
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/binman/entry.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binman entry
> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +
> +description: |
> +  The entry node specifies a single entry in the firmware.
> +
> +  Entries have a specific type, such as "u-boot" or "atf-bl31". If the type
> +  is missing, the name is used as the type.
> +
> +  Note: This definition is intended to be hierarchical, so that entries can
> +  appear in other entries. Schema for that is TBD.
> +
> +properties:
> +  $nodename:
> +    pattern: "^[-a-z]+(-[0-9]+)?$"

Why do you need this?

> +
> +  type:
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Provides the offset of this entry from the start of its parent section.
> +      If this is omitted, Binman will determine this by packing the enclosing
> +      section according to alignment rules, etc.
> +
> +  size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Provides the size of this entry in bytes. If this is omitted, Binman will
> +      use the content size, along with any alignment information, to determine
> +      the size of the entry.
> +


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
