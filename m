Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14R2N8-0005l4-00
	for mtd-list@infradead.org; Fri, 09 Feb 2001 01:29:14 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14R2N7-0005ky-00
	for mtd@infradead.org; Fri, 09 Feb 2001 01:29:13 +0000
Date: Fri, 9 Feb 2001 01:29:08 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Andrey Glazunov <lhfrjgtn@peterlink.ru>
cc: <mtd@infradead.org>
Subject: Re: lrp booting from M-Systems ISA flash card 
In-Reply-To: <004401c09236$e1862c90$a713f2c3@drakanworkst>
Message-ID: <Pine.LNX.4.30.0102090127570.17791-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 9 Feb 2001, Andrey Glazunov wrote:

> is it mtd-20000704.diff files from http://www.linux-mtd.infradead.org  the
> only patch i need or some else ? does it adds support for my old enough ISA
> flash card to 2.2.16 kernel or i have no chances to load modules from it
> after succesful loading kernel ?

Get the latest from the CVS tree. Don't use that old patch. Instructions
on getting the CVS tree are on the same web page. There are patches to
apply to the 2.2 kernels to set up the Makefiles etc., and then you drop
the .c and .h files from CVS into the kernel tree.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
