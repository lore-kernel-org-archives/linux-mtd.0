Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sggz-0005Fy-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 07:27:45 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13sggy-0005Fs-00
	for mtd@infradead.org; Mon, 06 Nov 2000 07:27:45 +0000
Date: Mon, 6 Nov 2000 07:27:41 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock
In-Reply-To: <Pine.LNX.4.10.10011052058170.30791-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.21.0011060644560.14068-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 5 Nov 2000, Nicolas Pitre wrote:
> 	insmod mtdcore.o
> 	insmod mtdram.o
> 	insmod mtdblock.o
> 	mke2fs /dev/mtdblock0
> 	mount /dev/mtdblock0 /mnt
> 	cp -a /sbin /mnt/sbin
> 	cat /dev/mtdblock0 > /dev/null
> 	[BOOM! random crash...]
> 
> Am I the only one to experience this?

Nope. I can reproduce it. handle_mtdblock_request is calling
end_request() when req->bh->b_end_io is NULL, even though it wasn't
like that at the beginning of handle_mtdblock_request.

Looks like the following comment is incorrect:
 * The head of our request queue is considered active so there is no need 
 * to dequeue requests before we are done.


-- 
dwmw2






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
