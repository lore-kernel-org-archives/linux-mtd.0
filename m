From: "Gupta, Pekon" <pekon@ti.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>, "b32955@freescale.com"
 <b32955@freescale.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "shijie8@gmail.com" <shijie8@gmail.com>
Subject: RE: [PATCH] mtd: gpmi: Deal with bitflips in erased regions regions
Date: Tue, 17 Dec 2013 10:17:38 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA56E78@DBDE04.ent.ti.com>
References: <1387267289-10026-1-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <1387267289-10026-1-git-send-email-eliedebrauwer@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Elie De Brauwer
>
>The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
>able to correct bitflips on data actually streamed through the block.
>When erasing a block the data does not stream through the BCH block
>and therefore no ECC data is written to the NAND chip. This causes
>gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
>found in an erased page. Typically causing problems at higher levels
>(ubifs corrupted empty space warnings). This problem was also observed
>when using SLC NAND devices.
>
>This patch configures the BCH block to mark a block as 'erased' if
>no more than gf_len/2 bitflips are found. Next HW_BCH_STATUS0:ALLONES
>is used to check if the data read were all ones, indicating a read of a
>properly erased chunk was performed. If this was not the case a slow path
>is entered where bitflips are counted and corrected in software,
>allowing the upper layers to take proper actions.
>
>Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
>Acked-by: Peter Korsgaard <peter@korsgaard.com>
[...]

>--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>@@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> 			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
> 			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>
>+	/*
>+	 * Set the tolerance for bitflips when reading erased blocks
>+	 * equal to half the gf_len.
>+	 */
>+	writel((gf_len / 2) & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
>+		r->bch_regs + HW_BCH_MODE);
>+
> 	/* Set *all* chip selects to use layout 0. */
> 	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>
>@@ -1094,6 +1101,15 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsi=
gned chip)
> 	return reg & mask;
> }
>
>+/* Returns 1 if the last transaction consisted only out of ones. */
>+int gpmi_all_ones(struct gpmi_nand_data *this)
>+{
>+	struct resources *r =3D &this->resources;
>+	uint32_t reg =3D readl(r->bch_regs + HW_BCH_STATUS0);
>+
>+	return reg & BM_BCH_STATUS0_ALLONES_MASK;
>+}
>+
>
Just query..=20
Is GPMI controller is able to detect number of 0s or 1s while reading
the raw data from NAND ?
I'm asking because a similar implementation was used in omap2.c
driver reference: drivers/mtd/nand/omap2.c: erased_sector_bitflips()
But, we ended up degrading the driver performance, so even I was
looking for alternative implementations..

 [...]

>
>+/*
>+ * Count the number of 0 bits in a supposed to be
>+ * erased region and correct them. Return the number
>+ * of bitflips or zero when the region was correct.
>+ */
>+static unsigned int erased_sector_bitflips(unsigned char *data,
>+					unsigned int chunk,
>+					struct bch_geometry *geo)
>+{
>+	unsigned int flip_bits =3D 0;
>+	int i;
>+	int base =3D geo->ecc_chunk_size * chunk;
>+
>+	/* Count bitflips */
>+	for (i =3D 0; i < geo->ecc_chunk_size; i++)
>+		flip_bits +=3D hweight8(~data[base + i]);
>+
>+	/* Correct bitflips by 0xFF'ing this chunk. */
>+	if (flip_bits)
>+		memset(&data[base], 0xFF, geo->ecc_chunk_size);

But I don't quite understand here is..=20
Why do you want to mask off the bit-flips in NAND, and give corrected
data to upper layers ? Won't this lead to accumulation of bit-flips ?

Actually UBIFS checks for clean erased-pages before writing anything
on it [1]. And if UBIFS finds an unclean page, it re-erases it without
harming the system to avoid accumulation of bit-flips [2].
(Artem, please correct me if I'm wrong here)..

But with your above patch you will actually fool UBIFS to write on
unclean pages, which will increase the probability of bit-flips failures.
Example:  your erased page had 4-bit flips, but you still reported
data as clean. Now when UBIFS will write on this erased page, it
has the margin of tolerating only 4 more bit-flips.

Now, if you want to get rid of the debug messages and stack_dump
coming into your boot log because of this, then better suppress
debug message in following file
----------------------
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index bf79def..e589ff3 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1430,7 +1430,9 @@ fail:
        print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len,=
 1);
        err =3D -EINVAL;
 error:
+#ifdef DEBUG
        dump_stack();
+#endif
        vfree(buf);
        return err;
 }
----------------------


[1] drivers/mtd/ubi/io.c
@@ ubi_io_write(...)
	err =3D ubi_self_check_all_ff( ... )

[2] drivers/mtd/ubi/wl.c
@@ wear_leveling_worker( ... )
       /UBI_IO_FF_BITFLIPS


with regards, pekon
