Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900FEC48260
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Feb 2024 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNumP+EKeExn8bzkyCWRnb5wU8mDYtZQNTyEEHlI2wI=; b=gNNVhntJbRPmPBzY+UOb4YptqX
	tVl17Xi3dDYJHM7iD5xZ5wA/d1BrH+16Hx/LVbXkUBPAv11F5dhXPdPbpy7dT5fcoP1IPyludKUKn
	SJop6OXwGx8nyyY7v/TEWNl4ohrYfjNfJTdSXbqE/rfXN+dy/RnPWFklCKoKgkZ/CsJhiRVzEe7RY
	9KGV72LV2hyn8ncfPkOKFSj+8KSwMSYKvdfiGb+zwgWIVlJnIBQjIipKcabN7BNF7hhiE86uW0i8K
	gZ7jwuj1EtMkfbHzXCvplscWlWqjUktxhrRGttI//tXVnF67qN9cHIqGESmrQbDup8bdchBW9FD3B
	K9BX8/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYr4I-00000001rEU-0BWo;
	Sat, 10 Feb 2024 17:23:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYr4E-00000001rBQ-1S9T
	for linux-mtd@lists.infradead.org;
	Sat, 10 Feb 2024 17:23:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr3s-0003V7-AK; Sat, 10 Feb 2024 18:22:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr3n-005icH-Po; Sat, 10 Feb 2024 18:22:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr3n-002FSV-2F;
	Sat, 10 Feb 2024 18:22:39 +0100
Date: Sat, 10 Feb 2024 18:22:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Erick Archer <erick.archer@gmx.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Rob Herring <robh@kernel.org>, Li Zetao <lizetao1@huawei.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Prefer struct_size over open coded
 arithmetic
Message-ID: <vm3fk7wbqxjl3i6kmd3dv2ofeszjxrvi2n7cd3ohasgjpi4j4g@d3f6estk2xol>
References: <20240210161619.12656-1-erick.archer@gmx.com>
MIME-Version: 1.0
In-Reply-To: <20240210161619.12656-1-erick.archer@gmx.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_092306_396778_1B1C85C6 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: multipart/mixed; boundary="===============6730164421351543881=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6730164421351543881==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="346zxj37n4z5j2px"
Content-Disposition: inline


--346zxj37n4z5j2px
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 05:16:19PM +0100, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
>=20
> As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
> this structure ends in a flexible array:
>=20
> struct mtk_nfc_nand_chip {
> 	[...]
> 	u8 sels[] __counted_by(nsels);
> };
>=20
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> devm_kzalloc() function.
>=20
> This way, the code is more readable and more safer.

Unless you intend this non-English comparative: s/more safer/safer/

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--346zxj37n4z5j2px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXHsN4ACgkQj4D7WH0S
/k7uhggAkjErCNtMO9Tgeku9UEu3BBrTsCG6cirem2RU9oGOT4pbrCjRb2KCGYfU
q+/lrPRkB6Tp8aLA3ljD5QZbmSN4UY7IFFRjTPhs2QeCfLX4USL2es+P4oCbd32u
gZqw7aoZgZ1Gb05G5gboHeun8K3eEQE8eWfj1hq4BetoLNdq53tlW/csK98ayxPA
JmPsBOXq5MHiGDSNqb1gp85oNS2F3D+F5YortaxkPr4F3L17MG9XDezixApG/nTw
Uz2+EdFzM6BJN1Zac6t3Z2/6IaYa+aHE+ugdYp5aQIZ2NqiFaTHL7c9UfO85Zsi7
1fYuhJr1sBGrZoWF8QnOgiJmoDAtPA==
=Sihr
-----END PGP SIGNATURE-----

--346zxj37n4z5j2px--


--===============6730164421351543881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6730164421351543881==--

