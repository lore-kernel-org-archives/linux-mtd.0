Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from zen.stanford.edu ([171.65.16.116])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EFAA-0003Da-00
	for mtd@infradead.org; Tue, 10 Aug 1999 17:54:10 +0100
Message-ID: <19990810095402.25968@zen.stanford.edu>
Date: Tue, 10 Aug 1999 09:54:02 -0700
From: David Hinds <dhinds@zen.stanford.edu>
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
References: <E11E7oz-0006h9-00@devel2.axiom.internal> <Pine.LNX.3.96.990810100528.4862A-100000@white.priv.deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990810100528.4862A-100000@white.priv.deltatee.com>; from Jason Gunthorpe on Tue, Aug 10, 1999 at 10:33:22AM -0600
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Aug 10, 1999 at 10:33:22AM -0600, Jason Gunthorpe wrote:
> 
> I've used the PCMCIA drivers on memory cards, they do not work very well
> at all - I -strongly- suspect that many problems would go away simply by
> using the fancy detection code that is being put into the mapped layer, so
> for me keeping compatibility with the old pcmcia driver isn't such a big
> deal. 

Hmmm.  What specific problems have you had?  As far as I know, there
are no outstanding bugs with the PCMCIA memory card drivers.  And I
don't really see how changing the card detection method would help:
identifying memory cards is not hard.

(I'm not arguing about the new code one way or the other, since I
haven't looked at it yet.  But as long as I'm supporting the current
code, I'm obviously interested in knowing about bugs)

-- Dave Hinds


To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
