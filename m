Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Cfkn-0004sO-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2001 12:02:34 +0100
Date: Wed, 20 Jun 2001 13:09:01 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: jffs2 problems
Message-ID: <20010620130901.A11353@crystal.2d3d.co.za>
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

This is weird. If I compile all the MTD drivers as modules as well as jffs2
and I insert them at runtime, everything works perfectly, but if I compile
them into the kernel, it screws up at boot time (I posted the errors to this
list yesterday iirc).

Any ideas why this happens? It's definitely jffs2 that messes up since the
mtd drivers work fine even if they're compiled into the kernel.

--=20

Regards
 Abraham

If only one could get that wonderful feeling of accomplishment without
having to accomplish anything.

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

iD8DBQE7MIRNzNXhP0RCUqMRAuPcAJ9feswiuPN2M2bbu05ozc8Y3MsTxgCfdj73
E4BSeErU8DYu512oOOkdtvQ=
=Ogeq
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
