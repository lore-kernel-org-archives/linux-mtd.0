Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132xQp-0003qD-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 15:49:15 +0100
Message-ID: <394A3E91.4C025831@matrox.com>
Date: Fri, 16 Jun 2000 10:49:53 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Alexander Larsson <alex@cendio.se>
CC: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c'
References: <Pine.LNX.4.10.10006161601090.32348-100000@tammy.signum.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson wrote:

> I did the most obvious conversions, but i had to leave a couple of thin=
gs
> because that need more thinking and testing:
>=20
> jffs_read_super() - Does it really has to lock the superblock here?

Ext2 does it in 2.2 and it seemed right to me.  If the fs changes while
it is being built, this is really not a good thing.
=20
> jffs_read_page() - I've done some changes here in the 2.3 version that
> might be intresting to 2.2. These are mainly page handling stuff, you n=
eed
> to check that carefully.

I'll have to check what changes you're talking about but IIRC the page
handling changed quite a bit between 2.2 and 2.3.

> jffs_file_write() - The 2.3 version has some file-size handling (SIGXFS=
Z)
> that could be interesting for 2.2. There is also some semaphore locking
> that 2.2 doesn't have which I'm a bit unsure of if it is needed in 2.2.
> The *pos handling can maybe also be moved over.
>=20
> There are also some comments (/* Is this really needed in 2.2?
> */) sprinkled in the code. These are mainly corner-cases which I and al
> viro has removed from the 2.3 code because they are handled by the VFS.
> Probably most of these are handled by the 2.2 VFS too...
>
> Also there are some french comments in the code that i left there, beca=
use
> i don't understand them.

Sorry about that.  I completly forgot them when I sent my tree to David
:)

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
