Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDB4C4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 08:49:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2431921473
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 08:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QmP/KX5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2431921473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gb/JxfnTn3zB94Wlkc0pfd0V/y960nFGY5tx9PB5ooI=; b=QmP/KX5lfjKtUrjnYQF+bb+bv
	L9nXZW9eVdqZx50n9aqAaWxXH2X0x9H253OiPp/NDFAvthq5n3bvHVKLk2wcp4UE7nWAUlYPjWwUA
	ZV9iC6i9hhZyKD8uk4NEvuXqnRfb+he0/zRmGTBJN2rE1Q8rTjjghpb4893O7M3AEiCfAJPIgFr3L
	rCyIqNgtLCkfx5QfRm+U4b6Rx42hw+TgQzS0wBmaa7nlOVJw2omjLVddqDmPmDxWhNE6U+4yvWI24
	U0XnZiDXv5bRR2TyVKquppDjZc0muOqtINPng/UcB1ozRLjg4uQ8McamAGXPrA5h52r8B9ELrcVFY
	xILfAU3zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBbak-0000Qo-P1; Wed, 03 Apr 2019 08:49:54 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBbac-0000Hf-19; Wed, 03 Apr 2019 08:49:47 +0000
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2732010000B;
 Wed,  3 Apr 2019 08:49:38 +0000 (UTC)
Date: Wed, 3 Apr 2019 10:49:38 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Message-ID: <20190403084938.nk5po4w7ljy5bniw@flea>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
 <20190403074418.by3cmvtmdcbovyw5@flea>
 <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+bivuKJ107tiQDb9EN2S+AyK89+CzfcofioXcqGLLqjA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_014946_220823_79C4D4DA 
X-CRM114-Status: GOOD (  18.09  )
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
Content-Type: multipart/mixed; boundary="===============7900366019775148312=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7900366019775148312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a76thyva57lxv6lt"
Content-Disposition: inline


--a76thyva57lxv6lt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2019 at 03:33:42AM -0500, Rob Herring wrote:
> > The other one that might be more problematic is that it also tries to
> > validate nodes that are not enabled. For in-SoC components that don't
> > rely on anything external, it's fine, however, for components that
> > would require something that is connected on the board (like a
> > regulator, a phy, a GPIO, whatever), then we can't have all the
> > required resources in the DTSI, and boards that don't use that
> > component (and keep it disabled) will emit warning that this
> > particular property is missing.
> >
> > I've tried to look into it but couldn't find an easy fix for that in
> > the tooling, so I've opened a github issue for this. Let me know if
> > it's not appropriate.
>
> Yeah, I need to go look at that. Skipping disabled nodes shouldn't be
> too hard to do within the tool. This came up before I think and I've
> resisted because I don't want to skip validating at least what is
> there. Maybe the better solution would be to drop 'required' from
> schema when validating disabled nodes. (At least, I think just
> 'required' is the problem?)

I thought about something along those lines too, since indeed the only
thing that causes troube is required.

> The complication would be we'd need 2 sets of schemas and select the
> right one for each node.

You mean two instances of the schema in the tool, right? Not two
schema files? Do you expect any drawback to that (like
performance-wise maybe, if we have more schemas with more complicated
select patterns)?

> Another way to implement it would be just to filter out the warning
> messages.

That would work too I guess :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--a76thyva57lxv6lt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKRzogAKCRDj7w1vZxhR
xac1AP0QLbbbxWvLkIPGe2zrWPi6nKLa/QhvRdMWM3ZbsDeZAgEA2a953gpc7deu
ZRklMgGMaC2SedAc09yfEV12U/V2OAU=
=qt3G
-----END PGP SIGNATURE-----

--a76thyva57lxv6lt--


--===============7900366019775148312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7900366019775148312==--

