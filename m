Received: from mail-yh0-f48.google.com ([209.85.213.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XA39u-0003CP-9M
 for linux-mtd@lists.infradead.org; Wed, 23 Jul 2014 20:29:07 +0000
Received: by mail-yh0-f48.google.com with SMTP id i57so1191811yha.7
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2014 13:28:43 -0700 (PDT)
Date: Wed, 23 Jul 2014 17:27:46 -0300
From: ezequiel@vanguardiasur.com.ar
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Message-ID: <20140723202746.GA26346@arch.cereza>
References: <1406116461-27089-1-git-send-email-pekon@ti.com>
 <20140723120510.GA19677@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EB064F3@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EB064F3@DBDE04.ent.ti.com>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Quadros, Roger" <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Brian, correct me if I'm wrong here, you're the BBT expert).

On 23 Jul 04:26 PM, Gupta, Pekon wrote:
> >From: Ezequiel Garcia [mailto:ezequiel@vanguardiasur.com.ar]
> >>On 23 Jul 05:24 PM, Pekon Gupta wrote:
> >> This patch makes OMAP NAND driver to
> >> - save Bad-Block-Table (BBT) on NAND Flash device
> >> - scan on device BBT during probe
> >>
> >
> >Doesn't this break backward compatibility? Please correct me if I'm wrong
> >here, but if I apply this patch, and boot with my current NAND flash
> >contents, the kernel won't have any place to store the BBT (assuming
> >there are no blocks reserved).
> 
> Good point. I'll rather like your opinion to judge my below understanding
> as you were recently involved in some NAND BBT features additions..
> 
> When bbt_options "NAND_BBT_USE_FLASH" is enabled, default BBT
> options will be used which are:
> 
> $KERNEL/drivers/mtd/nand_bbt.c
> static struct nand_bbt_descr bbt_main_descr = {
> 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> 		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> 
> As default options have NAND_BBT_CREATE and NAND_BBT_WRITE,
> so kernel will try to reserve erase-blocks for main-BBT and mirror-BBT
> towards end of NAND device.
> 
> - Case-1: If there is un-allocated space (not allocated to any partition)
>   at end of Flash device then it will be used. And there is no problem.
> 

Yes, so far, so good.

> - Case-2: If there is no free space towards the end of flash, then ...
> As per my understanding, the create_bbt() would try scanning whole
> NAND to find empty blocks and then it creates BBT wherever it finds
> empty blocks. And those blocks are marked as BAD with BBT signature
> to prevent getting erased or over-written by any user-data.
> 

OK, I just went through the BBT code, trying to see if I was missing
something. I can't see any place where the kernel scans the device
and searches for empty space for the BBT.

Instead, what create_bbt() seem to do is scan the whole device, searching
for bad blocks to fill an in-memory BBT. I presume that if I have some
blocks marked as bad in the OOB region, they are identified as bad
and the BBT is filled.

I think that write_bbt() is where the (previously created, in-memory) BBT
is written to flash. It goes like this:

write_bbt()
{
[..]
                /*
                 * Automatic placement of the bad block table. Search direction
                 * top -> down?
                 */
                if (td->options & NAND_BBT_LASTBLOCK) {
                        startblock = numblocks * (chip + 1) - 1;
                        dir = -1;
                } else {
                        startblock = chip * numblocks;
                        dir = 1;
                }

                for (i = 0; i < td->maxblocks; i++) {
                        int block = startblock + dir * i;
                        /* Check, if the block is bad */
                        switch (bbt_get_entry(this, block)) {
                        case BBT_BLOCK_WORN:
                        case BBT_BLOCK_FACTORY_BAD:
                                continue;
                        }
                        page = block <<
                                (this->bbt_erase_shift - this->page_shift);
                        /* Check, if the block is used by the mirror table */
                        if (!md || md->pages[chip] != page)
                                goto write;
                }
                pr_err("No space left to write bad block table\n");
                return -ENOSPC;
		[..]
}

which fails if there's no room left for the BBT. This will happen on every
boot, so it's not an ideal situation.
 
> Is my understanding correct?
> If yes, then this will not break backward compatibility, as on upgrading
> the kernel new BBT will be automatically written on first boot. And
> it will be used in subsequent boots.
> Need feedbacks ...
> 

In fact, you do have a simple way to solve this. Just support BBT through
the "nand-on-flash-bbt" devicetree property, so a user can tell if his flash
has a BBT or not. See pxa3xx-nand.c, which should be correct.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
