Received: from smtp-out113.alice.it ([85.37.17.113])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NBQVs-0004Qn-MM
	for linux-mtd@lists.infradead.org; Fri, 20 Nov 2009 10:14:52 +0000
Date: Fri, 20 Nov 2009 11:14:35 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] MTD: add missing put_chip() in cfi_intelext_reset()
Message-Id: <20091120111435.d28c19bf.ospite@studenti.unina.it>
In-Reply-To: <alpine.LFD.2.00.0910231559320.21460@xanadu.home>
References: <20091023000533.57893593.ospite@studenti.unina.it>
	<alpine.LFD.2.00.0910231559320.21460@xanadu.home>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__20_Nov_2009_11_14_36_+0100_mcKH0h4t2JlDr09o"
Cc: openezx-devel@lists.openezx.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__20_Nov_2009_11_14_36_+0100_mcKH0h4t2JlDr09o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Oct 2009 16:02:42 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

>=20
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
>

Hi, has this fix been submitted yet?
I can't see it in 2.6.32-rc8.

Thanks,
   Antonio

> ---
>=20
> On Fri, 23 Oct 2009, Antonio Ospite wrote:
>=20
> > Hi,
> >=20
> > I am attaching a trace of a possible recursive locking in
> > cfi_cmdset_0001.c
>=20
> This patch should fix it.
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_=
cmdset_0001.c
> index e7563a9..d923a2d 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2564,6 +2564,7 @@ static int cfi_intelext_reset(struct mtd_info *mtd)
>  		if (!ret) {
>  			map_write(map, CMD(0xff), chip->start);
>  			chip->state =3D FL_SHUTDOWN;
> +			put_chip(map, chip, chip->start);
>  		}
>  		spin_unlock(chip->mutex);
>  	}


--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__20_Nov_2009_11_14_36_+0100_mcKH0h4t2JlDr09o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksGbAwACgkQ5xr2akVTsAHNhgCbBwft8fZeo7DHU/pPj16r/HxZ
ncgAoJwBc4a4oJvZiyvCOIyzID6XX3ii
=dEDh
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Nov_2009_11_14_36_+0100_mcKH0h4t2JlDr09o--
