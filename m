Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Auks-0005tT-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 15:39:23 +0100
Date: Fri, 15 Jun 2001 16:45:25 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: latest jffs2 troubles
Message-ID: <20010615164525.A6569@crystal.2d3d.co.za>
References: <20010615160805.A5977@crystal.2d3d.co.za> <32514.992614893@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <32514.992614893@redhat.com>; from dwmw2@infradead.org on Fri, Jun 15, 2001 at 15:21:33 +0100
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David!

> > jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c093c: Read 0=
x49ccf4da, calculated 0x2
> > 77fb134
> > jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c0ae8: Read 0=
x2d13ab07, calculated 0x8=20
> > a10a00e
>=20
> Urgh. Word wrap.
>=20
> Which kernel? If the alignment fixups are broken, that would explain it.

2.4.3 with the rmk2 and rmk2-np1 patches applied on LART.

--=20

Regards
 Abraham

Old Japanese proverb:
	There are two kinds of fools -- those who never climb Mt. Fuji,
	and those who climb it twice.

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

iD8DBQE7Kh+FzNXhP0RCUqMRAk7LAJ9cf1ND6ZXWcXtAtp0FJgCucr4utgCgiIEm
jBGJxNCEsEtBcRFCsHLKEQQ=
=wxsc
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
