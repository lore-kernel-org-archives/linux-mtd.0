Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FEEC4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 07:44:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52BCB21473
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 07:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3IgU6o2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52BCB21473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x9iJwuwayL77d67fL7K8B2pPRHSlG6VH+nqWg9B9/jU=; b=X3IgU6o2vICp9KISLqeKLWWdu
	tyWq/OCCRTL1HWJntP6W8nICAANhlQPRNLmSPj4C0+JmYvACzgeRKR5iLJx+THBzX43L4wZ4B/S7v
	35y6kRYTvVj9gowVvmBtwS9CeG7sd8pAvVqw8u8e+hKEPv+5DXwFRUIK2uNE2tou6Xc2/UEJpPiXl
	VyCwcVy7f7QtKqLN73abW7W4taem9CghwArq4nlMlFV16xxuRnV9lrLlH1uwtgO6GM1MhIep8G8hh
	FYqwkly0VlzmmG6dJqq0hC7I+KmuMQ0KY1/q0VJbeZ+uGyvvA+Rhp5QDOGslLxB1pzsaJ2Txf9w+B
	H2Afio6UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBaZc-0007yF-6L; Wed, 03 Apr 2019 07:44:40 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBaZS-0007po-UO; Wed, 03 Apr 2019 07:44:33 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C19A32000C;
 Wed,  3 Apr 2019 07:44:18 +0000 (UTC)
Date: Wed, 3 Apr 2019 09:44:18 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Message-ID: <20190403074418.by3cmvtmdcbovyw5@flea>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_004431_653158_AD4FA59E 
X-CRM114-Status: GOOD (  17.27  )
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
Content-Type: multipart/mixed; boundary="===============3888684686352732590=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3888684686352732590==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vknjjztxeq3b4peb"
Content-Disposition: inline


--vknjjztxeq3b4peb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 02, 2019 at 08:25:59PM -0500, Rob Herring wrote:
> On Tue, Apr 2, 2019 at 9:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Switch the DT binding to a YAML schema to enable the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > ---
> >
> > Changes from v1
> >   - Added controller constraints to the generic options
> > ---
> >  Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
> >  2 files changed, 96 insertions(+), 48 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>
> Same 'a-f' comment here, but otherwise,
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> And thanks for being an early adopter. Let me know if you have any
> feedback on the schema or pain points.

My main feedback is that it's awesome :)

We (sunxi) have an awful lot of DT in the tree, and I made schemas for
most of the bindings we have now. It allowed us to find a huge (or at
least way more than what I was expecting) number of issues in our DTs,
like inconsistent node naming, typos, etc., and also that our bindings
were not updated as they should have.

The following patches are a direct result from that, and I expect to
find more.
http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/640978.html

On the pain point side, I guess the main one is that most of the time
it's not really clear to me how I should express a particular set of
constraints. You've been really helpful to deal with that one, and I
guess it also stems from the fact that there's not a lot of examples
in the tree right now. I expect it to go away the more schemas we
have.

The other one that might be more problematic is that it also tries to
validate nodes that are not enabled. For in-SoC components that don't
rely on anything external, it's fine, however, for components that
would require something that is connected on the board (like a
regulator, a phy, a GPIO, whatever), then we can't have all the
required resources in the DTSI, and boards that don't use that
component (and keep it disabled) will emit warning that this
particular property is missing.

I've tried to look into it but couldn't find an easy fix for that in
the tooling, so I've opened a github issue for this. Let me know if
it's not appropriate.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vknjjztxeq3b4peb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKRkUgAKCRDj7w1vZxhR
xT+SAQC/jplOEjgRMnTohLe07vDeB9EF3kFaK6ZyBWHffHY84QEAlvlsUdX96g9S
PHu1r3HAp+a6nSnJjbHDQ3ZcYYDZ8go=
=0MQo
-----END PGP SIGNATURE-----

--vknjjztxeq3b4peb--


--===============3888684686352732590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3888684686352732590==--

