Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qLcN-0003SK-00
	for mtd-list@infradead.org; Mon, 30 Oct 2000 20:33:19 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13qLcL-0003SE-00
	for mtd@infradead.org; Mon, 30 Oct 2000 20:33:18 +0000
Date: Mon, 30 Oct 2000 20:33:09 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: "Steven J. Hill" <sjhill@cotw.com>
cc: MTD List <mtd@infradead.org>, JFFS List <jffs-dev@axis.com>
Subject: Re: Write support with JFFS and NAND now working...
In-Reply-To: <39FDC4B2.A52F5D8A@cotw.com>
Message-ID: <Pine.LNX.4.21.0010302031390.15834-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 30 Oct 2000, Steven J. Hill wrote:

> SPECIAL NOTE: Process synchronization has not been implemented i.e.
> spinlocks and waitqueues. It is NOT currently process/thread safe. I
> will have this implemented hopefully by the end of the day or early
> tomorrow morning my time. Enjoy.

Actually you'll probably find that the jffs semaphore makes it safe, as
long as you've only got one filesystem on it and don't access any parts 
of the device through other means while it's mounted.

Don't let that put you off fixing the locking though :)


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
