Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0EAC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om9mq8x56OLt1MvFzd4KElrzz1lP1A0JNCd+X537gF8=; b=c+mmYtkDkFtbRhVVoWjmOLWxMP
	vDQ2wJBh2U2YJz5OOc45n/av6gDdKuFx6VUh/7e3hZyoSpBnaWWReXP1UerIsLVzQv+dz/eMbztDZ
	DhoDJnoXtmA10wBZk/Xo1qnwwNg7+O9A2Mwk0ebC0A/RQfq6qsjJ9dgwNu8VL/Hddpo8AnZktDHc6
	C5n9AfWJxCSQfLlvbjkLuc/C5sfuPI0xeIH/wasHj6u34HdWw2EKHC3RDdEbI83dob17g7sH81L7P
	2ETIhfy5jmLAdJPwGJGYtt7/tEP5Bn9/DrY+pX6pRElgUYnFDdRce09OUcyKDKXocV5FSFiNVC47U
	hzWWVeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhSK-001Uk9-Hw; Wed, 27 Apr 2022 13:11:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhS7-001Ufs-0f; Wed, 27 Apr 2022 13:11:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 930FF61BAA;
 Wed, 27 Apr 2022 13:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FC1C385A9;
 Wed, 27 Apr 2022 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651065090;
 bh=tpIYWICrW+Xe2NYo9+47DtMMvdK4RGp2TzuVJyjTpZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b7unDFzV3JJ93notz6nFF8qVCFjJ34yZONp6aEjymzwqcKThuj8hPwyIEQp4oyGjH
 Nc8Jwo6xRw7wqIP7Ns8of9TW2BnweRHUiYUyrMjQd1DIb/sLx9hQOnbS/xVOVBlv5D
 jpweLVNSIvktWp6sp2qD0AeGPbAvvsw9GSj5Ubo+mhE7jJs0Z6hnFu8O2reeakEaLB
 nPLS2QiotHoSXJ2c9gVDgnvYgW4X9HhFztis9wB6kcWMjX6hXOyg4MLlwCCTNp8Lsd
 AB4wZIhMFlANHQU5JDN2+CIqPmx13fGtsyUgPL929Tsl5VD/ZlR4FVRmhmN8ti2Q2M
 0XpGV3FuVmuYw==
Date: Wed, 27 Apr 2022 14:11:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND controller
Message-ID: <YmlA+tqqigjkRyMZ@sirena.org.uk>
References: <20220424032527.673605-1-gch981213@gmail.com>
 <20220427112857.7ddd7fc8@xps13>
MIME-Version: 1.0
In-Reply-To: <20220427112857.7ddd7fc8@xps13>
X-Cookie: Buckle up!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_061131_135249_DEFA9AEF 
X-CRM114-Status: GOOD (  13.56  )
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
Content-Type: multipart/mixed; boundary="===============6214460664119757312=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6214460664119757312==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3/axAlvjop7jo6tE"
Content-Disposition: inline


--3/axAlvjop7jo6tE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 11:28:57AM +0200, Miquel Raynal wrote:

> The patch actually look independent, so if it's fine for you I can take
> the two mtd patches and let you merge the spi/binding changes.

> Would this work for you?

That sounds great.

--3/axAlvjop7jo6tE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpQPkACgkQJNaLcl1U
h9D1ngf/VxXyRrmMrFHXOQIT/K9jzEroGCHRoT3IkpzG2UwCERVkL3XY1VX8Bem6
oeIQERn5z5pFMCvgeLOWDvW4LuV0J0E2Wp9IjvFxdX8fA5K7Tbg3albH0isMfcUp
FZcnMXUynnhcg/dTJYMXHunlQH+8yv84MjxSqq1wDmrHWCy76vraVev5n2eoBdo9
fQ06pKoqMEgkf1ICdUnlW8i9Y8LgmlZSyj7iGRhfw3H2MxBIHVmi2TOdAYM2u/eC
sanKESRfPqRjsbK6kkTy4oePpH0uR+aRLqzqtX9qcF/Wnw+A+WZBc8gQPZZqLvjX
9YGhLRk4sIgGwjyxbojuoeAw+pqSrA==
=3uM/
-----END PGP SIGNATURE-----

--3/axAlvjop7jo6tE--


--===============6214460664119757312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6214460664119757312==--

