Return-Path: <SRS0=vbdM=HB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19437C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 18:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72A364E11
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 18:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72A364E11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O0uJueszN1hKL/soC3PmKG/+LruBvffXJhY9g65sF/M=; b=boiKjq7EeQih/3NbRDr2RWUel
	UYYHu2w7dCTFIGnQJW/pm45mwEDa3Nk3U2r2NIhWK7WI+K4mQ1sxHDK21fLLuS3xFGYPRgg9zVymk
	NGyMTGc+gBRu3NAiq21LDqMmMvgvJTTp0NnKQ9q31gKES+ZRqvi5auk1QMfzaCFDVXwcDCpg7zijq
	BcA2YBCHA9p01YD0lVdT0AtYyZS4WRuayWhDsLDglBrCEMGiox3Yr/y3Vvv6+j7iwZ0jSEJ0hw0CW
	RjBIBRQYQn+43K/XHfvjru71eUKH+mMKQ9SFLe4zhx6t/KRJex2ouxQSOW2qtNq3pxgIhw3q0fAo9
	OvgXjZ5Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5vKF-0001oH-50; Sat, 30 Jan 2021 18:50:27 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5vK8-0001me-LB
 for linux-mtd@lists.infradead.org; Sat, 30 Jan 2021 18:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612032591;
 bh=pclPnpYLdC+dLvepA/sMNjeeUKX1+hC69GlNQVNIAog=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aqdM5+/6kn5DSgRSlEajDDKJ1+Oejya3kyzwQpo9Qxu1nk/vMdxSTI5jKMgZDDklP
 NtC0bOkepM7I4F1G8VVWyBgqBXgyeMBopgSi4Napylx8yE3mE5Dtto3G+fhOcplygw
 N8SlSU7S345JT1nTUbOAHhab1pH1xGs1QUJNj6h8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1lsoiD0nCc-00w1AD; Sat, 30
 Jan 2021 19:49:51 +0100
Date: Sat, 30 Jan 2021 19:49:49 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v1] mtd: spi-nor: core: fix/remove references to spi-nor.c
Message-ID: <YBWqTRLCfXyKNptd@latitude>
References: <20210126092516.1431913-1-f.suligoi@asem.it>
MIME-Version: 1.0
In-Reply-To: <20210126092516.1431913-1-f.suligoi@asem.it>
X-Provags-ID: V03:K1:V66xgt7nTLghDjmzC9TWw+/LZoNamcHZ1uDpCoUn3hoFn7nokFy
 5OPeAczuXCgsu3egzEuDMZR+kHcU56XSE4FgXnHGYZZ7g9JkmIFoCeapodHN37owK3TpzLu
 H3ITIQCheOXOB5EXOB6rj7js/+k8zGTWCPZj1avnpxHZD8wQwcUJEELoUIa/A4CSGYGH6aa
 rJWmefanGHcCltzbY/Cow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WiEUPf7FMRc=:DJVkcdsJp2PoVokcHLbwOl
 dXA4HEMPzky5gzVUd/bCkyTgpnbPGLKo10qSXqp9w9PxrgX6Qs8B2WvnoA3e7+AuXVZQO0Qoe
 RRsKIYlb1Kbdo/mk77ytzUfHG/Bp9Yi7NgiuTMnTAa9GSy4mHxm9CwgRRLjaqswVY0Ga99m4E
 YrS9jqSSgN/SMtttqvvZukN9tRbxtMAVufykN93oQufN8T6UOR24AEXY14FXuf6w+6hEYTzoT
 gjRay8hCUrqclvroxi3yvwFmQ1dSHeagTS2HEpZXxSgvYyG6utfgi16nroKcnH7HBWcvwBesU
 /y/h7ydiPdKbLoi3x3aAZlK+HcrV2HmYLm0/sZ5iCYA+LnLn4EQpKO4rh2jX1IrTsOuFgqNdR
 7HZ8PhGScRPBXLeI1SpT0BdfX9wZg/HwpK7XVqpfxXNnl5D1n4lg/Z57NMMFvZmn7exJ8hccm
 lkzlITT1S1AvKeBT/x/jfpHl6bWNsUSvD6Isl9XFafnR+3o/iw31WHSyOy2DcQvI6QpO1KvKC
 l/7PE3pxxgkySYbdhi6qJD/iUeDB+ixgUGmyfzKNDTo9ULpo7dsgwtRJtiHXc/yKNkGIteHiD
 zsG/VDPrcTb4mSRkJYFOoJ+rUUWoKYUDvYvaZekgFiIzISLBe5yNa37Zd0cnglqSDrX4HKfcg
 jFTVCyIbersobWr0bgEVdqQbjhxZN0Kdl7i3TDYgSVky5CqoxkfzvpStvkepyqr8ofJplu1h/
 ZTKgFxmwFB9yyY8H/na22032BBxuFFLI4e8Deo5bPgZoQ0CcX4Qumjx/mxmz/3jnLOq4vXk5q
 1c6NJpYLEedVSAq54Pu/+Nrt98wMIFEmwpbt4BzUalU4BQY6mELkf4mJuMp+FwkG61EHeFbXo
 DN1sv9Wl8ysB/8R3lOAg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_135021_006788_33349B1C 
