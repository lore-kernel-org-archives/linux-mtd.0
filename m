Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D20j-000678-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 11:48:30 +0100
Date: Thu, 21 Jun 2001 12:54:58 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: safe flash filesystem
Message-ID: <20010621125458.A23785@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
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

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

We're developing a product that needs a small part of the flash memory to
contain a very scaled down file system containing configuration files. This
file system have to be extremely reliable. Speed is not an issue, but the
validity of any data written to it is of utmost importance.

So before I go reinvent the wheel, I'd like to know if there's something
which already does this, i.e. does things like keep duplicate copies of
everything around, have all sorts of checks and balances to check for
damaged parts of the flash, no caching and some sort of wear levelling, etc?

--=20

Regards
 Abraham

Have you noticed that all you need to grow healthy, vigorous grass is a
crack in your sidewalk?

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7MdKCzNXhP0RCUqMRAhZGAJsHQ1DEqHQkRV6abgnLh2XGS9BFXQCbBMG3
ksNJuSFPEK2C1lG5RN3vmi0=
=2xRY
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
