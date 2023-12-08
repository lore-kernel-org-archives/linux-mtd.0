Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C2FC10F05
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHS39xboxTIXXhoI1u5uXIoiVtOSHZ5i6d5C/TCjdcQ=; b=3o7lDpek75+3pl
	/Hu1Df+F8+numLy1iEyFVCcKINdK/7j2QQlmR4ICvyGb1gl6WcaWaKdlUQReY52/d+j9DceS9trmd
	0ONGdBI8pkgJgCKq2W7rhbXQtkmatq0vProIm5JXfBX0Zgpy/Ppufq5aX5/Z6bnnwRV33AoUWsxH9
	z/UIWkbS7Nof203IBE4jKvDAm4sroCLueUtcrPqpHJZV3g/q/35BUL2mR/Jfzwo0vlnkfGSpPZiKn
	BVKK4JUnSBIeAm5HNZrjNfvXuikuWWXPC+cjtIQm3YWKnL0Hqt2kQf3xIx0YSJEZuPgiw3/03Q9X6
	Ap2itYL04X3b9DIGUshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBewV-00GDmn-2Q;
	Fri, 08 Dec 2023 17:47:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBewS-00GDlh-18
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 17:47:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1d93da3eb7so283980766b.0
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 09:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702057628; x=1702662428; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hAJ1WnEzjSjmEz7f7Ppx70QG1I8gsBXxVNcDVYzxKYo=;
        b=Hcem2jdVdbP0zRmEn4n18udWt3c7jomKigKhht2mhfw5VgqSagVgR8gGDOwpPvq7Em
         dLfzOy7Shhi26jMK4L8wq255Dk/Y8oFXVXpucv8fOAIrkVd+HxDxzDBcfpOKYvxD4lFJ
         QmsaaCCaS0jjTKvwhqP+/NQh98XWMyoZO03AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702057628; x=1702662428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAJ1WnEzjSjmEz7f7Ppx70QG1I8gsBXxVNcDVYzxKYo=;
        b=sejjdQNbXGFY9kKAQEHohPozcdrzd4CPHp8VKMLEkhsUSGGbRpTk3RpICLRpm1Q8ml
         gBmN2n6LlTUDs8sSVdfSWFzUykuvpznu5Wv0fn6uxftXKA0NKFf1rWNYCqlMulT9iHPx
         fx5dNwL3lR7zMsP6yMNq/vgg0qYkxOTOj69uNQBrOWkLdCTBrVOLTW3zbHD7K1mkygoA
         RZhZcP8ylQMFq78BpXElBptwHOPqbpkTrwXHUyQDM4DqvJ/7sFOsUGkKL4/iIlMVA3+j
         NaUNXLFBtVe32InX6Q+Rj0kDRfpqBcbhGpWtg+rWtLPKRPfZ+l2FyNpQf4tJMFcMGLpt
         HoKw==
X-Gm-Message-State: AOJu0YwONg/niGV5CgMfS5uF1PWfgXxz7PRN0oGXjaEGcAaErHXPdeIa
	Gyn/3KAk0Yp8l4Tfic/+AE+GY8cIaYF2bThjvahLpR5vLo01XYz0cYEaal+Y
X-Google-Smtp-Source: AGHT+IHVlaS5EYXTYlrQruZM+vx0QSh6/N3o/eDY14hRk0UBFA1FHofU1ZiRsQbF3VqXkzoInBKqIDKTJzp/jsjqxTU=
X-Received: by 2002:a17:906:68d9:b0:a19:a1ba:8cfa with SMTP id
 y25-20020a17090668d900b00a19a1ba8cfamr158447ejr.152.1702057628271; Fri, 08
 Dec 2023 09:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
In-Reply-To: <20231208150042.GA1278773-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 8 Dec 2023 10:46:51 -0700
Message-ID: <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_094712_407553_E75CB89D 
X-CRM114-Status: GOOD (  28.01  )
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

On Fri, 8 Dec 2023 at 08:00, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Nov 16, 2023 at 10:28:50AM -0700, Simon Glass wrote:
> > Add a compatible string for binman, so we can extend fixed-partitions
> > in various ways.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v5)
> >
> > Changes in v5:
> > - Add #address/size-cells and parternProperties
> > - Drop $ref to fixed-partitions.yaml
> > - Drop 'select: false'
> >
> > Changes in v4:
> > - Change subject line
> >
> > Changes in v3:
> > - Drop fixed-partition additional compatible string
> > - Drop fixed-partitions from the example
> > - Mention use of compatible instead of label
> >
> > Changes in v2:
> > - Drop mention of 'enhanced features' in fixed-partitions.yaml
> > - Mention Binman input and output properties
> > - Use plain partition@xxx for the node name
> >
> >  .../bindings/mtd/partitions/binman.yaml       | 68 +++++++++++++++++++
> >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> >  MAINTAINERS                                   |  5 ++
> >  3 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> > new file mode 100644
> > index 000000000000..329217550a98
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> > @@ -0,0 +1,68 @@
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
> > +  from multiple projects. It is based on fixed-partitions, with some
> > +  extensions, but uses 'compatible' to indicate the contents of the node, to
> > +  avoid perturbing or confusing existing installations which use 'label' for a
> > +  particular purpose.
> > +
> > +  Binman supports properties used as inputs to the firmware-packaging process,
> > +  such as those which control alignment of partitions. This binding addresses
> > +  these 'input' properties. For example, it is common for the 'reg' property
> > +  (an 'output' property) to be set by Binman, based on the alignment requested
> > +  in the input.
> > +
> > +  Once processing is complete, input properties have mostly served their
> > +  purpose, at least until the firmware is repacked later, e.g. due to a
> > +  firmware update. The 'fixed-partitions' binding should provide enough
> > +  information to read the firmware at runtime, including decompression if
> > +  needed.
>
> How is this going to work exactly? binman reads these nodes and then
> writes out 'fixed-partitions' nodes. But then you've lost the binman
> specifc parts needed for repacking.

No, they are the same node. I do want the extra information to stick
around. So long as it is compatible with fixed-partition as well, this
should work OK.

Regards,
SImon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
