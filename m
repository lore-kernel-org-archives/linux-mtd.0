Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10wcdu-0006CW-00
	for mtd@imladris.demon.co.uk; Wed, 23 Jun 1999 03:20:02 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Wed, 23 Jun 1999 03:20:02 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 930104383:20:00920:9; Wed, 23 Jun 99 02:19:43 GMT
Date: Tue, 22 Jun 1999 20:19:23 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
Reply-To: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: Linux-MTD mailing list <mtd@imladris.demon.co.uk>
Subject: Re: RFC: kernel-based PCMCIA ... 
In-Reply-To: <E10qvrK-00038e-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990622201422.28153B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 7 Jun 1999, David Woodhouse wrote:

> jgg@deltatee.com said:
> >  Has there been an talk of a FFS driver for linux? 

> There's already an FTL driver for Linux, and has been for some time. 
> M-Systems' new version of 'TrueFFS' doesn't appear to be FTL, and so there
> isn't (yet) a driver for it. I'm unlikely to be looking into that - I'm
> going to just put FTL on the device when I can eventually get it working
> properly.

We managed to extract the location of the specs today, go to 
http://msdn.microsoft.com and search for "microsoft flash file system". It
documents the MS FFS2 file system - I'll probably start working on one
this week unless someone else already has..

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
