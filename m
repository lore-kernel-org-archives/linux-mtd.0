Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsv8P-0006HT-ET
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 13:56:31 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so5879211pde.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 05:56:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA56FE4@DBDE04.ent.ti.com>
References: <1387267289-10026-1-git-send-email-eliedebrauwer@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
 <CAGWqfij3+yzxBFLPqqt+tWRBZTuHUWPc6xuqcwLcCFmYSAKSYA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56FE4@DBDE04.ent.ti.com>
Date: Tue, 17 Dec 2013 14:56:07 +0100
Message-ID: <CAGWqfigX2zPBLoe9NvsVjpxdjR-uUhU+CNnkbJUUkO3CwtxBeQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 2:21 PM, Gupta, Pekon <pekon@ti.com> wrote:
>>From: Elie De Brauwer [mailto:eliedebrauwer@gmail.com]
>>>On Tue, Dec 17, 2013 at 11:17 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>>>From: Elie De Brauwer
> [...]
>
>>> Just query..
>>> Is GPMI controller is able to detect number of 0s or 1s while reading
>>> the raw data from NAND ?
>>> I'm asking because a similar implementation was used in omap2.c
>>> driver reference: drivers/mtd/nand/omap2.c: erased_sector_bitflips()
>>> But, we ended up degrading the driver performance, so even I was
>>> looking for alternative implementations..
>>>
>>>  [...]
>>
>>If you look at my original patch, the correction algorithm is more or
>>less stolen from omap2 driver. In my original version of this patch
>>there was indeed a performance penalty which occurred each time you
>>were reading an erased block. Fortunately Huang Shijie pointed my at
>>the 'allones' case where the BCH block is able to tell us whether or
>>net it read 'all ones' as in a properly erased block. We combine this
>>with the ERASE_THRESHOLD to create a fast path (erased block without
>>any bitflips) and a slow path (erased block with bitflips) and in this
>>slow path we correct this. Bringing the overhead of this patch in the
>>normal case to an additional register access which we only do when the
>>BCH block told us the block is likely an erased block.
>>
> Yes, Shijie explained that..
> GPMI (FSL controller) supports 'allones' in hardware. (good controller :-) )
> Unfortunately GPMC (TI controller) does not have such mechanism,
> hence omap2.c driver had to do all read-data comparisons in software,
> leading to performance penalty, if bit-flips were encountered.
>
>
>>>>
>>>>+/*
>>>>+ * Count the number of 0 bits in a supposed to be
>>>>+ * erased region and correct them. Return the number
>>>>+ * of bitflips or zero when the region was correct.
>>>>+ */
>>>>+static unsigned int erased_sector_bitflips(unsigned char *data,
>>>>+                                      unsigned int chunk,
>>>>+                                      struct bch_geometry *geo)
>>>>+{
>>>>+      unsigned int flip_bits = 0;
>>>>+      int i;
>>>>+      int base = geo->ecc_chunk_size * chunk;
>>>>+
>>>>+      /* Count bitflips */
>>>>+      for (i = 0; i < geo->ecc_chunk_size; i++)
>>>>+              flip_bits += hweight8(~data[base + i]);
>>>>+
>>>>+      /* Correct bitflips by 0xFF'ing this chunk. */
>>>>+      if (flip_bits)
>>>>+              memset(&data[base], 0xFF, geo->ecc_chunk_size);
>>>
>>> But I don't quite understand here is..
>>> Why do you want to mask off the bit-flips in NAND, and give corrected
>>> data to upper layers ? Won't this lead to accumulation of bit-flips ?
>>
>>Actually the data is corrected the same way a properly functioning BCH
>>block would do if the FEC data would have been written. The trick is
>>that the in the function which calls this we return the number of
>>corrected bits (the same way as would happen on 'real' data with
>>proper ECC).  So we will not trick any upper layer into writing onto
>>possible damaged data. Whenever the upper layer reads an erased page
>>we will tell it 'we read what you requested but we corrected 'n'
>>bitflips' where the tolerance of the 'n' was an open point.  I'm no
>>expert on a decent value for this tolerance.
>>
>>An earlier post ( ref:
>>http://article.gmane.org/gmane.linux.drivers.mtd/46266/match=corrupted+empty+space+again
>>) this corrupted empty space was tackled at ubifs level, returning
>>-EUCLEAN instead of -EBADMSG and the result of that was that the
>>bitflip was not corrected but migrated away to another PEB, hence in
>>this solution I wanted to tackle this at the mtd level.
>>
> Understood.. Thanks for explaining..
> I missed that you were incrementing "err_stats.corrected" on detecting
> bit-flips in erased-pages. This caused nand_base.c to return -EUCLEAN.
>
> But, another query is..
> For erased-pages, does UBI differentiates between -EUCLEAN v/s -EBADMSG ?
> I couldn't find such difference in mtd/ubi/*..
>
> In UBI, I could trace that erased-pages are checked only on following paths:
> (a) ubi_io_write_data()
>         |- ubi_io_write()
>                 |- ubi_self_check_all_ff()
>
> (b) ubi_io_write_ec_hdr()
>         |- ubi_io_write()
>                 |- ubi_self_check_all_ff()
>
> (c) ubi_io_write_vid_hdr()
>         |- ubi_io_write()
>                 |- ubi_self_check_all_ff()
>
> (d) ubi_wl_get_peb()
>         |- ubi_self_check_all_ff()
>
> And in each case if an erased-page page was returned with error
> (whether -EUCLEAN or -EBADMSG) the PEB was re-added to
> erase-queue for erasure.
> So I'm not sure, what is causing UBI to scream on -EBADMSG and
> not on -EUCLEAN (just for erased-pages). Do you have any pointers ?
>

Well I traced what I made scream in my specific case. And the error
messages I got pointed to the right direction:

[    3.831323] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.845026] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.858710] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.872408] UBI error: ubi_io_read: error -74 (ECC error) while
reading 16384 bytes from PEB 443:245760, read 16384 bytes

And simply looking at ubi_io_read() shows that the code is
distinguishing between EUCLEAN and just deals with it. And EBADMSG
which is making it retry/dump stack and return EIO.

In a next stage I got UBIFS complaining about corrupted empty space
which looks something like:

[    4.011529] UBIFS error (pid 36): ubifs_recover_leb: corrupt empty
space LEB 27:237568, corruption starts at 9815
[    4.021897] UBIFS error (pid 36): ubifs_scanned_corruption:
corruption at LEB 27:247383

So  I actually followed the advice of earlier threads and dove deeper
(into the mtd layers) rather than upwards in the direction of
UBI/UBIFS.

On the other hand, just looking around points me to:
- wear_leveling_worker() which calls ubi_io_read_vid_hdr() (calling in
turn ubi_io_read(), see above ) and which may return a.o
UBI_IO_FF_BITFLIPS which the wear_levelling_worker then marks for
scrubbing.

my 2 cents
E.



-- 
Elie De Brauwer
