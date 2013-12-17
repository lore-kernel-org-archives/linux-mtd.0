Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vstv8-0002ra-Tt
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 12:38:44 +0000
Received: by mail-pb0-f45.google.com with SMTP id rp16so6888287pbb.18
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 04:38:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
References: <1387267289-10026-1-git-send-email-eliedebrauwer@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
Date: Tue, 17 Dec 2013 13:38:20 +0100
Message-ID: <CAGWqfij3+yzxBFLPqqt+tWRBZTuHUWPc6xuqcwLcCFmYSAKSYA@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 11:17 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>From: Elie De Brauwer
>>
>>The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
>>able to correct bitflips on data actually streamed through the block.
>>When erasing a block the data does not stream through the BCH block
>>and therefore no ECC data is written to the NAND chip. This causes
>>gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
>>found in an erased page. Typically causing problems at higher levels
>>(ubifs corrupted empty space warnings). This problem was also observed
>>when using SLC NAND devices.
>>
>>This patch configures the BCH block to mark a block as 'erased' if
>>no more than gf_len/2 bitflips are found. Next HW_BCH_STATUS0:ALLONES
>>is used to check if the data read were all ones, indicating a read of a
>>properly erased chunk was performed. If this was not the case a slow path
>>is entered where bitflips are counted and corrected in software,
>>allowing the upper layers to take proper actions.
>>
>>Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
>>Acked-by: Peter Korsgaard <peter@korsgaard.com>
> [...]
>
>>--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>>+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>>@@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>>                       | BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>>                       r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>>
>>+      /*
>>+       * Set the tolerance for bitflips when reading erased blocks
>>+       * equal to half the gf_len.
>>+       */
>>+      writel((gf_len / 2) & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
>>+              r->bch_regs + HW_BCH_MODE);
>>+
>>       /* Set *all* chip selects to use layout 0. */
>>       writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>>
>>@@ -1094,6 +1101,15 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
>>       return reg & mask;
>> }
>>
>>+/* Returns 1 if the last transaction consisted only out of ones. */
>>+int gpmi_all_ones(struct gpmi_nand_data *this)
>>+{
>>+      struct resources *r = &this->resources;
>>+      uint32_t reg = readl(r->bch_regs + HW_BCH_STATUS0);
>>+
>>+      return reg & BM_BCH_STATUS0_ALLONES_MASK;
>>+}
>>+
>>
> Just query..
> Is GPMI controller is able to detect number of 0s or 1s while reading
> the raw data from NAND ?
> I'm asking because a similar implementation was used in omap2.c
> driver reference: drivers/mtd/nand/omap2.c: erased_sector_bitflips()
> But, we ended up degrading the driver performance, so even I was
> looking for alternative implementations..
>
>  [...]

If you look at my original patch, the correction algorithm is more or
less stolen from omap2 driver. In my original version of this patch
there was indeed a performance penalty which occurred each time you
were reading an erased block. Fortunately Huang Shijie pointed my at
the 'allones' case where the BCH block is able to tell us whether or
net it read 'all ones' as in a properly erased block. We combine this
with the ERASE_THRESHOLD to create a fast path (erased block without
any bitflips) and a slow path (erased block with bitflips) and in this
slow path we correct this. Bringing the overhead of this patch in the
normal case to an additional register access which we only do when the
BCH block told us the block is likely an erased block.



>
>>
>>+/*
>>+ * Count the number of 0 bits in a supposed to be
>>+ * erased region and correct them. Return the number
>>+ * of bitflips or zero when the region was correct.
>>+ */
>>+static unsigned int erased_sector_bitflips(unsigned char *data,
>>+                                      unsigned int chunk,
>>+                                      struct bch_geometry *geo)
>>+{
>>+      unsigned int flip_bits = 0;
>>+      int i;
>>+      int base = geo->ecc_chunk_size * chunk;
>>+
>>+      /* Count bitflips */
>>+      for (i = 0; i < geo->ecc_chunk_size; i++)
>>+              flip_bits += hweight8(~data[base + i]);
>>+
>>+      /* Correct bitflips by 0xFF'ing this chunk. */
>>+      if (flip_bits)
>>+              memset(&data[base], 0xFF, geo->ecc_chunk_size);
>
> But I don't quite understand here is..
> Why do you want to mask off the bit-flips in NAND, and give corrected
> data to upper layers ? Won't this lead to accumulation of bit-flips ?

Actually the data is corrected the same way a properly functioning BCH
block would do if the FEC data would have been written. The trick is
that the in the function which calls this we return the number of
corrected bits (the same way as would happen on 'real' data with
proper ECC).  So we will not trick any upper layer into writing onto
possible damaged data. Whenever the upper layer reads an erased page
we will tell it 'we read what you requested but we corrected 'n'
bitflips' where the tolerance of the 'n' was an open point.  I'm no
expert on a decent value for this tolerance.

An earlier post ( ref:
http://article.gmane.org/gmane.linux.drivers.mtd/46266/match=corrupted+empty+space+again
) this corrupted empty space was tackled at ubifs level, returning
-EUCLEAN instead of -EBADMSG and the result of that was that the
bitflip was not corrected but migrated away to another PEB, hence in
this solution I wanted to tackle this at the mtd level.

I also tested this on a board with bitflips in empty space (see also
my initial posting) and my patch made the issue disappear.

>
> Actually UBIFS checks for clean erased-pages before writing anything
> on it [1]. And if UBIFS finds an unclean page, it re-erases it without
> harming the system to avoid accumulation of bit-flips [2].
> (Artem, please correct me if I'm wrong here)..
>
> But with your above patch you will actually fool UBIFS to write on
> unclean pages, which will increase the probability of bit-flips failures.
> Example:  your erased page had 4-bit flips, but you still reported
> data as clean. Now when UBIFS will write on this erased page, it
> has the margin of tolerating only 4 more bit-flips.
>
> Now, if you want to get rid of the debug messages and stack_dump
> coming into your boot log because of this, then better suppress
> debug message in following file
> ----------------------
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index bf79def..e589ff3 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -1430,7 +1430,9 @@ fail:
>         print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
>         err = -EINVAL;
>  error:
> +#ifdef DEBUG
>         dump_stack();
> +#endif
>         vfree(buf);
>         return err;
>  }
> ----------------------
>
>
> [1] drivers/mtd/ubi/io.c
> @@ ubi_io_write(...)
>         err = ubi_self_check_all_ff( ... )
>
> [2] drivers/mtd/ubi/wl.c
> @@ wear_leveling_worker( ... )
>        /UBI_IO_FF_BITFLIPS
>
>
> with regards, pekon



-- 
Elie De Brauwer
