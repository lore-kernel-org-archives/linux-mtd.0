Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 156seU-00031Q-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2001 12:36:07 +0100
Date: Mon, 4 Jun 2001 13:41:36 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: mtd->erasesize
Message-ID: <20010604134136.A2644@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
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

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm busy writing a driver for the 28Fxxxxx 3V Intel Fast Boot Block flash
devices (for now only a LART driver since I have no other boards to play
with).

The problem is that these chips have 8 4k blocks in the beginning and the
rest is 32k blocks, so effectively there is two erasesize's.

For now, I'm just skipping the first 8 4k blocks so you can't access that
with the MTD driver, but I believe this is a design flaw with the MTD
drivers. It should be able to handle multiple erasesize's for each device.

--=20

Regards
 Abraham

Somebody's terminal is dropping bits.  I found a pile of them over in the
corner.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7G3PwzNXhP0RCUqMRAqRnAJ9yGhjLs9lpFyYrLwD1LRw4j3U8AwCePRrA
Cl1WryQU3o/oXtpTlCH+/TU=
=4Vzw
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
