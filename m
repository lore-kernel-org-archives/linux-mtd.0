Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11ERGt-0003Xs-00
	for mtd@infradead.org; Wed, 11 Aug 1999 06:49:56 +0100
Date: Tue, 10 Aug 1999 23:49:51 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Hinds <dhinds@zen.stanford.edu>
cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
In-Reply-To: <19990810142948.59781@zen.stanford.edu>
Message-ID: <Pine.LNX.3.96.990810234642.10727A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 10 Aug 1999, David Hinds wrote:

> > On all the memory cards I've seen the CIS is stored on the flash itself,
> > so if you erase the CIS then it's gone. One of our systems here boots
> > from a PCMCIA memory card, putting a CIS in there gets in the way. So for
> > most of my purposes the current driver doesn't work.
> 
> What cards, specifically, are you using?

These cards are from AMD, memory only cards for use with their UforCE
board. It boots off them (the card stores the bios).

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
