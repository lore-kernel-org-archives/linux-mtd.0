Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Ar5A-0005gC-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 11:44:05 +0100
Date: Fri, 15 Jun 2001 12:49:57 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: flash driver patches
Message-ID: <20010615124957.A29946@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
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

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've just finished testing my flash driver which I'd like to send to you
guys to integrate into the MTD tree so that it can find it's way into the
official kernel.

I'm just wondering how you would prefer to get it? I can send it as a
standalone module (it's just a single source file which should go under the
mtd/devices section) or a unified diff (or both), but I don't know what I
should patch. The latest CVS MTD tree, the kernel (which version? with or
without the rmk/np patches?), etc.

There's also a small patch that fixes a bug in mtdpart.c, so I can send a
diff for this, but once again I don't know against what I should patch...

--=20

Regards
 Abraham

If I'd known computer science was going to be like this, I'd never have
given up being a rock 'n' roll star.
		-- G. Hirst

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7KehVzNXhP0RCUqMRAgUXAJ9U24kgW4rVTdWTHu5AP8NaB34dzwCggiFN
AWPCi7abGXBMko01AwFI3+o=
=ucjA
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
