From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3u12jr8y4.fsf@maxwell.lnxi.com>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1075099329.17157.97.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 06:42:09 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-01-25 at 14:53 -0700, Eric W. Biederman wrote:
> The old papers on jffs2 would make it unacceptable as it reserves
> 5 erase blocks. 

It's got slightly different heuristics now -- a proportion of total
size, plus a proportion of total _blocks_. That was done primarily to
deal with NAND flash, where we need _more_ blocks reserved, but it
should also have helped with small NOR flashes. 

You blatantly don't _need_ to reserve five erase blocks to let you
rewrite the contents of the remaining, erm, one erase block full of
data. You can tune this; it's not a mount option but it's relatively
simple to change in the code.

>  And I don't know if yaffs or yaffs2 is any better.

They're for NAND, not NOR flash.

> In addition boot time is important so it would be ideal if I did not
> to read every byte of the ROM chip to initialize the filesystem.

There have been efforts to improve JFFS2 performance in this respect. It
still reads the _header_ from each node of the file system, but doesn't
actually checksum every node any more.

-- 
dwmw2
