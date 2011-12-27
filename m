Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfSIW-0005JL-2Z
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 08:22:12 +0000
Received: by iadk27 with SMTP id k27so22154146iad.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 00:22:09 -0800 (PST)
Message-ID: <1324974236.1165.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] drivers/mtd/maps/lantiq-flash.c: drop iounmap for
 devm_ allocated data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
Date: Tue, 27 Dec 2011 10:23:56 +0200
In-Reply-To: <1324921081-13161-2-git-send-email-julia@diku.dk>
References: <1324921081-13161-2-git-send-email-julia@diku.dk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2TZQfsQjRjvrGma/qK/z"
Mime-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2TZQfsQjRjvrGma/qK/z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-12-26 at 18:38 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> Data allocated with devm_ioremap or devm_ioremap_nocache should not be
> freed using iounmap, because doing so causes a dangling pointer, and a
> subsequent double free.
>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @r@
> expression x;
> @@
> (
>  x =3D devm_ioremap(...)
> |
>  x =3D devm_ioremap_nocache(...)
> )
>=20
> @@
> expression r.x;
> @@
> * iounmap(x)
> // </smpl>

Thanks Julia,

surely this semantic patch script is worth adding to scripts/coccinelle?
Are you going to take care of this?

>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
>=20
> ---
>  drivers/mtd/maps/lantiq-flash.c |    6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-fl=
ash.c
> index 4f10e27..7b889de 100644
> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -159,7 +159,7 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	if (!ltq_mtd->mtd) {
>  		dev_err(&pdev->dev, "probing failed\n");
>  		err =3D -ENXIO;
> -		goto err_unmap;
> +		goto err_free;
>  	}

Pushed to l2-mtd-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-2TZQfsQjRjvrGma/qK/z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO+YCdAAoJECmIfjd9wqK0G7YP+gI+o6z25nl4ROlhH4+KkQXx
6LamIGEq+TWAjsTIZb/kAjaNtI7ZxQ5EnmTrdn4RjWw4YvrUXPadG4DYZ521lMLY
6dgStsekEKV3Q5Bs4cXFfWPDouAoJdkhjSsFr5sH0VxtEXr/YppWQdPpujpxJlG0
K8ywEQfbQLhWYWHf8OYi9O4+YKo+Ur9tSqMPc+0AXTtu0aAnHwNJFZ6AUF338+uc
TUZ98RDp1HyCVNBIhOinGXeFjHqOZRaNSRRt8v65P+LeNKn+nKf7AZaHXsTTwBC4
OkwSvZtM9qYKwYribDZpbBVTgNA2PRrxSL7Q3Iiahjib7ck29GPuQTkEdWwBkZc+
Djy9dCD1ZDG25VlF77BwKkSBx1jiRvEeL5wsT4M+Z7HFItgf1m5Vmdxxf4BzClPa
V94MLUIUYZizuU1FtPM0rhMLUgLJX5+Uvvbh3SclD5trw+5WpBDOtamsjN8iJhIW
fswXdRvpPsAZt67sZXOT8bt3CH7G0ZmfW1yxF7e/hthcno0jGcSSaaX2BKcwvShs
1N4faVREhQTy1+dptRVpm1npGomBS55UUqQnx0fzzLcDKVNvohuDeA5v0TdrnDC1
yeWjvZKAjcs8l0m+yuxUAPQ9urNKfFtR1DDzy7OrXahwYz8bpvp6rtxx9uwlHatt
700zv6DShlZ5cokBcJQ3
=13wt
-----END PGP SIGNATURE-----

--=-2TZQfsQjRjvrGma/qK/z--
