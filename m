Received: from pauli.thundrix.ch ([213.239.201.101])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAFnl-0006wQ-Ta
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 18:41:31 -0400
Date: Thu, 23 Sep 2004 00:39:27 +0200
From: Tonnerre <tonnerre@thundrix.ch>
To: Jesper Juhl <juhl-lkml@dif.dk>
Message-ID: <20040922223927.GB6889@thundrix.ch>
References: <Pine.LNX.4.61.0409202320270.2729@dragon.hygekrogen.localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0409202320270.2729@dragon.hygekrogen.localhost>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] attempt to fix warnings in dilnetpc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut,

On Mon, Sep 20, 2004 at 11:26:38PM +0200, Jesper Juhl wrote:
> diff -up linux-2.6.9-rc2-bk5-orig/drivers/mtd/maps/dilnetpc.c linux-2.6.9=
-rc2-bk5/drivers/mtd/maps/dilnetpc.c
> --- linux-2.6.9-rc2-bk5-orig/drivers/mtd/maps/dilnetpc.c	2004-08-14 07:36=
:32.000000000 +0200
> +++ linux-2.6.9-rc2-bk5/drivers/mtd/maps/dilnetpc.c	2004-09-20 23:19:34.0=
00000000 +0200
> @@ -403,7 +403,7 @@ static int __init init_dnpc(void)
>  	printk(KERN_NOTICE "DIL/Net %s flash: 0x%lx at 0x%lx\n",=20
>  		is_dnp ? "DNPC" : "ADNP", dnpc_map.size, dnpc_map.phys);
> =20
> -	dnpc_map.virt =3D (unsigned long)ioremap_nocache(dnpc_map.phys, dnpc_ma=
p.size);
> +	dnpc_map.virt =3D (unsigned long *)ioremap_nocache(dnpc_map.phys, dnpc_=
map.size);

This should be void *.

				    Tonnerre

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBUf8e/4bL7ovhw40RAufeAJ9UN9KO2mPBT6wiq3baVb4knMfwOQCZAa4G
EPjgwDNXT+cQOPKAKUMQBE4=
=mvqF
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
