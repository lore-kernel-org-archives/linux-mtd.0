Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CFuO-0003S8-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 08:26:45 +0100
Date: Tue, 19 Jun 2001 09:33:19 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Xavier DEBREUIL <xde@inventel.fr>,
  MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
Message-ID: <20010619093319.D10532@crystal.2d3d.co.za>
References: <3B2E2C7A.F997FDEE@inventel.fr> <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl> <20010618143104.A3715@crystal.2d3d.co.za> <3B2E2C7A.F997FDEE@inventel.fr> <29895.992882600@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline
In-Reply-To: <29895.992882600@redhat.com>; from dwmw2@infradead.org on Mon, Jun 18, 2001 at 17:43:20 +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David!

> xde@inventel.fr said:
> >  Does it mean that I can not use do_map_probe("cfi", ...) with
> > 28F160B3 chips ?
>=20
> ISTR there are some versions of the 28F160 which are CFI-compliant. But i=
f=20
> you've got the version which isn't, then no, you'll have to implement an=
=20
> Intel-specific probe routine for it. You can still hook into the=20
> cfi_cmdset_0001 back end code to actually _drive_ it though - you only ha=
ve=20
> to do a probe routine.

Just btw, if you're looking for an Intel probe routine for the 28F160 chips,
look at the lart driver - I implemented one there which works for 28F160 and
28F800 chips (but then again you could probably use the entire driver as is
as it should work with all 28F{800,160} chips.

--=20

Regards
 Abraham

Thus mathematics may be defined as the subject in which we never know
what we are talking about, nor whether what we are saying is true.
		-- Bertrand Russell

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LwA/zNXhP0RCUqMRAtShAJ9pD2qMOAydjnEBcF1HlMp6KgKCKACgiQ8R
OYV3/fiXNyJKOrlEYZDal4Y=
=nPIt
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
