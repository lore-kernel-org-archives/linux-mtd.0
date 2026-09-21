Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDE7C982ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xMEjAbq986x13KLDNEFM1+fiygDy52K9qVWTOF+g9s=; b=TGK7ZX+NXSwfoQrxlw2crgpbyJ
	0nAYbbtSKVpcKzgtmFpKZF/+cBJSI64n4WrVSggvopFbRbqUutRvcCGnNun+LSLu8EOlYCOo27oE7
	HhHUHIuIedWdoz136iqw/zVBKY6bgza6GFfpTAOISwhff13z0i5B5nflWku1UKYlh0Vg9RUNintZs
	4sPmuQ9Wskl37b1o/I81VeyKDH7SDmSjozBRrNzyJ0RMAmsv7I2aFXRXlOZ8H6NbhWrppJ8so+83s
	E3aVVI8SkA+1BG4wVE3WwbTagL1m+g8idztvEsZ4r4n4Nttrev1PsTJ4uFgd46TZpBCIfvVjeNEXM
	S0G4xvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eaS-00000002K1R-19R3;
	Mon, 21 Sep 2026 14:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eaQ-00000002K11-1q24
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 14:01:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F1343AC8;
	Mon, 21 Sep 2026 14:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929FC1F00893;
	Mon, 21 Sep 2026 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999297;
	bh=ndVjxm8TKIN1nfsjmkl9cnZNSgKhc4ofPbtvhzyMKw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WR3O9xtN97cDw5OLYA/QFj+rHt1l/6xP9ixUtxbXtWT4WYrnd49yKQbJstWfsDx1R
	 ANkgFva6ju34F1SqJtXXWxRgJE43aBen0aiN0G7iHZdexrvADdEnlHuVuAtEHrjWoO
	 Gu5Its2U51ujt1gm+HdIQAIqK25YY8JP6b2uSZL1gqH4glP5Oy5XVq8jMIn8NyXy8O
	 IRwPCMnR5QEGQD6F9WIHrpiZziPkD8iFKt4DdiXBqpQnutsb8fz2AIJYh6dN5xWp+6
	 HotR1695hIBx43lcF3olm5Qsu4NGzPE56DaPv6FgqYeHACtsRrgVOqMhMIW/+shekE
	 350Q3/RcIuPLQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 782431AC55A7; Mon, 21 Sep 2026 15:01:33 +0100 (BST)
Date: Mon, 21 Sep 2026 16:01:33 +0200
From: Mark Brown <broonie@kernel.org>
To: Fei Xie <fei.xie@horizon.auto>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parshuram Thombare <pthombar@cadence.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] dt-bindings: spi: cdns,xspi: add SPI NAND
 compatible
Message-ID: <arE4vVKXS3epjgbL@sirena.co.uk>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-2-fei.xie@horizon.auto>
MIME-Version: 1.0
In-Reply-To: <20260921093701.1341766-2-fei.xie@horizon.auto>
X-Cookie: Too clever is dumb.
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
Content-Type: multipart/mixed; boundary="===============5851064911065377128=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5851064911065377128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WV5wcvrA5GFuPAS2"
Content-Disposition: inline


--WV5wcvrA5GFuPAS2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 05:36:58PM +0800, Fei Xie wrote:
> From: "fei.xie" <fei.xie@horizon.auto>
>=20
> Document the Cadence XSPI controller compatible used with SPI NAND.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--WV5wcvrA5GFuPAS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxOLwACgkQJNaLcl1U
h9BU7gf/T+vYkaqiUknFKroCfHq87SeL86xlWaFcSnDD2lsSJbsi4OUcn8O63RIK
9jMqi2unojQsvmiRMjO4sNVL+TZk4V3KMbPkEI+jNJXGev7gnciJnAIwn+ao0m+q
fGL8Ph7HjeYlKdOSN6DxoZa2dcZpFP8ea84JG9mh56VHre9KnbYwp5Cr87jHXATR
9/uQ1VVBU5JdIrfQWEzpUlReBLNLiBzsXIP5Cyw+Sstm7SKdZzMSEEdowiex/+kl
Dh09cwv3j1dacBovZZ/L+9pIyYb1CKHH8lRVVo3U/HoR7agbZoel+2nRR4gQHKZ4
Owp0NKiLpoNMv48X8sfbNzZ/84Yc1A==
=PwHT
-----END PGP SIGNATURE-----

--WV5wcvrA5GFuPAS2--


--===============5851064911065377128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5851064911065377128==--

