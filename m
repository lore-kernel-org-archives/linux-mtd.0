Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApfP2-0002ro-2Z
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 03:14:36 +0000
Received: from 192.168.1.100 (bluefire.joshuawise.com [192.168.1.100])
	997938D8E	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Feb 2004 22:14:42 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 7 Feb 2004 22:14:32 -0500
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402072214.38040.joshua@joshuawise.com>
Subject: MTD CVS + Kernel 2.6 from handhelds.org - mtd_char - compilation
	errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

I am compiling mtdcvs+k2.6-hh, and mtd_char seems to be choking on the fact=
=20
that I have devfs enabled, but devfs is being phased out.=20

Errors:
drivers/mtd/mtdchar.c:28: error: parse error before "devfs_dir_handle"
drivers/mtd/mtdchar.c:28: warning: type defaults to `int' in declaration of=
=20
`devfs_dir_handle'
drivers/mtd/mtdchar.c:28: warning: data definition has no type or storage=20
class
drivers/mtd/mtdchar.c:29: error: parse error before "devfs_rw_handle"
drivers/mtd/mtdchar.c:29: warning: type defaults to `int' in declaration of=
=20
`devfs_rw_handle'
drivers/mtd/mtdchar.c:29: warning: data definition has no type or storage=20
class
drivers/mtd/mtdchar.c:30: error: parse error before "devfs_ro_handle"
drivers/mtd/mtdchar.c:30: warning: type defaults to `int' in declaration of=
=20
`devfs_ro_handle'
drivers/mtd/mtdchar.c:30: warning: data definition has no type or storage=20
class
drivers/mtd/mtdchar.c: In function `mtd_notify_add':
drivers/mtd/mtdchar.c:486: warning: implicit declaration of function=20
`devfs_register'
drivers/mtd/mtdchar.c:487: error: `DEVFS_FL_DEFAULT' undeclared (first use =
in=20
this function)
drivers/mtd/mtdchar.c:487: error: (Each undeclared identifier is reported o=
nly=20
once
drivers/mtd/mtdchar.c:487: error: for each function it appears in.)
drivers/mtd/mtdchar.c: In function `mtd_notify_remove':
drivers/mtd/mtdchar.c:503: warning: implicit declaration of function=20
`devfs_unregister'
drivers/mtd/mtdchar.c: In function `init_mtdchar':
drivers/mtd/mtdchar.c:518: warning: too many arguments for format

jwise
=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAJamdPn9tWOqA4LMRAhtKAJ9CY9rVyclz0FmMmsd+QyULyDzY+ACfZq0D
H9fuhqgsJp/SPxBUfTKSCOI=3D
=3D/yV8
=2D----END PGP SIGNATURE-----
