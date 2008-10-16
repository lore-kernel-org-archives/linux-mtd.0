Received: from trinity.fluff.org ([89.145.97.151])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KqapQ-0006ye-KA
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 21:56:20 +0000
Date: Thu, 16 Oct 2008 22:56:16 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Michal Ludvig <mludvig@logix.net.nz>
Subject: Re: nandwrite/ubi memory corruption?
Message-ID: <20081016215616.GE22711@trinity.fluff.org>
References: <48F71315.5080707@logix.net.nz>
	<20081016150135.GA11063@fluff.org.uk>
	<48F7B59D.9000200@logix.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48F7B59D.9000200@logix.net.nz>
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2008 at 10:43:57AM +1300, Michal Ludvig wrote:
> Ben Dooks wrote:
> > On Thu, Oct 16, 2008 at 11:10:29PM +1300, Michal Ludvig wrote:
> >> Hi all,
> >>
> >> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
> >> and am experiencing (probably) memory corruption of UBI/UBIFS on
> >> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
> >> [...]
> >> s3c2410-nand s3c2410-nand: clock idle support enabled
> > 
> > hmm, could you try disabling the clock-idle support?
> 
> How do I do that?

there should be a Kconfig entry to do it when the s3c2410 nand driver
is selected.
 
> Michal

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
