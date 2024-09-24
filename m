Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B06CF9C6F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbciAxSCmxJJzfx8TyU8K6PInVC6ma3j0kMMwvRN9+s=; b=myNQ/ezT4cv0HaJ+xP7ad5AYo6
	33B6lLMV08ayHlqmIajCRg54kghw2DB1Uuk2jmZkShflLMNk2C7YjEDcLJeC94ybeLy84GXfxOFY4
	eEO1WUj4MW3ZYYzIvTc3xhJ+N2zk6AU+foenV+l+pL5yj8Vy+iSmrV9yHD7hjsU9HxReH1fnxwX/2
	GWt50/tmrkZFZm7jrzNykqReGIklD5opk7Q25/JzX/gXHbKvwMFbR+HXHSdr85ar+hfNiRRullbeB
	XOAHzLTlTYUdWYBzKYZdr84Xh4MKXXY8h0+dcGy6032SfyVXwLgY/kwQNug7Qbg9nl28HEkOQw8YZ
	DGn48lMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st3t2-00000002C4b-1WDC;
	Tue, 24 Sep 2024 11:39:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3rU-00000002BiU-1Ktk
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 11:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99C6B5C5BBA;
	Tue, 24 Sep 2024 11:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C50C4CEC7;
	Tue, 24 Sep 2024 11:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727177863;
	bh=KwPn7H71G2ESFvjUpQBXWz48W7zBVrAEDy6LelZAxM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iX/WtRo3FMDNEvHlQDBrAbSKLj8hZfWERieHkqN7WacQeBjjZNcb+llrZ25r7UOLC
	 ACZSjG3XV43H1aUkM88v//mhKAYm1Qlkij6/N/j32EG0xgoWMnjNxX7Nqh1lGPbKvg
	 /jcpX99zzVRCzTzPnA/2gJ9CfmmlQ1RqqRntpPn4YqLZ9VqHNR/Y6Mm38HdLxQrUzx
	 TqdiaEpCihv3i7ZMNQGTZ4zNwdk4wYZd8uLyWRXy+4zdoAnfHflns2LM8bmvPK1Qa6
	 hx/50HH71ygdxcdOeKgjNYA4W/khhLshCr5Spe5KarqXx0oQO2nNtcfgx7SsjuGMa6
	 0FSHpHv1inyTA==
Date: Tue, 24 Sep 2024 13:37:40 +0200
From: Mark Brown <broonie@kernel.org>
To: AlvinZhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw, AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v9 2/6] spi: spi-mem: Allow specifying the byte order in
 Octal DTR mode
Message-ID: <ZvKkhPf3gCYpqQF2@finisterre.sirena.org.uk>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-3-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240718034614.484018-3-alvinzhou.tw@gmail.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_043744_444774_01248DE4 
X-CRM114-Status: GOOD (  10.02  )
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
Content-Type: multipart/mixed; boundary="===============6244020537751160256=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6244020537751160256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rkJTPNj4LORPrGCV"
Content-Disposition: inline


--rkJTPNj4LORPrGCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 11:46:10AM +0800, AlvinZhou wrote:
> From: AlvinZhou <alvinzhou@mxic.com.tw>
>=20
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>=20
> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> boundary when configured in Octal DTR mode. The byte order of
> 16-bit words is swapped when read or written in Octal Double
> Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses

Acked-by: Mark Brown <broonie@kernel.org>

--rkJTPNj4LORPrGCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbypIMACgkQJNaLcl1U
h9CKUAf/dMY9j4bSZx1832KGGjShmasj2G7xkknbjgcczinSBwK1bJZ1KqJSqN8E
0HoKDomE4GO0WENZ/Rzg9CPgGntZ/O5wKUQeHkNkfAHVJgqKZ5PvB3ex3P7VAt1l
oXtHSKHcQrI7GwL/bI5YZGikp97PC1HkG3s+TnDKbi+aidtkSzrny5wVuLaYrz4E
wYCgEVwusWNFxQi2hqorFJukBKR2Ep5/Cl8jfbN7R0laKaZ+btW2c4V17FAJHV/m
7SMHmiQf5H+8cTz45hI9QVe38a1/hG+BRpZmxovfg48KvV/+Gx2LUC4r4QrNUXrH
SLjDzdeXXMMAihMbfo0kIdIsMYy8qQ==
=i85L
-----END PGP SIGNATURE-----

--rkJTPNj4LORPrGCV--


--===============6244020537751160256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6244020537751160256==--

