Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18OdXm-0008SU-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 12:43:22 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C91F@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: "'manningc2@actrix.gen.nz'" <manningc2@actrix.gen.nz>, Russ Dill
	 <Russ.Dill@asu.edu>, linux-mtd@lists.infradead.org
Subject: RE: Intel sez: Synchronous Flash and XIP is the future -- thought
	s?
Date: Wed, 18 Dec 2002 05:13:59 -0800
MIME-Version: 1.0
Content-Type: text/plain
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

So what are people out there using in their designs for NAND primarily?  Raw
NAND?  NAND plus some bootable sector?  DiskOnChip?

-----Original Message-----
From: Charles Manning [mailto:manningc2@actrix.gen.nz] 
Sent: Monday, December 16, 2002 3:19 PM
To: Russ Dill; linux-mtd@lists.infradead.org
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?


On Tue, 17 Dec 2002 10:21, you wrote:
> On Mon, 2002-12-16 at 14:02, Charles Manning wrote:
> > Intel's flash is expensive. Figure somwhere over $1 per MB.  NAND 
> > costs approx 30c/MB + SDRAM approx 20c/MB.  Intel's flash thus costs 
> > approx twice what a NAND/RAM image does.
> >
> > One NAND flash footprint can give you up to 256MB of storage.
> >
> > NOR fully sucks for any sort of writeable file system performance. 
> > NAND runs a very usable fs with YAFFS or JFFS2.
> >
> > The only benefit I can see in NOR is a faster boot. This is becoming 
> > less of an issue as more designs switch to sleep/resume models.
>
> It really depends on how much data you store, and how you use that 
> data. Sure, for you, with a dynamic file system, and 256M of storage, 
> NAND is an easy choice. But many designs out there have static file 
> systems, use 2M or 4M of flash, and for such designs, NOR offers a lot 
> more simplicity for around the same cost as a NAND + boot logic. With 
> NOR flash, I can put a couple cramfs filesystems on there, and use the 
> boot block for storing a simple journalled config, reliably. I don't 
> have to worry about setting aside blocks in case one goes bad.
>
> I think this is the market intel is targeting, just change 2M or 4M to 
> 4M or 8M (no more compressed fs).

True, flexibility is the key. If 2-4MB with a static fs is all you need,
then 
no need to take on all the extra drama.

However, to get back to the start of this thread, Intels big push is for the

larger sizes (8MB+) where NOR is less palatable.

-- CHarles

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
