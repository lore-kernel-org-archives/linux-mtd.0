Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sabM-0004YJ-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 00:57:32 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13sabK-0004YD-00
	for mtd@infradead.org; Mon, 06 Nov 2000 00:57:31 +0000
Date: Mon, 6 Nov 2000 00:57:20 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Brian Kuschak <brian.kuschak@skystream.com>
cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: Erase unit header corrupted when using FTL
In-Reply-To: <B25E2E5A003CD311B61E00902778AF2A018278EB@server1.skystream.com>
Message-ID: <Pine.LNX.4.21.0011060055310.6733-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 5 Nov 2000, Brian Kuschak wrote:

> I'm having a major problem when using the FTL.  I format and mount a
> filesystem on the FTL device, and do this:
> 
>   - copy a file onto the device
>   - sync
>   - remove the file 
>   - sync
>   - copy another file onto the device
>   - sync.
> 
> The file is ~84KB and the sector size is 128KB.  The second copy causes the
> FTL to start erasing the first erase unit.  At this point, the erase always
> fails.  Seems like the erase unit is not getting a valid header written to
> it after being erased.  I can verify that the erase callback is being
> called.  Any ideas?

Probably because we're sleeping in the request function. We need to
transplant the kernel_thread fix from the mtdblock code.

Are you using this on a PCMCIA device? If not, and if you're not in the
Free World, then you're probably breaking the law. 

You might consider using JFFS instead.


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
