Received: from mail-ve0-f181.google.com ([209.85.128.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCaYc-0005Tf-HY
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 18:56:23 +0000
Received: by mail-ve0-f181.google.com with SMTP id d10so5034132vea.12
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 10:56:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-6-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-6-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 10:56:14 -0800
Message-ID: <CAN8TOE_unP1QVSTiOJdAf3LQ6zKYDLJ03ZRO7ZcDg0L72prnDw@mail.gmail.com>
Subject: Re: [PATCH 05/12] mtd: nand: remove AG-AND support
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> We have only one AG-AND driver and it was not touched since 2005. It looks
> like AG-AND was not really make it to mass-production and can be considered
> a dead technology.

You might want to include in your commit message that BBT_AUTO_REFRESH
was only needed for AG-AND. You drop it here (which is perfectly
reasonable) but it is technically provided as a generic feature which
*could* be used outside of AG-AND.

> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/nand/nand_base.c |   78 ++----------------------------------------
>  drivers/mtd/nand/nand_bbt.c  |   25 --------------
>  drivers/mtd/nand/nand_ids.c  |   13 -------
>  include/linux/mtd/nand.h     |   16 ---------
>  4 files changed, 2 insertions(+), 130 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4321415..0e28f55 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c

...

> @@ -22,7 +21,6 @@
>   *     Enable cached programming for 2k page size chips
>   *     Check, if mtd->ecctype should be set to MTD_ECC_HW
>   *     if we have HW ECC support.
> - *     The AG-AND chips have nice features for speed improvement,
>   *     which are not supported yet. Read / program 4 pages in one go.
>   *     BBT table is not serialized, has to be fixed
>   *

You cut this off mid-sentence. Did you mean to cut three lines here,
instead of just one?

> @@ -836,9 +834,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>          */
>         ndelay(100);
>
> -       if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
> -               chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
> -       else
> +       if (state == FL_ERASING)
>                 chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);

This is not a precise refactor. All non-AND flash would previously
have run the STATUS command, but now you make it only run when
FL_ERASING. Shouldn't it just be an unconditional cmdfunc(STATUS)?

>         if (in_interrupt() || oops_in_progress)

...

The rest looks OK to me.

Brian
