Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18O2BZ-0004gb-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 20:49:57 +0000
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
From: Russ Dill <Russ.Dill@asu.edu>
To: manningc2@actrix.gen.nz
Cc: David Woodhouse <dwmw2@infradead.org>, Wolfgang Denk <wd@denx.de>,
   Paul Nash <paulnash@wildseed.com>,
   "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
In-Reply-To: <20021216210640.C31D314C2B@dragon.actrix.co.nz>
References: <20021216095652.D4D24C6139@atlas.denx.de>
	 <18190.1040039149@passion.cambridge.redhat.com>
	 <20021216210640.C31D314C2B@dragon.actrix.co.nz>
Content-Type: text/plain
Message-Id: <1040073679.27220.9.camel@timmy>
Mime-Version: 1.0
Date: 16 Dec 2002 14:21:19 -0700
Content-Transfer-Encoding: 7bit
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

On Mon, 2002-12-16 at 14:02, Charles Manning wrote:

> Intel's flash is expensive. Figure somwhere over $1 per MB.  NAND costs 
> approx 30c/MB + SDRAM approx 20c/MB.  Intel's flash thus costs approx twice 
> what a NAND/RAM image does.
> 
> One NAND flash footprint can give you up to 256MB of storage. 
> 
> NOR fully sucks for any sort of writeable file system performance. NAND runs 
> a very usable fs with YAFFS or JFFS2.
> 
> The only benefit I can see in NOR is a faster boot. This is becoming less of 
> an issue as more designs switch to sleep/resume models.

It really depends on how much data you store, and how you use that data. 
Sure, for you, with a dynamic file system, and 256M of storage, NAND is an
easy choice. But many designs out there have static file systems, use 2M or
4M of flash, and for such designs, NOR offers a lot more simplicity for around
the same cost as a NAND + boot logic. With NOR flash, I can put a couple
cramfs filesystems on there, and use the boot block for storing a simple
journalled config, reliably. I don't have to worry about setting aside blocks
in case one goes bad.

I think this is the market intel is targeting, just change 2M or 4M to 4M or 8M
(no more compressed fs).
