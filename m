Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157CKG-0004Lq-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 09:36:33 +0100
Date: Tue, 5 Jun 2001 10:42:01 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: acceptable chip driver limitations
Message-ID: <20010605104201.A26328@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
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

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Is it allright if my chip driver read/write's only accept 32-bit
to/from/len's?

I.e. if I return with -EINVAL if somebody tries to read/write a single byte
or tries to read from a non-dword boundary, is that acceptable or should the
driver cater for word/byte read/writes as well?

If this is the case, it complicates things a lot because for instance in my
case the flash device can only handle 32-bit read/write's and smaller
accesses will have to be emulated.

--=20

Regards
 Abraham

First study the enemy.  Seek weakness.
		-- Romulan Commander, "Balance of Terror", stardate 1709.2

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HJtZzNXhP0RCUqMRAllRAJ45ODgHlpPlxDpUxB2Xc8fs8T6aegCgkLmc
IoilWSBRS8stndEKvWLT2yI=
=gi6p
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
