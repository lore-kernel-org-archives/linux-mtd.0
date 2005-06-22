Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DlCf2-0002UE-Ek
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 17:21:32 -0400
Date: Wed, 22 Jun 2005 23:21:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Russell King <rmk@arm.linux.org.uk>
Message-ID: <20050622212114.GA1819@wohnheim.fh-wedel.de>
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
Content-Transfer-Encoding: 8bit
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

On Wed, 22 June 2005 21:10:13 +0100, Russell King wrote:
> 
> Consider what's happening - you're telling the system that you have
> less memory than it actually has, so it only reserves (say) the first
> 512MB of memory.  It then scans the PCI bus and reserves those
> resources.
> 
> When it comes to allocate a new resource for a PCI device, how does
> the kernel know that you _actually_ had (eg) 1GB of RAM - it doesn't
> because you told it you only had 512MB.  So it merrily hands out a
> new resource at, say, 768MB.
> 
> When that happens, it's hardly surprising that the kernel can't
> access the PCI device properly.

I have to agree that slram is a hack.  A proper solution might be to
turn mm/* into a user of the memory address space.  Then we could
explicitly tell mm/* not to use some area and have slram (or rather
phram) take it instead.  Ignoring the stupid names, maybe something
like:

 +----------------------------------------+
 |virtual address space                   |
 |+---------------------------+-----+     |
 ||memory space               | PCI |     |
 ||+-------+-------+          |     |     |
 |||  mm/* | phram |          |     |     |
 ||+-------+-------+          |     |     |
 |+---------------------------+-----+     |
 +----------------------------------------+

Telling mm/* to ignore some space is basically the same operation as
passing mem=.  But the ignored memory is still allocated into the
memory space and cannot be handed out to PCI devices or similar stuff.

Sure, this is major surgery and likely won't happen soon.  But would
it work in principle?

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
