Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from [209.167.190.89] (helo=ampr.harc.on.ca)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112Uoh-0006u4-00
	for mtd@infradead.org; Fri, 9 Jul 1999 08:11:27 +0100
From: "D. Jeff Dionne / VE3DJF" <jeff@ampr.harc.on.ca>
Message-Id: <199907090709.HAA04138@ampr.harc.on.ca>
Subject: Re: your mail
In-Reply-To: <Pine.LNX.3.96.990708165218.3773A-100000@white.priv.deltatee.com> from Jason Gunthorpe at "Jul 8, 1999  4:53:49 pm"
To: jgg@deltatee.com (Jason Gunthorpe)
Date: Fri, 9 Jul 1999 07:09:48 +0000 (GMT)
Cc: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> 
> On Thu, 8 Jul 1999, David Woodhouse wrote:
> 
> > > Anyway, having come over from the uClinux project, I am very
> > > interested in anything you may have.  I can also lend a hand.  We've
> > > had XIP from FLASH now for about a year, but are stuck using ROMfs
> > > (which as you know is read only). 
> 
> Can you fire over your patch to ROMfs to make it do this? The 2.2.10
> kernel version doesn't. 

Unfortunately, in it's current form it will not be of any use to you I suspect.
It's for 2.0.37, and is tied up with another meg of patch.  It touches lots
of stuff, and it needs cleaning :-(

We're also very 68k right now, so Linux/Intel would be some work.  You'll
need fully position independant code to start with... Does -fpic go far enough
on Intel?  You'll need to hack the ELF loader, we run a simple (low overhead)
binary format.

>   
> > We don't have XIP. We _do_ have FTL, and are working on FFS2. The situation is 
> > something like this:
> 
> I have read only ffs2 running, but the hair brained compression scheme is
> giving me pain :<
> 
> On lwn there was a pointer to a Hard Hat linux which also claimed flash
> support with a flash file system, anyone know more about those guys?
> 
> Jason
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
