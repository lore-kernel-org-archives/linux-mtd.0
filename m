Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7531C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfq0QdDUI6zkWojV9YzyHZbrb10cUHimjIg3B/0IGKk=; b=JtbuQvH+QUMhsmg/fZk5uEbSJ1
	/Jc//J6b0CtMpMXmRxaV4f5XP2RZgpB1568XAloaldi41CjLkHk1vlnlRcOFWXYAAUYCeqKP+lr+/
	hxRUzFjPR4lpoH5e7jISzhfjcWzs6BBCdbHIyxomVa0lGiGFltBIKtGKXbTCs4qrgXbDKerYd2kF0
	Ibh98ZT2r5aiEABiwpGRcz3xYbB+T1SH+TjSwm56O3WoSBSYdvp7nOrBiod601klH6z3QVHcixL6z
	qSxkHi+YfJLjdDn0D6b6gVugoATVCMmotj0ppVqCckURVj9oAWVXJRCD9+PxxqoyYGHh+bC9L5fll
	byg3SPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXfp-0056Fw-RM; Thu, 06 Oct 2022 20:40:53 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXfn-0056Ee-69
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 20:40:52 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 5BF3B5C00BA;
	Thu,  6 Oct 2022 16:40:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 06 Oct 2022 16:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1665088850; x=1665175250; bh=de59dSNQPp
	7lYzDS7scAquZbLIpMTBkfanJfxPS4kG8=; b=cQRy2TO3+9hXOKUKMRVrXIDBbc
	yrk4Ydbu7zfxCehfhP/ofFZvZ4Hsx6o8QEZmiWH9KaZI00b82T0liEUNE05FPFAt
	uMq0Z3+BP9f0RIvmOad6PGR7MIeZV2i+2eJDWX2+Kz7C4hXYcvOQ60pXfhJRwrU9
	LsGK/fLDkQPM71v5eqVjIYFlUnmwSio24zjx/ipgxI9n+ixwAmqgXLhNEbjkjmY6
	V4t8PgS/QDKORUGl59Bn/MaX3qaon/uu+vCzpO4Xu9xCgRTT296kR1qWgZgEhYGq
	afWO5oVwyiC5CiosoO7W0DEk34U77q7wEl/tQaLkOgdjt+HF6kEljAKNKx+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1665088850; x=1665175250; bh=de59dSNQPp7lYzDS7scAquZbLIpM
	TBkfanJfxPS4kG8=; b=VTuTJJ8CKhVA1uFRqwkHT82E+Ha9Ib2fHfkqFIEO0ydV
	Rr+dHHQ4ctRuh+BD1Tt4cksvKL4QiEbqcXS9rgftHey5iZ0Mx58zK+esYQN0pbWf
	8Lq+54c84SnB3kB16WfOm6ZuKVQIpG+lKpLtnllXYrZV90Vb/TN14iK4bLwGmL7K
	PteYxYy3rYom3Z34E47+2YsB4fYOfgJkxgiWnpsnL2zjTd29ji8wP64zY+fGNz+M
	BiuiHyCbbcu+BHvsHpvfDiyaoBvYeXOILrc8Kk2oe3vWURgT/PCQi1NYj7KKBep9
	e1c3ZR0U2an9bQUO2eHRAC5xFmpCvHutX4m+sgUMUw==
X-ME-Sender: <xms:UT0_Y8WpjKSrGH3yeYdFN569T-SCD78DGHWyyhWzEhXiAQYOewlEoA>
    <xme:UT0_Ywlj_Q-sku_GbT3B7kQr6_aNp7sc9b3bLKT1JFjbxDEHuMUPTacopiZ20wnik
    ZdLHzPKsIJy11J4C3A>
X-ME-Received: <xmr:UT0_YwaZiYerCBwjRJSAM5TN0sHMIZ5FiQ95ql-ZfZIvaIOgn-XupDefpcXk6JIVULAe_IzdCK46vaycr71XsStl9EivpXVv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeihedgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:UT0_Y7X3fN_5Zukbr9ECB6xbRRgHbSPucxdHlRrE2OaNG6F6xLueNg>
    <xmx:UT0_Y2na4fvqPhjwFtdDGMTKMM_X3NHEV-PLhJfRHeTWi_PlXge1gg>
    <xmx:UT0_YwfxFhH3-akInXPFZvR1U4a-J0Bf9YkytUadfm0qPdutEh8tAQ>
    <xmx:Uj0_Y_fYB6BYUt_gsDWoVAztIPI4GCvCGqDhqTLRLNt0CNrYAJM-ng>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 16:40:49 -0400 (EDT)
