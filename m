Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12spq4-0002Kd-00
	for mtd-list@infradead.org; Fri, 19 May 2000 17:41:28 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12spq3-0002KX-00
	for mtd@infradead.org; Fri, 19 May 2000 17:41:27 +0100
Date: Fri, 19 May 2000 18:40:29 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: Alexander Larsson <alex@cendio.se>
cc: Alexander Viro <aviro@redhat.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: rename semantics
In-Reply-To: <Pine.LNX.4.10.10005191829380.3233-100000@tammy.signum.se>
Message-ID: <Pine.LNX.3.96.1000519183449.10581D-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 19 May 2000, Alexander Larsson wrote:
> > I guess we'll have to maintain 3 cvs trees instead of one :) or maybe t=
he
> > 2.2 and 2.3 versions will be sufficiently similar to work with #ifdef's=
 ?=20
>=20
> The 2.2 version will be merged into the MTD cvs tree.=20
> S=E9bastien C=F4t=E9 <scote1@matrox.com> is working on it. The changes ar=
e
> sufficiently small to warrant #ifdef's.=20

Ok.

> For the 2.0 version.... I don't know. Maybe if we just keep two separate
> inode.c in the tree. That file is the only one with changes, but they are
> quite major.

That sounds good. As long as the internal routines are the same, it will
make bugfixing etc easier if they coexist.

So we'll merge in the inode.c from the MTD tree when you've merged in the
2.2 patches, and then we'll do some magic incantations and make a real
JFFS release as an all-purpose patch :)

-Bjorn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
