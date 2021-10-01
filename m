Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC79C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DE761A8B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6DE761A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dt7Y+x67Ff8gGq5ZEpR7s7YPuOW6c1lwv2oWKYp+NLc=; b=ZGURGZ5Mpt6ze/eutOYk7uUOPN
	yFs0DsnByHqYzyNpkZeaPvjpnIUrOR00zKL1qp1uSk2aCa/diLua8ucp949s/PqqaVs8ccTN8LMGP
	FGVGhBNXf2pZolRR6h8LOGGYF+HAxufhCKnB1EMtE1XmFYNyt+5cTUw+JQdkDSmRJEnJL1ayPAY26
	E06N9w5SMxesNEk/SpapVIJZFYLN53BQvQt1pGaSEirRlipvQm2mGOadyk+uaXc3EmIrAsaUQ1WmK
	fjmVUsrKtrXW5GvLGuczEc8m/XcFdGn3GABt4jX3gmbUakzqIxq0vtU/lEA4y7jSIHsI1G9CX4p8F
	zaKb8hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWHRM-000FWM-3W; Fri, 01 Oct 2021 12:15:00 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWHH8-0007Ec-I6
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 12:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=sU1jHZ5AxD4VfGEdE0alKPxI1996
 qYnc3sUVIk98xIA=; b=o2DkK4TEJ2MjNtxegdLBJeBjQFr16jn7wHO4G/EAQU1K
 j1RK0i4oldYwujwtqM3GV/UGHQONbcgn6x9RtjmzfinIm+xq3fgXYuoL/LArmIRH
 m2gGCz81yu6LMx18Kdm4IrvgKuRj9bp7gMlhcF+D7jWKpZmPbsyTgyNG7rNUaMw=
Received: (qmail 2459946 invoked from network); 1 Oct 2021 14:04:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 1 Oct 2021 14:04:22 +0200
X-UD-Smtp-Session: l3s3148p1@MLMZXUnNftIgAwDPXwmDAJN1R91E6vGQ
Date: Fri, 1 Oct 2021 14:04:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 6/6] memory: renesas-rpc-if: Add support for RZ/G2L
Message-ID: <YVb5RXvh9agIS7MG@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXMc1A4D/y4kjim@shikoro>
 <CA+V-a8sDSsyTGfTeQfG_ZhfrJHCm+2kBTEDWaoFMTgsMOmxEgQ@mail.gmail.com>
 <YVbM3z7x+D0MCkTF@ninjato>
 <CA+V-a8uyQmW3+4hAt4534spKeQHDoeZzuJJE4RY70KLZfYOXoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8uyQmW3+4hAt4534spKeQHDoeZzuJJE4RY70KLZfYOXoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_050427_253538_174AC989 
X-CRM114-Status: GOOD (  18.18  )
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
Content-Type: multipart/mixed; boundary="===============8307110785177674581=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8307110785177674581==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5QK+6x2YA2y8yiDI"
Content-Disposition: inline


--5QK+6x2YA2y8yiDI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

I checked the G2L datasheet and reconsidered. It is better if your patch
goes in first. That means...

> > > > Is RPCIF_CMNCR_IO3FV and RPCIF_CMNCR_IO2FV actually documented in your
> > > > datasheets? I am asking because I have a patch pending to remove writing
> > > > to undocumented locations. So, I was aboout to remove the IO3FV and
> > > > IO2FV macros.
> > > >
> > > Yes they are documented, you should be able to download the HW manual from [1]
> >
> > Great, then I will keep them!

... that you could change the comments here from "undocumented" to
"documened for G2L" or similar.

> > > > > +             regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> > > > > +             dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
> > > > > +             dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> > > > > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
> > > >
> > > > regmap_update_bits?
> > > >
> > > Im a bit hesitant to use regmap_update_bits() here as some of the bits
> > > are not documented.

Here you can keep your code as is. I will change it afterwards if needed
once I clarified all undocumented locations.

Thanks and have a nice weekend,

   Wolfram


--5QK+6x2YA2y8yiDI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFW+UEACgkQFA3kzBSg
Kbb9Nw//bCZjWZIYqwiSCfxBOafnLWkptccKRA/ccZ57W8k5zOSNRRPmx68uEr2+
G6p3M5tlc9g9oqT0Yek9lce9f+7SIVrbOdHLONIpBpeEHEb4FfZUKqOiLzDB+JDf
RlMF+IbEFNOwDAfhFCJdR9SY5GeobFjmLpTWyMfJlRnFvTFFe9S3NF7V1V9AQMHh
KrTC2H67mMpgzVwT/iF7naTL4mHI7GaT9I1bm3U1meHYxDM7hDZB2uWvwErPzh1w
plGrppDm02M6Bj+IllzZukxvC7ppzPDAjmuHMttjuurInrem5NrWCtTMT4mZdf/w
0OIn2me7d40DI351em9tk5YL3tsqyIgTp+MpmrDGGi/9bs5FCQzPYh5RHtRVNwiZ
XicfUYQzFXg5FxSwf2LcDOcuHu737TZxjjrr++cKC6e9uGnzfXUlAy+HNhzSce7M
NqIZbnMNQD2t83mThggTvl+XgNQ/c4pMiJ11Je/fImfHkB/OV+ExZzhoTYqeRkjX
STlHRriE+XIuotL+RFD/ImGqKXPauFhWJwCrQcJFmwMhV4vl8EkWdtZlNDiR9sR7
+ir4YTUv1s7FUEpRCozcHus1MiKtFdoxDgC+yNDLwbo/fDE21lBB7o/4nTm3P3Qd
itXUJBUf8jxaSazpaURv1jiRCGSFZZEZCYmbnD2SDS3+y4J3PDM=
=nApo
-----END PGP SIGNATURE-----

--5QK+6x2YA2y8yiDI--


--===============8307110785177674581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8307110785177674581==--

