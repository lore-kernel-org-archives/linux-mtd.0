Received: from mail-yk0-f172.google.com ([209.85.160.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAJH6-0003TU-RD
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 13:41:41 +0000
Received: by mail-yk0-f172.google.com with SMTP id 10so1792728ykt.17
 for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2014 06:41:13 -0700 (PDT)
Date: Thu, 24 Jul 2014 10:40:18 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Message-ID: <20140724134018.GA711@arch.cereza>
References: <1406116461-27089-1-git-send-email-pekon@ti.com>
 <20140723120510.GA19677@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EB064F3@DBDE04.ent.ti.com>
 <20140723202746.GA26346@arch.cereza>
 <20140724015438.GC3711@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140724015438.GC3711@ld-irv-0074>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 "Quadros, Roger" <rogerq@ti.com>,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 Jul 06:54 PM, Brian Norris wrote:
> > > 
> > > - Case-1: If there is un-allocated space (not allocated to any partition)
> 
> Partitioning has no effect on the BBT process. BBT is run only for the
> 'master' MTD, and it has no regard for previous data on the flash. Given
> that...
> 

Right.

> > >   at end of Flash device then it will be used. And there is no problem.
> > > 
> > 
> > Yes, so far, so good.
> 
> Agreed. It is especially safe because that area was not partitioned, and
> therefore should not contain important data.
> 
> > > - Case-2: If there is no free space towards the end of flash, then ...
> > > As per my understanding, the create_bbt() would try scanning whole
> > > NAND to find empty blocks and then it creates BBT wherever it finds
> > > empty blocks. And those blocks are marked as BAD with BBT signature
> > > to prevent getting erased or over-written by any user-data.
> > > 
> > 
> > OK, I just went through the BBT code, trying to see if I was missing
> > something. I can't see any place where the kernel scans the device
> > and searches for empty space for the BBT.
> 
> Right, on-flash BBT has no notion of "empty space", really; it just
> knows what region is reserved for its use (the last few blocks of the
> device).
> 

Right. And in fact, that's clear from the snippet I pasted below.

> > Instead, what create_bbt() seem to do is scan the whole device, searching
> > for bad blocks to fill an in-memory BBT. I presume that if I have some
> > blocks marked as bad in the OOB region, they are identified as bad
> > and the BBT is filled.
> > 
> > I think that write_bbt() is where the (previously created, in-memory) BBT
> > is written to flash. It goes like this:
> > 
> > write_bbt()
> > {
> > [..]
> >                 /*
> >                  * Automatic placement of the bad block table. Search direction
> >                  * top -> down?
> >                  */
> >                 if (td->options & NAND_BBT_LASTBLOCK) {
> >                         startblock = numblocks * (chip + 1) - 1;
> >                         dir = -1;
> >                 } else {
> >                         startblock = chip * numblocks;
> >                         dir = 1;
> >                 }
> > 
> >                 for (i = 0; i < td->maxblocks; i++) {
> >                         int block = startblock + dir * i;
> >                         /* Check, if the block is bad */
> >                         switch (bbt_get_entry(this, block)) {
> >                         case BBT_BLOCK_WORN:
> >                         case BBT_BLOCK_FACTORY_BAD:
> >                                 continue;
> >                         }
> >                         page = block <<
> >                                 (this->bbt_erase_shift - this->page_shift);
> >                         /* Check, if the block is used by the mirror table */
> >                         if (!md || md->pages[chip] != page)
> >                                 goto write;
> >                 }
> >                 pr_err("No space left to write bad block table\n");
> >                 return -ENOSPC;
> > 		[..]
> > }
> > 
> > which fails if there's no room left for the BBT. This will happen on every
> > boot, so it's not an ideal situation.
> 
> BTW, td->maxblocks==4 by default. There's no 'scanning the whole
> device'; it only scans the last 4 blocks. But you're correct that it's
> not ideal, since it will fail if there are 4 bad blocks at the end.
> 

Yeah, I was completely wrong. Thanks for the insight!

> > > Is my understanding correct?
> > > If yes, then this will not break backward compatibility, as on upgrading
> > > the kernel new BBT will be automatically written on first boot. And
> > > it will be used in subsequent boots.
> > > Need feedbacks ...
> > > 
> > 
> > In fact, you do have a simple way to solve this. Just support BBT through
> > the "nand-on-flash-bbt" devicetree property, so a user can tell if his flash
> > has a BBT or not. See pxa3xx-nand.c, which should be correct.
> 
> Yes, you can use the 'nand-on-flash-bbt' property, and that probably
> makes the most sense.
> 
> The only real backwards-compatibility concern you'd have for
> unconditionally enabling on-flash BBT (like in this patch) is if you had
> previous file system data in the last 4 blocks; nand_bbt will just
> clobber it, breaking your file system. For this reason, using DT is
> probably a good idea -- you're opting in, rather than being forced in by
> a kernel upgrade.
> 

FWIW, having the kernel wipe your precious data, is even worse than having
him fail; which means this represents a much more serious drawback.
This is why any modification to a NAND driver that involves a different
'view' of the flash, should be considered with a lot of care!

> Beyond the backwards-compatibility concern, you still have other
> concerns about on-flash BBT's robustness. Limiting yourself to a region
> of 4 blocks is one potential issue. There are others (e.g., lack of CRC
> protection), but none that have been real show-stoppers. I have a few
> generations of products running it here.
> 

Hm.. Can you guys mention what's the benefit of using a BBT, against keeping
the bad block mark in the OOB region? (Other than the fact that some ECC
strength may not leave any available OOB).
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
