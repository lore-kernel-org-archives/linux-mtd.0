Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14VXF4-0003co-00
	for mtd-list@infradead.org; Wed, 21 Feb 2001 11:15:30 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14VXF3-0003ci-00
	for mtd@infradead.org; Wed, 21 Feb 2001 11:15:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0056890022171085000002L952*@MHS> 
References: <0056890022171085000002L952*@MHS> 
To: erik.niessen@philips.com
Cc: mtd@infradead.org
Subject: Re: combine 2 banks into a single mtd device? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Feb 2001 11:15:26 +0000
Message-ID: <1906.982754126@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


erik.niessen@philips.com said:
>  Is there a way to combine the two banks into one mtd device of 16MB?
> So that I can put a simple Linux system on it.

Yep. Whatever map driver you're using, switch the add_mtd_partitions call 
to just register the underlying MTD device directly rather than the 
partitions.

> David is the jffs2 code beta enough for some read only testing? 

Testing is good, yes please. Read-only testing is pointless because nobody's
written a mkfs.jffs2 yet, so you have to mount an empty filesystem and then
fill it. It seems OK at the moment until you get to the end of the flash 
and the GC starts having to do some work. Compression is working nicely. 

I'm working on the GC code. The scan code and the normal read/write/etc 
operations want exercising. And mkfs.jffs2 wants writing :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
