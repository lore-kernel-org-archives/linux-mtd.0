Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEWjF-0004Av-QD
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 00:01:44 +0000
Date: Wed, 19 May 2010 02:01:37 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: how to pre-screen patch submissions from a newbie janitor?
Message-ID: <20100519000137.GA18592@pengutronix.de>
References: <alpine.DEB.2.00.1005181936120.3484@lynx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1005181936120.3484@lynx>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>   however, since he's new to patch creation and submission, i offered
> to "vet" his patches first.  i realize that my vetting carries no
> weight on the MTD list, but given that i've submitted lots and lots of
> patches elsewhere, i can still at least sanity check what he comes up
> with before it hits the list.
>=20
>   is there a canonical signage for that nowadays?  is it "Reviewed-By"
> or something like that?  so that by the time it gets to the MTD list,
> he would have done the "Signed-Off-By" and i'd sign off as a reviewer.
> is that the way it works?  or is there an alternative?  thanks.

Yes, that sounds like a good case for Reviewed-by. It will surely help these
patches knowing there is somebody with experience who already had a look at
(and in that case probably build-tested) them.

Looking forward to the series,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvzKmEACgkQD27XaX1/VRtKOQCgnDAZqMPhjKmAndpyo0FZeMFP
3fUAoMG2FzsIZyflEb9MPos2x553vFYQ
=p9II
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
