Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35A1C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nds/6XFV146RVS3JQJ4SiLWa7rUerxKoQLNmsap7PU=; b=iVlemgSer+W8mnlbYySoS6tygD
	pv0sMKWE2G288pHNicIGle94slf3feqCeIG0eGGy+aaKUGpaoSdP2BVTj253uPzT3omDs53r5PQSi
	PRxtDfSp3Eyfl3BrOV9/kxvZls8oDWVxMQ3FERU9+9Z1K1h1txQXH1IRVnd7yxe8or/KTjC/DMYHy
	CrVSSEqg03Xu53Llci8z0d3dWkxqQpJ2TuCfR1S66o/s5QUC+DkhIxtdxJCw/rI7N91ezX0d57h+1
	XQHwghygBeDibsE2447vB4nU7wiJC9vVtbYSatHgLd6005pHBN5E1oqGdU6dduY0YzwJeJfgbBJyZ
	uJs6KvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWCk-00000000btE-44cv;
	Mon, 12 Aug 2024 14:39:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdW9l-00000000bF8-0Mf2
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 14:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59C48CE0E9C;
	Mon, 12 Aug 2024 14:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C706C4AF09;
	Mon, 12 Aug 2024 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723473375;
	bh=lU+Uhh+y+aAM6ENiDfkeg8F/8dKDJUSDm5cZcLbNfgA=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=PnEIIjLH++sDNBhaLdXNEy+Gqef6G6P6ciwi133jAfdOPaFjfbOkdw1X10bN8KBeH
	 mbwjemJxGwrkoda7oh/Ltk82isxmHLc8N6mV9jmpg/hqDI1JICw2rS25MaDQ72yKDu
	 AgSgUDGJ4oezxUk6IPxU99hvzCbN6hbxRiHiUqrrTL3Mx7QsUmD1r75Ri9t/8DnFgt
	 rJDyp1bQ8pSLFYRgxKg1fzYkd3AGMCouWlt83Mg8l0Y0knEWq2YmGTtPz5IJT+KTtI
	 uNe6JHc9GzKngrTmQLPoxivoMpWPp/0MNmygWv4CcOrZmrmZwb8ae/F2F+eEt/y5f2
	 y1tUshVzYLEVg==
Date: Mon, 12 Aug 2024 16:36:11 +0200
Message-Id: <D3E0BKGQIZ9R.1ULZZ93E18VGM@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add Zetta ZD25Q128C support
X-Mailer: aerc 0.16.0
References: <20240804221535.291923-1-mwalle@kernel.org>
 <mafs0v805zwlv.fsf@kernel.org>
In-Reply-To: <mafs0v805zwlv.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_073621_607047_B0F5A1D0 
X-CRM114-Status: GOOD (  21.27  )
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
Content-Type: multipart/mixed; boundary="===============7217020384795040983=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7217020384795040983==
Content-Type: multipart/signed;
 boundary=936a0167f95709de7bcfad0449549450e6c28ada1f5126b8ad66eda4afb2;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--936a0167f95709de7bcfad0449549450e6c28ada1f5126b8ad66eda4afb2
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > Zetta normally uses BAh as its vendor ID. But for the ZD25Q128C they
> > took the one from Winbond and messed up the size parameters in SFDP.
> > Most functions seem compatible with the W25Q128, we just have to fix up
> > the size.
> >
> > Link: http://www.zettadevice.com/upload/file/20150821/DS_Zetta_25Q128_R=
evA.pdf
> > Link: https://www.lcsc.com/datasheet/lcsc_datasheet_2312081757_Zetta-ZD=
25Q128CSIGT_C19626875.pdf
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> [...]
> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbon=
d.c
> > index e065e4fd42a3..9f7ce5763e71 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -17,6 +17,31 @@
> >  		   SPI_MEM_OP_NO_DUMMY,					\
> >  		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
> > =20
> > +static int
> > +w25q128_post_bfpt_fixups(struct spi_nor *nor,
> > +			 const struct sfdp_parameter_header *bfpt_header,
> > +			 const struct sfdp_bfpt *bfpt)
> > +{
> > +	/*
> > +	 * Zetta ZD25Q128C is a clone of the Winbond device. But the encoded
> > +	 * size is really wrong. It seems that they confused Mbit with MiB.
> > +	 * Thus the flash is discovered as a 2MiB device.
> > +	 */
> > +	if (bfpt_header->major =3D=3D SFDP_JESD216_MAJOR &&
> > +	    bfpt_header->minor =3D=3D SFDP_JESD216_MINOR &&
> > +	    nor->params->size =3D=3D SZ_2M &&
> > +	    nor->params->erase_map.regions[0].size =3D=3D SZ_2M) {
> > +		nor->params->size =3D SZ_16M;
> > +		nor->params->erase_map.regions[0].size =3D SZ_16M;
> > +	}
>
> Since the size is 16 MiB for both Zetta and Winbond, why do you have
> these conditions here? Why not just do it unconditionally? What
> situation do you want to protect against?

Two things, I want to make sure, the values I'll overwrite (which
were set indirectly by the SFDP data I check here) are really the
"before" value I expect them to be. And secondly, I want to
fingerprint the SFDP as accurately as possible. I mean you wouldn't
need the SFDP version either. Think of a preparation for a possible
.match() callback in zetta.c. That would probably look like this,
i.e. check the flash id and these four conditions.

What are your concerns?

-michael

--936a0167f95709de7bcfad0449549450e6c28ada1f5126b8ad66eda4afb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrod2xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hsRgGA8mJnYuTjf8+k8Eb84oremKVsPySQr0La
pDBEoW6frwYqISVoGFwXcxRqFmYAtelOAX9U9tqvJYLDveZby4CIQhXZpQ9Kx5jb
FVA+zGxanAjfzTIypTnhLdOtEed3TGGNApo=
=V4LY
-----END PGP SIGNATURE-----

--936a0167f95709de7bcfad0449549450e6c28ada1f5126b8ad66eda4afb2--


--===============7217020384795040983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7217020384795040983==--

