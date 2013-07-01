Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uths3-00038W-8y
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 17:26:36 +0000
Received: by mail-vc0-f174.google.com with SMTP id kw10so2154354vcb.19
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2013 10:26:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <518D6138.2090009@wanadoo.fr>
References: <1368195520.26780.169.camel@sauron.fi.intel.com>
 <518D6138.2090009@wanadoo.fr>
Date: Mon, 1 Jul 2013 10:26:12 -0700
Message-ID: <CAN8TOE-NfM4P5=+Q6yKOaUsQCAfBADncocP5a_a61mubXgBFoA@mail.gmail.com>
Subject: Re: [PATCH] mtd: chips: Add support for PMC SPI Flash chips in
 m25p80.c
From: Brian Norris <computersforpeace@gmail.com>
To: Michel Stempin <michel.stempin@wanadoo.fr>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael,

I gook a glimpse at this and have a few comments ;)

On Fri, May 10, 2013 at 2:06 PM, Michel Stempin
<michel.stempin@wanadoo.fr> wrote:
>     Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit), Pm25LV010 (1 Mbit) (see datasheet http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf) and Pm25LQ032 (32 Mbit) (datasheet:http://www.

This line has no line breaks, and so it is hard to read. That may also
explain why the sentence (and URL) is cut off. Please try to wrap it
properly when you resend, so it is both complete and readable.

Are there any manufacturer links for old datasheets? That would be
preferable to random Geocities links, but it looks like the
manufacturer website only has new stuff.

A few other general notes:

It's worth documenting the quirks of these flash that you are
supporting, probably just in the patch description. As I read it, you
are supporting two different generations of PMC flash here:

Pm25LV512 and Pm25LV010: these have 4KB sectors and 32KB blocks. The
4KB sector erase uses a non-standard opcode (0xd7). They do not
support JEDEC RDID (0x9f), and so they can only be detected by
matching their name string with pre-configured platform data.

Pm25LQ032: a newer generation flash, with 4KB sectors and 32KB blocks.
It uses the standard erase and JEDEC read-ID opcodes.
...
> ---
>  drivers/mtd/devices/m25p80.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 2f3d2a5..4d45ce4 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -45,6 +45,7 @@
>  #define        OPCODE_BE_4K            0x20    /* Erase 4KiB block */
>  #define        OPCODE_BE_32K           0x52    /* Erase 32KiB block */
>  #define        OPCODE_CHIP_ERASE       0xc7    /* Erase whole flash chip */
> +#define        OPCODE_BE_4K_PMC        0xd7    /* Erase 4KiB block on PMC chips*/

Missing a space after chips. (i.e., should be "... PMC chips */")

While you're at it, you might as well run scripts/checkpatch.pl on your patch.

I would also group OPCODE_BE_4K_PMC along with OPCODE_BE_4K_PMC (that
is, by function) rather than just sorting by opcode.

>  #define        OPCODE_SE               0xd8    /* Sector erase (usually 64KiB) */
>  #define        OPCODE_RDID             0x9f    /* Read JEDEC ID */
>
> @@ -682,6 +683,7 @@ struct flash_info {
>  #define        SECT_4K         0x01            /* OPCODE_BE_4K works uniformly */
>  #define        M25P_NO_ERASE   0x02            /* No erase command needed */
>  #define        SST_WRITE       0x04            /* use SST byte programming */
> +#define        SECT_4K_PMC     0x08            /* OPCODE_BE_4K_PMC works uniformly */
>  };
>
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)     \
> @@ -762,6 +764,11 @@ static const struct spi_device_id m25p_ids[] = {
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
>         { "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
>
> +       /* PMC -- pm25x "blocks" are 32K, sectors are 4K */

Is this true for all PMC flash that you know of? If not, then I'd just
let the table speak for itself. But it's fine as-is, if there are no
known flash without a 4KB sector, for example.

> +       { "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
> +       { "pm25lv010", INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },
> +       { "pm25lq032", INFO(0x7F9D46, 0, 64 * 1024,  64, SECT_4K) },

Use lower-case 0x7f9d46, to match the style of the rest of the table.

> +
>         /* Spansion -- single (large) sector size only, at least
>          * for the chips listed here (without boot sectors).
>          */
> @@ -1014,6 +1021,9 @@ static int m25p_probe(struct spi_device *spi)
>         if (info->flags & SECT_4K) {
>                 flash->erase_opcode = OPCODE_BE_4K;
>                 flash->mtd.erasesize = 4096;
> +       } else if (info->flags & SECT_4K_PMC) {
> +               flash->erase_opcode = OPCODE_BE_4K_PMC;
> +               flash->mtd.erasesize = 4096;
>         } else {
>                 flash->erase_opcode = OPCODE_SE;
>                 flash->mtd.erasesize = info->sector_size;

Other than the suggestions for style and documentation improvements,
it looks good to me. I gook forward to acking your revised patch.

Brian
