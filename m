Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H1eM-0007o8-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 11:09:22 +0100
Date: Tue, 25 Jul 2000 12:11:48 +0200 (CEST)
From: Finn Hakansson <finn@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
        "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
In-Reply-To: <3583.964519300@cygnus.co.uk>
Message-ID: <Pine.LNX.4.21.0007251206470.17368-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 25 Jul 2000, David Woodhouse wrote:

> 
> finn@axis.com said:
> >  I cannot understand that. How much time are we talking about? How
> > large is the flash? How long does an erase take? One garbage collect
> > cannot consume more time than (sectors on flash * number of sectors)
> > time I think. 
> 
> After making a few copies of /usr and /lib, then deleting them, I saw it
> take an hour and a half with a 16Mb flash which was about half-full.

Then something else must be very wrong. A garbage collect shouldn't take
more than a few seconds at most. Unless you have a really slow flash chip.


> Now I've implemented buffer writes on chips which support it, that should be
> down to ten minutes. I'm sure the verbose logging over the serial port
> doesn't help :)
> 
> But it's still done in process context, and writes of new nodes have to 
> wait while it's happening. Shifting that into its own kernel thread would 
> be nice, and would also allow us to merge writes. 
> 
> I'm far more concerned by the thing getting corrupted when I abruptly 
> remove power - I'm about to see if I can reproduce it with the patches you 
> committed just before I left - do you have any ideas from the log I posted 
> on the 17th of July?

I'll take a look at it after lunch.

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
