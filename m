Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E510C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F9861A0B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59F9861A0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDejuDBv2b8zFqqJxCwfDWQlfaDf/rwKbPBfgQXnHSw=; b=ou5puAnADhR6wQ/nfVW3elI+de
	aAoDTfXSLPOnipTQ6kdkvbP4hdjLeZWbpjVECSGnmtA0YCxPP3iCSDd3wryWuMvOytzAgB5or87wU
	yOpRjNrg2aLp4cu7FvtYhFOA1mHQTHLN7OVOGs/t9GC0UEAG/miN7kpMI1Ix4my1NYnTYNwFV/mQw
	ItHswRJ5Rxee7hMGEtqWuTqR85qB6M140ewAvRabyN6alb4hMn2YSI3jlMjoGTMG9rBTFTVRWe3/j
	I/dMluWYoqfWvdWfj3JawTpYzQPeftkaDk49Cg3cknYLjeSY2VLotyhrFQg4c0n9FmbS8Upm7tiql
	8fFLxyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVxLO-00EoUZ-V4; Thu, 30 Sep 2021 14:47:31 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVxHg-00EmwW-Vs
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 14:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=zC0Alauy1GO2I9lyHxa0EfxWQbz8
 B2+rwQmkFWLZr+w=; b=pVciIik0p6VGP3udU6MCYIxqkKUY8GygzNDt3dr10lV1
 x766ShUFEUcOvUJT65QToDAgeM8MTBAN3nLWv1gKhosWZiBdpwhLI31NzKU6ardB
 2v2fqIabltyNPKTFY3nKtuwAJL8h5q1XgxJhMgOC2zsX3STrgNcsJ+6LS1ULl/Y=
Received: (qmail 2114006 invoked from network); 30 Sep 2021 16:43:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Sep 2021 16:43:37 +0200
X-UD-Smtp-Session: l3s3148p1@9OrLeDfNOoYgARa4RV6LAWawlO8I9jL3
Date: Thu, 30 Sep 2021 16:43:37 +0200
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
Subject: Re: [PATCH 5/6] memory: renesas-rpc-if: Drop usage of
 RPCIF_DIRMAP_SIZE macro
Message-ID: <YVXNGTfOdMgkqxPT@shikoro>
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
 <20210928140721.8805-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXBwx7rxJLRhlTI@shikoro>
 <CA+V-a8sZ0qudhbV7Fart-puNQO-ZHhDEG3OdRH=w_dbTHy2A7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8sZ0qudhbV7Fart-puNQO-ZHhDEG3OdRH=w_dbTHy2A7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_074341_364952_DA8387A5 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3566811273552302749=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3566811273552302749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+vXGT369GaKLNZZk"
Content-Disposition: inline


--+vXGT369GaKLNZZk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Both the fixes would apply to the first patch itself i.e. when
> resource_size was added in ca7d8b980b67 and later in 59e27d7c94aa
> resource_size was moved online below (this would cause kernel panic
> res is NULL). Do you agree?

Yes. I do wonder a little if we need the Fixes tag for ca7d8b980b67
because we fix 59e27d7c94aa which already fixes ca7d8b980b67, so there
is a chain. But maybe redundancy doesn't hurt here. I don't mind.


--+vXGT369GaKLNZZk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFVzRgACgkQFA3kzBSg
Kba5Ag/+Nh2/+1ZBUs5G25GPrGF4qipbPyFFYvcGBkQ5Mx+GsiS9Z6jPdM3kjylF
+suiOYdPxy4HsRrZuu43cSb3SCK9Liem2sE1hvd3HmWk6jEhctIpKWzVBXEYahHS
g+BqPhcwQVEYlZCC6k46ByedC+E9IgSR6/of2J+3lVqVnH3iZhQjC5lAyan70za3
9Zo8mTCxqhaugRFrVl9tROKrQ6Kh1tYwQ7cRWvUbXS5Cx813m19TPXs+ieXFQTIq
KR3j3xAbkLSNjr+Y6Nlz6/4gcbF+FL9Y2u2/ey7Vku1ER6gwjpREkx0vVa9Dhi6K
HOoRCI1bP/4T7IuTJ4Nsz2Wlram+VfwqaEv5PLmzquWnOmWY8IqXhiC2JtR5FqoM
zbZbqVvAdrGLI8Ca+ogT4BDxB06JlZkgOW3454Nfw5xNNW1mc05Yoy45uTLvN5sf
LHrkLQ5HH3yxbbSl5bTAeUz2SWj8rHoCG4a/THVwY9sdd/iBV+mQlsGWd4XV++ES
zydPwjo37x04T/95dRpOOMqXeB5Ob5j0V2Dki1+hCTsHLmS2Gy1wrjhPKGR4C9RI
JC8s9wmC9dFgbcmNZGqdWyVA/0L9h7u2XdZR+nQb7ZTuHlbNoa44gElHaCOS4i4U
opohmx5AwY2ItrBcROWpTF7GMGRO+eyRn1I2kFLrCvJKJmA4wXE=
=nHUc
-----END PGP SIGNATURE-----

--+vXGT369GaKLNZZk--


--===============3566811273552302749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3566811273552302749==--

