Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112N3E-0006j9-00
	for mtd@infradead.org; Thu, 8 Jul 1999 23:53:56 +0100
Date: Thu, 8 Jul 1999 16:53:49 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: "D. Jeff Dionne / VE3DJF" <jeff@ampr.harc.on.ca>, mtd@infradead.org
Subject: Re: your mail
In-Reply-To: <E112KPc-0005ge-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990708165218.3773A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Thu, 8 Jul 1999, David Woodhouse wrote:

> > Anyway, having come over from the uClinux project, I am very
> > interested in anything you may have.  I can also lend a hand.  We've
> > had XIP from FLASH now for about a year, but are stuck using ROMfs
> > (which as you know is read only). 

Can you fire over your patch to ROMfs to make it do this? The 2.2.10
kernel version doesn't. 
  
> We don't have XIP. We _do_ have FTL, and are working on FFS2. The situation is 
> something like this:

I have read only ffs2 running, but the hair brained compression scheme is
giving me pain :<

On lwn there was a pointer to a Hard Hat linux which also claimed flash
support with a flash file system, anyone know more about those guys?

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
