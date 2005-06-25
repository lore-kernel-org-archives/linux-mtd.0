Received: from 216-229-91-229-empty.fidnet.com ([216.229.91.229]
	helo=mail.icequake.net)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlzsN-0001nr-Pt
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 21:54:33 -0400
Received: from dbz.icequake.net (dbz.icequake.net [216.229.91.244])
	by mail.icequake.net (Postfix) with ESMTP id 0A82B27B67
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2005 20:54:30 -0500 (CDT)
Received: from nemesis by dbz.icequake.net with local (Exim 4.50)
	id 1DlzsM-00041e-Jt
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 20:54:30 -0500
Date: Fri, 24 Jun 2005 20:54:30 -0500
From: Ryan Underwood <nemesis-lists@icequake.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20050625015430.GK8920@dbz.icequake.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Subject: slram reserve its memory region?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am having a problem where slram fails to reserve the memory it is
using, allowing a later-loaded PCI driver (yenta_socket) to have PCI
resources mapped in the same area, which results in a non-functional
hardware.  This effect is only possible because mem= kernel parameter is
required to prevent the kernel from using memory that slram will be
using later, but unfortunately device resources can still be mapped
there since the kernel thinks slram's area is not physical RAM and is
thus safe to use.

Is it an easy change to cause slram to reserve the memory area it uses
so that nothing else attempts to use it?

Ryan

----- Forwarded message from Russell King <rmk+pcmcia@arm.linux.org.uk> -----

On Tue, Jun 21, 2005 at 08:58:15PM -0500, Ryan Underwood wrote:
> Ok, this now appears to allow Cardbus cards to work.  Unfortunately the
> 16-bit card doesn't work unless the BIOS is set to PCIC Compatible mode,
> which means I can't use a Cardbus and 16-bit card at the same time as
> with 2.4 and pcmcia-cs.  I also need mem=64M so that I can use uncached
> RAM as slram device.

Unfortunately, the kernel needs to know how much RAM you really have so
it can properly allocate memory resources.  Lying to it (by passing mem=)
is generally a recipe for disaster.

However, if slram is making use of some area of memory, it really should
reserve it.  That's a slram bug - please report it to the mtd mailing
list.

Even with slram fixed, there remains the danger of something trying to
allocate a resource _before_ slram claims its resource...  I just hate
the entire mem= mess entirely for this very reason.  It's completely
unsafe.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core


----- End forwarded message -----

-- 
Ryan Underwood, <nemesis@icequake.net>
