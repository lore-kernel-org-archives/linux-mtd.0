Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kpw4-00060c-00
	for mtd-list@infradead.org; Wed, 04 Apr 2001 17:15:08 +0100
Received: from gatekeeper.emware.com ([209.140.75.114])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14kpvw-00060V-00
	for mtd@infradead.org; Wed, 04 Apr 2001 17:15:00 +0100
Message-ID: <3ACB4907.725AA806@emware.com>
Date: Wed, 04 Apr 2001 10:17:11 -0600
From: Tim Bowman <tbowman@emware.com>
MIME-Version: 1.0
To: Eric <ebrower@usa.net>, mtd mailing list <mtd@infradead.org>
Subject: Re: [Re: [RPX Classic/Lite and byte ordering]]
References: <20010404022046.11794.qmail@nw171.netaddress.usa.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Eric wrote:
> 
> Tim,
> 
> Have you verified that a kernel compiled with this io.h
> change still works properly on your system?  This sounds
> shakey to me if your kernel was already working as a whole
> without your changes.
> 

It seemed to, but I haven't really tested everything thoroughly.

> I would think that using __raw_writeX and __raw_readX combined
> with the appropriate endian setting in cfi_endian.h would have
> the same effect without such a drastic change.  I am more concerned
> about the statement that other folks with the same boardset do not
> experience this problem-- likely, the correct fix is an endian-map
> (similar in spirit to LART) in cfi_endian.h rather than io.h in such
> a case.  If you can find a mythical RPX system that does not have this
> error, perhaps you can modify the driver to read/write/read/write some
> location to determine if you have an 'affected' board or not.
> 

Sound advice, I think.  It looks like some net and char code uses the
readX stuff, so I'll go ahead and make the changes in rpxlite.c
instead.  I have 4 or 5 other RPX boards I can try, so I'll let you know
if I find one that is different.  Otherwise, we might want to make these
changes to the tree.

-T


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
