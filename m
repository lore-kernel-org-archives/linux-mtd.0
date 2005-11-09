Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZsCV-0007Mw-PZ
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 10:49:34 -0500
Date: Wed, 9 Nov 2005 16:48:59 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20051109154859.GA1447@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
	<20051108105923.GA31446@wohnheim.fh-wedel.de>
	<m3zmofovsc.fsf@maxwell.lnxi.com>
	<20051108183339.GB31446@wohnheim.fh-wedel.de>
	<m3slu5al3n.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3slu5al3n.fsf@maxwell.lnxi.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 9 November 2005 08:37:16 -0700, Eric W. Biederman wrote:
> Jörn Engel <joern@wohnheim.fh-wedel.de> writes:
> 
> > Can you name a few examples, where mtdchar.c makes sense?  I've found
> > it to be quite useless.
> 
> I have found just the opposite.  It happens to be the only interface
> to mtd devices I use.   In general when you have flash devices small
> enough that you can't use a filesystem without waisting a lot of space
> (keeping 1 free erase block out of 4 or 8 is a problem).  Or when you are
> doing low-level mucking mtdchar is invaluable.

Josh already convinced me with the Bad Block argument.  The hardware
already used an OOB scheme to define them.  Regular unix files without
some sort of OOB data access don't map well to NAND.

> As for the interface to mtdchar.  I agree that the readonly character
> device is silly, and does weird things to the mtd device minor numbers.
> I agree that ioctls are not the prettiest interface around, however
> the raw functionality the ioctls export is needed, and interesting.  Some
> of the functionality would be hard to export even in sysfs the cool ascii
> replacement for ioctl.
> 
> Long term it does look like a sysfs interface to the mtd functionality
> could suffice.

It could.  Some time ago I starting coding something up, but got
quickly distracted.  Might be easier to start from scratch again.

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
