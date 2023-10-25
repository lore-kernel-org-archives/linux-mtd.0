Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8602DC0032E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=St8M3VC3+DCgpwBzBhNfmKTn5O+uhtjJonvMvqF0udo=; b=YwkyBpx0ZhuOs5
	mEijYbTK60RkiGeb45WaFVM+4hTEhKLk8ChnC/WjO/oya/aWqZSXIn+q+SXeH7bliu5msCwKY83tO
	Cd2RrhpqkT3UccyGhjvhWRKwjLkr/lNZHmkxEtl+A92/mis1Vpee1HN4jGzv1irGYMlw5xE1noGb5
	6Oa9Gt6Vf+Cmsr36G3nGh6GiDke32KpQ8sZ99dikTedHgGvNJMoAr3j+lAYJZEGvppmdvHtOcGfMS
	S4iVBvCS/2IgW/ajRPX+f8zyhfa3Rd6R+429Rec1hHC+ZFUnQpu0vyQp4v+vkOdnelQ5bqOW+/WSu
	M38IPI7bKZRo00nwiTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkxs-00D7pX-19;
	Wed, 25 Oct 2023 20:58:56 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkxo-00D7og-2C
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 20:58:54 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c5629fdbf8so2484121fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 13:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698267528; x=1698872328; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5E+y3Sa5hhlUIO0lLz8Lj8Z/SZXQuFdPCCdWtajuYnA=;
        b=PYqYmnWaFwTXGJexmrIP9IrsqHulrD9nZFcTuHibfnoypV7iWHAEowc14kr3ojd0mr
         jZ58bxCA9TMusod/QK7P0OylLYemLmiIxsLsdci/iubkyTkyYTrl1sBSQAbyOk4JS42Y
         IezFrNmdjH9A9r1ckSL/wgqyD0t+w81WuI3js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698267528; x=1698872328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E+y3Sa5hhlUIO0lLz8Lj8Z/SZXQuFdPCCdWtajuYnA=;
        b=QV77BzEKFnCncJ4aeT1X5WFGNmJ9EWm8lC3BOnOpQWgNEAgsXAJXru44DaITl6E+aP
         1K6Aq7SmTXew1h99zgNHb/aPxRx96eZbM7s/+hPbLPj72qtzt6oSk1kvkQQ9l9nt5FnJ
         BkHlwkLOr1QtkCK0SBNtazd/OWDHFCzkmGki4lwd/+yTJdsPPTY2QZPGBhfj7fp6xOYT
         DmTxAPNlrAaVWsROqmm4j7Ti9xrQjThVYoAXGTgqjra2LIVUfwlyNCS8IQo9LyJwuT23
         6+FvjB8wFA8WM5pDF5dyHpRWim2FjK2oya2EnVo1XvleaE1tuePv79PXwy4IPP4J7EY4
         0nfA==
X-Gm-Message-State: AOJu0Yz+YJWmRadaKP8DzJA2MGSqERHdWia56AjYALMzxq467/n1dOnt
	KSpdPU9ILZXv/EIZnCQnUlWZUvaA+m0YTvRFBvkGgA==
X-Google-Smtp-Source: AGHT+IFIpzj33tVTxfmSbifouoWpSglC2W9rs1RwuI9tQBH2J4n3lYoTMUopFM/zLfxYuDpMHPxKVmRlPbKDytQm8m4=
X-Received: by 2002:a2e:3018:0:b0:2c5:1623:66b8 with SMTP id
 w24-20020a2e3018000000b002c5162366b8mr11230277ljw.12.1698267528156; Wed, 25
 Oct 2023 13:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231009220436.2164245-1-sjg@chromium.org> <20231009220436.2164245-2-sjg@chromium.org>
 <20231024161644.GB3707756-robh@kernel.org> <CAPnjgZ0G3W0a1T5TMuS_8L+4OwqFU3xXBKPnTs+MDDFBWYP_VA@mail.gmail.com>
 <20231025101126.2234a74c@xps-13>
In-Reply-To: <20231025101126.2234a74c@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 25 Oct 2023 20:58:36 +0000
Message-ID: <CAPnjgZ0GH-06xA3ij2ZBV_zDwPKa3m=wpHrsj8oKNS=8S0FvHA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_135852_763579_B3F1DB83 
X-CRM114-Status: GOOD (  65.44  )
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

Hi Miquel,

On Wed, 25 Oct 2023 at 08:11, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Simon,
>
> sjg@chromium.org wrote on Tue, 24 Oct 2023 14:40:54 -0700:
>
> > Hi Rob,
> >
> > On Tue, 24 Oct 2023 at 09:16, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Oct 09, 2023 at 04:04:14PM -0600, Simon Glass wrote:
> > > > Add two compatible for binman entries, as a starting point for the
> > > > schema.
> > > >
> > > > Note that, after discussion on v2, we decided to keep the existing
> > > > meaning of label so as not to require changes to existing userspace
> > > > software when moving to use binman nodes to specify the firmware
> > > > layout.
> > > >
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - Correct selection of multiple compatible strings
> > > >
> > > > Changes in v3:
> > > > - Drop fixed-partitions from the example
> > > > - Use compatible instead of label
> > > >
> > > > Changes in v2:
> > > > - Use plain partition@xxx for the node name
> > > >
> > > >  .../mtd/partitions/binman-partition.yaml      | 49 +++++++++++++++++++
> > > >  1 file changed, 49 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> > > > new file mode 100644
> > > > index 000000000000..35a320359ec1
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> > > > @@ -0,0 +1,49 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +# Copyright 2023 Google LLC
> > > > +
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mtd/partitions/binman-partition.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Binman partition
> > > > +
> > > > +maintainers:
> > > > +  - Simon Glass <sjg@chromium.org>
> > > > +
> > > > +select: false
> > >
> > > So this schema is never used. 'select: false' is only useful if
> > > something else if referencing the schema.
> >
> > OK. Is there a user guide to this somewhere? I really don't understand
> > it very well.
>
> The example-schema.yaml at the root of the dt-bindings directory is
> well commented.

