Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6C0C88E50
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDgkdADHa8V+Bmey1edrgRqeBv6wp/Qr2OPTcFl2hi4=; b=hb2hfVTIRF56uU6v8plu3jHmfj
	pa8lvIX5XXVfoWezPFAe4VgWtQJMgKoE9VCt61GmnwzYkS1HtTtfKqf33SAyK10Yp+GuGwaIJHPom
	er0vboCCSV4lY3RRAorzITsgbwhifommA5aalEqossGrN3KXjGls83WnxGHj7kaxd7mQbdu1O/4Pc
	sTEOgBrjJqHj3ynJAK/316h8NK4jJ9RTNM0kKgfOtSlLjjegEOTIcAwkDoo9wBzQ100UbDDtMiM5B
	d18Efm6ecFV5z+ft7hhZSihhRc9Yb8G8XdqPCTA9r5+F7ndLv9wgq3aHAXU0lyvBD331Ae5unvGQk
	ktyX5QYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xBV-0000000GDAp-2JPq;
	Fri, 11 Sep 2026 09:04:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xBT-0000000GDAf-36kf
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 09:04:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 2625641838;
	Fri, 11 Sep 2026 09:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 83E9B1F000FF;
	Fri, 11 Sep 2026 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117475;
	bh=7JlIneF+Aa5Fd5sLqEGclf6Gn+1k3hyJj/xN5+NfGIU=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=ON8unehkxMbl8hUzsRRW6Oi0xftSeUBy/1gKfDj5YyVbh6CBJmZYAMhzNBoz2ZBsd
	 bEQiZePmAmLx+JFaaCY0KdNUwFTMn1Vt8nxRdnVKi6I6xEvLSW6IPYqLMXRIrmH8GH
	 tPe0wrbWwg/UtSDetHjKr5vtuQsLRO9eQCNVd87148RxSJYMQNxWeh/XIa50RgsSDX
	 sRrG4IRg3+7vr6lSE0ElYs2Z4dNPmdv/6t6vcHiiBJ/91efSENZVwkFOCdiq0cQ/m1
	 e8b6NLiGChkDsn+RRt08Cul7NkYoIKqBJ5N+EO3YiX4kdBi5RRgVSfYxGdtMur+3st
	 KakB4Qno7jXdA==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 11:04:31 +0200
Message-Id: <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Jon Hunter"
 <jonathanh@nvidia.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============0884712364145971443=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0884712364145971443==
Content-Type: multipart/signed;
 boundary=5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 10:55 AM CEST, Miquel Raynal wrote:
> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
> means they do not have an SR2 to read from/write to. The new generic QE
> helper was supposed to accommodate this situation but in the last version
> that got merged, parts of that specific handling has been moved to a
> more contained location, swp.c (which needed most of the extra code),
> yet the Macronix case has been forgotten about in that generic QE
> handling helper. Booting with such flashes will always fail probing.
>
> Fix the situation by making sure we do not attempt to read SR2 if the QE
> bit is in SR1.
>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.1445162503=
7676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status sup=
port")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d..ac909dfb9657 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_no=
r *nor)
>  	if (!qe_mask[0] && !qe_mask[1])
>  		return 0;
> =20
> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
> +	if (qe_mask[0])
> +		ret =3D spi_nor_read_sr1(nor, sr);
> +	else
> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);

Shouldn't that be the other way around?

+	if (qe_mask[1])
+		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
+	else
+		ret =3D spi_nor_read_sr1(nor, sr);

I know qe_mask won't be spread across two SRs. Just to be
correct and make it easier to grok.

-michael

--5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPEHxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jolwF/alhIN5hGOwBv+D0Xlr76orhmahxlL5O3
7dCJ1w4daF42qHsdouevHxRJvizdCpauAX49wTeAp088AC1HLRGNGsGFiQe2Oblv
WtEU95UDTAtgrl+UWzqJNUdZKIiS1DCpKmE=
=phm2
-----END PGP SIGNATURE-----

--5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855--


--===============0884712364145971443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0884712364145971443==--

