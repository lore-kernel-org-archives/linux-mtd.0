Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157wEj-0007JP-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 10:37:54 +0100
Date: Thu, 7 Jun 2001 11:43:19 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: HELP
Message-ID: <20010607114319.A23641@crystal.2d3d.co.za>
References: <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <19468.991906514@redhat.com>; from dwmw2@infradead.org on Thu, Jun 07, 2001 at 10:35:14 +0100
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

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David!

> abraham@2d3d.co.za said:
> > mtd_debug: Unaligned memory access at pc=3D0xca005644, lr=3D0xc001dc08
> > (bad address=3D0xc0135d82, cod) Internal error: alignment exception: 0
>=20
> Enable CONFIG_ALIGNMENT_TRAP.
>=20
> 2.4.4-rmk1 or later will force you to do this before you can enable
> CONFIG_MTD.

why is this necessary though? The kernel docs make it pretty clear that
enabling that causes severe performance penalties which I wanted to avoid.

--=20

Regards
 Abraham

Everybody is somebody else's weirdo.
		-- Dykstra

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7H0y3zNXhP0RCUqMRAtDjAKCIstB+SQvXmNh4ssD6MCBtHTj12wCfVsGh
Dkp4k/3/SOHnleKkCpYrSGE=
=dX9n
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
