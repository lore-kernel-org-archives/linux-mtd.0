Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sphY-0002Io-00
	for mtd-list@infradead.org; Fri, 19 May 2000 17:32:40 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12sphX-0002Ii-00
	for mtd@infradead.org; Fri, 19 May 2000 17:32:39 +0100
Date: Fri, 19 May 2000 18:32:33 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Bjorn Wesen <bjorn.wesen@axis.com>
cc: Alexander Viro <aviro@redhat.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: rename semantics
In-Reply-To: <Pine.LNX.3.96.1000519181531.10581B-100000@fafner.axis.se>
Message-ID: <Pine.LNX.4.10.10005191829380.3233-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 19 May 2000, Bjorn Wesen wrote:

> Hi,
>=20
> do you think there is any possibility at all to make the same source of
> JFFS work both in 2.0, 2.2 and 2.3/4 ? It is not really good to split t=
he
> development into 3 branches I think, but it sure looks like it will be
> difficult to merge together Alexander's 2.3 port with our original
> 2.0 version.=20
>=20
> I guess we'll have to maintain 3 cvs trees instead of one :) or maybe t=
he
> 2.2 and 2.3 versions will be sufficiently similar to work with #ifdef's=
 ?=20

The 2.2 version will be merged into the MTD cvs tree.=20
S=E9bastien C=F4t=E9 <scote1@matrox.com> is working on it. The changes ar=
e
sufficiently small to warrant #ifdef's.=20

For the 2.0 version.... I don't know. Maybe if we just keep two separate
inode.c in the tree. That file is the only one with changes, but they are
quite major.

/ Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