Date: Thu, 6 Oct 2022 15:40:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Walle <michael@walle.cc>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	~sircmpwn/email-test-drive@lists.sr.ht, garnermic@fb.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for w25q01jv-im
Message-ID: <Yz89UJsFJBMaTxuy@heinlein>
References: <20221006070841.2106194-1-Delphine_CC_Chiu@Wiwynn.com>
 <0dde4fa6ddeefa23314dbdcd1dd1b28b@walle.cc>
MIME-Version: 1.0
In-Reply-To: <0dde4fa6ddeefa23314dbdcd1dd1b28b@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_134051_320683_FEC1AB07 
X-CRM114-Status: GOOD (  18.47  )
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
Content-Type: multipart/mixed; boundary="===============4292415130283183582=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4292415130283183582==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pjTEFctmrz8zr3LU"
Content-Disposition: inline


--pjTEFctmrz8zr3LU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 01:52:33PM +0200, Michael Walle wrote:
> Hi,
>=20
> Am 2022-10-06 09:08, schrieb Delphine CC Chiu:
> > Add support for winbond w25q01jv-im chip.
> >=20
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > ---
> >  drivers/mtd/spi-nor/winbond.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/mtd/spi-nor/winbond.c=20
> > b/drivers/mtd/spi-nor/winbond.c
> > index ffaa24055259..2b02b05ceb0a 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -139,6 +139,9 @@ static const struct flash_info winbond_nor_parts[]=
=20
> > =3D {
> >  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> >  			      SPI_NOR_QUAD_READ) },
> > +	{ "w25q01jv-im", INFO(0xef7021, 0, 64 * 1024, 2048)
>=20
> The name should be w25q01jvm.
>=20
> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> > +			      SPI_NOR_QUAD_READ) },
>=20
> That flash should support SFDP, so please try the following:
> +	{ "w25q01jvm", INFO(0xef7021, 0, 0, 0) PARSE_SFDP },

It seems like QEMU doesn't support SFDP yet.  Is using PARSE_SFDP a hard
requirement or can we delay until the QEMU support can be written?

--=20
Patrick Williams

--pjTEFctmrz8zr3LU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM/PU4ACgkQqwNHzC0A
wRmpJw/+Np3IEKkaJrHkeGBaf2O57oTxLMumWGxDCWV/tu3k6J9K6k7T5opE6zBA
DHkPs7pnvSsZoGHXQYo179cNsSfX1qgOIBPiLAo0PyI0CgW73GSWt3kRlafJv38l
bb9j/vr+uXb8+k62npuX+9iM04gcRU4geAj9gVYnMHmVkUr9Ma/33vGHrkfM3sLk
c3OHdZG+cvsVTRJiatoSyrHm+S+yvkMVH7Ztw8z9WTH4/ANi26CsggapMUYANc8T
5Aa7Jtbasx2I7xTboNkioKe4Ah9O4EmwKoohChuK9mwlFI1zBFltzjjVVOkc0gfm
pMzsmz9PQriatqEAB4je+SHd4WSoDs3t3iKWReFx2rOAjUM8CRZATqAtWrv/1HUL
K/4T6wXMgLLrMU5t3bIyncHS30KiFpq76ZRq6MNicf0De1C+HBoJjSWlBSlvJ8VN
dXCBhIvzpc3nq62Mab1lWwyTn5ggTD8ZHXjr24lg2E5i44NMUMACrv/Br5osOihH
QqDmY0hAAIyggxMR90f799lsVfL4iVtovwKXi7Ud+2z1OlPZiJ2vX6Q8udxvXVVP
tIgWHecZ9d1/ZLLGoipYzGxYgoR+9EI1vYGhTJt+EvAWyG6DAs1bS3XThASli6j7
yVetrfPHlLT8rYMYvqXOd0TH12YoINOZnOs9qrn7qxkWtWxKX8o=
=f5UJ
-----END PGP SIGNATURE-----

--pjTEFctmrz8zr3LU--


--===============4292415130283183582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4292415130283183582==--

