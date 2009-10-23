Received: from smtp-out01.alice.it ([85.33.2.12])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1Qt0-0007GK-TO
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 20:37:26 +0000
Date: Fri, 23 Oct 2009 22:37:04 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] MTD: add missing put_chip() in cfi_intelext_reset()
Message-Id: <20091023223704.af83eaf0.ospite@studenti.unina.it>
In-Reply-To: <alpine.LFD.2.00.0910231559320.21460@xanadu.home>
References: <20091023000533.57893593.ospite@studenti.unina.it>
	<alpine.LFD.2.00.0910231559320.21460@xanadu.home>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__23_Oct_2009_22_37_04_+0200_nwR9apXirKpCB3F0"
Cc: openezx-devel@lists.openezx.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__23_Oct_2009_22_37_04_+0200_nwR9apXirKpCB3F0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Oct 2009 16:02:42 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

>=20
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
>=20
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

I've just tested this and it seems to fix the issue, indeed.

Many thanks,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__23_Oct_2009_22_37_04_+0200_nwR9apXirKpCB3F0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkriE/AACgkQ5xr2akVTsAGh8ACfbtE5OFsEIPIvO6JpmtDvF89n
aG0AnjmizPfYHhyk39xNxkQIWnQWFrLZ
=EqYo
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Oct_2009_22_37_04_+0200_nwR9apXirKpCB3F0--
