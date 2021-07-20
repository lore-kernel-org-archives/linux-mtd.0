Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40893C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 16:44:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F6660FF2
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 16:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F6660FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGhjCsITBh82fUuqoHdcaZMp2oEqsBPXCg7hiZG5Z24=; b=yryczi01Phqb7O
	tvJkhusENTWwIZNCZzFboC4k0AiFPz/MvL3BOTBvV0mBkaEOhWjq+1TQ6DaGYeEKXY9mhXr5NuQ3O
	PyElQDQQ4DGF3WHDPjepAFKqhm5sU0mFJLyuoKNUz+1HTnPSCKAb/CUf1ofqs1QqzxF7Ld1qJ1iBT
	jGmTnMCzP+Y00xC0qz4AQO1kHVeDD15nY/mXC/UG6UR6HaqCYiSwOij4WjF8BNEWsUYnGSDz8YhBb
	Ng02T8x8PLs9gtNeJxvDmhbW+LyiXtleF2qjQr2TLQqQqR2Y0PzNaKrXmCfc9dniZEiN7tGWZ8hoY
	wNv7hN7+7wzpBZXk8vxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5spl-00Da01-G4; Tue, 20 Jul 2021 16:43:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5spi-00DZzU-Q1
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 16:43:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 333A960FF2
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jul 2021 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626799382;
 bh=j4BCtPKXcQCOjyfWn0WZbL/kVl1xrM5LvBy4FoGz/40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=moeWhsB7eX73mM0W6ABzmaXgPWmHBdPBBw0qgkPsPA2+RAyIvoLAhI77BCqCW79Sp
 xydZMGobvFHByG2gqrbEmfVOm9tRnN/+nakSkGmStRcuhw8E1ItFimXZguAHYjrs1T
 7XT+jJ2jZWsfEkw1MnRll4enlJqzZZnIZ78Ot+PNv/UHfVdUuKR5Sw+N2CfhR0iyPc
 bUjMPPuhppzFGO28GPlNkRUnafuD+onsug1tYPdLatbW9g3kgoEmnXGlQN6ZbzUVKn
 DAVZYj0agPkdfE00h/jrQzL2PRO+H+juX1clU5Y9oE+sc7wLmW9PfYbRoz+EapA+9x
 biYG5J5j3zUCw==
Received: by mail-ej1-f53.google.com with SMTP id dp20so33337170ejc.7
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jul 2021 09:43:02 -0700 (PDT)
X-Gm-Message-State: AOAM532hPwOcLjNXCN7+eoKY+EGKqU1epd7Pu9X8xdU8nKDY3FOYOk0L
 2oj/Tg5EjXM6J3+62ninTeueO8ovMWXR+ZYQsw==
X-Google-Smtp-Source: ABdhPJxjI2GVsp30gFxyft0HwUf/jh/jdIG8vJGlj+RqnG3vOkfXtdpanD4o0pxB3n9fg2NzozRw2Nvbs11EVTCG5Kw=
X-Received: by 2002:a17:906:5fc1:: with SMTP id
 k1mr32794046ejv.360.1626799380758; 
 Tue, 20 Jul 2021 09:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <d430f9c06d6691fe8a98f923cdb7ca13772834b1.1626262043.git.geert+renesas@glider.be>
 <20210716180253.GA3684196@robh.at.kernel.org>
 <CAMuHMdWXCJd0NzH4km+oXBziBct31DCb53fmk3RhAk-+29Zkew@mail.gmail.com>
In-Reply-To: <CAMuHMdWXCJd0NzH4km+oXBziBct31DCb53fmk3RhAk-+29Zkew@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jul 2021 10:42:49 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+anYwYVssARuymvB=HKK13=p22e65OiYbvYKSwPCtsVg@mail.gmail.com>
Message-ID: <CAL_Jsq+anYwYVssARuymvB=HKK13=p22e65OiYbvYKSwPCtsVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,
 rpc-if: Miscellaneous improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_094302_900557_918B6FC5 
X-CRM114-Status: GOOD (  16.94  )
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

On Fri, Jul 16, 2021 at 1:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Fri, Jul 16, 2021 at 8:02 PM Rob Herring <robh@kernel.org> wrote:
> > On Wed, Jul 14, 2021 at 01:30:13PM +0200, Geert Uytterhoeven wrote:
> > >   - Add missing "#{address,size}-cells",
> > >   - Fix rejection of legitimate flash subnodes containing multiple
> > >     compatible values,
> > >   - Add missing list of required properties.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  .../memory-controllers/renesas,rpc-if.yaml    | 23 ++++++++++++++++---
> > >  1 file changed, 20 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > > index 990489fdd2ac33fe..c0d899a2305361b1 100644
> > > --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > > @@ -56,17 +56,34 @@ properties:
> > >    resets:
> > >      maxItems: 1
> > >
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> >
> > spi-controller.yaml already defines this.
>
> spi-controller.yaml says '#address-cells' must be 0 or 1.  As RPC-IF does
> SPI master only, it should be 1.

Yes, but then it says:

allOf:
  - if:
      not:
        required:
          - spi-slave
    then:
      properties:
        "#address-cells":
          const: 1
    else:
      properties:
        "#address-cells":
          const: 0

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
