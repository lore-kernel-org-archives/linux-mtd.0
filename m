Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OnzO-0003hC-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 21:43:30 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14OnzM-0003h6-00
	for mtd@infradead.org; Fri, 02 Feb 2001 21:43:29 +0000
Date: Fri, 2 Feb 2001 21:43:25 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Fenzi <kevin@scrye.com>
cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <20010202212916.18193.qmail@scrye.com>
Message-ID: <Pine.LNX.4.30.0102022140480.8902-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Feb 2001, Kevin Fenzi wrote:

> I left it at 0. How can I tell what address the DOC is at? from the
> bios? 
> 
> So it would print something here if it found the DOC? 

Yep, should do. Make it print stuff anyway - litter the 'doccheck' routine
in docprobe.c with printks. You do have CONFIG_MTD_DOCPROBE_HIGH turned
_off_ too, don't you? Another option which wants hiding.


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