X-CRM114-Status: GOOD (  25.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-doc@vger.kernel.org,
 Jonathan Neuschaefer <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: multipart/mixed; boundary="===============5323212754877670604=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5323212754877670604==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wI9p3h9l5IyRJxxJ"
Content-Disposition: inline


--wI9p3h9l5IyRJxxJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 10:25:16AM +0100, Flavio Suligoi wrote:
> The old file:
>=20
> drivers/mtd/spi-nor/spi-nor.c
>=20
> is not more present and now some of its code is
> contained in:
>=20
> drivers/mtd/spi-nor/core.c
>=20
> This patch fix/remove the references to the old
> spi-nor.c file.
>=20
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Thanks.


>  Documentation/driver-api/mtd/spi-nor.rst | 2 +-
>  drivers/mtd/spi-nor/core.c               | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/dri=
ver-api/mtd/spi-nor.rst
> index 4a3adca417fd..bf2db371d3fb 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst
> @@ -61,7 +61,7 @@ Part III - How can drivers use the framework?
> =20
>  The main API is spi_nor_scan(). Before you call the hook, a driver should
>  initialize the necessary fields for spi_nor{}. Please see
> -drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-q=
spi.c
> +drivers/mtd/spi-nor/core.c for detail. Please also refer to spi-fsl-qspi=
=2Ec
>  when you want to write a new driver for a SPI NOR controller.
>  Another API is spi_nor_restore(), this is used to restore the status of =
SPI
>  flash chip such as addressing mode. Call it whenever detach the driver f=
rom
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 20df44b753da..6ae7d4c2d2b6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3701,8 +3701,8 @@ static void spi_nor_shutdown(struct spi_mem *spimem)
>   * encourage new users to add support to the spi-nor library, and simply=
 bind
>   * against a generic string here (e.g., "jedec,spi-nor").
>   *
> - * Many flash names are kept here in this list (as well as in spi-nor.c)=
 to
> - * keep them available as module aliases for existing platforms.
> + * Many flash names are kept here in this list to keep them available
> + * as module aliases for existing platforms.
>   */
>  static const struct spi_device_id spi_nor_dev_ids[] =3D {
>  	/*
> --=20
> 2.25.1
>=20

--wI9p3h9l5IyRJxxJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmAVqj8ACgkQCDBEmo7z
X9uYtQ/+Kyf6rbT8uYEzJDIpKYjRo1XokEoanbc2YkMTFeZiFLCH4XnNTl26QeBo
TDTxGZ6SXWbH7e1hYnu5nEHPA/Ld56ah3kZvC1ncNWAiPxj5dlnYabs13u5NjpoI
Dehw2xVq7Cj5XhOsItu7SgcVL/agydg72xgoEXOEXejrD2d4TFGp3a2KfGu33Fh2
7oN25wb8P06wJPrM8aWZWC5jb+iDDOURsJD32bXDufGKISF09UrbLvpo3+H5LL8F
SVGYOvaFidk8sEHb65Lp91lyG4EMicZM7ItHtmkLKAhBaCgE2wrBVqoeFsWO0TBe
4ONikf9nZMGKaIHhG6i8+ou2xcKvx00ilpTvSxUCOPbSmwkUbTnFnDWfKm+2gpGP
nRCSfhybqoVV55iMjVsnpkVS5laahk+nIY0M9U+GjEX0bSzDPcsDpmH7PrczIoHx
3TxWNfe1auFbAuLT0zGdtgcw0jujdVPe8qWggeVbnxp2t+tecylx5lep6NgxS7Tj
Yxqmuv+l+rtZhetcbIqLZ/tpKPaMD9hTpP7iM8gUTBL6xaaxbLuZgRpkjFZCO6Vb
3CK6rwqE2uG73Ut5Ln32GyBwl8etpw+StMn4QA0urLK6f0QIApJXqEQM8t/wSRoz
t/OJRElGzFBj3sL1YmMl3FyeBMfzO50/eFcgIJPit3y4UYIdPV4=
=q3ZK
-----END PGP SIGNATURE-----

--wI9p3h9l5IyRJxxJ--


--===============5323212754877670604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5323212754877670604==--

