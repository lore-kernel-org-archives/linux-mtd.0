Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh4fZ-0007za-Ed
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 15:10:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hh4f8-0007GR-Sp
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 16:09:34 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2007 16:09:34 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2007 16:09:34 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Wanted - simple NOR Flash filing system - JFFS2 ?
Date: Thu, 26 Apr 2007 14:09:08 +0000 (UTC)
Message-ID: <loom.20070426T155948-242@post.gmane.org>
References: <loom.20070423T132454-397@post.gmane.org>
	<200704240655.37619.manningc2@actrix.gen.nz>
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

Charles Manning <manningc2 <at> actrix.gen.nz> writes:

>  
> It is far too grand to call this a file system. 
> This is a bit more like a linear file store, or even more proimitive than 
> that.
> 
> I agree with the basic principle: if you don't need a full fs, then why use 
> one? You don't need a chainsaw to cut butter!
...snip...
> 

I note from an earlier newsgroup thread 
http://thread.gmane.org/gmane.linux.drivers.mtd/3255/focus=3271

that it would be possible to wind down the min blocks requirement
for a JFFS2 filesystem, after all with the usage pattern I described,
who cares about garbage collection or spare blocks ?

It would be very nice if you could somehow set this minimalist option
when doing a mk.jffs2, such that the driver would then be happy (on
that particular filesystem partition) with even a single eraseblock,
but obviously if the block ever filled up you could hardly expect
the driver to handle it for you.

Comments from dwmw2 ?!

Regards,
MikeW
