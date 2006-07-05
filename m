Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy5TF-0006ir-CT
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 07:23:13 -0400
Date: Wed, 5 Jul 2006 13:22:23 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ville Herva <vherva@vianova.fi>
Subject: Re: block2mtd: Overrun end of disk in cache readahead
Message-ID: <20060705112223.GA29743@wohnheim.fh-wedel.de>
References: <20060705072614.GQ6240@vianova.fi> <44AB6EFA.9000604@thinstuff.com>
	<20060705100727.GC15078@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060705100727.GC15078@vianova.fi>
Cc: linux-mtd@lists.infradead.org, Norbert Federa <nfedera@thinstuff.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 July 2006 13:07:27 +0300, Ville Herva wrote:
> On Wed, Jul 05, 2006 at 09:49:14AM +0200, you [Norbert Federa] wrote:
> > Ville,
> > Try changing the PAGE_READAHEAD define in
> > /drivers/mtd/devices/block2mtd.c from 64 to 0:
> > 
> > -#define PAGE_READAHEAD 64
> > +#define PAGE_READAHEAD 0
> 
> Looking at the source, it almost looks like the error message is just a
> spurious warning, not a dangerous error. Doesn't this happen when the
> underlying device does not end at 64k boundary? And the readahead code just
> stops reading ahead after that warning?

I'm fairly tempted to just nuke the readahead code completely.  For
some users, it is outright harmful (usbstick, some other flash behind
blockdev interface), for others it should be done by the block device
driver, not by block2mtd.

If either of you wants to do that and can test the resulting patch,
you have my blessing.

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
