Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VssK3-0008UW-BL
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 10:56:19 +0000
Date: Tue, 17 Dec 2013 18:26:34 +0800
From: Huang Shijie <b32955@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131217102632.GA19961@shlinux2.ap.freescale.net>
References: <1387267289-10026-1-git-send-email-eliedebrauwer@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
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

On Tue, Dec 17, 2013 at 10:17:38AM +0000, Gupta, Pekon wrote:
> >+/* Returns 1 if the last transaction consisted only out of ones. */
> >+int gpmi_all_ones(struct gpmi_nand_data *this)
> >+{
> >+	struct resources *r = &this->resources;
> >+	uint32_t reg = readl(r->bch_regs + HW_BCH_STATUS0);
> >+
> >+	return reg & BM_BCH_STATUS0_ALLONES_MASK;
> >+}
> >+
> >
> Just query.. 
> Is GPMI controller is able to detect number of 0s or 1s while reading
> the raw data from NAND ?

The gpmi can detect the all-one case, in other word, if the page is all
0xff, we can know this case.

Since the bit flips of erase page is very very rare, i think 
the performance is not effected by this patch.


> I'm asking because a similar implementation was used in omap2.c
> driver reference: drivers/mtd/nand/omap2.c: erased_sector_bitflips()
> But, we ended up degrading the driver performance, so even I was
> looking for alternative implementations..
> 
>  [...]
> 
> >
> >+/*
> >+ * Count the number of 0 bits in a supposed to be
> >+ * erased region and correct them. Return the number
> >+ * of bitflips or zero when the region was correct.
> >+ */
> >+static unsigned int erased_sector_bitflips(unsigned char *data,
> >+					unsigned int chunk,
> >+					struct bch_geometry *geo)
> >+{
> >+	unsigned int flip_bits = 0;
> >+	int i;
> >+	int base = geo->ecc_chunk_size * chunk;
> >+
> >+	/* Count bitflips */
> >+	for (i = 0; i < geo->ecc_chunk_size; i++)
> >+		flip_bits += hweight8(~data[base + i]);
> >+
> >+	/* Correct bitflips by 0xFF'ing this chunk. */
> >+	if (flip_bits)
> >+		memset(&data[base], 0xFF, geo->ecc_chunk_size);
of course, this function could be optimized more better.

> 
> But I don't quite understand here is.. 
> Why do you want to mask off the bit-flips in NAND, and give corrected
> data to upper layers ? Won't this lead to accumulation of bit-flips ?
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
if we use the 8 as the ECC strengh, we still can correct the bitflips,
am I right? I feel a little confused at this.

Btw: From Pekon's comment, i suddenly notice that we should fill the
     ERASE_THRESHOLD like this:

	int threshold = gf_len / 2;

	if (threshold > geo->ecc_strength)
		threshold = geo->ecc_strength;

	/*
	 * Set the tolerance for bitflips when reading erased blocks
	 * equal to half the gf_len.
	 */
	writel(threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
		r->bch_regs + HW_BCH_MODE);


thanks
Huang Shijie
