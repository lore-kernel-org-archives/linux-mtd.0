Received: from mail.2d3d.co.za ([196.14.185.200] helo=crystal.fakeland)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 159onE-00015S-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 15:05:18 +0100
Date: Tue, 12 Jun 2001 16:11:16 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: mtd woes
Message-ID: <20010612161116.A13712@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
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

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Jeez. I've had the worst debugging session in a long time the past two days.
My flash module kept causing a fault when using partitioning. In the end it
turned out there's a small bug in mtdpart.c - It doesn't check whether
sync() is defined, i.e. in add_mtd_partitions():

------------< snip <------< snip <------< snip <------------
        slave->mtd.bank_size =3D master->bank_size;

        slave->mtd.module =3D master->module;

        slave->mtd.read =3D part_read;
        slave->mtd.write =3D part_write;
       if (master->sync) slave->mtd.sync =3D part_sync;
        //slave->mtd.sync =3D part_sync;
        if (!i && master->suspend && master->resume) {
                slave->mtd.suspend =3D part_suspend;
                slave->mtd.resume =3D part_resume;
------------< snip <------< snip <------< snip <------------

The uncommented line is what it's set to atm which is wrong since the MTD
API states that sync() is optional. The line in there fixes it.

I'll send a patch when I release my module, but since this is a one-liner
anyway, one of you guys can patch it as well...

--=20

Regards
 Abraham

If A =3D B and B =3D C, then A =3D C, except where void or prohibited by la=
w.
		-- Roy Santoro

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7JiMEzNXhP0RCUqMRAmKiAKCLtSCJZ5FVi2u93eRH4JCd7r+0dACePD1q
Xy1AEzmLXln9mPlCR+5d2Io=
=syYz
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
