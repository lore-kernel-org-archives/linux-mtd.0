Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EJKB-0003Lg-00
	for mtd@infradead.org; Tue, 10 Aug 1999 22:20:47 +0100
Date: Tue, 10 Aug 1999 15:20:36 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Hinds <dhinds@zen.stanford.edu>
cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
In-Reply-To: <19990810140454.34027@zen.stanford.edu>
Message-ID: <Pine.LNX.3.96.990810151540.7675A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 10 Aug 1999, David Hinds wrote:

> That's certainly true: PCMCIA currently treats cards with no CIS as
> static RAM cards.  Mostly because the issue has never really come up
> for me.  I think that's a bit different from an unqualified "they do
> not work very well at all".

As far as memory devices go, detecting is a big part of the entire
process. I also had lots of weird trouble getting this memory card up, I
finally did it but it was quite trying.
 
> Are linear flash cards with no CIS common?  I'm only familiar with the
> Intel cards, which all seem to have a CIS.  I've never had anyone ask
> about no-CIS flash card support, as far as I can remember.

On all the memory cards I've seen the CIS is stored on the flash itself,
so if you erase the CIS then it's gone. One of our systems here boots
from a PCMCIA memory card, putting a CIS in there gets in the way. So for
most of my purposes the current driver doesn't work.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
