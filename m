Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139wzz-0003pg-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 22:46:27 +0100
Date: Wed, 5 Jul 2000 22:45:14 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>
cc: Bjorn Wesen <bjorn.wesen@axis.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000
In-Reply-To: <39637696.8FD02579@matrox.com>
Message-ID: <Pine.LNX.4.21.0007052243240.1189-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 5 Jul 2000, [iso-8859-1] S=E9bastien C=F4t=E9 wrote:

> Are you going to port MTD to 2.0 or will you switch your kernel to
> 2.2/2.4 ?

There has already been some work on porting MTD to 2.0. I cruelly reverted
a few of the changes which were made - but they were mostly fine in
principle, it's just that the result didn't actually compile on 2.[24] any
more for me.

--=20
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
