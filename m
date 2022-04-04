Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DAAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QtCNx1lxJudnz1BRhnO65kJ+rUsDWxKuyOd3r8alf8=; b=EiQ/WHqbRFSbgwCmi/Mon2vhCX
	KkS2TqMTcEKBssqtsQeUkx0H4j1vOYNlV4vlJEKLioieMOP9zwpZShy8bKR5QOJM+9ydlOGH+Ako1
	N77KCOSdIiuq+rVqnaJEeGQM1hs9uEiktHvc53dQkPeBhJVZVyQe+gK2g1XT5V4PuDIouQ6vQJ76j
	As8c47W7t6M8ea79BeAVPO4rlDqtgxVVifL6Ca5lOeG+VOZKZryE4DqJC0jwBH8YV7N2DmJ7vsl4p
	Og4osRUxTCPnq3vIhYE8aEgfHajbt4Ofjo+JEYwhXN0X9YAqc1XHpiFlmghpIZfbvarivnpYB8oQV
	kIQ2MOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbNK4-00FGLU-3T; Mon, 04 Apr 2022 14:04:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbNJs-00FGHy-6R; Mon, 04 Apr 2022 14:04:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C332B8170B;
 Mon,  4 Apr 2022 14:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5C3C340EE;
 Mon,  4 Apr 2022 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649081072;
 bh=+YodnbKNfkD+6Cay2I53zzP9Fet7F7fDGOH+q3ST2WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgkScUB9MqKjZwqfpE1regXlQ5YzXGwZsjnqo4dN0muVS235eUAjnw+BKIJMC3P4m
 z3OHgXZpTOB/WHZYJA9jUwZzTmJMOfGhlDEdCeTQBFZwBNyKINzUgpQKS7N9cgTE2t
 2G5Sbbdk0eOTP5DXRKBy9PSppWpPGWb8xPvzHh65q1nQ5gGnS+LN3ubFpTGJ+HcY5Q
 Wo6wNLTqeOCXaF+xSe11nzC86MLLXuMbYh0aSPF7hzFPIazdaUw5VM4TDyTXCcL+lT
 fNKMei4vhBaiGivTLUqzE0n4UGyL6/BR7ZN3io5o+HtGVmolDL8eSoEDVPFMRnH1Rn
 EprzCWdbSK/tQ==
Date: Mon, 4 Apr 2022 15:04:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Message-ID: <Ykr66c+KEaO8vltj@sirena.org.uk>
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <14c921b5-4240-a026-252a-d5fb60836b34@linaro.org>
MIME-Version: 1.0
In-Reply-To: <14c921b5-4240-a026-252a-d5fb60836b34@linaro.org>
X-Cookie: Did I say I was a sardine?  Or a bus???
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_070436_431694_CF3DA4B1 
X-CRM114-Status: GOOD (  13.53  )
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
Content-Type: multipart/mixed; boundary="===============5296322034758487369=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5296322034758487369==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/iF9jkJodygiQRcM"
Content-Disposition: inline


--/iF9jkJodygiQRcM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 04, 2022 at 03:52:19PM +0200, Krzysztof Kozlowski wrote:
> On 04/04/2022 15:18, Chuanhong Guo wrote:

> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - ecc-engine

> Slightly slow down resends (max 1 per day). You sent v3 without giving a
> chance to review this.

> Wrong name here.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--/iF9jkJodygiQRcM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJK+ugACgkQJNaLcl1U
h9DovAf9FvUfyz38jWX01k0PPwcjlxGKC4qUprMZogZ5XZdSB9lbzlD1miFEYdQz
UmBtAiLNTO9ZfPHJnyV5Wl2Xkdfoc8+InivnS9xjXylc98GlA5FHzjTEiSiJz8ZU
k0lp3kaJX6E0Q76hUKDEt66W3Su90IfnKfOal2MuUzS2JGIeR0zE8bQneXElLoAw
cXKz/Xz6py2LiOtIoJ86NRLOV9h0lGFgRmKgG0CAIV7a+xPpkfBpxrX2dFKtZKYw
/sBjRC5tpXdt1TFrzhgkKPH2srhbxZXmIZmtgjId78zdrF2vX5GJJiYs19dc/7jq
tOAfJXMJ8GTUrroa2H6zauEsIlxtJA==
=yGjl
-----END PGP SIGNATURE-----

--/iF9jkJodygiQRcM--


--===============5296322034758487369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5296322034758487369==--

