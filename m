Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H1GT-0007g0-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 10:44:41 +0100
Date: Tue, 25 Jul 2000 11:44:13 +0200 (CEST)
From: Finn Hakansson <finn@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
        "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
In-Reply-To: <31773.964517387@cygnus.co.uk>
Message-ID: <Pine.LNX.4.21.0007251137360.17368-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 25 Jul 2000, David Woodhouse wrote:

> 
> finn@axis.com said:
> >  Yeah. One day, write and rewrite should be merged into one single
> > function... 
> 
> I'm been thinking about this, and about the problems with garbage collection
> taking to long.

I cannot understand that. How much time are we talking about? How large
is the flash? How long does an erase take? One garbage collect cannot
consume more time than (sectors on flash * number of sectors) time I
think.


> What about shifting all node writes into a kernel thread,
> which also does the GC?

Hmmm...

> The jffs_file_write() function then only needs to queue the node(s) to be 
> written, and can return immediately. Obviously we have to implement a way 
> of flushing a particular file, but that shouldn't be too difficult.

Well. Sounds like a good idea. I'll think about it.

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
