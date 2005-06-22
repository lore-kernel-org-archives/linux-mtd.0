Received: from 216-229-91-229-empty.fidnet.com ([216.229.91.229]
	helo=mail.icequake.net)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlDgY-0002pk-Bv
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 18:27:09 -0400
Date: Wed, 22 Jun 2005 17:27:03 -0500
From: Ryan Underwood <nemesis-lists@icequake.net>
To: Russell King <rmk@arm.linux.org.uk>
Message-ID: <20050622222703.GB362@dbz.icequake.net>
References: <20050611231733.GA10349@dbz.icequake.net>
	<1251495.1118575059614.komurojun-mbn@nifty.com>
	<2687305.1118667124185.komurojun-mbn@nifty.com>
	<4050205.1118836800033.komurojun-mbn@nifty.com>
	<8247339.1118928170515.komurojun-mbn@nifty.com>
	<5186040.1119048110920.komurojun-mbn@nifty.com>
	<20050622015815.GA22559@dbz.icequake.net>
	<20050622101621.B28181@flint.arm.linux.org.uk>
	<20050622195557.GA25758@dbz.icequake.net>
	<20050622211013.A26597@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20050622211013.A26597@flint.arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Toshiba 64M limit and slram (was Toshiba ToPIC developer info)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, Jun 22, 2005 at 09:10:13PM +0100, Russell King wrote:
> > 
> > What is the best thing to do then?  Ever since slram was designed, it
> > has assumed that the user would set the mem= option appropriately.  I've
> > had the 'reserve' option pointed to me but not tried it yet.
> 
> Consider what's happening - you're telling the system that you have
> less memory than it actually has, so it only reserves (say) the first
> 512MB of memory.  It then scans the PCI bus and reserves those
> resources.

I see.  I thought the PCI resources were mapped by the BIOS and not by
the kernel, but this makes a bit more sense now.  So you are also saying
that when a PCI device becomes mapped in that region, subsequent
accesses by the CPU in that range go to physical RAM that is located
there instead of to the device's MMIO range, so the device is
inaccessible.  That would seem odd though, since in the low memory area,
certainly there is RAM underneath the range e.g.  F000:0000-FFFF, but
accesses to that area are mapped to the BIOS ROM instead.  Or the same
for the VGA framebuffer at A000:0, etc.

-- 
Ryan Underwood, <nemesis@icequake.net>
