Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DDQ9c-0000Nf-3L
	for linux-mtd@lists.infradead.org; Mon, 21 Mar 2005 11:53:26 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j2LGr8JP031749
	for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2005 11:53:08 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j2LGr78h209976
	for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2005 11:53:07 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2LGr7m4027163
	for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2005 11:53:07 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050317103418.GA4501@wohnheim.fh-wedel.de>
References: <1110827292.7642.26.camel@windu.rchland.ibm.com>
	<1110828016.7642.29.camel@windu.rchland.ibm.com>
	<1110828565.7642.33.camel@windu.rchland.ibm.com>
	<20050317103418.GA4501@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 21 Mar 2005 10:52:45 -0600
Message-Id: <1111423965.7635.4.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: lock bit and erase errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-17 at 11:34 +0100, Jörn Engel wrote:
> > 
> > FYI, I just ran this with a 2.6 kernel + fairly recent MTD code and I
> > see the same problems.
> > 
> > No more updates from me until I hear back, I promise :).
> 
> I've had a quick look and would agree with you right now.  This
> appears to be a bug.

Thomas and I thought so too.

> 
> Generally speaking, there appears to be a lack of automated tests for
> the cfi code.  Getting it to work right for all combinations of bus
> widths, etc. is a challenge.  But automated tests would require one
> device of each kind and I have no idea how to get all those.

Me either.  Some kind of test suite would be nice though.  Artem has the
NAND simulator.  Perhaps someone could make a NOR simulator as well to
test the CFI stuff?  Any volunteers?

> 
> Maybe you should just fix your special case and hope not to break
> someone else.

Thomas actually came up with a patch for it and it's in CVS now.  It
fixed my bogus status merging problem so an error is actually returned
when an erase fails.

As for why dd never reported an error, that is because dd is stupid and
doesn't flush any of it's writes.  It just relies on the flush that is
done on the implicit close when exit(0) is called.

josh
