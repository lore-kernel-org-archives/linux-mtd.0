Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12spmZ-0002Jk-00
	for mtd-list@infradead.org; Fri, 19 May 2000 17:37:51 +0100
Received: from lacrosse.corp.redhat.com ([207.175.42.154] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12spmX-0002Je-00
	for mtd@infradead.org; Fri, 19 May 2000 17:37:50 +0100
Date: Fri, 19 May 2000 12:37:43 -0400 (EDT)
From: Alexander Viro <aviro@redhat.com>
To: Alexander Larsson <alex@cendio.se>
cc: Bjorn Wesen <bjorn.wesen@axis.com>, Alexander Viro <aviro@redhat.com>,
        jffs-dev@axis.com, mtd@infradead.org
Subject: Re: rename semantics
In-Reply-To: <Pine.LNX.4.10.10005191829380.3233-100000@tammy.signum.se>
Message-ID: <Pine.LNX.4.10.10005191236020.684-100000@aviro.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>




On Fri, 19 May 2000, Alexander Larsson wrote:

> On Fri, 19 May 2000, Bjorn Wesen wrote:
>=20
> > Hi,
> >=20
> > do you think there is any possibility at all to make the same source =
of
> > JFFS work both in 2.0, 2.2 and 2.3/4 ? It is not really good to split=
 the
> > development into 3 branches I think, but it sure looks like it will b=
e
> > difficult to merge together Alexander's 2.3 port with our original
> > 2.0 version.=20
> >=20
> > I guess we'll have to maintain 3 cvs trees instead of one :) or maybe=
 the
> > 2.2 and 2.3 versions will be sufficiently similar to work with #ifdef=
's ?=20
>=20
> The 2.2 version will be merged into the MTD cvs tree.=20
> S=E9bastien C=F4t=E9 <scote1@matrox.com> is working on it. The changes =
are
> sufficiently small to warrant #ifdef's.=20

Notice that 2.3 and 2.2 versions will seriously diverge in interp.c too -
current code maintains the heck of redundant stuff that already belongs
to dcache. And I'm not too sure that cleanups in that area will be portab=
le
to 2.2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
