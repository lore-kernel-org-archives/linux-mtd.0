Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DM6n-0007kA-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 09:16:06 +0100
Date: Fri, 22 Jun 2001 10:22:38 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
Message-ID: <20010622102238.F1828@crystal.2d3d.co.za>
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621155737.A26310@crystal.2d3d.co.za> <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com> <20010621163537.A26714@crystal.2d3d.co.za> <3B32668F.8020000@asu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <3B32668F.8020000@asu.edu>; from Russ.Dill@asu.edu on Thu, Jun 21, 2001 at 14:26:39 -0700
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

--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russ!

> If its just a config file, why make all this so complicated?
>=20
> struct node {
>=20
> 	u32 magic;
> 	char valid;
> 	u32 version;
> 	u32 data_crc;
> 	u32 hdr_crc;
> 	char data[DATA_SIZE];
> };

Yes, this is something in the lines I was thinking of. But what complicates
things is if you start taking things like avoiding damaged blocks into
account, wear levelling (this is fairly easy to solve) and keeping the flash
unfragmented.

--=20

Regards
 Abraham

Walking on water wasn't built in a day.
		-- Jack Kerouac

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7MwBOzNXhP0RCUqMRAu7dAKCGi78of4J6nBMHEEwVrf3PKmxXFgCfatS4
/ZXKMjRu7DGc2rgkdDlwgRg=
=5pCO
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
