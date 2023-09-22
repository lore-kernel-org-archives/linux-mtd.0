Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C7E6FE52
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpB2uzwI1ELBuOX9AOY7TMoU29tZB12ynnQi8q0tsSs=; b=XB5JMmnn7qkR0e
	HOBXKVAFmjgqi9BG/9pzIyKyEyY5qq/5Zpfk+dgdeAjxFnqgonk+MTKYHePTeJyXqyHy4UOVc1hpG
	Dr8DwNWCehmb1dfoYqTv0ko8StUf0DF8j63pc1y2Ijk/9PMC92s2uy+DszbmCK5h8FVK2VlqjR5sj
	EtK2ppvJg93tANc6NwgeyOUpYFq0qKMk5AnrBk/Dx0x9Y2DBp25/y22pvzxXzFlXGWOaWvCBUlY+L
	OWSZod7vkDM6K/PUKQLD7bNEgqIkHQBpn6vzwlt0TYYHQtccZh4Artor0cZrsht9Y4K2Vp/I89yhr
	JaDeDDgbZ1I16VgFnPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qji3b-009JQb-2Q;
	Fri, 22 Sep 2023 15:27:03 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qji3Y-009JPK-07
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 15:27:02 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5315b70c50dso2688353a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695396417; x=1696001217; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ehhS94nOYDx67I5UrhN7dvh/Dlk6jqSDrmSSvlfrbig=;
        b=CMrbltuaTtT8e7Yri8dSP9zGMfV4/gNE7A/hF9VhIpqufxj4+vnyilsA3drwx/k8j+
         sgIINpVp/MPkLvcowix1dC/A54btoaW5inQjjK58xot828WI2Bz0CDJ0NQ0N6Ix7M9Zr
         764C92fXh2oaHSANQCjt6NZZbAdwNlMU9tWjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695396417; x=1696001217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehhS94nOYDx67I5UrhN7dvh/Dlk6jqSDrmSSvlfrbig=;
        b=kCTRS/4qKdIxx9ULQ/X4KtnzM/6QNLam1gTibdoZkbDRlyVXdSUrykLPrv6fFIQXEW
         qXFWLT1N+GEHRNLzlBZH16CD4iWWWhcgN5AH4bJ84j9x15nBrTGMLaWvyDlZsFrepJuY
         eAsFUpYz7cZ0pMhCnhhrTioW3FSJSTLhxgqyD1rqVaZf3mzDK4lTwhu2WUUBsgHHVxfK
         zr4nhd0Nzz5/qw3eOzPFhf09z+NKbriT/IgQ3qoG/r1P6DtaTeOVoCu1FgnSt/F/YpYP
         styUneGG6oUabgkRP+tIr+3rDKHqG6LMaAeTxPWlFnLb01o4r59RucKf7+hj29AxnA6w
         tpWg==
X-Gm-Message-State: AOJu0YwroyxMYOGxfW3T/wDhZaAGXs+RlArgUcDNc9Q+eXL0ueNurFc0
	EANlbjT7BaUqE+CyKCGXGnIeE0h1I6iJw4pmM8kH1A==
X-Google-Smtp-Source: AGHT+IFoGrL2e/v7oEth7xaYwVHjp41m5T5R1E9Jh7pwjgOEp/hjouucyihvUHkWO43wehoYyZSTEdxlA2dO6pUlS5M=
X-Received: by 2002:aa7:cd18:0:b0:530:c880:9171 with SMTP id
 b24-20020aa7cd18000000b00530c8809171mr8099822edw.27.1695396416625; Fri, 22
 Sep 2023 08:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <da77e965-2893-097a-b438-85787c43dcb0@linaro.org>
In-Reply-To: <da77e965-2893-097a-b438-85787c43dcb0@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 22 Sep 2023 09:26:38 -0600
Message-ID: <CAPnjgZ2EyWxwCfUi6vHby4tYUfH0Dw6nfC7tOo-g4ahKhTMRjg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_082700_095899_A9F1204F 
X-CRM114-Status: GOOD (  32.66  )
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

Hi Krzysztof,

On Fri, 22 Sept 2023 at 01:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/09/2023 20:45, Simon Glass wrote:
> > Binman[1] is a tool for creating firmware images. It allows you to
> > combine various binaries and place them in an output file.
> >
> > Binman uses a DT schema to describe an image, in enough detail that
> > it can be automatically built from component parts, disassembled,
> > replaced, listed, etc.
> >
> > Images are typically stored in flash, which is why this binding is
> > targeted at mtd. Previous discussion is at [2] [3].
> >
> > [1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
> > [2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
> > [3] https://www.spinics.net/lists/devicetree/msg626149.html
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  .../bindings/mtd/partitions/binman.yaml       | 50 +++++++++++++++
> >  .../bindings/mtd/partitions/binman/entry.yaml | 61 +++++++++++++++++++
> >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> >  MAINTAINERS                                   |  5 ++
> >  4 files changed, 117 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> > new file mode 100644
> > index 00000000000000..c792d5a37b700a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2023 Google LLC
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binman firmware layout
> > +
> > +maintainers:
> > +  - Simon Glass <sjg@chromium.org>
> > +
> > +description: |
> > +  The binman node provides a layout for firmware, used when packaging firmware
> > +  from multiple projects. For now it just supports a very simple set of
> > +  features, as a starting point for discussion.
> > +
> > +  Documentation for Binman is available at:
> > +
> > +  https://u-boot.readthedocs.io/en/latest/develop/package/binman.html
> > +
> > +  with the current image-description format at:
> > +
> > +  https://u-boot.readthedocs.io/en/latest/develop/package/binman.html#image-description-format
> > +
> > +properties:
> > +  compatible:
> > +    const: u-boot,binman
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    firmware {
> > +      binman {
> > +        compatible = "u-boot,binman";
> > +
> > +        u-boot {
>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

Yes this came out of dt-schema and I assumed it was similar. I will rework it.

>
>
> > +          size = <0xa0000>;
> > +        };
> > +
> > +        atf-bl31 {
> > +          offset = <0x100000>;
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
> > new file mode 100644
> > index 00000000000000..8003eb4f1a994f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2023 Google LLC
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/binman/entry.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binman entry
> > +
> > +maintainers:
> > +  - Simon Glass <sjg@chromium.org>
> > +
> > +description: |
> > +  The entry node specifies a single entry in the firmware.
> > +
> > +  Entries have a specific type, such as "u-boot" or "atf-bl31". If the type
> > +  is missing, the name is used as the type.
> > +
> > +  Note: This definition is intended to be hierarchical, so that entries can
> > +  appear in other entries. Schema for that is TBD.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^[-a-z]+(-[0-9]+)?$"
>
> Why do you need this?

It seemed to be needed in dt-schema. I will drop it.
Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
