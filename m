Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from zen.stanford.edu ([171.65.16.116])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EJ4y-0003Jl-00
	for mtd@infradead.org; Tue, 10 Aug 1999 22:05:05 +0100
Message-ID: <19990810140454.34027@zen.stanford.edu>
Date: Tue, 10 Aug 1999 14:04:54 -0700
From: David Hinds <dhinds@zen.stanford.edu>
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
References: <19990810095402.25968@zen.stanford.edu> <Pine.LNX.3.96.990810144532.7328A-100000@white.priv.deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990810144532.7328A-100000@white.priv.deltatee.com>; from Jason Gunthorpe on Tue, Aug 10, 1999 at 02:49:01PM -0600
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Aug 10, 1999 at 02:49:01PM -0600, Jason Gunthorpe wrote:
> 
> Well, the big problem is that it simply cannot detect an empty card (with
> no CIS) - I've watched QNX do it so I know it can be done, and I'm pretty
> sure they rely on CFI or JEDEC ID flash methods [which is exactly what the
> mapped flash driver implements].

That's certainly true: PCMCIA currently treats cards with no CIS as
static RAM cards.  Mostly because the issue has never really come up
for me.  I think that's a bit different from an unqualified "they do
not work very well at all".

Are linear flash cards with no CIS common?  I'm only familiar with the
Intel cards, which all seem to have a CIS.  I've never had anyone ask
about no-CIS flash card support, as far as I can remember.

-- Dave


To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
