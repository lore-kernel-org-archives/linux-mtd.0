Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU2R6-0004Mj-6V
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 11:09:29 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HU2Qs-00068x-Ni
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 16:08:58 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 16:08:58 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 16:08:58 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Clarification on multiple mtdram devices - HowTo
Date: Wed, 21 Mar 2007 15:08:48 +0000 (UTC)
Message-ID: <loom.20070321T154146-99@post.gmane.org>
References: <loom.20070319T162102-206@post.gmane.org>
	<loom.20070321T130947-321@post.gmane.org>
	<1174483288.3416.35.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer <jwboyer <at> linux.vnet.ibm.com> writes:

> 
> 
> This is about creating a single MTD with mtdram and effectively using
> that for loopback.  You had asked about creating multiple MTDs with
> mtdram.  So does this fully answer your question, or?
> 
> /me is a bit confused.
> 
> josh

I wanted to create more than one MTD in RAM to emulate a board
with Flash memory split into several partitions, mtd0..n, mtdblock0..m

It's not immediately clear what (if any) relationship there is
between device numbers and partitions, and there's not much on the 
MTD site.

I noted the existence of mtdram, but then wanted to know how best
to use it.

I noted that mtdram only appeared to be capable of creating one device,
so was looking for a way of creating several devices (mtd0...n).
I looked in the driver code but it confirmed that only one mtd
would exist, AFAICS.

>From the quoted item it looks as if you can create several mtds
by creating one mtdram and then splitting it up using mtdblock.

It would be useful if there was a proper 'howto' on this subject
on the website, since I have only been able to piece this
together by much searching.

So can some mtd drivers (mtdblock) subdivide mtd devices provided by
other drivers, for example ?

I have been looking for some kind of overall 'concept of operation'
but without much luck ATM !

If I *do* manage to put all the pieces together I will willingly
write it up on the site !

Regards,
MikeW
