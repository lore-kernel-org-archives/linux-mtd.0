Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579F5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbvEXOmXKnEB9izuRXyDScxXSoumaVu9WRk7AD9t3T0=; b=gfCZ0olVRpiMNagTHPrQrR4TSY
	wAOqzFXJxLiLCpRStWSO9i9m/CnJL9G/vzHeRXpMhfAeItGAh1W3vamZIHgtuH82CkwYsC+SFHhQY
	lPKzrTXalBeAfiAmdQCVMrFptmhNjQS/WIS3mrLxMNl8q1KbQP0MJkVzXtW1gJf66ko6Ygjv1B48E
	Cik1hka4z6F8MOWH2DrS9O9tOv8SvMTrOoCLu9lkRYURmza/AbiZZrFCi4FvCATYKETyTPdBvPsNm
	AItHgbsjptCIOsIjL/M0gCQn7scNMWWIlEsXcgkoW3wWH29a4pDxivj6VAFvSDFsqJ08TlqLiatTc
	1aaI8tVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZHYm-00DLzv-Mr; Tue, 29 Mar 2022 19:31:20 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZHYg-00DLzM-2r
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2022 19:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=knNYMZEU69NMfpQ4m1rH0jsDGANi
 5zCmvpltFrEzd28=; b=lsWefx/liGK71ItGFC+CnZIEW36Kr8g3igLmsjFLK3M2
 k5S0rlO4S6q6NWmA9hrYHnJu4/mlcfst+a3fyndzSogNfXTH8rVlqYcp7qlFEgd9
 VpDvkdfgwzM7NJ2Dffv15QZC1bYPruh0c/oFeo7Y2W8zv+nOhe5MnkW6hOTfQp8=
Received: (qmail 1912200 invoked from network); 29 Mar 2022 21:31:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Mar 2022 21:31:11 +0200
X-UD-Smtp-Session: l3s3148p1@EtKmeGDbiOIgAQnoAFHmAKSkhU0Puvxy
Date: Tue, 29 Mar 2022 21:31:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: rpc-if: Fix RPM imbalance in probe error path
Message-ID: <YkNef6Vkj3yWKLpF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
 <1c78a1f447d019bb66b6e7787f520ae78821e2ae.1648562287.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <1c78a1f447d019bb66b6e7787f520ae78821e2ae.1648562287.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_123114_435850_556AE591 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: multipart/mixed; boundary="===============8348689863800753272=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8348689863800753272==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p/R0G50SrYfB5ovU"
Content-Disposition: inline


--p/R0G50SrYfB5ovU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 04:00:39PM +0200, Geert Uytterhoeven wrote:
> If rpcif_hw_init() fails, Runtime PM is left enabled.
>=20
> Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--p/R0G50SrYfB5ovU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJDXn4ACgkQFA3kzBSg
KbYKHg//aEF5Ckun5neyJ3R7yRbUM5LIIQ4YUw1bqJ3qwDioYlnwR00wE968ZJJ7
X7dkJ+1MBGsU91h8diz1+YZvlO6c8IHbigM3efwFzy21NcVxu7I14Wb/7s068BEC
fDC4Rf7Ph8ajJNVXn4eO/ciwTi22zHgyfSTdlgATd4fI6IrDe2t5dcga7P0tBwWe
4lta3qbC1+iFdMJC8ohmlL0Un9UUy5UjyL2UTTEL7z23EjUSwtEWvGe8lr99HF1/
8CFVnzvWWk/EYwOX6LEvdMRQHpuwJNMi8qZ6cuUnDc/og/fxuTOHlwemF5JZNW7I
ZXJ8mUkf4t0WWpkNPSN/VDityv42rdGDiNBGA6N63qVfSe56GKGqtU8Hg0pcYNFG
O48z9VjIFLuPRBRFU0y+Yo42jNJBkxnAY/H5ZQpTRe+Jivqqf3p3Umu21UNG+2WH
52lXhDH9MOk2ijkOSV9WDhgnctg0yqcLa41mGv5Q1f4vEOQnB7H+AQxbdQo3wXXJ
dcXrXVvHGLZ/VOnXpNurcqqp3FwwLg9/1NOd/SSmZAKbIz1cSmI/H98f+F5ioqDr
HWvlddjv/2w2i9n9tZVDx5wSZUix8hn8wtFBcISQdV7h+9ymvFN0/gEEuXoDA8W6
LrEt3M0h42NXC6Oa1uYegMP5dsaxFDibA1WsxaAEy41fw0OAM40=
=5+x/
-----END PGP SIGNATURE-----

--p/R0G50SrYfB5ovU--


--===============8348689863800753272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8348689863800753272==--

