Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EIpY-0003J1-00
	for mtd@infradead.org; Tue, 10 Aug 1999 21:49:08 +0100
Date: Tue, 10 Aug 1999 14:49:01 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Hinds <dhinds@zen.stanford.edu>
cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
In-Reply-To: <19990810095402.25968@zen.stanford.edu>
Message-ID: <Pine.LNX.3.96.990810144532.7328A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 10 Aug 1999, David Hinds wrote:

> Hmmm.  What specific problems have you had?  As far as I know, there
> are no outstanding bugs with the PCMCIA memory card drivers.  And I
> don't really see how changing the card detection method would help:
> identifying memory cards is not hard.

Well, the big problem is that it simply cannot detect an empty card (with
no CIS) - I've watched QNX do it so I know it can be done, and I'm pretty
sure they rely on CFI or JEDEC ID flash methods [which is exactly what the
mapped flash driver implements]. There were a few other weird things I had
happen to me while futzing with that, but have forgotten many of the
details.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
