Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FEEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L14nucSxm0vGDRDtB3pa/ApDVdXEo2TCcQtw7W2i6e4=; b=0o1uYnUzCTYeLi8NavJ9OfjU8Y
	MDZXQEQQjq2f5NT61+WcpxUhc3PnB6opN5YZEhm3U7ZJcHF6/QfUKn39St79uB2yLAM/6h81sd32h
	sFQJureYLroJYVxdyZQU5Apy27ykS4W2QLe5zXaImvrv7hljOLaddPgcp3Yu82IcSjvFLDxrY7Dyw
	bMJEMtyi/gdYStUApgG8FUvdBMdsaFpoaq2RLO/2482W6qwF/5kqJmVBw9XKrWPw0hWByornOxfGQ
	vIVuj+wRrIMj+excy6rfgnb+c/5DwuLvWXu62NvYKlUYHmEz8Did5Do50CH0BE9SJIl6RCOvNvI+8
	2b8L81Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njiQc-001kBa-HL; Wed, 27 Apr 2022 14:14:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njiQQ-001k8b-JT; Wed, 27 Apr 2022 14:13:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1260361DD1;
 Wed, 27 Apr 2022 14:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34185C385A9;
 Wed, 27 Apr 2022 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651068829;
 bh=YRr62X1KC5ng1LU4kmCYYrPiYAa/FMG0PmYtGBvTSd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jp0majI7UjWwC8FLYui36TU6U/wwA7CUyylwj6NAoHTeojNVT550lHLbgA9aJK/wQ
 FZPc6pqY5naKiec48+BKfQ0t/jX/vAdL0OtqiAX8k19DOMyKpVTnW2Ktdsp96uu7rX
 v4O6lToN80jNleN/6Esd/qgLAGp8P9d1mlG4pLM9rpCsXZARsaAJwG4y2QZgQ9PClm
 vy7yzzSgGcmZvjTBUVl7NsoFkbM6BCfH1kMJaDukYik5lpdF0umPockeea8qrSdSG9
 2JXUx3CRyi7l32931F9MEKFdqS271YDlMhQGk8QO4hYB2viStfjD+TiF90nywvNTh9
 5n49mp5csBdgg==
Date: Wed, 27 Apr 2022 15:13:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
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
Message-ID: <YmlPlhKTrRXZo/Sx@sirena.org.uk>
References: <20220424032527.673605-1-gch981213@gmail.com>
 <20220427112857.7ddd7fc8@xps13>
 <CAJsYDV+DfBEmWr7D1aO8F=3WMurAg6aEhf5gY86BXOUSyJ2nXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJsYDV+DfBEmWr7D1aO8F=3WMurAg6aEhf5gY86BXOUSyJ2nXA@mail.gmail.com>
X-Cookie: Buckle up!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_071350_714744_A0FFE1EE 
X-CRM114-Status: GOOD (  16.13  )
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
Content-Type: multipart/mixed; boundary="===============8834898339500825676=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8834898339500825676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4i1ELcqcSD2FWPzu"
Content-Disposition: inline


--4i1ELcqcSD2FWPzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 10:04:57PM +0800, Chuanhong Guo wrote:
> On Wed, Apr 27, 2022 at 5:29 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > The patch actually look independent, so if it's fine for you I can take
> > the two mtd patches and let you merge the spi/binding changes.

> Out of curiosity:
> Wouldn't that break the build for spi subsystem? Because...

> > >  rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

> The spi driver needs this header file which is moved in the mtd patch.

Ah, that'll be an issue indeed - if I could get a signed tag with the
dependency in it I can go ahead with the SPI bits?

--4i1ELcqcSD2FWPzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpT5UACgkQJNaLcl1U
h9CoCggAgr/UCrnXyGYR548Hq8CNekwM2Sb0hIKaUwNi7p1ZqciUlWwzMJKtAYrV
ZTgWlLGUMY476SBCyrtHlucuB+DKBwCikrUnMMsEk39+pMEXSNPdKLnjG7hqd6Qr
u/8Px3mAdyBzOgdcIlxcTl8kgIvR+aqMSzkjsRJaZ3csuqCnN8NVQAHJ+yLBqkrg
bEr083uX8PyGSTCQc+v7HaMXce143J8bJYj0lFWJ23znLRf4Lb6PemUQhcoXCF2H
d+3GC4HLLB9cUfyTT5FqxE17wgACp6rjjIMuSc7BgTmwM9g61EfIqVjUYtRpTBTm
980Mme+EQalOui5TWB1hYXW0VXicHQ==
=2Qhu
-----END PGP SIGNATURE-----

--4i1ELcqcSD2FWPzu--


--===============8834898339500825676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8834898339500825676==--

