Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FZtG-0003LI-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 11:18:46 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FZtF-0003LC-00
	for mtd@infradead.org; Fri, 21 Jul 2000 11:18:45 +0100
Date: Fri, 21 Jul 2000 12:20:40 +0200 (CEST)
From: Finn Hakansson <finn@axis.com>
To: Studio Balbi <balbi@iol.it>
cc: David Woodhouse <dwmw2@passion.cygnus.co.uk>, mtd@infradead.org,
        jffs-dev@axis.com
Subject: Re: RFC about my application
In-Reply-To: <Pine.LNX.4.21.0007201527000.23213-100000@passion.cygnus.co.uk>
Message-ID: <Pine.LNX.4.21.0007211134290.8889-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 20 Jul 2000, David Woodhouse wrote:

> On Thu, 20 Jul 2000, Studio Balbi wrote:
> 
> > I need to change often some bytes of information inside a big file.
> > I thougth I could store this information in a separate file or as a suffix
> > to the file name rather than into the file. Could this two options give me
> > some advantages in term of saving flash writes or reliability? Which is the
> > better?
> 
> On JFFS, I believe it'd be (slightly) more efficient to store it in the
> same file. The residents of the JFFS list will know better than I.

What David wrote is in a way true. I think its effectiveness depends from case
to case though. Approximately how large is your file and your flash? And how
often are you going to change the file? If the file isn't going to be changed
extremely often you could have it on a JFFS partition. Some changes per minute
is okay for a flash device but perhaps a number of changes per second isn't that
good in the long run.

Upon a small change or write to the flash, JFFS also just writes a small chunk
of data; the writes are kept small. Each data chunk written is just preceded
by a so-called raw inode of 60 bytes. So, in a way that is rather space
efficient. And sometimes JFFS rewrites the file in the event of a garbage
collect. (As you know, a garbage collect is triggered if the amount of dirty
space on the flash has exceeded a certain level.)

If you are going to change a large file very often I think you should have that
file on a read-only partition and try to apply the current changes to it each
time it is accessed. If you aren't going to change the file that often you could
perhaps have it on a read-write JFFS partition. My advice is that you try these
two methods out. To have the file on a JFFS partition is probably a simpler
solution; let the file system do the work for you.

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
