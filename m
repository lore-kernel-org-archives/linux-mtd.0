Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etLqe-0008MC-7j
 for linux-mtd@lists.infradead.org; Tue, 06 Mar 2018 23:18:23 +0000
Date: Wed, 7 Mar 2018 00:18:05 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com, tharvey@gateworks.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180306231805.GA28183@amd>
References: <20180303104554.5958-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20180303104554.5958-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2018-03-03 11:45:54, Richard Weinberger wrote:
> While UBI and UBIFS seem to work at first sight with MLC NAND, you will
> most likely lose all your data upon a power-cut or due to read/write
> disturb.
> In order to protect users from bad surprises, refuse to attach to MLC
> NAND.
>=20
> Cc: stable@vger.kernel.org

That sounds like _really_ bad idea for stable. All it does is it
removes support for hardware that somehow works.

Now... Yes, handling flash is hard, MLC NAND is worst of the
bunch. But...

Read disturb is not unique to MLC, right? Happens to all the flashes,
its just that MLC has tighter margins for error.

Power-cut. UBIFS is just not power-cut safe, right? My notes say that
power-cut during erase could result in flash that contains all 1s, but
will start showing errors very quickly. Again, not MLC specific. Can
be solved with battery...

(And yes, there are some problems specific to MLC, where parts of page
need to be written in specific order. Not sure how it affects
ubifs. But it was not listed as a reason for the patch.)

> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/build.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index e941395de3ae..753494e042d5 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -854,6 +854,17 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi=
_num,
>  		return -EINVAL;
>  	}
> =20
> +	/*
> +	 * Both UBI and UBIFS have been designed for SLC NAND and NOR flashes.
> +	 * MLC NAND is different and needs special care, otherwise UBI or UBIFS
> +	 * will die soon and you will lose all your data.
> +	 */
> +	if (mtd->type =3D=3D MTD_MLCNANDFLASH) {
> +		pr_err("ubi: refuse attaching mtd%d - MLC NAND is not supported\n",
> +			mtd->index);
> +		return -EINVAL;
> +	}
> +
>  	if (ubi_num =3D=3D UBI_DEV_NUM_AUTO) {
>  		/* Search for an empty slot in the @ubi_devices array */
>  		for (ubi_num =3D 0; ubi_num < UBI_MAX_DEVICES; ubi_num++)

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqfIa0ACgkQMOfwapXb+vJ6ZQCgqFe1Pe55Q2kgHjXoMClPat83
iCAAn2HkaKl7ZEWEuffl0iDyWmSFI405
=OGEp
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
