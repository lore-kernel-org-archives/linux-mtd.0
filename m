Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12smTh-0001gB-00
	for mtd-list@infradead.org; Fri, 19 May 2000 14:06:09 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12smTg-0001g5-00
	for mtd@infradead.org; Fri, 19 May 2000 14:06:08 +0100
Date: Fri, 19 May 2000 15:05:48 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>
cc: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
In-Reply-To: <3921B15B.BBFC65F3@matrox.com>
Message-ID: <Pine.LNX.4.10.10005191503140.2025-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 16 May 2000, S=E9bastien C=F4t=E9 wrote:

> Alexander Larsson wrote :
>=20
> > I have huge problems with rm (unlink). If i unlink a file i've recent=
ly
> > read i get a BUG() in clear_inode() in fs/inode.c. See my posting to
> > linux-kernel for more info.
> > Otherwise i haven't done much testing, I've mainly done separate test=
ing
> > of each function as I've implemented them.
>=20
> I played with the filesystem today and I noticed that this problem went
> away if I erase every file on the filesystem and re-copy them once it i=
s
> mounted.  I tried that a few times and all my problems went away (unlin=
k
> seems to work fine, df reports are ok, and so on).  I'm starting to
> think that the problem might lie elsewhere.

The problem was that i had no delete_inode() op in the
superblock_operations, so iput didn't call truncate_inode_pages() if ther=
e
were any cached pages.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
