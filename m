Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10hrw7-0000LI-00
	for mtd@imladris.demon.co.uk; Thu, 13 May 1999 10:37:51 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Thu, 13 May 1999 10:37:51 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 926588259:20:13846:0; Thu, 13 May 99 09:37:39 GMT
Received: from biffen.signum.se (alex@biffen.signum.se [193.180.23.11])
	by geisha.signum.se (8.8.7/8.8.7) with ESMTP id LAA05294
	for <mtd@imladris.demon.co.uk>; Thu, 13 May 1999 11:37:22 +0200
To: mtd@imladris.demon.co.uk
Subject: Re: FTL patent.
References: <E10hazQ-0001dy-00@devel2.axiom.internal>
From: Alexander Larsson <alex@signum.se>
Date: 13 May 1999 11:37:22 +0200
In-Reply-To: David.Woodhouse@mvhi.com's message of Wed, 12 May 1999 16:32:08 +0100
Message-ID: <w1d805nwdp.fsf@biffen.signum.se>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

David.Woodhouse@mvhi.com (David Woodhouse) writes:

> dhinds@zen.stanford.edu said:
> >  I've recently learned that there is a fairly annoying encumberance
> > associated with FTL: while it is now part of the PCMCIA standard, it
> > is patented and M-Systems grants a royalty free license for its use
> > *only* for PCMCIA devices.  So technically, it appears that any use of
> > FTL for non-PCMCIA devices is a patent infringement.
> 
> > The patent claims are broad enough that I don't see any straighforward
> > way of writing a free non-FTL translation layer.  But I'm not a patent
> > lawyer, and don't really know what can and can't be gotten away with. 
> 
> 
> alex@signum.se said:
> >  Note that there *might* be patent problems using this code in the US.
> 
> Is this _just_ a US problem, or are the patents applicable world-wide?

I wrote this because i don't think those patens are applicable everywhere.
Sweden (where i live/work) doesn't allow software patents. I am not a
lawyer, and i haven't looked at the specific patents, so I don't know
the real deal here.

/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
