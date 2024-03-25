Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175EC54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 01:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTaQgTwrqp4znHE3gZU7UYfsTdmeSwVIt3Rkfb7Xwcc=; b=CZej2hkAv/mB4i
	1sK/54AI73PPCtRlZo1mOmDzPCQu/XlzNtPW6CUdPMNXXIGh8UYnmxH+9vkrkVrdl/EsL3t8mYJfd
	3XscVPAPSRSpbQdR/2NTS1NbzFVKUkdanIB1opnxDmENVv/ZnOmzzcN8ORj3ZpPjoDGLmiSxaCBL+
	LDGSS4+CkWDAxLtdw6RGd3Vb203vL88E/24mw6lrOeWIJCvO8CGrkCyQjKPQ20MP2lPixuuUGKwwL
	2NO1OuMG6agDGEmX4EDwjK3RCjagwEQT4mWD5u+tAJHds9PgIzW9jlfm671Jw3JBS/t4bRpMmdQj2
	dKdxCFe6dkcz7SM8WaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZ6S-0000000EOVd-0tA8;
	Mon, 25 Mar 2024 01:26:20 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZ6L-0000000EOSS-2M7a
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 01:26:16 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-696499bd61eso39972066d6.0
        for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2024 18:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711329969; x=1711934769; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Dbx4/AQEaK3b87iVLlgcHWjdXiKW8/SKBtYSvJ4l8=;
        b=epR6B9CNXl8gjNP/O2xxjIrwS+3gOXdz9wnYqlUAV/9mVYfoLU6iRh+zGii5TUXH+d
         CtyF4PKr5oATkdCiGRiy45v8uNCHlyob4RwRF6a3zoAg/337mX23/nlyisKU0qCmj1cu
         y1nl7ONsnad951Vu4olwnfMKAijiOsrhkLgHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711329969; x=1711934769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Dbx4/AQEaK3b87iVLlgcHWjdXiKW8/SKBtYSvJ4l8=;
        b=ITUHEUlrQLsbsF/M9hQvACgrVsk1JIqfbhOgQRD7GAFY67NHyLeLfmv+68fyAXi7lI
         OWzH76pVG+qoJVJc6zGsFMI6HceZXRc+aXAFP5FvxyoS7IGUl1FDH6btYRCZOf49CcGA
         nPom3Ad9awdRnqvI/kucsn/EK8c/5iv7SQiKAQhbhUPH+mP+sRlanRaeb4nNBPLgmtTe
         9T5fcz0KLmvk0abdE9XqdeZNP861ffWrQ4WeLjU5m63/oMeis6w9E7+m7m3/tH/uSVFe
         8Pg3ni8cejXDIUqQuCYmQZ4+M6aKpArBTI0+DFNcucEewu0MliCvuvg1fPLdVQwAld2j
         tuog==
X-Forwarded-Encrypted: i=1; AJvYcCX0FeAQH6T7dDyUQu9hup9tuSmOpx9Fr6T7wdlZMYeu5CUn/MC51S9Jga9tjdoswMc3ymxLdOT0NKen3ZL6vw2g+SHoWUB0U/pjYTTO4w==
X-Gm-Message-State: AOJu0Ywr2QJvl4QcEroytgAYbMgQkWTTzYTlDajMkypHoaFvxZqu+Kb1
	hZ8v6ZZRs8biQV0I+9aHhbzEuqEJt6wsiM5vyRbPly5d897ih1o+u8Dj1DRkR1SRT3MWN7vh6e5
	0/Dr7UHfKZnHzKvO6n2HG5/fbzi1zgVtF9K9CK7O6tU3JxmlFSw==
X-Google-Smtp-Source: AGHT+IF8k6IEgNL4Ml3wABhG3s1RLLEjzUk0aITApXvBMpCMHfkjVmDSrsKoCpsIrVx5U2+VbKSHOEy12MRmxPAYxkg=
X-Received: by 2002:a05:6214:410:b0:690:a576:2a2c with SMTP id
 z16-20020a056214041000b00690a5762a2cmr6745531qvx.32.1711329968724; Sun, 24
 Mar 2024 18:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240320052449.175786-1-sjg@chromium.org> <20240320052449.175786-2-sjg@chromium.org>
 <20240321134917.GA1625959-robh@kernel.org>
In-Reply-To: <20240321134917.GA1625959-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 25 Mar 2024 14:25:57 +1300
Message-ID: <CAFLszThbC7PDnJk8pXS2bNN9ebntoOJ-7xxkFU_LCm4Jg-km4w@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_182614_019158_017B3484 
X-CRM114-Status: GOOD (  31.76  )
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

On Fri, 22 Mar 2024 at 02:49, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 20, 2024 at 06:24:49PM +1300, Simon Glass wrote:
> > Add two compatibles for binman entries, as a starting point for the
> > schema.
> >
> > Note that, after discussion on v2, we decided to keep the existing
> > meaning of label so as not to require changes to existing userspace
> > software when moving to use binman nodes to specify the firmware
> > layout.
> >
> > Note also that, after discussion on v6, we decided to use the same
> > 'fixed-partition' schema for the binman features, so this version
> > adds a new 'binman.yaml' file providing the new compatibles to the
> > existing partition.yaml binding.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v8)
> >
> > Changes in v8:
> > - Switch the patch ordering so the partition change comes first
> >
> > Changes in v7:
> > - Adjust MAINTAINERS entry
> > - Put compatible strings into the 'fixed-partition' binding
> >
> > Changes in v5:
> > - Add mention of why 'binman' is the vendor
> > - Drop  'select: false'
> > - Tidy up the compatible setings
> > - Use 'tfa-bl31' instead of 'atf-bl31'
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
> >  .../bindings/mtd/partitions/binman.yaml       | 49 +++++++++++++++++++
> >  .../bindings/mtd/partitions/partition.yaml    | 21 ++++++++
> >  MAINTAINERS                                   |  5 ++
> >  3 files changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> > new file mode 100644
> > index 000000000000..83417ad5cee9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binman entries
> > +
> > +description: |
> > +  TBD
>
> ?

Oh yes, I forgot to put that back when I reworked all these again.

>
> > +
> > +maintainers:
> > +  - Simon Glass <sjg@chromium.org>
> > +
> > +allOf:
> > +  - $ref: /schemas/mtd/partitions/partition.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - binman,entry # generic binman entry
>
> As-is, 'binman' would need to be added to vendor-prefixes.yaml.
>
> However, I think just 'binman' would provide just as much information.
> But really, does it provide anything? What would be the difference
> between this and no compatible?

In Binman this is the base class ('entry') for all entry types that it
understands. I don't expect we would actually use this since it does
not define what the contents are.

So I can remove this line.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
