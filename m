Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5CBC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16EB32133D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fvj4rOmd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="MReoCFng"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16EB32133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aGjJjricxD6d6qXuTBQy6OjB3oq8k/anY/2utMEfXsI=; b=Fvj4rOmdLcgIlXJnMLWp5wzAp
	d+yEDkqZhXpTS5YWx4WErfGBZ+a/jIRwAttOUW/age47dYqI0ZafKvH5umtwoxYoACeJQ7U5j4IYB
	MTfzbrWAYMokH3I7bEAUIo6GWNtakvqhh6nllGVBC7fwqL7hevv1iJqM3Z12xOCllseWe0EeBThhl
	TimFMn+yHTpW7SJI0ksbUEQYoa5YztfjYfdDFP3G3dB8FxDCbtnvTJ2c2LmIozXPWZ9yZW42czcnU
	zzkvdZ9O22+MpMpcRJ9Zo+JzwVx7hlZmP2+jp2hwtl7+xL8ePQ6akZW5xhZSGM+ECHFQeyKAv/Ye5
	bhHHGq2NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE9fm-0004bq-VZ; Wed, 10 Apr 2019 09:37:38 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE9fj-0004af-IL
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 09:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sTySuJ3uSEbYJqEtVFEIslJYrbNyzomjAmVxCe+9Q68=; b=MReoCFngLXipuXrWa74Axd2+L
 QvUYJ8EVl68TwQf9BTDYGfo1xGGm8WkObxZAvOBOKBpz6NMIlBCVrRhe3ih3bPLNz60pfdYxQ8o01
 GJBKfkAhFkTr6S/Ey25b7ddaiznHUYEuUWfbW8WW463z3+DIhVGCkeWnFfo3Wy+eQQPdY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hE9fR-0007Ju-9d; Wed, 10 Apr 2019 09:37:17 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id C15971128E83; Wed, 10 Apr 2019 10:37:16 +0100 (BST)
Date: Wed, 10 Apr 2019 10:37:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 3/4] spi: Add MFD for Macronix MX25F0A SPI controller
 driver
Message-ID: <20190410093716.GC6106@sirena.org.uk>
References: <1554777000-10542-1-git-send-email-masonccyang@mxic.com.tw>
 <1554777000-10542-4-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <1554777000-10542-4-git-send-email-masonccyang@mxic.com.tw>
X-Cookie: teamwork, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_023735_746172_E59E38A3 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, juliensu@mxic.com.tw,
 christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org,
 marcel.ziswiler@toradex.com, dwmw2@infradead.org, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com, robh+dt@kernel.org,
 geert@linux-m68k.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmal.com, liang.yang@amlogic.com, lee.jones@linaro.org,
 zhengxunli@mxic.com.tw
Content-Type: multipart/mixed; boundary="===============7943740534075861812=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7943740534075861812==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2019 at 10:29:59AM +0800, Mason Yang wrote:
> Add a MFD driver for Macronix MX25F0A SPI controller.
>=20
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/spi/spi-mxic.c | 275 +++++++++----------------------------------=
------

This isn't adding a new MFD driver, this is a substantial refactoring of
the SPI driver which doesn't touch SPI at all.

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlytuUsACgkQJNaLcl1U
h9AeQgf8Cq4PSo+iWmspUorVUXm+K5G5aUI3052g+2/+hl0mEaCt7grEKFmiY6ef
xWMpNCd1tocLecIJxAyiipHfJQDpA4hrpRhZaXkbJAG6LXwXfjK2l8YCnzHpSd43
zGBQvVlwNIpqjYv8/YmFXe92QFk6XNPhhofK83HennndKm5ZwjF+vJTa8ZDdPhR5
oikRqtPYEs9ONDwKPL0WRzWBq05uRoe7MjE6tfAqwahQC7paVJCgv40S51m7FUZQ
dv5NyqAfA+piR5zFrrk5QR3GEX3+Hh2pudJjRCSjY8QQkyULl4hT2ehjanj4uWj9
bH4xjLtxOcgcsSxo4wM6vyVNDEffnQ==
=oPnu
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--


--===============7943740534075861812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7943740534075861812==--

