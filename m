Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 193JEW-0007rB-6R
	for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2003 18:19:36 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'Earl Manning'" <EManning@PRISMIQ.com>,
	<linux-mtd@lists.infradead.org>
Date: Wed, 9 Apr 2003 13:19:58 -0400
Message-ID: <001601c2febc$4013a050$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <20030407141857.3a11609c.EManning@PRISMIQ.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> I have a similar system, embedded mips based, and here is the=20
> changed Makefile for the util directory that I used.  I hope=20
> this helps.
>=20
> Earl Manning

Two things...

1. Your makefile helped, but the static 'erase' binary is nearly 2MB
(0.5MB stripped); I need this for the target and can't afford that much
space.  When I add '-shared' to CFLAGS, 'erase' is down to a manageable
size, but then I see that the libc.so.6 (libc-2.2.5.so) that it needs is
over 5MB (1.6M stripped).  Still too big.  Are there other solutions for
erasing or for library?

2. Also, I'm still getting...

"undefined reference to: 'cpu_to_je16'" and=20
"undefined reference to: 'cpu_to_je32'"

errors when building eraseall.c.  It seems it uses these, but the only
place I see them defined (as macros) is in mkfs.jffs2.c.  I could always
just duplicate those from mkfs.jffs2 and put them into eraseall, but I'm
wondering if there are other issues involved.

John

>=20
> On Mon, 7 Apr 2003 14:50:49 -0400
> "John Burch" <jburch@vincisystems.com> wrote:
>=20
> > I'm running into compiler errors when trying to build the jffs2=20
> > utilities for a 2.4.17/mips target.  I've checked out the=20
> latest mtd=20
> > code according to www.linux-mtd.infradead.org, then have=20
> followed the=20
> > instructions in the mtd/util/README file (copied mtd/util=20
> contents to=20
> > directory under linux root and changed $CROSS as necessary=20
> since I'm=20
> > cross-compiling to mips).  I cd to=20
> <mips-kernel-path>/linux/utils and=20
> > do a make, but get errors immediately, which typically include the=20
> > following (depending on which util I'm trying to make)...
> >=20
> > .../libc.so.6: undefined reference to 'no symbol'
> > .../mips-linux-ld: cannot find -lz
> >=20
> > I'm really only after 'erase' and maybe 'jffs2reader' for use on my=20
> > mips embedded target; I already have mkfs.jffs2 as an x86=20
> binary for=20
> > my x86 development platform.  Any ideas, or better place for me to=20
> > post this question?
> >=20
> > John
> >=20
> >=20
> > ______________________________________________________
> > Linux MTD discussion mailing list=20
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
