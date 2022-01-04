Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A672C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlT2yoZVtVzsf2BCQzFzbQc+IN4YtHYFZcdkzM5isgY=; b=eclU90omj/9TZ3
	U5gRbX+l/q85u4VZBOzhnrW+EDm5jLv0l4HDVLkQrpX8Xj1pVogibxXeXjBaUiUQioN5oWnrJtNgl
	RshUNYTUZQyRQdMZNvYlsyHCq//3WL6QUYia59kXZRgXi/TL+vjurfk25BjUm+LY2M2htkFRr7eQ3
	/XQD+8Cb7chdsBJpBluBz02BUp+nhQSg0ghgfvZucPr2PLzhQrKrWD3EIkVAIDXQercSsRVZwXDal
	oejMyzHuGWV6Me96geO8UN56Wi5PPc81j1Jyx6c9crS1oZUb+bT4x464EaDzmN9r/aW7MYbZJgprs
	pyCtbTp6Kk8sZueQ2qbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4lM1-00BrEH-O1; Tue, 04 Jan 2022 15:04:01 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4lLy-00BrBg-6c; Tue, 04 Jan 2022 15:03:59 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so47072493oti.11; 
 Tue, 04 Jan 2022 07:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=152c0gKjn3E33kOx2gb1j/9J4KVx7ChUyzcnpwaFY8g=;
 b=xQyBjgFaskJ+h54R2KDBmH+JwHSUfguZRNwPbyaV9bt8u3hFTecT+dLg+395kiUtk8
 SD4X6h96Wg56PQFZ9wOqZCvUQoTPor/SNhA/UxveukhbymeCxNdgJBnDND7mbnGh27ZX
 na5kiPCS4fWOUAlUAmXemHT35p02IpeV559AhSEU5ETguHZ4Hvm/45dlKwmZ3pycwoXI
 K4NRDU/1+PCM5p0twycKyqOv9PwMq/5q8paA0cfkBmJLezZafjHcwkSU39Xku0fmJ7bc
 +JE1oFmCSIZ/2LfcnprdZU6luVJtlamoUzbW0lHhiHHycNOsmcwIlHDu+k0heuC9D6Tu
 ppNA==
X-Gm-Message-State: AOAM531UpZ+XayeHS4v4kYct1jGBYKy7lG1KL/zqmBAnJDJN12F+Aqz8
 L7CA9pf72NBpQ9jUc4UCpA==
X-Google-Smtp-Source: ABdhPJxdcEz899N4s9UGrNr72PJ1GZBttIopE5knK3uzd5fzcvNeYcIE9wjDFZ/opk6pASbc7fBNvw==
X-Received: by 2002:a05:6830:24ac:: with SMTP id
 v12mr36249885ots.177.1641308635916; 
 Tue, 04 Jan 2022 07:03:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h1sm7720007oog.26.2022.01.04.07.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 07:03:55 -0800 (PST)
Received: (nullmailer pid 830577 invoked by uid 1000);
 Tue, 04 Jan 2022 15:03:54 -0000
Date: Tue, 4 Jan 2022 09:03:54 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/8] dt-bindings: nvmem: add transformation bindings
Message-ID: <YdRh2lp5Ca08gHtR@robh.at.kernel.org>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-3-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228142549.1275412-3-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_070358_294307_832406A1 
X-CRM114-Status: GOOD (  24.09  )
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

On Tue, Dec 28, 2021 at 03:25:43PM +0100, Michael Walle wrote:
> Just add a simple list of the supported devices which need a nvmem
> transformations.
> 
> Also, since the compatible string is prepended to the actual nvmem
> compatible string, we need to match using "contains" instead of an exact
> match.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../devicetree/bindings/mtd/mtd.yaml          |  7 +--
>  .../bindings/nvmem/nvmem-transformations.yaml | 46 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 376b679cfc70..0291e439b6a6 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -33,9 +33,10 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        enum:
> -          - user-otp
> -          - factory-otp
> +        contains:
> +          enum:
> +            - user-otp
> +            - factory-otp

If the addition is only compatible strings, then I would just add them 
here. Otherwise this needs to be structured a bit differently. More on 
that below.

>  
>      required:
>        - compatible
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> new file mode 100644
> index 000000000000..8c8d85fd6d27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/nvmem-transformations.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVMEM transformations Device Tree Bindings
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This is a list NVMEM devices which need transformations.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - kontron,sl28-vpd
> +        - const: user-otp
> +      - const: user-otp

This will be applied to any node containing 'user-otp'. You need a 
custom 'select' to avoid that.

> +
> +required:
> +  - compatible
> +
> +additionalProperties: true

True is only allowed for common schema intended to be included (i.e. a 
$ref) by other schemas. IOW, ones that are incomplete on their own. So 
you need to reference mtd.yaml and make this 'unevaluatedProperties: false'.

> +
> +examples:
> +  - |
> +    otp-1 {
> +            compatible = "kontron,sl28-vpd", "user-otp";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            serial@2 {
> +                    reg = <2 15>;
> +            };
> +
> +            base_mac_address: base-mac-address@17 {
> +                    #nvmem-cell-cells = <1>;
> +                    reg = <17 6>;
> +            };
> +    };
> +
> +...
> -- 
> 2.30.2
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
