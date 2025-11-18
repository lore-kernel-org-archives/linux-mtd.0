Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83816CED24D
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aY8oTduz/0+jETUiM2Mb9Rsh+eiijEduvXt3D0FH+Os=; b=tsmOLzn7PkUUx2nl1gZDYED/MP
	Vxdv9dCO9/r2/pkpqcN5Am0QBuFNIgVGikdAhEojXaa9Du6WRT3t1qJkHLicg+DJV8LH3b9RBRMBH
	JO0NVEMWgkNrgRSVAtbRCTBHnzpo7cWfbdEdtIVDsKPj9VG9FSCyOgZm6j807ivsV1y27TjO2UZrI
	eNpw5fzaqmuj9TMLBVPYWUBFY8vJX2JHsv48P8vIJKEnYTdi4ebaOyJgqxdSW6pvsjo7P0yTPoNMM
	FcxEfNXzKxh7MtzF8RBJMEsjbF4b+xAKOmGapFg6MxFE1SW1utfUl4RpJ7DkA3yqs9PUj8OZF33sm
	QC3sZg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHqd-000000009G8-11Yw;
	Tue, 18 Nov 2025 09:18:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHqc-000000009Fq-0JFX
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 09:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E936C60192;
	Tue, 18 Nov 2025 09:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFDEC16AAE;
	Tue, 18 Nov 2025 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457480;
	bh=E8R1yDsf/seLe0DPO0AuDBsiOinS7QE8v1NzUOFrc+Y=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=tWyFZSuUKS9qOJjULaBCOQ+YOVDrbZ5a9t8QPvOlMw5DMtJ0asz2DUfuduotBkR7k
	 RaZ0LMXXNw9VQsDnVl9zthZebCV5GkD6tagZTaDcQvwXmRbvTOxzjtBJ2rlkdP4ydK
	 0mohGs6BxSDMF562T1ad/KidI2Cg1UDwCz8iFEx7to0KkoWGLBmS11WmEEALP/gjhO
	 YhWk2yqc1hrKMJBTkT+qoFWkG0iwx/kTt3TbiEBsnulA+b5dQvzWTbpPCWRR2kUyVp
	 IUjZtCeoyZD33Xz2TPRjZi8a4mgUAkIkSQh2ocEWDJn0VV/TdalooGtYyhgyyZODcP
	 RJ+Te6Zj7s2sg==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 10:17:55 +0100
Message-Id: <DEBPI49KKW00.3MSWMX9HQL7JZ@kernel.org>
Subject: Re: [PATCH 02/19] mtd: spi-nor: swp: Improve locking user
 experience
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8693136732412813731=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8693136732412813731==
Content-Type: multipart/signed;
 boundary=79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> In the case of a single block being locked, if the user want to fully
> unlock the device it has two possibilities:
> - either it asks to unlock the entire device, and this works;
> - or it asks to unlock just the blocks that are currently locked, which
> fails.
>
> It fails because the conditions "can_be_top" and "can_be_bottom" are
> true. Indeed, in this case, we unlock everything, to the TB bit does not
> matter. However in the current implementation, use_top would be true (as
> this is the favourite option) and lock_len, which in practice should be
> reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
> a positive number. This is wrong.

This only happens if you try to unlock the first sector, correct? If
my maths are correct, trying it on the last sector, lock_len should
be 0, i.e in that case "ofs + len =3D=3D size".

If it's the first sector (or sectors), lock_len will end up with
"size - N * 64k", which is clearly wrong.

> An easy way is to simply add an extra condition. In the unlock() path,
> if we can achieve the results from both sides, it means we unlock
> everything and lock_len must simply be 0.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> For me, this result was clearly unexpected, but I am not sure this
> qualifies as a fix.

That's definetly a bug, esp. because it will lock an entire
unrelated region. And it seems to go back all the to commit
3dd8012a8eeb "mtd: spi-nor: add TB (Top/Bottom) protect support").

> ---
>  drivers/mtd/spi-nor/swp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 9b07f83aeac76dce2109f90dfa1534c9bd93330d..9bc5a356444665ad8824e9e12=
d679fd551b3e67d 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -281,7 +281,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, lof=
f_t ofs, u64 len)
>  	use_top =3D can_be_top;
> =20
>  	/* lock_len: length of region that should remain locked */
> -	if (use_top)
> +	if (can_be_top && can_be_bottom)
> +		lock_len =3D 0;

Could you please add a comment stating that if both are true, it
means that both adjacent regions are unlocked and thus the entire
flash will be unlocked.

-michael

> +	else if (use_top)
>  		lock_len =3D nor->params->size - (ofs + len);
>  	else
>  		lock_len =3D ofs;


--79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw5wxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/heWwF/ZUlOc2hLuhZZHqppA3A+DdCZmX8UvWPb
UD344wwQISdRs4KsLFbM6zHnJkawfwa2AX92vlDSPwHzz2XmbQZviHwbQ38znTds
q0v6z0xPWsaOOSomttrs1kgFU0GX40GKETI=
=dBmF
-----END PGP SIGNATURE-----

--79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3--


--===============8693136732412813731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8693136732412813731==--

