Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A05C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 20:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqqXDpV+LM1KFJ47bY2ZgkeDhNseFB+KYih6nIPr64M=; b=jR1xSc3ZJHktx7
	SomajV3zjQXfyVnBH+NO44TtpFLI+f6/6q2/4MUTu1t+18my5/mhhm6X7wpT00Je4W7Yyc0AleCfn
	B8ITpXuGY7UXrxDt+0GL0L17DjkMrjKXy/CJS2ME9JvCdH2mr+WVMArzMk5SGxuTrnx23amzU0GEm
	jfPVYRv9sprOLYe7QObz03AwTZxPE4Ew//lTfyb4+igy/+4nERPhwdZe4IUQYJWSmVgMphXOSZ/UA
	Ph1Arw96pyfLCXAE9qJtbt8k0Q1fsae0AQObHuz0qA1tSn4hVpwnBOq6kzxr2Pzwt8o+NQtzC7S5x
	iz1WWjxdNb9y1i9KjvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSPsI-00E1A6-1q; Thu, 10 Mar 2022 20:59:06 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSPsD-00E19d-D4
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 20:59:02 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so4889882otl.12
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2022 12:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KY8vboNBmqrfG0d73imgH39eTc9TfJDXwkAlFPUH9vc=;
 b=MUCvHxWO16UtP0bUkneMXWFe0117kFK9jUnGFF2+OlHuvCfhOW03xGc0TkpHNcm9aV
 2BchK2p0HFKE8JcoSGCCCCcEpZu/kKrq9IRP7qLJrFu23W/dwbRnkYy5rDXpG12ivlyi
 BI+c+Mh9Vnk//Rk/9Y4kgC5WJA7GQDwKzosDLny2rqUuXnvBgl/oHbArpIxSTaS0AIfI
 TGUnldlHGJ3ttJOwGL2IDrNOrv3dD/Wy9D8ZP7PIqNGjv113BLzT2hcke10+GCcvO27t
 mzDI2EUxaRkuH9+GCL2IJZ7RbI3oxb2dDJ3mKxpZYoHAa1gMqvX3mwFuB6emfkcr8Txh
 +yaw==
X-Gm-Message-State: AOAM530V8LMEEfXQGdNNGThTehrytWaHukeO7OJvP/0/+L/7u8TXuRUt
 YYOpAYQFgwY3koRSjKOj7w==
X-Google-Smtp-Source: ABdhPJweLHgVJP/ACLxeR6y+GKz1ica7nyWcDw6WwkEkwllJY8ExbXdnGbaAQa1EOxVBGQr9EAhM2g==
X-Received: by 2002:a9d:2ce:0:b0:5b2:1513:4997 with SMTP id
 72-20020a9d02ce000000b005b215134997mr3460310otl.278.1646945940049; 
 Thu, 10 Mar 2022 12:59:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q189-20020acaf2c6000000b002da32f2035fsm2768709oih.2.2022.03.10.12.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:58:59 -0800 (PST)
Received: (nullmailer pid 2058933 invoked by uid 1000);
 Thu, 10 Mar 2022 20:58:58 -0000
Date: Thu, 10 Mar 2022 14:58:58 -0600
From: Rob Herring <robh@kernel.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 joern@lazybastard.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 frowand.list@gmail.com, krzysztof.kozlowski@canonical.com
Subject: Re: [PATCH 2/4] dt-bindings: reserved-memory: Add phram
Message-ID: <YipmkgOuLZGVqH7S@robh.at.kernel.org>
References: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
 <20220307141549.2732179-3-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307141549.2732179-3-vincent.whitchurch@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_125901_467594_E6FB9A1E 
X-CRM114-Status: GOOD (  19.32  )
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

On Mon, Mar 07, 2022 at 03:15:47PM +0100, Vincent Whitchurch wrote:
> Add bindings to allow MTD/block devices to be created in reserved-memory
> regions using the "phram" driver.

What does 'ph' mean? Please define somewhere for the binding.

> 
> This allows things like partitioning to be specified via the existing
> devicetree bindings.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  .../bindings/reserved-memory/phram.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/phram.yaml b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
> new file mode 100644
> index 000000000000..92e7a80ee87a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/phram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MTD/block device in RAM
> +
> +description: |
> +  Use the reserved memory region as an MTD or block device.
> +
> +  If no-map is not set, cached mappings will be used for the memory region.
> +
> +maintainers:
> +  - Vincent Whitchurch <vincent.whitchurch@axis.com>
> +
> +allOf:
> +  - $ref: "reserved-memory.yaml"
> +  - $ref: "../mtd/mtd.yaml"

/schemas/mtd/mtd.yaml

> +
> +properties:
> +  compatible:
> +    const: phram
> +
> +  reg:
> +    description: region of memory that contains the MTD/block device
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        phram: flash@12340000 {
> +            compatible = "phram";
> +            label = "rootfs";

That's an odd example...

> +            reg = <0x12340000 0x00800000>;
> +        };
> +    };
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
