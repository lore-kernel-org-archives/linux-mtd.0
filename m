Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ro5m-0003Sa-00
	for mtd-list@infradead.org; Tue, 16 May 2000 21:37:26 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ro5l-0003SU-00
	for mtd@infradead.org; Tue, 16 May 2000 21:37:25 +0100
Message-ID: <3921B15B.BBFC65F3@matrox.com>
Date: Tue, 16 May 2000 16:36:43 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Alexander Larsson <alex@cendio.se>
CC: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
References: <Pine.LNX.3.96.1000515120001.25053A-100000@biffen.cendio.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson wrote :

> I have huge problems with rm (unlink). If i unlink a file i've recently
> read i get a BUG() in clear_inode() in fs/inode.c. See my posting to
> linux-kernel for more info.
> Otherwise i haven't done much testing, I've mainly done separate testin=
g
> of each function as I've implemented them.

I played with the filesystem today and I noticed that this problem went
away if I erase every file on the filesystem and re-copy them once it is
mounted.  I tried that a few times and all my problems went away (unlink
seems to work fine, df reports are ok, and so on).  I'm starting to
think that the problem might lie elsewhere.

Could mkfs.jffs be the problem ?  What about mtd ?


--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
