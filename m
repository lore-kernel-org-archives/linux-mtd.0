Received: from 85.8.24.16.se.wasadata.net ([85.8.24.16] helo=smtp.drzeus.cx)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H2NFh-0008HQ-S9
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 02:43:11 -0500
Message-ID: <459CB001.4010800@drzeus.cx>
Date: Thu, 04 Jan 2007 08:42:57 +0100
From: Pierre Ossman <drzeus-mmc@drzeus.cx>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] MTD driver for MMC cards
References: <200612281418.20643.arnd@arndb.de> <4597ADD2.90700@drzeus.cx>
	<200701012322.14735.arnd@arndb.de>
In-Reply-To: <200701012322.14735.arnd@arndb.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arnd Bergmann wrote:
> 
> One promising effort for a replacement is Jörn's logfs
> (http://wiki.laptop.org/go/Logfs), which should scale well to many
> gigabytes. A driver based on MMC would be a nice development tool
> for that, since it enables regular PCs as a debugging machine
> instead of having to load test kernels onto an actual embedded
> machine.
> 

A bit of a niche area, but as long as this driver doesn't look like high maintenance then it could be enough.

> Another thing I have been thinking about was an MTD version of
> fat16/fat32. There are a number of optimizations that you can
> do for flash media, including:
> 
> - limiting the number of writes to the FAT
> - erasing blocks when they are freed in the FS
> - always writing full erase blocks if the erase block
>   size matches the cluster size
> - optimize for wear leveling instead of avoiding
>   fragmentation
> 

These sound like they would be nicer in the block layer, to cover other devices where you know there is flash at the bottom.

> I read that the SD cards have some restrictions of how
> the fat fs needs to be laid out on them, presumably to
> make sure clusters are aligned with erase blocks.
> Do you have any specific information on what SD actually
> requires?
> 

No, as we don't give a rats ass about them. I don't know why they stuck a FAT requirement into the spec. Perhaps Microsoft wanted a chance at the extortio^Wlicense money for any patent issues.

> 
> ok, I'll have a look. I keep having trouble identifying the right
> specifications (physical spec sounded like it was only about wiring
> and electric properties, so I did not look at that). Maybe it would

That had me fooled for quite a while as well.

> be good if you could put pointers to the relevant documents into
> your Wiki?

Probably. I haven't really put that much time into the wiki lately. It turned out to be a one man show, so I'm doubting its usefulness.

>> First of all, you cannot assume that read_blkbits is a valid block
>> size when doing writes. 
> 
> Right, I see. I introduced that bug when I merged parts of the read and
> write paths.
> 
> Is it fair to assume that write_blkbits is always bigger than
> read_blkbits, so that one can be used in both cases?
> 

There is some relation, yes, but I don't remember the details right now. More important is that the card can only be set to one block size at any given time (both read and write). So unless you want
terrible latency by switching block size back and forth I'd suggest selecting one size and sticking with it.

As the newer cards only support a block size of 512 bytes, the most future proof would be to use that.

> 
> I tried to do multiple block access at first, but then took it out again.
> If it turns out valuable to have these, I'll implement it properly later.
> Does it make a difference performance-wise to do larger accesses?
> 

Yes. On my rather slow ISA device, the speedup was over 100% for writes.

Rgds
-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
