Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W3iO-0000kM-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 21:55:56 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14W3iN-0000kG-00
	for mtd@infradead.org; Thu, 22 Feb 2001 21:55:55 +0000
Date: Thu, 22 Feb 2001 21:55:49 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Vipin Malik <vmalik@danielind.com>
cc: <mtd@infradead.org>
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n
 ot r  egister block device!
In-Reply-To: <3A958586.676CD231@danielind.com>
Message-ID: <Pine.LNX.4.30.0102222154410.7303-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 22 Feb 2001, Vipin Malik wrote:

> Success!! Well sort of ;)
> 
> After a terrible hack of explicitly calling rd_load() again at the end
> of init_mtdblock(), forces the ramdisk stuff to look for the
> compressed root file system again. This time it finds it (now that
> mtdblock has registered the block device) enabling the root file
> system to be loaded and be mounted!

Heh. Well done.

> This proves for sure that that is the only issue left to boot
> compressed root file systems off raw flash. Once we figure out how to
> force init_mtdblock() to be linked in before the ram disk stuff, we
> would be set.

Cool. You'll have to hurry, though - We'll have JFFS2 (with compression) 
ready to roll out quite soon :)

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
