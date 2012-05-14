Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STtyR-0004R5-FY
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:02:00 +0000
Message-ID: <1336997124.2528.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in
 uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: gerg@snapgear.com
Date: Mon, 14 May 2012 15:05:24 +0300
In-Reply-To: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4zLfLtsy3pzyivVt47rx"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4zLfLtsy3pzyivVt47rx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have few requests

On Thu, 2012-05-10 at 16:55 +1000, gerg@snapgear.com wrote:
> @@ -80,7 +80,6 @@ static int __init uclinux_mtd_init(void)
>  	mtd =3D do_map_probe("map_ram", mapp);
>  	if (!mtd) {
>  		printk("uclinux[mtd]: failed to find a mapping?\n");

KERN_ERR prefixe is missing. Please, fix other printks in this file
while on it.

> -		iounmap(mapp->virt);
>  		return(-ENXIO);
>  	}
> =20
> @@ -103,10 +102,8 @@ static void __exit uclinux_mtd_cleanup(void)
>  		map_destroy(uclinux_ram_mtdinfo);
>  		uclinux_ram_mtdinfo =3D NULL;
>  	}
> -	if (uclinux_ram_map.virt) {
> -		iounmap((void *) uclinux_ram_map.virt);
> +	if (uclinux_ram_map.virt)
>  		uclinux_ram_map.virt =3D 0;
> -	}

The "if" statements are redundant - could you please kill them?

Would you please be kind to address these sparse warnings while you work
on this rarely used file:

drivers/mtd/maps/uclinux.c:27:17: warning: symbol 'uclinux_ram_map' was not=
 declared. Should it be static? [sparse]
drivers/mtd/maps/uclinux.c:49:15: warning: incorrect type in assignment (di=
fferent address spaces) [sparse]
drivers/mtd/maps/uclinux.c:49:15:    expected void *<noident> [sparse]
drivers/mtd/maps/uclinux.c:49:15:    got void [noderef] <asn:2>* [sparse]
drivers/mtd/maps/uclinux.c:71:20: warning: incorrect type in assignment (di=
fferent address spaces) [sparse]
drivers/mtd/maps/uclinux.c:71:20:    expected void [noderef] <asn:2>*virt [=
sparse]
drivers/mtd/maps/uclinux.c:71:20:    got void * [sparse]
drivers/mtd/maps/uclinux.c:73:27: warning: Using plain integer as NULL poin=
ter [sparse]
drivers/mtd/maps/uclinux.c:106:40: warning: Using plain integer as NULL poi=
nter [sparse]

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-4zLfLtsy3pzyivVt47rx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsPUEAAoJECmIfjd9wqK0OvEQAJ/dxrqoRe29oVT1B2aClpW/
savu5GV1eV081t9o/p9IA30hc5kbZqETSXXLJ2bg0uBobBRsu/5mHa8ry9bpv3L7
BMsdNM4Gm1uJ++1d0IJRUfgXhDmGxH+LUTt+7qhpvZY0dBVaSMyijHM3pfkLDpx0
tZtiB+vU4UMSiPASV6fc2peko78KMx5aNUxGqsSv3Qr+EgBWinOdn6iYjjLcpnna
QuwTh6ziqd/tNfQ+/TCCCY8II1nlzLx8uBpxye6z1p2ysq0JCotk/EpyEMVxLbk1
CrUfy6A84lAHQNpojaIAB4p5Tee0N/0B+lTHBnGUhkBqSoB1s5Zuy+SUBSLzR+Du
/RMx/wyikjbH4ImxxXIaxVIusvh/J5U6/T1edgWqOuIe/25se5XXdp07xIzmtJ/d
lhRow5r3Rw9SOG0/tGgNmX2itvw0vriNZBfY5zN5IRvUqrp+TwBCFABEVn1UZ+7j
e7QtTIU/nDsabpen2lUSpL1suxbbiTkbdqzn54eJTkiIjFzSnavrcx11ksMrxmVD
ump/pYo9qydnixf5jHUkGJ7cB7uyXMaNOOCxJdJrpMHVqbnbsimfbm7NCol0AQ7H
DoNhFkzfjyk3MvkF0lkEXk8CKanMosk3tO18mVBW8XsEmkW7Fw1vbSEdaKHEkjC/
t7/f55DOv2HHccq0twnf
=xF/b
-----END PGP SIGNATURE-----

--=-4zLfLtsy3pzyivVt47rx--
