Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C37CC67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2LqYycrDn6SpbSVhYM4oeunCV9vLNHeAJcTb9UYrmw=; b=CnaqCkCvdmShitnMA5VdlVI8w1
	Ecm4Fpjo6edYnqXU1xNE3UGL3ZOMFg8GrQED4BJ33h27omUPRc6iWknneBTwRw5wj0J2M2KfxX4As
	uf/2iC0ENtS5y9PkWm8kWuPHz3vdxYuTuTmC80QWY7AfcYObcle6Dt2WWZ9kogExSVanQBUBOrX2Y
	9Mx0nuW90cIqsQGjkvfnXE6HXR0SCMxN9FNSWfLHbpAngQ1gBSO6dAzGrL9mhqg0+Bw9JdNHuVQPP
	AB2fK472v3YQh75PQIuwFaeT8w6R+/yaAvqXvMsvM6/7KpM60nuox5atYO16Zt9sFCgoQUX6kyN5A
	2jMhereQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru72d-000000012H5-4BEq;
	Tue, 09 Apr 2024 08:41:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru72Z-000000012Fj-05zp
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 08:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B942615F7;
	Tue,  9 Apr 2024 08:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97BDC433F1;
	Tue,  9 Apr 2024 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712652073;
	bh=U5vLQFJ64eI6meyT6waXNqRo1a5qOmG5YXFiiBLDeig=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=d+gw/87R88tq4WiRhLZhO/YfLhURKwgUiDgoFnNRsjXTsmFe4FLuHRabdbM6SW+kS
	 f0iiMJXo+ZxEznd8yWDbmH5wgJgE34KVRlOlAv54u5FXcd4eahWG/0ZEfShD0Sf24f
	 JNfxWpKQM8x0KxWvQG9dt8bUegyn4pYAIUZztlfrtRbBV4jQS9oVAt/5o+JxMdQeX2
	 hPPl52BE4AXMl8peW+f/yRfFf5fDVVFpgEuOwKIXOx+zWilJz6yw/q4GREw2RzhSSQ
	 PsHrO03vxGDOgEtEQf8A89Z7KSLVda1NA0/23ZRbReftH19T/JkYCztWOOCmlPVBMQ
	 Oy3G+Sus9phDQ==
Date: Tue, 09 Apr 2024 10:41:09 +0200
Message-Id: <D0FGHMY4V864.118ONNO1DWQ7G@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Hui Wang" <hui.wang@canonical.com>, <linux-mtd@lists.infradead.org>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for infineon
 cy15v102qsn
X-Mailer: aerc 0.16.0
References: <20240408124328.777375-1-hui.wang@canonical.com>
 <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
 <81551ca3-532d-43c8-859e-c3d9be8d6e9d@canonical.com>
In-Reply-To: <81551ca3-532d-43c8-859e-c3d9be8d6e9d@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_014115_144243_B8018058 
X-CRM114-Status: GOOD (  18.99  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4748210250342025564=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4748210250342025564==
Content-Type: multipart/signed;
 boundary=9d81ebfeae54d1e5358d920d18e92966fed905dc1f6ab0a11f8e9c260d71;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9d81ebfeae54d1e5358d920d18e92966fed905dc1f6ab0a11f8e9c260d71
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> >> It is 2Mbit F-RAM which is logically organized as 256K x 8.
> > Please have a look at drivers/misc/at25.c. I'm trying to get rid of
> > the NO_ERASE flag. This is more of an EEPROM like device. The at25
> > driver already have some kind of FRAM type support.
> After reading your comment, I checked the drivers/misc/at25.c, I found=20
> It couldn't work on my hardware. In my case, the F-RAM is under a spi=20
> bus (spi-nxp-fspi.c) which only supports spi_mem transfer mode. So=20
> currently, the mtd/spi-nor is the only choice.

Then it will be a great opportunity to make the at25 driver spi-mem
ready :)

> >> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> >> ---
> >>   drivers/mtd/spi-nor/spansion.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/span=
sion.c
> >> index 6cc237c24e07..5dc94926b2cb 100644
> >> --- a/drivers/mtd/spi-nor/spansion.c
> >> +++ b/drivers/mtd/spi-nor/spansion.c
> >> @@ -981,6 +981,12 @@ static const struct flash_info spansion_nor_parts=
[] =3D {
> >>   		.name =3D "s28hs02gt",
> >>   		.mfr_flags =3D USE_CLPEF,
> >>   		.fixups =3D &s28hx_t_fixups,
> >> +	}, {
> >> +		.id =3D SNOR_ID(0x48, 0x51, 0x80, 0x06, 0x00, 0x00),
> > This doesn't look like a JEDEC id. The datasheet says it is a 11bit
> > manufacturer id?
> >
> > -michael
>
>  From the page 82 of datasheet, the Device ID is 0000000006805148, and=20
> the ID read by spi_nor_read_id() matches it (id[0] is 0x48, id[1] is=20
> 0x51, ...).

JEDEC manufacturer IDs are not 11bit wide.

-michael

--9d81ebfeae54d1e5358d920d18e92966fed905dc1f6ab0a11f8e9c260d71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZhT/JRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hxlAF+Jw9CJbeCxjAxliGUybj+xtbvI2pI8Owk
nm3g2LeVhwUMGJUGrXytXZ2oh73rS7dAAX9Twlvv0IxUQqaRrpsYhU9QFCnnGqSg
ppFEtFLXYS+U87+8ao4QRWT2tKZe4c6H+PY=
=n4Yv
-----END PGP SIGNATURE-----

--9d81ebfeae54d1e5358d920d18e92966fed905dc1f6ab0a11f8e9c260d71--


--===============4748210250342025564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4748210250342025564==--

