Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CKNv-0003hJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 13:13:32 +0100
Date: Tue, 19 Jun 2001 14:20:07 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: jffs2 problems
Message-ID: <20010619142007.A12096@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
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

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I just tried the 2.4.5 with the rmk6 and rmk6-np1 patches applied and
used the MTD CVS code instead of the kernel MTD code. Problems ):

When I boot up, I still get:

------------< snip <------< snip <------< snip <------------
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
jffs2_scan_empty(): Empty block at 0x00000000 ends at 0x00000000 (with
0xe0021985)! Marking dirt
y
jffs2_scan_empty(): Empty block at 0x00020000 ends at 0x00020000 (with
0xe0021985)! Marking dirt
y
jffs2_scan_empty(): Empty block at 0x00040000 ends at 0x00040000 (with
0xe0021985)! Marking dirt
y
jffs2_scan_empty(): Empty block at 0x00060000 ends at 0x00060000 (with
0xe0021985)! Marking dirt
y
=2E
=2E
=2E
jffs2_scan_empty(): Empty block at 0x002e0000 ends at 0x002e0000 (with
0x20031985)! Marking dirt
y
VFS: Mounted root (jffs2 filesystem) readonly.
------------< snip <------< snip <------< snip <------------

Any ideas?

Another interesting thing I noted is this:

------------< snip <------< snip <------< snip <------------
Freeing init memory: 36K
=2EI=FE=A0=FE#=AB)=F1.!=FE)init started:  BusyBox v0.51 (2001.06.07-09:49+0=
000) multi-call
binary
------------< snip <------< snip <------< snip <------------

Notice the hi-ascii garbage before init is started?

--=20

Regards
 Abraham

Your sister swims out to meet troop ships.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7L0N3zNXhP0RCUqMRAlggAJ0bhoy2/uVZZLeUbAUhNNdwGHUZngCeOKEx
tjlxZYS0M0WzdiceR90itSY=
=mN0Z
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
