Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlKkX-0003bF-Dn
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 04:22:53 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: ebiederman@lnxi.com (Eric W. Biederman),
	<linux-mtd@lists.infradead.org>
Date: Tue, 27 Jan 2004 17:30:03 +1300
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
In-Reply-To: <m3u12jr8y4.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040127042233.C8D0416623@desire.actrix.co.nz>
Subject: Re: Q: Filesystem choice..
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 26 January 2004 10:53, Eric W. Biederman wrote:
> Currently I am examining the possibility of using a filesystem with
> LinuxBIOS so that I may store parameters and kernels in the flash in a
> more flexible manner.
>
> The current flash chips I am working with are NOR flash from 512KiB to
> 4MiB.  And they generally have a 64KiB erase size.
>
> I have two flash blocks that are reserved for XIP code (the hw
> initialization firmware) and the rest can be used for the filesystem.
> So in the worst case I have 6 flash blocks to play with.
>
> The old papers on jffs2 would make it unacceptable as it reserves
> 5 erase blocks.  And I don't know if yaffs or yaffs2 is any better.
>
> In addition boot time is important so it would be ideal if I did not
> to read every byte of the ROM chip to initialize the filesystem.
>
> Is there a filesystem that only reserves one erase block?
>
> Does it look like I need to write my own solution?


First up: Do you really need a full-blown file system? Maybe something more 
along the lines of a linear file store is more suited. Maybe too just some 
basic storage in binary partitions.

YAFFS is not really designed for NOR, though it has been used for NOR. For 
the sizes you're talking about YAFFS would not really be a good choice 
because the file headers use one "chunk" per file. THis eases garbage 
collection, but swallows flash.

-- CHarles
