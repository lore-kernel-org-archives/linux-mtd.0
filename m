Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12rKvZ-0007ZV-00
	for mtd-list@infradead.org; Mon, 15 May 2000 14:28:57 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12rKvY-0007ZP-00
	for mtd@infradead.org; Mon, 15 May 2000 14:28:56 +0100
Message-ID: <391FFB78.4D0674D@matrox.com>
Date: Mon, 15 May 2000 09:28:24 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Alexander Larsson <alex@cendio.se>
CC: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
References: <Pine.LNX.3.96.1000515120001.25053A-100000@biffen.cendio.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson wrote :

>=20
> I have huge problems with rm (unlink). If i unlink a file i've recently
> read i get a BUG() in clear_inode() in fs/inode.c. See my posting to
> linux-kernel for more info.
> Otherwise i haven't done much testing, I've mainly done separate testin=
g
> of each function as I've implemented them.

I tried to unlink a file after reading it and, even though the file gets
unlinked without any error, most of the files on the filesystem got
screwed up.

In kernel 2.2.14, clear_inode() is a bit different :

void clear_inode(struct inode *inode)
{
	if (inode->i_nr_pages)
	    truncate_inode_pages(inode,0);
	wait_on_inode(inode);
	...
}

This would explain the fact that I didn't get any BUG().


--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
