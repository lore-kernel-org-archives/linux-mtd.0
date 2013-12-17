From: "Gupta, Pekon" <pekon@ti.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>, "shijie8@gmail.com"
 <shijie8@gmail.com>
Subject: RE: [PATCH] mtd: gpmi: Deal with bitflips in erased regions regions
Date: Tue, 17 Dec 2013 13:21:02 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA56FE4@DBDE04.ent.ti.com>
References: <1387267289-10026-1-git-send-email-eliedebrauwer@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
 <CAGWqfij3+yzxBFLPqqt+tWRBZTuHUWPc6xuqcwLcCFmYSAKSYA@mail.gmail.com>
In-Reply-To: <CAGWqfij3+yzxBFLPqqt+tWRBZTuHUWPc6xuqcwLcCFmYSAKSYA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "b32955@freescale.com" <b32955@freescale.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Elie De Brauwer [mailto:eliedebrauwer@gmail.com]
>>On Tue, Dec 17, 2013 at 11:17 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>>From: Elie De Brauwer
[...]

>> Just query..
>> Is GPMI controller is able to detect number of 0s or 1s while reading
>> the raw data from NAND ?
>> I'm asking because a similar implementation was used in omap2.c
>> driver reference: drivers/mtd/nand/omap2.c: erased_sector_bitflips()
>> But, we ended up degrading the driver performance, so even I was
>> looking for alternative implementations..
>>
>>  [...]
>
>If you look at my original patch, the correction algorithm is more or
>less stolen from omap2 driver. In my original version of this patch
>there was indeed a performance penalty which occurred each time you
>were reading an erased block. Fortunately Huang Shijie pointed my at
>the 'allones' case where the BCH block is able to tell us whether or
>net it read 'all ones' as in a properly erased block. We combine this
>with the ERASE_THRESHOLD to create a fast path (erased block without
>any bitflips) and a slow path (erased block with bitflips) and in this
>slow path we correct this. Bringing the overhead of this patch in the
>normal case to an additional register access which we only do when the
>BCH block told us the block is likely an erased block.
>
Yes, Shijie explained that..
GPMI (FSL controller) supports 'allones' in hardware. (good controller :-) =
)
Unfortunately GPMC (TI controller) does not have such mechanism,
hence omap2.c driver had to do all read-data comparisons in software,
leading to performance penalty, if bit-flips were encountered.


>>>
>>>+/*
>>>+ * Count the number of 0 bits in a supposed to be
>>>+ * erased region and correct them. Return the number
>>>+ * of bitflips or zero when the region was correct.
>>>+ */
>>>+static unsigned int erased_sector_bitflips(unsigned char *data,
>>>+                                      unsigned int chunk,
>>>+                                      struct bch_geometry *geo)
>>>+{
>>>+      unsigned int flip_bits =3D 0;
>>>+      int i;
>>>+      int base =3D geo->ecc_chunk_size * chunk;
>>>+
>>>+      /* Count bitflips */
>>>+      for (i =3D 0; i < geo->ecc_chunk_size; i++)
>>>+              flip_bits +=3D hweight8(~data[base + i]);
>>>+
>>>+      /* Correct bitflips by 0xFF'ing this chunk. */
>>>+      if (flip_bits)
>>>+              memset(&data[base], 0xFF, geo->ecc_chunk_size);
>>
>> But I don't quite understand here is..
>> Why do you want to mask off the bit-flips in NAND, and give corrected
>> data to upper layers ? Won't this lead to accumulation of bit-flips ?
>
>Actually the data is corrected the same way a properly functioning BCH
>block would do if the FEC data would have been written. The trick is
>that the in the function which calls this we return the number of
>corrected bits (the same way as would happen on 'real' data with
>proper ECC).  So we will not trick any upper layer into writing onto
>possible damaged data. Whenever the upper layer reads an erased page
>we will tell it 'we read what you requested but we corrected 'n'
>bitflips' where the tolerance of the 'n' was an open point.  I'm no
>expert on a decent value for this tolerance.
>
>An earlier post ( ref:
>http://article.gmane.org/gmane.linux.drivers.mtd/46266/match=3Dcorrupted+e=
mpty+space+again
>) this corrupted empty space was tackled at ubifs level, returning
>-EUCLEAN instead of -EBADMSG and the result of that was that the
>bitflip was not corrected but migrated away to another PEB, hence in
>this solution I wanted to tackle this at the mtd level.
>
Understood.. Thanks for explaining..
I missed that you were incrementing "err_stats.corrected" on detecting
bit-flips in erased-pages. This caused nand_base.c to return -EUCLEAN.

But, another query is..=20
For erased-pages, does UBI differentiates between -EUCLEAN v/s -EBADMSG ?
I couldn't find such difference in mtd/ubi/*..

In UBI, I could trace that erased-pages are checked only on following paths=
:
(a) ubi_io_write_data()
	|- ubi_io_write()
		|- ubi_self_check_all_ff()

(b) ubi_io_write_ec_hdr()
	|- ubi_io_write()
		|- ubi_self_check_all_ff()

(c) ubi_io_write_vid_hdr()
	|- ubi_io_write()
		|- ubi_self_check_all_ff()

(d) ubi_wl_get_peb()
	|- ubi_self_check_all_ff()

And in each case if an erased-page page was returned with error
(whether -EUCLEAN or -EBADMSG) the PEB was re-added to
erase-queue for erasure.
So I'm not sure, what is causing UBI to scream on -EBADMSG and
not on -EUCLEAN (just for erased-pages). Do you have any pointers ?


with regards, pekon
