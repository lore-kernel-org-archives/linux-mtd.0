Received: from mail-vc0-f175.google.com ([209.85.220.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFVQb-0000tG-DP
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 20:04:06 +0000
Received: by mail-vc0-f175.google.com with SMTP id p1so131502vcq.6
 for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2013 13:04:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363068864-5376-1-git-send-email-shc_work@mail.ru>
References: <1363068864-5376-1-git-send-email-shc_work@mail.ru>
Date: Tue, 12 Mar 2013 13:04:03 -0700
Message-ID: <CAN8TOE9iVZHYF6KDEaSKqLxWo5AzPkPsM1acS=cybGhwBvZ3Fg@mail.gmail.com>
Subject: Re: [RFC RESEND] mtd: nand_base: Make Diskonchip work again
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Mon, Mar 11, 2013 at 11:14 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> According to my post (http://permalink.gmane.org/gmane.linux.drivers.mtd/45657),
> I created a patch to fix the DiskOnChip regression. Patch partially revert
> "mtd: nand: kill NAND_NO_READRDY". We create NAND_NEED_READDRY option as a
> replacement NAND_NO_READRDY but with different logic, and restore RDY
> expectations in reading function, if this option is set. At least, Disconchip
> works again, so probably it can help in solving other NAND-related bugs in
> the latest kernels.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Sorry, I didn't have time to comment and supply a different patch, but
I don't think this is quite what we want. My previous error (removing
NO_READRDY when, in fact, it should be used on some chips still)
should not resolved by a diskonchip-specific option; we should apply
the option to specific NAND flash, as it was done previously. I'm
guessing you're the only one who saw it because (1) few people use old
NAND which need this and (2) some drivers/NAND controllers may perform
the appropriate delays automatically anyway.

It may be a good idea to, at the same time, transform the option to an
"opt-in" (i.e., your 'NAND_NEED_READRDY') rather than opt-out
('NAND_NO_READRDY').

I will try to work up a patch tonight and submit it.

Brian

> ---
>  drivers/mtd/nand/diskonchip.c |    1 +
>  drivers/mtd/nand/nand_base.c  |   16 ++++++++++++++++
>  include/linux/mtd/nand.h      |    2 ++
>  3 files changed, 19 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> index 81fa578..19992f2 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c
> @@ -1580,6 +1580,7 @@ static int __init doc_probe(unsigned long physadr)
>         nand->dev_ready         = doc200x_dev_ready;
>         nand->waitfunc          = doc200x_wait;
>         nand->block_bad         = doc200x_block_bad;
> +       nand->options           = NAND_NEED_READRDY;
>         nand->ecc.hwctl         = doc200x_enable_hwecc;
>         nand->ecc.calculate     = doc200x_calculate_ecc;
>         nand->ecc.correct       = doc200x_correct_data;
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4321415..42c6392 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1523,6 +1523,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>                                         oobreadlen -= toread;
>                                 }
>                         }
> +
> +                       if (chip->options & NAND_NEED_READRDY) {
> +                               /* Apply delay or wait for ready/busy pin */
> +                               if (!chip->dev_ready)
> +                                       udelay(chip->chip_delay);
> +                               else
> +                                       nand_wait_ready(mtd);
> +                       }
>                 } else {
>                         memcpy(buf, chip->buffers->databuf + col, bytes);
>                         buf += bytes;
> @@ -1787,6 +1795,14 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>                 len = min(len, readlen);
>                 buf = nand_transfer_oob(chip, buf, ops, len);
>
> +               if (chip->options & NAND_NEED_READRDY) {
> +                       /* Apply delay or wait for ready/busy pin */
> +                       if (!chip->dev_ready)
> +                               udelay(chip->chip_delay);
> +                       else
> +                               nand_wait_ready(mtd);
> +               }
> +
>                 readlen -= len;
>                 if (!readlen)
>                         break;
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7ccb3c5..1c13582 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -187,6 +187,8 @@ typedef enum {
>   * This happens with the Renesas AG-AND chips, possibly others.
>   */
>  #define BBT_AUTO_REFRESH       0x00000080
> +/* Chip require ready check on read */
> +#define NAND_NEED_READRDY      0x00000100
>  /* Chip does not allow subpage writes */
>  #define NAND_NO_SUBPAGE_WRITE  0x00000200
>
> --
> 1.7.3.4
>
