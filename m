Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CFoL-0003Rb-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 08:20:31 +0100
Date: Tue, 19 Jun 2001 09:26:49 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
Message-ID: <20010619092649.B10532@crystal.2d3d.co.za>
References: <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl> <20010618143104.A3715@crystal.2d3d.co.za> <3B2E2C7A.F997FDEE@inventel.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <3B2E2C7A.F997FDEE@inventel.fr>; from xde@inventel.fr on Mon, Jun 18, 2001 at 18:29:46 +0200
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

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xavier!

> > Originally I wanted to change the maps driver and just write a chip dri=
ver,
> > but the sa1100 maps driver is dependant on CFI being configured. Since =
the
> > 28F160xx chips isn't CFI compliant, it makes no sense to put the map
> > definitions in there (It's only about 20 lines of code anyway: read/wri=
te
> > routines and the partition definition), so I decided to just make a
> > standalone driver.
>=20
> Does it mean that I can not use do_map_probe("cfi", ...) with 28F160B3
> chips ?

Yes (i.e. you can't do it)

--=20

Regards
 Abraham

There's no real need to do housework -- after four years it doesn't get
any worse.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Lv65zNXhP0RCUqMRAuZZAJ4r0f8B3URw4mOIwFyJPkJ6vyNkpgCeMc/N
Y3NfTRtAkKUf6nh6pTiHjm8=
=5ftm
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
