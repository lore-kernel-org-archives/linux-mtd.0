Received: from mail-ve0-f171.google.com ([209.85.128.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCagC-00072R-Dm
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 19:04:12 +0000
Received: by mail-ve0-f171.google.com with SMTP id b10so5085019vea.30
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 11:04:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-7-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-7-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 11:04:06 -0800
Message-ID: <CAN8TOE8zwnJY_1L1FmeGP3w+wJ4XpL4_bohOtp2h9UCHPdztFw@mail.gmail.com>
Subject: Re: [PATCH 06/12] mtd: nand: remove a bunch of unused commands
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Alexander

On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/nand/cafe_nand.c   |    6 ------
>  drivers/mtd/nand/nand_base.c   |   10 ----------
>  drivers/mtd/nand/nandsim.c     |    8 --------
>  drivers/mtd/nand/nuc900_nand.c |    9 ---------
>  include/linux/mtd/nand.h       |   20 --------------------
>  5 files changed, 53 deletions(-)
>

... trimmed ...

> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 2aba049..69097e8 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -86,7 +86,6 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  #define NAND_CMD_READOOB       0x50
>  #define NAND_CMD_ERASE1                0x60
>  #define NAND_CMD_STATUS                0x70
> -#define NAND_CMD_STATUS_MULTI  0x71
>  #define NAND_CMD_SEQIN         0x80
>  #define NAND_CMD_RNDIN         0x85
>  #define NAND_CMD_READID                0x90
> @@ -105,25 +104,6 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  #define NAND_CMD_RNDOUTSTART   0xE0
>  #define NAND_CMD_CACHEDPROG    0x15
>
> -/* Extended commands for AG-AND device */
> -/*
> - * Note: the command for NAND_CMD_DEPLETE1 is really 0x00 but
> - *       there is no way to distinguish that from NAND_CMD_READ0
> - *       until the remaining sequence of commands has been completed
> - *       so add a high order bit and mask it off in the command.
> - */
> -#define NAND_CMD_DEPLETE1      0x100

Perhaps this is the reason for the "unnecessary command masking" noted
by Alexander? There is one instance of a command function which masks
command & 0xff. Maybe Alexander's patch can be updated to mention this
likely cause for the original masking and can be applied on top of
Artem's cleanup series? Anyway, the mask was likely not used anyway,
since (as Artem mentions in this patch series) AG-AND had very little
general use (or none?).

> -#define NAND_CMD_DEPLETE2      0x38
> -#define NAND_CMD_STATUS_MULTI  0x71
> -#define NAND_CMD_STATUS_ERROR  0x72
> -/* multi-bank error status (banks 0-3) */
> -#define NAND_CMD_STATUS_ERROR0 0x73
> -#define NAND_CMD_STATUS_ERROR1 0x74
> -#define NAND_CMD_STATUS_ERROR2 0x75
> -#define NAND_CMD_STATUS_ERROR3 0x76
> -#define NAND_CMD_STATUS_RESET  0x7f
> -#define NAND_CMD_STATUS_CLEAR  0xff
> -
>  #define NAND_CMD_NONE          -1
>
>  /* Status bits */

Brian
