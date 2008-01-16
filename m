Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JF09U-0003Uv-Vo
	for linux-mtd@lists.infradead.org; Wed, 16 Jan 2008 04:45:34 +0000
Date: Wed, 16 Jan 2008 15:41:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/3] mtd: Factor out OF partition support from the NOR
	driver.
Message-Id: <20080116154153.2f6c2ee9.sfr@canb.auug.org.au>
In-Reply-To: <478D450A.8060802@freescale.com>
References: <20080114172116.a2e5aa18.sfr@canb.auug.org.au>
	<478D450A.8060802@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__16_Jan_2008_15_41_53_+1100_1z.kM1l/KnaNUVrO"
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Wed__16_Jan_2008_15_41_53_+1100_1z.kM1l/KnaNUVrO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Jan 2008 17:43:06 -0600 Scott Wood <scottwood@freescale.com> wro=
te:
>
> Stephen Rothwell wrote:
> >> +	nr_parts =3D 0;
> >> +	for (pp =3D node->child; pp; pp =3D pp->sibling)
> >=20
> > 	for_each_child_of_node(node, pp)
>=20
> "for_each_child_of_node" is only in Paul's tree, but this has to go via m=
td.
>=20
> Plus, I'm just moving the code; it's not new.

OK, we can change it later.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jan_2008_15_41_53_+1100_1z.kM1l/KnaNUVrO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHjYsVTgG2atn1QN8RAkK6AKCKaUndHc0j8YRyL1qUGCMNMjlmFgCdG1N9
OvxHUcQ3CDumS+VJimXrzsk=
=7q3H
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jan_2008_15_41_53_+1100_1z.kM1l/KnaNUVrO--
