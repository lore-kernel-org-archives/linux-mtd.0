Received: from [202.190.100.200] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aGnw-0008N5-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 13:47:38 +0000
Date: Mon, 11 Feb 2002 21:53:45 +0800 (MYT)
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <gleixner@autronix.de>
cc: linux-mtd@lists.infradead.org,  <jffs-dev@axis.com>
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <02021114425704.00764@thomas>
Message-ID: <Pine.LNX.4.44.0202112137580.1558-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 11 Feb 2002, Thomas Gleixner wrote:

> On Thursday,  7. February 2002 08:04, David Woodhouse wrote:
> I'm going to merge your current CVS code with my wbuf changes. 
> But we should decide what to do with the cleanmarker stuff and the usage of 
> the spare area.
> On devices with 512 byte pagesize we have a spare area of 16 byte. On smaller 
> devices with 256 byte pagesize we have only 8 byte.
> We have already some layouts for the spare area:
> DOC
> Byte 0-5	ECC
> Byte 6-7	block used status (0x55,0x55)
> Byte 8-15	not assigned

Yes it is, at least for the first three pages in each eraseblock. It holds 
the 'Unit Control Information' structures. 

> SmartMediaCard 256 Byte pagesize
> Byte 0-5	not assigned
> Byte 6		bad block status
> Byte 7		not assigned

Where's the ECC when we're using the SmartMedia format on them?

> The bad block status on the SmartMediaCards is programmed to a value 
> different to 0xff by the manufacturer. We should use this too. 
> Bad blocks on raw NAND chips are marked by values different to 0xff in the 
> first two pages of a block. 
> I don't know, if there's a similar technique on DOC.

Same as raw NAND I believe. The DiskOnChip driver lists the NAND chips 
which are used - all the data sheets are available. 

> I think the SmartMedia bad block indication is much more convenient than the 
> raw NAND solution. 

Either way, you mustn't ever erase a block which is marked bad, right?

> May be we can implement a utility to move the bad block 
> info into the spare area on raw NAND chips, so the bad block indication would 
> be the same. This could also be done at production time or be part of a 
> bootloader, because it has to done only once. 
> The nand driver should exclude these blocks from erase/write to keep this 
> information intact. But then we should read the bad block information at 
> mount time too. This can easily be done with the read_cleanmarker_oob 
> function. If we detect a bad block during operation, we could mark it the 
> same way, so the block is excluded for ever. 

Seems sane. 

> Layout with cleanmarker in spare area:
> DOC
> Byte 0-5	ECC
> Byte 6-7	block used status (0x55,0x55) or bad block (value != 0x55 && != 0xff)
> Byte 8-15	cleanmarker
> 
> SmartMedia and raw NAND 512 Byte pagesize
> Byte 0-5	ECC
> Byte 6		bad block status
> Byte 7 		page data valid flag
> Byte 8-15	cleanmarker
> 
> SmartMedia and raw NAND 256 Byte pagesize
> Byte 0-2	ECC for even page
> Byte 3-5	cleanmarker
> Byte 6		bad block status
> Byte 7		page data valid flag

Those also look sane. 

> Some information about the current state. I ran a 24h test with copying, 
> moving, deleting files with random power down. The filesystem is clean and we 
> have no data loss except some broken files on powerdown. But nothing in the 
> world can help, if we write a new file and loose power before we finished it.

Cool. Does this leave some files on the fs and make lots of GC happen, and 
check the contents of all files on restart? Vipin's tests did this quite 
well, IIRC.

Now I suppose we need to look at using write_super and sb->s_dirt the way 
that God intended, for flushing pending writes in the wbuf rather than 
just triggering erases. 

-- 
dwmw2
