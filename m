Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 193FKX-0007C7-2w
	for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2003 14:09:33 +0100
From: "John Burch" <jburch@vincisystems.com>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Wed, 9 Apr 2003 09:09:54 -0400
Message-ID: <000501c2fe99$509aaa40$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <20030407195308.GA28178@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: 'Mtd' <linux-mtd@lists.infradead.org>
Subject: RE: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several questions...

1.  Even to build 'erase' only, one still needs zlib?
2.  I can't seem to track down the 'common zlib patch' you refer to.  Is
this a special patch in support of mtd, or a general patch for zlib
(such that if I get the latest zlib I wouldn't need the patch)?
3.  Is the patch particular to a specific version of zlib?
4.  Can my target zlib version differ from the host zlib version without
causing problems?

Thanks,
John


> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of J=F6rn =
Engel
> Sent: Monday, April 07, 2003 2:53 PM
> To: John Burch
> Cc: 'Mtd'
> Subject: Re: Problems making jffs2 utils
>=20
>=20
> On Mon, 7 April 2003 14:50:49 -0400, John Burch wrote:
> >=20
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
>=20
> You need the common zlib patch, it should be on=20
www.kernel.org somewhere under people/dwmw2.

J=F6rn

--=20
Data expands to fill the space available for storage.
-- Parkinson's Law

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
