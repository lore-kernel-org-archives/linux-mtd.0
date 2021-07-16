Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5452CC12002
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 19:11:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A3F9613D4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 19:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A3F9613D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Giwh9gXvF/VwJNxJ0wj+KUnKmDkrp5OLCemsPof84W8=; b=DHkXo43Qq/JMv+
	Lbc39B+w96x1fBaovmqjPQfB9nEwMFvBhpX6UfgeB5iI+9F4BG2ZP8ZcLnJ0K41xU7KsUcFIkRIq5
	h4lyF93Z2vyMTY/0Q4BLeVBwUoElWvSAebTQcHn3cx1zY4pDhCyzqMe8fmm7IGHa3wTy1+7v1MFw0
	380C8TFpK3yoCdmyXNoe8B8fmY94zUPqW/vgMjtId/eJRKAdv+0IrCuXg0dpW7YDYmU3R/10STzZ8
	0R+65m8ZVK9kZkTIIxjREBEbo8JBXvvGNXddsD4T+HMKMJ+RVarTj9tc7ExXxeU7lHzaabqC9qNz+
	iBZtP9XwkNmLopOQnuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4TDq-0056Oe-NF; Fri, 16 Jul 2021 19:10:06 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4TDo-0056NR-3S
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 19:10:05 +0000
Received: by mail-vs1-f49.google.com with SMTP id a22so5699073vso.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jul 2021 12:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehJwWdmJnEqOFrEyqslwmNH6+ZDemUpg9Q/4BttkqCY=;
 b=o1pBy/A9FW5Soh28USejOlweyB0ywuioqqdiTi9zyTv04zDMHjufs70lZ+fcnpD0XK
 fbGZPRvv1L9hTpQSVW7OWTidh2mfBL52mp3OSEc+2obNPfUmaKsEsvjXjthG+HuOh54h
 8MmegbrMckFVwykfIOUQCWUavyNkW1ruaum08ml5cyveXcvh0C8OQfyA6bc8QSRXZfnv
 /J6M2tFD8LvpS9F0J2HXhO4tltNoLmsut9luF2lgVLFNAzO0knjgBJJo3PeBWd3g7AEw
 6nYBjRZmb3PU0hKs21uxrYjnyOZnhCkY43ShdW0J2Qo15jjJP21obV92zz+HxoF4t3vb
 nYuw==
X-Gm-Message-State: AOAM531NbcBIt15eHILA2CY6t8S8DeWVa9q9Fl6B+vQia4nicO8WSTEq
 RjKNsDg6/tnELiTL4tk/J9W91lAy5NG3t0hjPKg=
X-Google-Smtp-Source: ABdhPJxZ3GQdFZsnwGr4ysExj1rkCNjJYj/LMNp5Bwoi5+JuhzOdItSjtD8zznsMplgRv8d3nnp0PfgcVGSLfl6UM94=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr14494278vsd.42.1626462598688; 
 Fri, 16 Jul 2021 12:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <d430f9c06d6691fe8a98f923cdb7ca13772834b1.1626262043.git.geert+renesas@glider.be>
 <20210716180253.GA3684196@robh.at.kernel.org>
In-Reply-To: <20210716180253.GA3684196@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jul 2021 21:09:47 +0200
Message-ID: <CAMuHMdWXCJd0NzH4km+oXBziBct31DCb53fmk3RhAk-+29Zkew@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,
 rpc-if: Miscellaneous improvements
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_121004_190646_DED25604 
X-CRM114-Status: GOOD (  23.01  )
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

On Fri, Jul 16, 2021 at 8:02 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jul 14, 2021 at 01:30:13PM +0200, Geert Uytterhoeven wrote:
> >   - Add missing "#{address,size}-cells",
> >   - Fix rejection of legitimate flash subnodes containing multiple
> >     compatible values,
> >   - Add missing list of required properties.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../memory-controllers/renesas,rpc-if.yaml    | 23 ++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > index 990489fdd2ac33fe..c0d899a2305361b1 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > @@ -56,17 +56,34 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
>
> spi-controller.yaml already defines this.

spi-controller.yaml says '#address-cells' must be 0 or 1.  As RPC-IF does
SPI master only, it should be 1.

Don't remember why I added the '#size-cells' too. Perhaps for symmetry?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
