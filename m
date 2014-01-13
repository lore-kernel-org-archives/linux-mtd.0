Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2bpK-0006HN-J9
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 07:20:51 +0000
Received: by mail-pb0-f52.google.com with SMTP id uo5so6939080pbc.25
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2014 23:20:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1389581697-28309-1-git-send-email-b32955@freescale.com>
References: <1389581697-28309-1-git-send-email-b32955@freescale.com>
Date: Mon, 13 Jan 2014 08:20:24 +0100
Message-ID: <CAGWqfiiRtRoT_qE4SjrkMDspxEWePRbX9krZxXM-TtVSxuhSLg@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the bitflips for erased page
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vikram.Narayanan@in.bosch.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, bpringlemeir@nbsps.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 3:54 AM, Huang Shijie <b32955@freescale.com> wrote:
> We may meet the bitflips in reading an erased page(contains all 0xFF),
> this may causes the UBIFS corrupt, please see the log from Elie:
>
> -----------------------------------------------------------------
> [    3.831323] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
> [    3.845026] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
> [    3.858710] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
> [    3.872408] UBI error: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read 16384 bytes
> ...
> [    4.011529] UBIFS error (pid 36): ubifs_recover_leb: corrupt empty space LEB 27:237568, corruption starts at 9815
> [    4.021897] UBIFS error (pid 36): ubifs_scanned_corruption: corruption at LEB 27:247383
> [    4.030000] UBIFS error (pid 36): ubifs_scanned_corruption: first 6569 bytes from LEB 27:247383
> -----------------------------------------------------------------
>
> This patch does a check for the uncorrectable failure in the following steps:
>
>    [0] set the threshold.
>        The threshold is set based on the truth:
>          "A single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH
>           do the ECC."
>
>        For the sake of safe, we will set the threshold with half the gf_len, and
>        do not make it bigger the ECC strength.
>
>    [1] count the bitflips of the current ECC chunk, assume it is N.
>
>    [2] if the (N <= threshold) is true, we continue to read out the page with
>        ECC disabled. and we count the bitflips again, assume it is N2.
>
>    [3] if the (N2 <= threshold) is true again, we can regard this is a erased
>        page. This is because a real erased page is full of 0xFF(maybe also has
>        several bitflips), while a page contains the 0xFF data will definitely
>        has many bitflips in the ECC parity areas.
>
>    [4] if the [3] fails, we can regard this is a page filled with the '0xFF'
>        data.
>
> Tested-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Reported-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> v2 -- > v3:
>         [1] add the shortcut for the step [2].
>         [2] use the hweight64 to optimize the bitflips count.
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   54 ++++++++++++++++++++++++++++++++
>  1 files changed, 54 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index e2f5820..9b600e1 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -958,6 +958,56 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
>         p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
>  }
>
> +static bool gpmi_erased_check(struct gpmi_nand_data *this,
> +                       unsigned char *data, unsigned int chunk, int page,
> +                       unsigned int *max_bitflips)
> +{
> +       struct nand_chip *chip = &this->nand;
> +       struct mtd_info *mtd = &this->mtd;
> +       struct bch_geometry *geo = &this->bch_geometry;
> +       int base = geo->ecc_chunk_size * chunk;
> +       unsigned int flip_bits = 0, flip_bits_noecc = 0;
> +       uint64_t *buf = (uint64_t *)this->data_buffer_dma;
> +       unsigned int threshold;
> +       bool ret = false;
> +       int i;
> +
> +       threshold = geo->gf_len / 2;
> +       if (threshold > geo->ecc_strength)
> +               threshold = geo->ecc_strength;
> +
> +       /* Count bitflips */
> +       for (i = 0; i < geo->ecc_chunk_size; i++) {
> +               flip_bits += hweight8(~data[base + i]);
> +               if (flip_bits > threshold)
> +                       return false;
> +       }
> +
> +       /* Read out the page without ECC enabled, and check it again */
> +       chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +       chip->read_buf(mtd, (uint8_t *)buf, mtd->writesize);
> +
> +       /* Count the bitflips for the no ECC buffer */
> +       for (i = 0; i < mtd->writesize / 8; i++)
> +               flip_bits_noecc += hweight64(~buf[i]);

Is it safe to assume that all these chunks will be 8-byte-aligned ? I
also thought about this optimization but didn't find any indication
that this might be safe.

> +
> +       if (flip_bits_noecc <= threshold) {
> +               /* Tell the upper layer the bitflips we corrected. */
> +               *max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
> +
> +               /*
> +                * The geo->payload_size maybe not equal to the page size
> +                * when the Subpage-Read is enabled.
> +                */
> +               memset(data, 0xff, geo->payload_size);
> +               ret = true;
> +       }
> +       dev_dbg(this->dev, "The page(%d) %s an erased page(%d,%d,%d,%d).\n",
> +                       page, ret ? "is" : "isn't", chunk, threshold,
> +                       flip_bits, flip_bits_noecc);
> +       return ret;
> +}
> +
>  static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>                                 uint8_t *buf, int oob_required, int page)
>  {
> @@ -1007,6 +1057,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>                         continue;
>
>                 if (*status == STATUS_UNCORRECTABLE) {
> +                       if (gpmi_erased_check(this, payload_virt, i,
> +                                               page, &max_bitflips))
> +                               break;
> +
>                         mtd->ecc_stats.failed++;
>                         continue;
>                 }
> --
> 1.7.2.rc3
>

A second note, you patch v2 is a lie, there in the v1->v2 you mention
you return the number of bitflips to the upper layer, however your
code was not modified accordingly, gpmi_erase_check still does not
return the number of bitflips. Unless I'm missing something there too.

my 2 cents
E.



-- 
Elie De Brauwer
