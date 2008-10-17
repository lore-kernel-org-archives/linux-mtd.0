Received: from trinity.fluff.org ([89.145.97.151])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqpb6-0001iu-9L
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 13:42:32 +0000
Date: Fri, 17 Oct 2008 14:42:25 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: nandwrite/ubi memory corruption?
Message-ID: <20081017134225.GK22711@trinity.fluff.org>
References: <48F71315.5080707@logix.net.nz>
	<20081016150135.GA11063@fluff.org.uk>
	<48F7B59D.9000200@logix.net.nz>
	<20081016215616.GE22711@trinity.fluff.org>
	<1224241434.4466.13.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1224241434.4466.13.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Michal Ludvig <mludvig@logix.net.nz>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2008 at 02:03:54PM +0300, Artem Bityutskiy wrote:
> On Thu, 2008-10-16 at 22:56 +0100, Ben Dooks wrote:
> > there should be a Kconfig entry to do it when the s3c2410 nand driver
> > is selected.
> 
> Ben,
> 
> is that right that s3c2410-nand does not support sub-pages?

do you mean reads from non-page aligned addresses? currently a whole
page must be read/written to allow the hardware ecc unit to function
properly.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
