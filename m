Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M3C2-0007V0-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 08:53:27 +0100
Date: Mon, 16 Jul 2001 09:59:42 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: kingseft@samsung.co.kr
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: =?iso-8859-1?Q?=28=C0=E7=C0=FC=BC=DB=29_=2Fdev=2Fmtd0_qeustions?=
Message-ID: <20010716095942.A21213@crystal.2d3d.co.za>
References: <H00002af04ff19c1@MHS>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <H00002af04ff19c1@MHS>; from kingseft@samsung.co.kr on Sat, Jul 14, 2001 at 08:43:46 +0900
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

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi kingseft!

>  I got latest MTD source code(2001-07-11 version)
>  and set Kernel options.
>=20
>  when the kernel booted, I found all correct messages from kernel.
>  but, when I tyepd MAKEDEV, and then
>=20
>  mkfs.jffs -d /home/jffs -o /tmp/jffs.image
>  and
>=20
>  cp /tmp/jffs.image /dev/mtd0
>  the result message is
>=20
>  cp: /dev/mtd0  Read-only file system.     <----Here.
>=20
>  so, I can't proceed next step!!
>=20
>  Could anyone explain this problem??
>  Any comments will help me.. thanks.

btw, if you want to copy to a raw partition (as you did above), you'll have
to erase that partition first.

--=20

Regards
 Abraham

Your supervisor is thinking about you.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Up7uzNXhP0RCUqMRArZMAJ9klpVR69mSGdIw8WFLmPpYY8d71gCdGsup
2/Pp5rwhMTMMtYn3/TttkpM=
=WV4a
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
