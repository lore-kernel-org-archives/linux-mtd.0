Received: from dsl-205-210-52-185.kingston.net ([205.210.52.185] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188Iwl-0003ca-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2002 11:29:39 +0000
Date: Sun, 3 Nov 2002 06:59:41 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021103115941.GJ16306@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <200210311
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CqfQkoYPE/jGoa5Q"
Content-Disposition: inline
In-Reply-To: <20021031183718.GA31035@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <ae211dd25992457126b87e47964e2ed8@interlinx.bc.ca>
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

--CqfQkoYPE/jGoa5Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2002 at 07:37:18PM +0100, J=F6rn Engel wrote:
>=20
> All right. This patch will only create the mtd devices from ram and
> block devices, unless $CONFIG_MEMORY_BUS is defined.
> Brian, can you define this option for all platforms other tham uml?
>=20
> Also, this might still be a little too broad for nand flash. Nand
> needs more than just a memory bus, but I don't know what exactly.
> But this should be close enough for now.

OK.  I have taken your patch and added the bits to define
CONFIG_MEMORY_BUS on existing hardware architectures in the 2.4.19
tree and sent the patch to Marcelo.  Let's see what happens.

I don't know what Marcelo's normal mode of operations is, whether he
responds to patch sumbitters with a confirmation of the patch being
applied or not (I still have not gotten response from a patch I sent a
few weeks ago doing pretty much this same thing for PC Appletalk
cards), but I guess we can just wait and see what's in 2.4.20 when
it's released.

b.

--=20
Brian J. Murrell

--CqfQkoYPE/jGoa5Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9xQ+tl3EQlGLyuXARAqW4AJ0VxIYFgw98HfqLJkpIZJ1N0WlAwwCg1B7Q
PExe/Pf+DP5wKT45EbOWp5I=
=KLSI
-----END PGP SIGNATURE-----

--CqfQkoYPE/jGoa5Q--
