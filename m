Received: from tds-102399.k.se.telia.net ([213.64.187.90] helo=bjorndell)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXDe-0003dD-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:29:22 +0000
Received: from bjorn by bjorndell with local (Exim 3.33 #1 (Debian))
	id 16MXO8-000360-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 17:40:12 +0100
Date: Fri, 4 Jan 2002 17:40:12 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Eriksson <mdeans@algonet.se>
To: linux-mtd@lists.infradead.org
Subject: Re: From 2.4.9 to CVS ???
Message-ID: <20020104164012.GL4547@algonet.se>
References: <9A1957CB9FC45A4FA6F35961093ABB8406456D89@srvmail-mtl.montreal.ubisoft.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yaPAUYI/0vT2YKpA"
Content-Disposition: inline
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8406456D89@srvmail-mtl.montreal.ubisoft.org>
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

--yaPAUYI/0vT2YKpA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2002 at 11:19:13AM -0500, Patrick Allaire wrote:
> Every thing is compiled fine ... at boot up, MTD find(probe) my flash, it
> printout the partioning it will do ... after that I get=20
>=20
> VFS: Mounted root (cramfs filesystem) readonly.
> Freeing unused kernel memory : 36k freed
> Kernel panic: No init found....
>=20
>=20
> I know from the last line that the problems is that the kernel cannot find
> /sbin/init ... but it is there, it is exactly the same cramfs I used on
> 2.4.9 when it was working !!! To be sure it was not corrupted, I redid the
> flashing of the /dev/mtdblock0 with my cramfs file ... with the same
> results.

 Are you sure you're not getting a 'bad cramfs magic' as well? I know I
did when I tried booting a 2.4.9 cramfs-initrd with a 2.4.17 kernel.
Anyways, read fs/cramfs/README:

  <<The disadvantage is that the generated cramfs cannot always be
    shared between different kernels, not even necessarily kernels of
    the same architecture if PAGE_CACHE_SIZE is subject to change
    between kernel versions.>>


--=20
//Bj=F6rnen

--yaPAUYI/0vT2YKpA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NdrsZZzfBoMgUQ0RAmQ4AJwLZ0vh390PkEYifaWnYTxfRhi5IACcD9kA
2uBETGlbsaFN88Bc5tNZ0yA=
=cUzm
-----END PGP SIGNATURE-----

--yaPAUYI/0vT2YKpA--
