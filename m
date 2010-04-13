Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O1UVL-0007jx-Ez
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 01:01:28 +0000
Date: Tue, 13 Apr 2010 03:01:13 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Alexander Kurz <linux@blala.de>
Subject: Re: [PATCH 1/2] drivers/mtd/maps/pcmciamtd.c: fixing obvious errors
Message-ID: <20100413010112.GC8978@pengutronix.de>
References: <alpine.DEB.1.10.1004121945510.7438@blala.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.1004121945510.7438@blala.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-pcmcia@lists.infradead.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Magnus Damm <damm@opensource.se>, linux-mtd@lists.infradead.org,
	Karsten Keil <keil@b1-systems.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2010 at 07:49:15PM +0400, Alexander Kurz wrote:
> Hello folks,
> this is an attempt, to reanimate the pcmciamtd driver.

Nice :)

> @@ -652,7 +651,6 @@ static int pcmciamtd_config(struct pcmcia_device *lin=
k)
>  	link->dev_node =3D &dev->node;
>  	return 0;
> =20
> - failed:
>  	err("CS Error, exiting");
>  	pcmciamtd_release(link);
>  	return -ENODEV;

I'd suggest keeping 'failed', removing the 'err'-statement and using 'goto
failed' in error cases. Currently, pcmciamtd_release() is used many times on
errors.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvDwlgACgkQD27XaX1/VRuu7ACeKm4K4u8TF1iN76Dvjxv2H9SA
ha4An0elMCOW3B7TL2mHuRH63uZZFzJm
=lR2W
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
