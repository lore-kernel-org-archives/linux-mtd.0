Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15BwsK-0002IT-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 12:07:20 +0100
Date: Mon, 18 Jun 2001 13:13:15 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: CVS updates
Message-ID: <20010618131315.A2156@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
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

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've added a standalone driver for the 28F160xx chips on LART. I've also
removed the LART definitions in the sa1100 maps driver (it's wasn't used in
anycase and it's obsolete now anyway). Same for the LART endian definitions
in cfi_endian.h and the cfi chip driver Config file.

I've also added 2 utilities. mtd_debug is a debugging/diagnostics tool for
MTD drivers and fcp allows you to copy files to mtd character devices.


--=20

Regards
 Abraham

Absence makes the heart grow fonder.
		-- Sextus Aurelius

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LeJLzNXhP0RCUqMRAm9SAJ0dT8WFDmBwSbmqy4nrAEYiQTJQCQCeLDoh
AD1dtP3+cpGeulc+2Y89xAQ=
=uQhD
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
