Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12t5Nh-0003xL-00
	for mtd-list@infradead.org; Sat, 20 May 2000 10:17:13 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12t5Nf-0003xF-00
	for mtd@infradead.org; Sat, 20 May 2000 10:17:12 +0100
Date: Sat, 20 May 2000 11:17:09 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Alexander Viro <aviro@redhat.com>
cc: Bjorn Wesen <bjorn.wesen@axis.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: rename semantics
In-Reply-To: <Pine.LNX.4.10.10005191236020.684-100000@aviro.devel.redhat.com>
Message-ID: <Pine.LNX.3.96.1000520111028.10527A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 19 May 2000, Alexander Viro wrote:
> On Fri, 19 May 2000, Alexander Larsson wrote:
> > The 2.2 version will be merged into the MTD cvs tree.=20
> > S=E9bastien C=F4t=E9 <scote1@matrox.com> is working on it. The change=
s are
> > sufficiently small to warrant #ifdef's.=20
>=20
> Notice that 2.3 and 2.2 versions will seriously diverge in interp.c too=
 -
> current code maintains the heck of redundant stuff that already belongs
> to dcache. And I'm not too sure that cleanups in that area will be port=
able
> to 2.2

Ahh, I see. I didn't think about that, but it would be much better to use
the dcache for the in-memory representation of the filesystem. That chang=
e
will surely make a lot of changes in interp.c, but it will mean less code=
,
use less memory, and will (i think) mean that we will not need to keep th=
e
entire jffs meta-data in memory (parts of it is cached, the rest read on
demand into the dcache from the journal).

That will be a good change, and with the threaded dcache (and other
2.2->2.3 dcache changes) it might mean that 2.2 compatibility will be
hard.

Anyway, I will try to get a well-working version of the current code
before i do any dcache stuff. That version will probably support 2.2 and
2.3/4, and the interp.c changes are small (mainly bugfixes and MTD
support) so that the old inode.c with some small MTD changes could
probably be used for 2.0 support.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
