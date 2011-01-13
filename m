Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PdVZt-0007vY-Rs
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2011 22:23:34 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1PdVZq-0000pR-7V
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2011 23:23:30 +0100
Received: from S01060013461abac3.gv.shawcable.net ([24.108.1.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2011 23:23:30 +0100
Received: from jbarlow by S01060013461abac3.gv.shawcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2011 23:23:30 +0100
To: linux-mtd@lists.infradead.org
From: J Barlow <jbarlow@ivl.com>
Subject: Re: What if the UBI flasher can't skip all-FF pages?
Date: Thu, 13 Jan 2011 22:23:07 +0000 (UTC)
Message-ID: <loom.20110113T232225-210@post.gmane.org>
References: <loom.20110110T205414-506@post.gmane.org>
	<1294738528.2266.12.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1 <at> gmail.com> writes:

> 
> Hi,
> 
> On Mon, 2011-01-10 at 22:47 +0000, J Barlow wrote:
> > I am developing an embedded system with a NAND flash.  We're intending to 
> > program all of the NAND flashes in a factory programmer.
[snip]
> 
> First of all, is this a problem for your flash? If yes, why is it a
> problem and why you cannot test this?

Good point.  But unfortunately I did find out it was a problem.  I have
development tools which didn't follow the UBI flasher instructions, so I
ran into various ECC errors and found the solution on this list.  I've fixed
my development flasher tool, but I suspect the production flasher won't do the
right thing.  For other reasons we do need the production flasher.

> The original reason for writing this article was that some flashes have
> write non-0xFF ECC to the OOB area when programmed with all 0xFFs. But
> this case is easily testable.

Isn't that possible for all ECC algorithms?  If the page has a bit stuck at 0,
and is programmed to all 0xFFs, the ECC cannot possibly be all 0xFFs.

> > Is there any reasonable way to let UBIFS know all pages have been programmed 
> > initially? For example, maybe I could deliberate replace all-FF pages with 
all-
> > 00 pages in the flashed image.  Or will that just cause UBI/UBIFS to find 
> > corrupt empty space and fail?  Or perhaps someone could direct me how to 
make a 
> > patch that would help with UBIFS/UBI/ubinize with this specific situation.  
It 
> > does seem like other people have run into problems with poorly written 
flashers 
> > problem, and in some cases like mine changing the flasher is not an option.
> 
> The easiest way is to introduce a bit to UBI EC headers which would mean
> "I'm an LEB flashed in production, and empty pages were programmed with
> 0xFFs, do something". Then for each of such LEBs UBI would do full
> re-write and would clean the flag. It is very easy to implement, but
> would mean that the first boot basically needs full re-write of the
> flashed data, which may be very slow.

A long initial boot is not really a problem.  I was seriously considering this,
but I realized that I could set up a platform specific workaround.  My 
bootloader can write UBIFS correctly, so all I need to do is reprogram every
PEB in the UBI volume on the first boot before attempting to load Linux.

> With more work and thought it is also possible to invent better
> solution, though. But I do not have time to think about this and
> describe this right now (vacation) 

Enjoy your vacation.  I really appreciate your comments and work on UBI/UBIFS.
It's a great system.

J Barlow
