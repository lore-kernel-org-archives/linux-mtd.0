Received: from caramon.arm.linux.org.uk ([212.18.232.186])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DlBd8-0001ku-IG
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 16:15:28 -0400
Date: Wed, 22 Jun 2005 21:10:13 +0100
From: Russell King <rmk@arm.linux.org.uk>
To: Ryan Underwood <nemesis-lists@icequake.net>
Message-ID: <20050622211013.A26597@flint.arm.linux.org.uk>
References: <20050613104838.GA23036@dbz.icequake.net>
	<20050611231733.GA10349@dbz.icequake.net>
	<1251495.1118575059614.komurojun-mbn@nifty.com>
	<2687305.1118667124185.komurojun-mbn@nifty.com>
	<4050205.1118836800033.komurojun-mbn@nifty.com>
	<8247339.1118928170515.komurojun-mbn@nifty.com>
	<5186040.1119048110920.komurojun-mbn@nifty.com>
	<20050622015815.GA22559@dbz.icequake.net>
	<20050622101621.B28181@flint.arm.linux.org.uk>
	<20050622195557.GA25758@dbz.icequake.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050622195557.GA25758@dbz.icequake.net>;
	from nemesis-lists@icequake.net on Wed, Jun 22, 2005 at
	02:55:57PM -0500
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Toshiba 64M limit and slram (was Toshiba ToPIC developer info)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 22, 2005 at 02:55:57PM -0500, Ryan Underwood wrote:
> On Wed, Jun 22, 2005 at 10:16:21AM +0100, Russell King wrote:
> > Unfortunately, the kernel needs to know how much RAM you really have so
> > it can properly allocate memory resources.  Lying to it (by passing mem=)
> > is generally a recipe for disaster.
> 
> I was under the impression that using the mem= parameter simply
> truncated the high memory area, so the kernel would behave as if you
> only had that amount of memory installed.
> 
> > However, if slram is making use of some area of memory, it really should
> > reserve it.  That's a slram bug - please report it to the mtd mailing
> > list.
> 
> I will do so.  However, it seems impossible for slram to reserve i.e.
> 64M-160M area unless the kernel is disallowed from using it for other
> reasons.  Surely something would be allocated there already by the
> time slram was activated.
> 
> > Even with slram fixed, there remains the danger of something trying to
> > allocate a resource _before_ slram claims its resource...  I just hate
> > the entire mem= mess entirely for this very reason.  It's completely
> > unsafe.
> 
> What is the best thing to do then?  Ever since slram was designed, it
> has assumed that the user would set the mem= option appropriately.  I've
> had the 'reserve' option pointed to me but not tried it yet.

Consider what's happening - you're telling the system that you have
less memory than it actually has, so it only reserves (say) the first
512MB of memory.  It then scans the PCI bus and reserves those
resources.

When it comes to allocate a new resource for a PCI device, how does
the kernel know that you _actually_ had (eg) 1GB of RAM - it doesn't
because you told it you only had 512MB.  So it merrily hands out a
new resource at, say, 768MB.

When that happens, it's hardly surprising that the kernel can't
access the PCI device properly.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
