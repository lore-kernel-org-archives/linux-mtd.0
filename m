Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18O46c-0004rm-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 22:52:58 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Russ Dill <Russ.Dill@asu.edu>, linux-mtd@lists.infradead.org
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
Date: Tue, 17 Dec 2002 12:18:57 +1300
References: <20021216095652.D4D24C6139@atlas.denx.de> <20021216210640.C31D314C2B@dragon.actrix.co.nz> <1040073679.27220.9.camel@timmy>
In-Reply-To: <1040073679.27220.9.camel@timmy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021216232336.35B3D151B0@dragon.actrix.co.nz>
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

On Tue, 17 Dec 2002 10:21, you wrote:
> On Mon, 2002-12-16 at 14:02, Charles Manning wrote:
> > Intel's flash is expensive. Figure somwhere over $1 per MB.  NAND costs
> > approx 30c/MB + SDRAM approx 20c/MB.  Intel's flash thus costs approx
> > twice what a NAND/RAM image does.
> >
> > One NAND flash footprint can give you up to 256MB of storage.
> >
> > NOR fully sucks for any sort of writeable file system performance. NAND
> > runs a very usable fs with YAFFS or JFFS2.
> >
> > The only benefit I can see in NOR is a faster boot. This is becoming less
> > of an issue as more designs switch to sleep/resume models.
>
> It really depends on how much data you store, and how you use that data.
> Sure, for you, with a dynamic file system, and 256M of storage, NAND is an
> easy choice. But many designs out there have static file systems, use 2M or
> 4M of flash, and for such designs, NOR offers a lot more simplicity for
> around the same cost as a NAND + boot logic. With NOR flash, I can put a
> couple cramfs filesystems on there, and use the boot block for storing a
> simple journalled config, reliably. I don't have to worry about setting
> aside blocks in case one goes bad.
>
> I think this is the market intel is targeting, just change 2M or 4M to 4M
> or 8M (no more compressed fs).

True, flexibility is the key. If 2-4MB with a static fs is all you need, then 
no need to take on all the extra drama.

However, to get back to the start of this thread, Intels big push is for the 
larger sizes (8MB+) where NOR is less palatable.

-- CHarles
