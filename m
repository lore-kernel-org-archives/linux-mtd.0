Return-Path: <SRS0=NuEk=IZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE066C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Mar 2021 17:10:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 292776199F
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Mar 2021 17:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 292776199F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pu6G/efaioTmvOsF7ZKesQrRc4uOX0hh3ZR5S+8rfzU=; b=CVO6VPtBLOVxdekA2B6W6A+Xj
	XPt6qHE+rc+7LusRXf0jy3xKEmsa0zNjc2uXsF4OUCokufjap+7CjTbMw9oef4ICVJGJaS56WNQPa
	LfwCwMaq89javBNTiVA4ToWbDNsJYT39PtpqyWUxHnqEK2cqvbwNLi5HfbnnfbainlWgVtlRt+ux+
	9T7/EucXgJBYnWGvlVzMAoRdFdhvum7499CKl1ZdS3n0yrKLhB57uEgGj0cgPxhJcqfNLzdhU6wy4
	C8z/J/qHtEBiAVICRvYy79OTMfla8ZrxE0pvK1xohUsHrLCwxWy2+fIFo+P/JxEwxwY4hTeUEAF1+
	gvf2W8qqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQCRG-005KUq-Ch; Sat, 27 Mar 2021 17:09:30 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQCRC-005KUO-EL
 for linux-mtd@lists.infradead.org; Sat, 27 Mar 2021 17:09:28 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so8250095otq.8
 for <linux-mtd@lists.infradead.org>; Sat, 27 Mar 2021 10:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DLsxAGfchYkbO41PzHGYGbdXOVMJdMlwtMG5pFUqb58=;
 b=WbAcqcz/gF035g/lkoZ3CN7WY+htc7k1VaTPHTPkfxHayomnWMFokLMA4uAgLsaNCD
 pyl70Dsb2r7jVWKKM9/SzReXZzxO8T4IfDtne4VjiN7GfCbhr6R2fg6NoqzkFSNWh9zd
 R9ktgJKuSbvKlTEe/gVy8+dCzHO9o3QT2WrhWsdQqY3Y35z9X5fHtnNjWj3Z3rbfiZ8U
 ecdyA06JLU8DLDGJERDRl7jZb7ITrD3KfwHSN4ctsHZhcJ1jde0GnhtJocdBSbOHhlAd
 Lu6zAoaa8hPMfwx4oe2mD3h9sAcdJMaWNk+gcZoBRrnZFm8L8Wj1+bzCSENHI6G04OHD
 pZ2g==
X-Gm-Message-State: AOAM5322zzslq48/yDgFqhQqA1zW9yri/fFwEGFHKpYSi6OBBGrhqAhV
 SMa3rQHtbE9Cix8pxigXZw==
X-Google-Smtp-Source: ABdhPJwqScajK5wkMqNipsU3p55DSXqNUIRszZRRYrqAWCKJp0nD78s+3JcREu6E7E1wAohXMJzwYA==
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr16847757otu.138.1616864965285; 
 Sat, 27 Mar 2021 10:09:25 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id y31sm1141294ota.16.2021.03.27.10.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:09:24 -0700 (PDT)
Received: (nullmailer pid 255828 invoked by uid 1000);
 Sat, 27 Mar 2021 17:09:20 -0000
Date: Sat, 27 Mar 2021 11:09:20 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [RFC PATCH 3/4] dt-bindings: mtd: add OTP bindings
Message-ID: <20210327170920.GA249312@robh.at.kernel.org>
References: <20210322181949.2805-1-michael@walle.cc>
 <20210322181949.2805-4-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322181949.2805-4-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_170926_600570_A305DCB5 
X-CRM114-Status: GOOD (  18.66  )
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

On Mon, Mar 22, 2021 at 07:19:48PM +0100, Michael Walle wrote:
> Flash devices can have one-time-programmable regions. Add a nvmem
> binding so they can be used as a nvmem provider.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../devicetree/bindings/mtd/mtd.yaml          | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 321259aab0f6..2b852f91a6a9 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,6 +21,25 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +patternProperties:
> +  "^otp(-[0-9]+)?":

Needs '$' on the end.

> +    type: object
> +    $ref: ../nvmem/nvmem.yaml#
> +
> +    description: |
> +      An OTP memory region. Some flashes provide a one-time-programmable
> +      memory whose content can either be programmed by a user or is already
> +      pre-programmed by the factory. Some flashes might provide both.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mtd-user-otp
> +          - mtd-factory-otp
> +
> +    required:
> +      - compatible
> +
>  additionalProperties: true
>  
>  examples:
> @@ -36,4 +55,56 @@ examples:
>          };
>      };
>  
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@0 {
> +            reg = <0>;
> +            compatible = "some,flash";

Soon (in linux-next, but off by default) this will be a warning for 
undocumented compatible string. Use a real device.

> +
> +            otp {
> +                compatible = "mtd-user-otp";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                serial-number@0 {
> +                    reg = <0 16>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@0 {
> +            reg = <0>;
> +            compatible = "some,flash";
> +
> +            otp-1 {
> +                compatible = "mtd-factory-otp";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                electronic-serial-number@0 {
> +                    reg = <0 8>;
> +                };
> +            };
> +
> +            otp-2 {
> +                compatible = "mtd-user-otp";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                mac-address@0 {
> +                    reg = <0 6>;
> +                };
> +            };
> +        };
> +    };

The 2nd example is a superset of the 1st, so drop the first one.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
