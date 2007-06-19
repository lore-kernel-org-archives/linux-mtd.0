Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0bKA-0007TV-0L
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 06:52:40 -0400
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Richard Purdie <rpurdie@openedhand.com>
To: dedekind@infradead.org
In-Reply-To: <1182248962.4403.60.camel@sauron>
References: <1182184301.6074.62.camel@localhost.localdomain>
	<1182239749.4403.48.camel@sauron>
	<1182247254.5760.17.camel@localhost.localdomain>
	<1182248962.4403.60.camel@sauron>
Content-Type: text/plain
Date: Tue, 19 Jun 2007 11:52:29 +0100
Message-Id: <1182250350.5760.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-19 at 13:29 +0300, Artem Bityutskiy wrote:
> On Tue, 2007-06-19 at 11:00 +0100, Richard Purdie wrote:
> > > Well, mtd->block_isbad() may return error, unlikely, bu still. You also
> > > ignore the error at other places.
> > 
> > Ignoring that is deliberate since it doesn't really matter if the block
> > is bad or we can't read from it, the action is the same...
> 
> No, bad EB is a perfectly legal thing and you should deal with it.

The code does.

>  Error
> code means that something very bad and sever is going on and you have to
> just refuse working with this device.

In this case, it will just move on to the next EB. There is code to
handle no available EBs at which point it will refuse to work with the
device.

> > > Also, do not ignore error code of mtd->block_markbad()
> > 
> > All we can do is print a warning, the action will be the same...
> 
> No, the action should be returning an error and refuse doing more work.

It will refuse to do more work if no usable EB is available but it will
try others first. It can be assumed mtdoops will only be used with small
partitions so trying to find a usable EB before giving a fatal error
shouldn't have much of an impact on the system and might just let it
keep working in some strange error cases (and since its an error logger,
that is good).

> > > Also, could you please use wait_event_interruptible() instead of
> > > set_current_state() which looks better (indeed, you have wait queue, 
> > > so use wq calls).
> > 
> > That piece of code is in keeping with the rest of the mtd erase handling
> > code. Looking through the various wq macros, I don't see any which help
> > particularly in this case...
> 
> Well, it is matter of taste so I do not insist. But I think
> wait_event_interruptible() is much nicer. Glance at drivers/ubi/io.c how
> it looks.

I'll have a look.

Cheers,

Richard
