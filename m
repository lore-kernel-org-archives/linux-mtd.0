Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC9EC4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 08:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D09D21473
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 08:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRRaMre+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5BGtGFw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D09D21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2T1CU2PXRCCIdWcrSsd9eXzK0gf2WHsjRPYSNtYD+XY=; b=fRRaMre+TcBPIY
	7fZDXlwr1A+Yb8t+TjEbEy/LrDpJr1zdZFO281JwHIM7AXHgSgwXIFI7VauvkjX615NKoDu7S5KIp
	2wW34HQo7257ifgm9qMwTvoPpkwA9YywGl6Wgr5DzxDnNyUQtKjrAUjnL/YMXzBeGXDaHw3mfYSWN
	BOgK6Iw1bhO1j8wNgCPw3ztFo1jwic2PXdn3rAK1ok4Aa2ebEIWaEFa+0cUuk5I2LEF0t4epPEJYM
	wJkx8oB1vkgQr7mN/a1dPqIEJfcxGxn9TCcyATvtkvmKWAWeGn3+uZ+1Y0F30hiJvlLBWBThIqh2z
	eMcMxOThkHck7zKFSlOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBbLQ-0006EK-Vl; Wed, 03 Apr 2019 08:34:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBbLH-00065U-Iy; Wed, 03 Apr 2019 08:33:57 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1652F2147A;
 Wed,  3 Apr 2019 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554280435;
 bh=6QCm6q5tJVmWJ58vqjLodRRli8JXECg0lAteQ+OUfbI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s5BGtGFwPe6GhWX6XI4+OlGv4FNhyOdbQrS/43fHKdoBbBuaWmajQ3QYaF6eOggPp
 Ojdgn3iyObIKcCHJQDkDFSitIiuXOyG1H1vE03CDQum/J5LccyDONeLulQWm6SrB9M
 dCRASY2jlDdi+JmHhA6JRQjfYJkYAbtWSNrJaNcA=
Received: by mail-qt1-f169.google.com with SMTP id x12so18518105qts.7;
 Wed, 03 Apr 2019 01:33:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXsFC5qwiYr/NFkwHa85Fd1ecf9k1VLau1Pr1OFHc30EwjWP6KN
 S7Q6orbBHZdjzS08huLyejB04yQaaCMUj+q46Q==
X-Google-Smtp-Source: APXvYqwQzslf1iCl6IZEgmH5hGEUzKPtVXUV8UySGIeIlQtPTDqAd6R4aSc++Rhl/aKsp3Tlm4mYygn62vsys6VqiyU=
X-Received: by 2002:ac8:3f6f:: with SMTP id w44mr62482739qtk.59.1554280434265; 
 Wed, 03 Apr 2019 01:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
 <20190403074418.by3cmvtmdcbovyw5@flea>
In-Reply-To: <20190403074418.by3cmvtmdcbovyw5@flea>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 Apr 2019 03:33:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
Message-ID: <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_013355_660993_CD77ACC2 
X-CRM114-Status: GOOD (  28.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 2:44 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Apr 02, 2019 at 08:25:59PM -0500, Rob Herring wrote:
> > On Tue, Apr 2, 2019 at 9:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > Switch the DT binding to a YAML schema to enable the DT validation.
> > >
> > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > >
> > > ---
> > >
> > > Changes from v1
> > >   - Added controller constraints to the generic options
> > > ---
> > >  Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> > >  Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
> > >  2 files changed, 96 insertions(+), 48 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> >
> > Same 'a-f' comment here, but otherwise,
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > And thanks for being an early adopter. Let me know if you have any
> > feedback on the schema or pain points.
>
> My main feedback is that it's awesome :)

Thanks.

> We (sunxi) have an awful lot of DT in the tree, and I made schemas for
> most of the bindings we have now. It allowed us to find a huge (or at
> least way more than what I was expecting) number of issues in our DTs,
> like inconsistent node naming, typos, etc., and also that our bindings
> were not updated as they should have.
>
> The following patches are a direct result from that, and I expect to
> find more.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/640978.html
>
> On the pain point side, I guess the main one is that most of the time
> it's not really clear to me how I should express a particular set of
> constraints. You've been really helpful to deal with that one, and I
> guess it also stems from the fact that there's not a lot of examples
> in the tree right now. I expect it to go away the more schemas we
> have.

Yes, there is a bit of a learning curve to json-schema if you have to
do anything out of the ordinary. The meta-schema is supposed to help
constrain things, but it's only as good as what we define there. That
also mainly works for already known property names and patterns we've
thought of.

> The other one that might be more problematic is that it also tries to
> validate nodes that are not enabled. For in-SoC components that don't
> rely on anything external, it's fine, however, for components that
> would require something that is connected on the board (like a
> regulator, a phy, a GPIO, whatever), then we can't have all the
> required resources in the DTSI, and boards that don't use that
> component (and keep it disabled) will emit warning that this
> particular property is missing.
>
> I've tried to look into it but couldn't find an easy fix for that in
> the tooling, so I've opened a github issue for this. Let me know if
> it's not appropriate.

Yeah, I need to go look at that. Skipping disabled nodes shouldn't be
too hard to do within the tool. This came up before I think and I've
resisted because I don't want to skip validating at least what is
there. Maybe the better solution would be to drop 'required' from
schema when validating disabled nodes. (At least, I think just
'required' is the problem?) The complication would be we'd need 2 sets
of schemas and select the right one for each node. Another way to
implement it would be just to filter out the warning messages.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
