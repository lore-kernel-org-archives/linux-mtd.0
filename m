Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4FBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHZWlXQVQ/relArH66m7w0aA5kTbHhs80XHJye51qRo=; b=wqgikO72sRt5tr
	X7O8SCiC4UlSJmeDPZ4NkZO3zuLGdGIL9Xjo3KJtyYIcQPiCapE1WTh0n95DIps8J7Jy8dQCn3pZs
	/pZcDD7pyW6ET44h+tHFP8tV1c7H3zLBldD8pR2ldtdr8AOHPz4uVnPuRbvXAkCUY9DAGt4nccfhO
	WNFUktsKZ/cWt2cp6nNnke4YWo2Iozpj4IUeLFKeGg72GzmOtPdmFouLodO39WwUrPXtoygn8Tlwp
	EQGebsPIM/AgwcnzKB3toi+FirxWCQpz/K9MhrWKZW2T+kgc7MVU4W+2/4ZvGXY1ejTx2s9xoxDoO
	XOIOrgFgGi387L1W7ktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVYU-000PN8-AO; Wed, 01 Jun 2022 21:07:02 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVYR-000PLl-Kl
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 21:07:01 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-f2cd424b9cso4350847fac.7
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2022 14:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1aYbxtI2kFcJW8TF891pB+yFKcjcjCKbFierwXKVFJQ=;
        b=cFzv5zBhFFPKKFFmStTL7Aro4xEGuCHk4/HHWbKSYG0mrPP/hGw2j2kb53s3N3mvZr
         fb1lyvCrDUEan7sAn7gj2FVshDhg+j7i0KhNy9AVyGVtEowsf7T9AH/PHlcKDRQCpfsI
         vW/fWU9mCkM0RUgFBHHEAtT1iqcVbKoo/GB7vA0U9xrlfCgQ0y7EeP89q7y9rsoblVf6
         OWK/Y3YaWBgUKmgTFYWvD8qXTprmLSn0+t6qjs/gt20QBx3lLEUJ7jn8EJ8Z3DkT0lTz
         lqsz9dGBPgevACjjxXAPzkDrgvYwo6CyVAl+MfME1ilzHHRNqw3ludQ3EbE4VsAHD8W0
         I0iA==
X-Gm-Message-State: AOAM533Kd1jiGFcGWlvBdIpdZGVLHffxgJHB9mGCDTfo2hBL2u6pVBvK
	iv3cALnVBop6jh0ZTS0hJQ==
X-Google-Smtp-Source: ABdhPJwraQ5k2e5C8qqSpHN0k6lN1vr8yIKqmcHArZfs6vcu6Kkp/p4ie3BdK7sHr/cGEQ0IZSfAuw==
X-Received: by 2002:a05:6870:6196:b0:e1:e1a2:5c65 with SMTP id a22-20020a056870619600b000e1e1a25c65mr921650oah.190.1654117616097;
        Wed, 01 Jun 2022 14:06:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id oh27-20020a0568702c9b00b000f324b1e645sm1076782oab.22.2022.06.01.14.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 14:06:55 -0700 (PDT)
Received: (nullmailer pid 452850 invoked by uid 1000);
	Wed, 01 Jun 2022 21:06:55 -0000
Date: Wed, 1 Jun 2022 16:06:55 -0500
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partition nodes
Message-ID: <20220601210655.GA380852-robh@kernel.org>
References: <20220518233258.5483-1-ansuelsmth@gmail.com>
 <20220518233258.5483-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518233258.5483-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_140659_725775_090419AA 
X-CRM114-Status: GOOD (  33.88  )
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

On Thu, May 19, 2022 at 01:32:57AM +0200, Ansuel Smith wrote:
> Document new dynamic-partition nodes used to provide an OF node for
> partition registred at runtime by parsers. This is required for nvmem
> system to declare and detect nvmem-cells.
> 
> With these special partitions, the reg / offset is not required.
> The label binding is used to match the partition allocated by the
> parser at runtime and the parser will provide reg and offset of the mtd.
> 
> NVMEM will use the data from the parser and provide the NVMEM cells
> declared in the DTS, "connecting" the dynamic partition with a
> static declaration of cells in them.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../mtd/partitions/dynamic-partition.yaml     | 57 +++++++++++++++++++
>  .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> new file mode 100644
> index 000000000000..f57d7b9cae7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partition.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dynamic Partition
> +
> +description: |
> +  This binding describes a single flash partition that is dynamically allocated
> +  by a dedicated parser that is not a fixed-partition parser.
> +
> +  Each child of the parser partition node is then compared and if a match with
> +  the provided label is found then the OF node is assigned.
> +
> +  These special partition definition can be used to give a dynamic partition
> +  an OF node to declare NVMEM cells. An example is declaring the partition
> +  label and all the NVMEM cells in it. The parser will detect the correct reg
> +  and offset and the NVMEM will register the cells in it based on the data
> +  extracted by the parser.
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +properties:
> +  label:
> +    description: The label / name for the partition assigned by the parser at
> +      runtime. This is needed for sybsystem like NVMEM to define cells and

typo

> +      register with this OF node.
> +
> +required:
> +  - label
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    flash {
> +      partitions {
> +        compatible = "qcom,smem-part";
> +
> +        partition-art {
> +          compatible = "nvmem-cells";
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          label = "0:art";
> +
> +          macaddr_art_0: macaddr@0 {
> +            reg = <0x0 0x6>;
> +          };
> +
> +          macaddr_art_6: macaddr@6 {
> +            reg = <0x6 0x6>;
> +          };

There's a problem with the schema structure for this which is a common 
problem where we have parent and child nodes with parent defined 
properties in the child nodes (label in this case). The issue is that 
there is not a single schema applied to the child node which contains 
all possible properties sub-node names. This is necessary to check for 
extra, undocumented properties using unevaluatedProperties. The creation 
of spi-periphera-props.yaml is an example of how to address this. I 
suspect that all the partition schemas may need similar restructuring.

The nvmem-cells schema may happen to already have 'label', so it happens 
to work (that and unevaluatedProperties is probably missing in places).

Given this schema is really just one property which is already 
documented for 'partition' nodes, all we really need is to say is if 
'reg' is not present, then 'label' is required:

if:
  not:
    required: [ reg ]
then:
  required: [ label ]


> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> index cf3f8c1e035d..b6fa25949fe2 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> @@ -19,6 +19,10 @@ properties:
>    compatible:
>      const: qcom,smem-part
>  
> +patternProperties:
> +  "^partition-[0-9a-z]+$":
> +    $ref: dynamic-partition.yaml#
> +
>  required:
>    - compatible
>  
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
