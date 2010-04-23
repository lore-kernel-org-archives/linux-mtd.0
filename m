Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O57rP-0004iM-Ey
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 01:39:16 +0000
Date: Fri, 23 Apr 2010 03:39:13 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v3 8/8] mtd: cfi_util: do not printk if no extended
	query table
Message-ID: <20100423013913.GB4412@pengutronix.de>
References: <20100422083545.17166.17822.stgit@shiryu.yomgui.biz>
	<20100422083621.17166.14671.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20100422083621.17166.14671.stgit@shiryu.yomgui.biz>
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


One thing here...

On Thu, Apr 22, 2010 at 10:36:21AM +0200, Guillaume LECERF wrote:
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_util.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> index ca584d0..6ce5107 100644
> --- a/drivers/mtd/chips/cfi_util.c
> +++ b/drivers/mtd/chips/cfi_util.c
> @@ -104,10 +104,11 @@ __xipram cfi_read_pri(struct map_info *map, __u16 a=
dr, __u16 size, const char* n
>  	int i;
>  	struct cfi_extquery *extp =3D NULL;
> =20
> -	printk(" %s Extended Query Table at 0x%4.4X\n", name, adr);
>  	if (!adr)
>  		goto out;
> =20
> +	printk(" %s Extended Query Table at 0x%4.4X\n", name, adr);
> +

Log level is missing. KERN_INFO or use pr_info?

>  	extp =3D kmalloc(size, GFP_KERNEL);
>  	if (!extp) {
>  		printk(KERN_ERR "Failed to allocate memory\n");
>=20

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvQ+kEACgkQD27XaX1/VRvvawCeL75jwwvZNuup1DqxR9q06wzw
wy0AoKpJEjQ2XktsnuluZdhGhOL4kt/m
=bLm7
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
