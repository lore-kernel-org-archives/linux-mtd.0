Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15By5U-0002RO-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 13:25:01 +0100
Date: Mon, 18 Jun 2001 14:31:04 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
Message-ID: <20010618143104.A3715@crystal.2d3d.co.za>
References: <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20010618142215.M12246@arthur.ubicom.tudelft.nl>; from J.A.K.Mouw@ITS.TUDelft.NL on Mon, Jun 18, 2001 at 14:22:15 +0200
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

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Erik!

> > I've added a standalone driver for the 28F160xx chips on LART. I've also
> > removed the LART definitions in the sa1100 maps driver (it's wasn't use=
d in
> > anycase and it's obsolete now anyway). Same for the LART endian definit=
ions
> > in cfi_endian.h and the cfi chip driver Config file.
>=20
> Why? If I understood the MTD stuff properly it is layered with the chip
> drivers at the lowest level, the maps driver on that, and the device
> drivers on top of the maps driver. As far as I can see (and what my
> plan was before you started) you only need a new chip driver for LART
> and reuse the other parts. Because the LART is an sa1100 design we
> should avoid special casing and just use the sa1100 maps driver.

The driver I wrote for LART is a standalone driver, so it doesn't need aby
maps driver.

Originally I wanted to change the maps driver and just write a chip driver,
but the sa1100 maps driver is dependant on CFI being configured. Since the
28F160xx chips isn't CFI compliant, it makes no sense to put the map
definitions in there (It's only about 20 lines of code anyway: read/write
routines and the partition definition), so I decided to just make a
standalone driver.

Anyway, even if I decided to make/patch an existing maps driver, the endian
definitions for LART doesn't belong in cfi_endian.h.

--=20

Regards
 Abraham

Vail's Second Axiom:
	The amount of work to be done increases in proportion to the
	amount of work already completed.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LfSIzNXhP0RCUqMRAmimAJ9Dz5oqtaH0OD+rizCzdAXMIpoMTACbBxF/
/WsWDL7AWHhZeIwRDdOjrRI=
=Q8Tg
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
