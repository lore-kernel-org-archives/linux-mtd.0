Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H1kv-0007qH-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 11:16:09 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H1kn-0007q8-00
	for mtd@infradead.org; Tue, 25 Jul 2000 11:16:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000725115308.8086L-100000@fafner.axis.se> 
References: <Pine.LNX.3.96.1000725115308.8086L-100000@fafner.axis.se> 
To: Bjorn Wesen <bjornw@axis.com>
Cc: "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 11:15:53 +0100
Message-ID: <4992.964520153@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjornw@axis.com said:
> But you will run into the same problem then that the buffer-cache we
> avoid solves. If you start queueing stuff, the reads will need to
> check the queue before reading from the flash for example (the in-core
> node which keeps track of the data contents of the files can of course
> have a pointer to the queued data if it's not on flash yet). You
> cannot rely on the page cache caching the changes because the pages
> might have become invalidated. 

True. It should be possible to make JFFS use the page cache and
generic_file_{read,write}() though, so the data in the page cache are always
valid. There are apparently ways to do it without having to write 4 KB nodes
each time we're told a page has been dirtied.

I need to schedule myself a crash course on Linux VFS so that I know what 
I'm talking about :)

bjornw@axis.com said:
> . When he has hit OK and gotten the "Saved" webpage, he pulls the
> plug. OK that is perhaps fixed by writing files with O_SYNC or
> whatever that mechanism is called like you say...

Netscape does actually write changes to its config files with O_SYNC, and I
think it's reasonable to expect that to be necessary. A journalling
filesystem should always have a consistent state, but it allowed to have
write-behind. It doesn't necessarily have to commit writes to the media
before returning - that's what O_SYNC is for.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
