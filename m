Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H1Yj-0007k8-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 11:03:33 +0100
Date: Tue, 25 Jul 2000 12:02:09 +0200 (CEST)
From: Bjorn Wesen <bjornw@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
In-Reply-To: <31773.964517387@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000725115308.8086L-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 25 Jul 2000, David Woodhouse wrote:
> I'm been thinking about this, and about the problems with garbage collection
> taking to long. What about shifting all node writes into a kernel thread,
> which also does the GC?
> 
> The jffs_file_write() function then only needs to queue the node(s) to be 
> written, and can return immediately. Obviously we have to implement a way 
> of flushing a particular file, but that shouldn't be too difficult.

But you will run into the same problem then that the buffer-cache we avoid
solves. If you start queueing stuff, the reads will need to check
the queue before reading from the flash for example (the in-core node
which keeps track of the data contents of the files can of course have a
pointer to the queued data if it's not on flash yet). You cannot rely
on the page cache caching the changes because the pages might have become
invalidated.

So it's more complicated than just queueing the writes and erases. Also if
you defer writes too long you start loosing the point with the flash
filesystem since you'll loose a lot of changes upon power-failure. Imagine
a user changing a configuration entry with his web-browser. When he has
hit OK and gotten the "Saved" webpage, he pulls the plug. OK that is
perhaps fixed by writing files with O_SYNC or whatever that mechanism is
called like you say...

However with suitable locking, the GC _should_ indeed be a kernel thread,
that either is woken up on-demand (like it is now) or wakes up once in a
while and collects if necessary (both probably). That is not the same as
queueing writes though.

-Bjorn




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
