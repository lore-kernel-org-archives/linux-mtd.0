Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132yLV-00041f-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 16:47:49 +0100
Message-ID: <394A4C3F.C6E434C8@matrox.com>
Date: Fri, 16 Jun 2000 11:48:15 -0400
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

> jffs_file_write() - The 2.3 version has some file-size handling (SIGXFS=
Z)
> that could be interesting for 2.2. There is also some semaphore locking
> that 2.2 doesn't have which I'm a bit unsure of if it is needed in 2.2.
> The *pos handling can maybe also be moved over.

The file-size handling is definitly good.  The semaphore locking isn't
present in the 2.2 version of ext2 (it was introduced in 2.3) so I don't
think it's needed.

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
