Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157xTw-0007Oy-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 11:57:41 +0100
Date: Thu, 7 Jun 2001 13:03:09 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: erase questions
Message-ID: <20010607130309.A28720@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
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

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I have a couple of questions about mtd_info->erase which isn't covered in
the MTD API:

=46rom the MTD API docs, it seems the erase function can only be called
erase_info->len =3D=3D mtd->erasesize. This is obviously not true anymore s=
ince
there can be multiple erase regions with multiple erase sizes and the user
might request an erase on one of the smaller blocks.

So can I assume that I only have to deal (read: allow) with erases where
erase_info->addr =3D=3D START_OF_SOME_BLOCK and erase_info->len =3D=3D
LENGTH_OF_THAT_BLOCK?

So basically it boils down to 2 questions. Is ->addr always equal to the
start of a block and is ->len always equal to the size of that block or may
->len span multiple blocks.

If ->len may span multiple blocks, must it be equal to the size of all the
blocks (e.g. if you we're to erase a 2x 4k + 3x 8k consecutive blocks, must
len be equal to 32k)?

--=20

Regards
 Abraham

Reading is to the mind what exercise is to the body.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7H19tzNXhP0RCUqMRAmqGAJwPf0GGJeCXcSn/EEpUQETpsp8gTgCfV8IC
9Hl3HayYraBlmx0v40z5hws=
=Y9Zn
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