OK I had forgotten about that, thank you.

>
> > > > +description: |
> > > > +  This corresponds to a binman 'entry'. It is a single partition which holds
> > > > +  data of a defined type.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/mtd/partitions/partition.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: binman,entry     # generic binman entry
> > >
> > > 'binman' is not a vendor. You could add it if you think that's useful.
> > > Probably not with only 1 case...
> >
> > I think it is best to use this for generic things implemented by
> > binman, rather than some other project. For example, binman supports a
> > 'fill' region. It also supports sections which are groups of
> > sub-entries. So we will likely start with half a dozen of these and it
> > will likely grow: binman,fill, binman,section, binman,files
> >
> > If we don't use 'binman', what do you suggest?
> >
> > >
> > > > +      - items:
> > > > +          - const: u-boot       # u-boot.bin from U-Boot project
> > > > +          - const: atf-bl31     # bl31.bin or bl31.elf from TF-A project
> > >
> > > Probably should use the new 'tfa' rather than old 'atf'. Is this the
> > > only binary for TFA? The naming seems inconsistent in that every image
> > > goes in (or can go in) a bl?? section. Why does TFA have it but u-boot
> > > doesn't? Perhaps BL?? is orthogonal to defining what is in each
> > > partition. Perhaps someone more familar with all this than I am can
> > > comment.
> >
> > From what I can tell TF-A can produce all sorts of binaries, of which
> > bl31 is one. U-Boot can also produce lots of binaries, but its naming
> > is different (u-boot, u-boot-spl, etc.). Bear in mind that U-Boot is
> > used on ARM, where this terminology is defined, and on x86 (for
> > example), where it is not.
> >
> > >
> > > Once you actually test this, you'll find you are specifying:
> > >
> > > compatible = "u-boot", "atf-bl31";
> >
> > I don't understand that, sorry. I'll send a v5 and see if the problem goes away.
>
> For me this means the partition contains U-Boot and TF-A, which is
> probably not what you want. I believe Rob is saying that how you define
> the compatible property above does not match the examples below. Did
> you run make dt_binding_check?

Yes, but I have not been able to install the correct version with 'pip
install'. So the check about not being an object did not appear for
me.

I have now figured out how to run the latest version locally with the
Linux validation, so will fix these problems in v6.

>
> Also, do you really need to say which software project provides a
> component? Would using "bl31", "bl33", etc be enough? Or maybe you
> could have eg. "bl31-tf-a" and "bl31-u-boot-spl" (in this order) for
> clarity? This way one knows which stage a partition contains and also
> the software project which provided it.

The software project tells binman the filename to pick up and any
processing it might need to use. It is quite an important element of
this schema. Bear in mind that Binman assembles the image...so it must
read in the various files that are needed.

The bl31 terminology is used by ARM but not x86. So using bl31 in the
context of U-Boot would be quite confusing on non-ARM SoCs.

For the stage (or what I call Phase), I have not considered that yet.
The purpose of adding 'bl31' is because TF-A (like U-Boot) produces a
few binaries so we need to specify which one is wanted, which in turn
leads to the filename. We do have the concept of a boot phase in DT
(bootph-pre-ram for example), so I hope to integrate that at some
point, for runtime use. But for the purposes of assembling the image,
it doesn't matter when the phase runs...all that matters is being able
to read in the files which need to be assembled into the image.

>
> To be honest I still don't fully get where you want to go and I believe
> a more complete schema would probably help, with different examples, to
> catch what you need and why.

The full schema is described at [1] and [2]. Note that this may need
to change as I slowly upstream it. The top of [1] describes the
motivation for binman and there is a more detailed talk at [3].

So far I am just trying to describe two things:

- U-Boot (u-boot.bin)
- TF-A BL31 (bl31.elf)

I am doing things in baby steps because even that is quite a
challenge. But I think the linked docs should help explain where it is
heading.

>
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    partitions {
> > > > +        compatible = "binman";
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <1>;
> > > > +
> > > > +        partition@100000 {
> > > > +            compatible = "u-boot";
> > > > +            reg = <0x100000 0xf00000>;
> > > > +        };
> > > > +
> > > > +        partition@200000 {
> > > > +            compatible = "atf-bl31";
> > > > +            reg = <0x200000 0x100000>;
> > > > +        };
> > > > +    };
> > > > --
> > > > 2.42.0.609.gbb76f46606-goog
> > > >

Regards,
SImon

[1] https://u-boot.readthedocs.io/en/latest/develop/package/binman.html#image-description-format
[2] https://u-boot.readthedocs.io/en/latest/develop/package/binman.html#entry-documentation
[3] https://elinux.org/Boot_Loaders#U-Boot

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
