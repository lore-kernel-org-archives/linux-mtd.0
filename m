Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10hch5-0000Bh-01
	for mtd@imladris.demon.co.uk; Wed, 12 May 1999 18:21:19 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Wed, 12 May 1999 18:21:19 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 926529447:10:10246:11; Wed, 12 May 99 17:17:27 GMT
Message-ID: <19990512101556.19349@zen.stanford.edu>
Date: Wed, 12 May 1999 10:15:56 -0700
From: David Hinds <dhinds@zen.stanford.edu>
To: David Woodhouse <David.Woodhouse@mvhi.com>
Cc: mtd@imladris.demon.co.uk
Subject: Re: FTL patent.
References: <E10hazQ-0001dy-00@devel2.axiom.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10hazQ-0001dy-00@devel2.axiom.internal>; from David Woodhouse on Wed, May 12, 1999 at 04:32:08PM +0100
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

On Wed, May 12, 1999 at 04:32:08PM +0100, David Woodhouse wrote:
> 
> > The patent claims are broad enough that I don't see any straighforward
> > way of writing a free non-FTL translation layer.  But I'm not a patent
> > lawyer, and don't really know what can and can't be gotten away with. 
> 
> alex@signum.se said:
> >  Note that there *might* be patent problems using this code in the US.
> 
> Is this _just_ a US problem, or are the patents applicable world-wide?

I don't know.  I could ask M-Systems, I guess.

> Could we get away with inserting a check so that the FTL code is
> only allowed to  
> be used with PCMCIA devices, (which can conveniently be disabled with a 
> single-line patch)

I'm not super interested in opening myself up for a potential lawsuit,
so I'm not sure if this would be a good approach.

-- Dave


To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
