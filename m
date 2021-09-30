Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C346DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 15:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B9660F4A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 15:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87B9660F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpNUV8QkglYermMEtBA+2uUrw/9f9PN4+e/f8Az0B4c=; b=TaUtm8BzyruBDDNqpRahRuFRkq
	lEVXJzUC04H7lTQ2EbX1Git9poBqWqmUitGhkOaQoTWfyO4AbAeTXNUlj8ccuqSfil6RN2Qo0Mpd2
	gp6SqYTxeophOu2bgCWW/GhQU+Xo614i4rrjoy4Y5VZgCiDWwclvvsfUwFeFi6xOwdl+Q94N7TFcx
	nl87Nfyq/IjGOMCVucQlC1SpE7/Zs+pJerjIifuXx9ocBg29oZXUDaJZ2o6ZFTimK7gGmBsWCDvv2
	ogxg480EKN/yzaHfxXsbGNQKsaFk1QsLngH5N6tq9tfzgWtOArLz8BRp81O/JyNlb1U7sY+HO13I+
	bmsBNbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVxZT-00EskM-3i; Thu, 30 Sep 2021 15:02:03 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVxZP-00EsjK-Sv
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 15:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=r+o3vngVkdgztVQkxkUxvPMjJ9nS
 mdIiV96Cw1ESXyc=; b=CXiUxsT2FblaWdUcBNRW+qgmMsmmSNwCXBs3DTwU3ScX
 SFb0bWfx+QD6R2MfmlF/a2igkJAipQBxDcYehr3rhi05Ed8fZsydSIBOlYBHa91a
 mqvamJacTStj4qLZENtzL7Z49MPxeNugnjA/yO0Q9qGWFe9JuNmPTeRtGVOPsTo=
Received: (qmail 2119133 invoked from network); 30 Sep 2021 17:01:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Sep 2021 17:01:56 +0200
X-UD-Smtp-Session: l3s3148p1@mcROujfNQIYgARa4RV6LAWawlO8I9jL3
Date: Thu, 30 Sep 2021 17:01:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 0/6] Add SPI Multi I/O Bus Controller support for RZ/G2L
Message-ID: <YVXRZNxrgmfROlJy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_080200_250364_2A736E22 
X-CRM114-Status: GOOD (  11.55  )
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
Content-Type: multipart/mixed; boundary="===============2284424423360575519=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2284424423360575519==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdec5ePrzlj11VEg"
Content-Disposition: inline


--gdec5ePrzlj11VEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This patch series adds a couple of fixes for rpc-if driver and
> adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
> is identical to the RPC-IF block found on R-Car Gen3 SoC's.

I did some basic testing on the Falcon board with a Renesas R-Car V3U
SoC and did not find a regression, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gdec5ePrzlj11VEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFV0WMACgkQFA3kzBSg
KbbtBQ//UDqnFRl9bJ/3z/krcE5cI7mn3iuGbS97ZGR6nqRDvSvmbIiQPTreCPNU
VQqMfbLoLkHM9O9u7UR7ucjggb7kveCz1wAtz4h0WPArBvFXJXbOaaeU2dodlk2Y
tYZCGkrfn5FhaRokcMK9MbIBxwwv5ZIypR1DBdyvPD5tX4QujTBrX2z/XzGkCfn2
be+IxS8ibDKnx2VwD0ErPa7la4fKcGVh+4bVd8Wn3fCC+1lTBXaQl5sIcgZnS2H0
HdhETeXxJTPLpPWKNjkYbO9gQRiKQ9iM9tg34hLjWvrgkG45LCct/Q/UTI998yeh
4OXhypsgoFKnLjNJXh3CLAV1Ud8xQvglWV5YkLEyeinTb2xdk4LX45h+DKDOmcHU
0GD2VvzY3ilwcneSAFRlae6EuJ+lvw6AingESituuIOPCtAmDbQ3MYkZsFHwDW2K
rHnVMKNT6ajsehg9jmwIBOr7zAU1YEG0WrTXDI1KzoeL8hhczcGVRnhGOv0CMSXY
tGrqEiVC9hSX6trxx60N42hLwuMxF2E4aS6mi/CsdkfPYfoOJ4YEWuvkMc+iG4mB
4znsrDwaBYF47lX96RsW6nSI8prCyOsvf42vyZ6OeWJYOOlAgBSh9wGJN2IuYeh8
BRop7XCqLmNVFAt/Q9CXDgsmXKcB+dE82t0MtavGfuwukYE01D4=
=o3Q2
-----END PGP SIGNATURE-----

--gdec5ePrzlj11VEg--


--===============2284424423360575519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2284424423360575519==--

