Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17134C25B6C
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZaXeDdV6WMwDi+jx5oDJ2hvpr9crhJNS3+lUOWaQA0=; b=vYoif/h3q/CNT7
	mdvII/ndq0HTBtYyUzR3/OiKUfelRoCl7YhRhKnO6m7gC85vs5a5XSGeQJk6JkzSY9GVqpcJXPsOh
	AQTeC8NfcSXmnY2AhsOcqv6SkRSmcZSbC0F4VsRE+jHiZqcaeNJAsrzsgCx/R5aNcQJVwm5aZEQbd
	MrPGY/fN7Pd+yKFX2XgTMDDpQRDogJgn4a6otCBPWNrmpPxO0GG7rzqOw9aAyAu7VDkec0IOz9PaZ
	Jt3rVDXCYuORxdC0qh/XcnWi3UdB6Wyjo6ZDEq6rZJ/LMUJmqvWOE3VqnfS1sSp3gWvddSGvMzBy9
	A/+JuUr/WWyqxK0Twh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP9H-00AtrO-1K;
	Tue, 24 Oct 2023 21:41:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP9E-00Atq9-1N
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 21:41:14 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso7863200e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698183666; x=1698788466; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/l3iCnOIbHxgn209fI6Ue3Dyqs1H9WjYDgBhKPc4nY=;
        b=DVENFaz4tUboAEK+bLhTkDuwwIOxAukcdk6/7cDJ9EWkS5DlnlLuhJJbxkGG5Opa0N
         ITJBnGPuPfhKSWngNJ3H9MpYlQfXKd5b0pnI7BJozInKySsYW0xX4g8aHDkGdzqv/zEG
         9DGnzGjK2JIdiAGTDmZwZ+DhHpUgMpD9s60KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698183666; x=1698788466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/l3iCnOIbHxgn209fI6Ue3Dyqs1H9WjYDgBhKPc4nY=;
        b=vWJ6AqQsaLs9fUwbOgNLuMOr2IyNJP+59cTE54wLxiKbzZxEVZCOkZpECLjSdcv1OO
         ECdK2/7hBfxF3V+Y5afty8Dzu9TnNGonuxiok7A4HvhmtQwQoqE6gohAEi9+hes5sp+Y
         TptODiKCoDqRPCej61yNE59aitm2Q4+6p5VhnxIDjpFd22h321IZJSbKAL5gklP6vNWj
         sOcrbGls1wdKEa65M5lg3uxg/rLITFCYb96VvgFKFG8g5Tz79/ReT6kgbyOOLMTQit2B
         N5jaeQ1p3ItktdVZI0lfSHDV8EqjXQ+WqJYsgwNVJHPpMrGPcoB4yo9ObuVJkoO1SEQu
         DGlQ==
X-Gm-Message-State: AOJu0YxZy0MsSzq2NJrhcP7iAdjqUQ1eniI3wXZQkWvVMpVuWgCysm2V
	MYZN2lBp4Tz3NolA9kq5Mz8h7cAr19MnmumyDqYqCA==
X-Google-Smtp-Source: AGHT+IFScWIum/OTHr5wNhT1S/G7FDAmrtGJXwLdpLF1M/LYqy7vRAiXQHkkcwQgTLFDVP6Hd+bZsDD/O+/8wNKhQNw=
X-Received: by 2002:a05:6512:3a8e:b0:507:a1e5:74fe with SMTP id
 q14-20020a0565123a8e00b00507a1e574femr11574219lfu.54.1698183666243; Tue, 24
 Oct 2023 14:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231009220436.2164245-1-sjg@chromium.org> <20231009220436.2164245-2-sjg@chromium.org>
 <20231024161644.GB3707756-robh@kernel.org>
In-Reply-To: <20231024161644.GB3707756-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 24 Oct 2023 14:40:54 -0700
Message-ID: <CAPnjgZ0G3W0a1T5TMuS_8L+4OwqFU3xXBKPnTs+MDDFBWYP_VA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_144112_469968_D1CF45D2 
X-CRM114-Status: GOOD (  36.25  )
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

Hi Rob,

On Tue, 24 Oct 2023 at 09:16, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 09, 2023 at 04:04:14PM -0600, Simon Glass wrote:
> > Add two compatible for binman entries, as a starting point for the
> > schema.
> >
> > Note that, after discussion on v2, we decided to keep the existing
> > meaning of label so as not to require changes to existing userspace
> > software when moving to use binman nodes to specify the firmware
> > layout.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Correct selection of multiple compatible strings
> >
> > Changes in v3:
> > - Drop fixed-partitions from the example
> > - Use compatible instead of label
> >
> > Changes in v2:
> > - Use plain partition@xxx for the node name
> >
> >  .../mtd/partitions/binman-partition.yaml      | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> > new file mode 100644
> > index 000000000000..35a320359ec1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2023 Google LLC
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/binman-partition.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binman partition
> > +
> > +maintainers:
> > +  - Simon Glass <sjg@chromium.org>
> > +
> > +select: false
>
> So this schema is never used. 'select: false' is only useful if
> something else if referencing the schema.

OK. Is there a user guide to this somewhere? I really don't understand
it very well.

>
> > +
> > +description: |
> > +  This corresponds to a binman 'entry'. It is a single partition which holds
> > +  data of a defined type.
> > +
> > +allOf:
> > +  - $ref: /schemas/mtd/partitions/partition.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: binman,entry     # generic binman entry
>
> 'binman' is not a vendor. You could add it if you think that's useful.
> Probably not with only 1 case...

I think it is best to use this for generic things implemented by
binman, rather than some other project. For example, binman supports a
'fill' region. It also supports sections which are groups of
sub-entries. So we will likely start with half a dozen of these and it
will likely grow: binman,fill, binman,section, binman,files

If we don't use 'binman', what do you suggest?

>
> > +      - items:
> > +          - const: u-boot       # u-boot.bin from U-Boot project
> > +          - const: atf-bl31     # bl31.bin or bl31.elf from TF-A project
>
> Probably should use the new 'tfa' rather than old 'atf'. Is this the
> only binary for TFA? The naming seems inconsistent in that every image
> goes in (or can go in) a bl?? section. Why does TFA have it but u-boot
> doesn't? Perhaps BL?? is orthogonal to defining what is in each
> partition. Perhaps someone more familar with all this than I am can
> comment.

From what I can tell TF-A can produce all sorts of binaries, of which
bl31 is one. U-Boot can also produce lots of binaries, but its naming
is different (u-boot, u-boot-spl, etc.). Bear in mind that U-Boot is
used on ARM, where this terminology is defined, and on x86 (for
example), where it is not.

>
> Once you actually test this, you'll find you are specifying:
>
> compatible = "u-boot", "atf-bl31";

I don't understand that, sorry. I'll send a v5 and see if the problem goes away.

>
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    partitions {
> > +        compatible = "binman";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        partition@100000 {
> > +            compatible = "u-boot";
> > +            reg = <0x100000 0xf00000>;
> > +        };
> > +
> > +        partition@200000 {
> > +            compatible = "atf-bl31";
> > +            reg = <0x200000 0x100000>;
> > +        };
> > +    };
> > --
> > 2.42.0.609.gbb76f46606-goog
> >

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
