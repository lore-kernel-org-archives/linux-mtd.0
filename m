Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCayX-0001Lo-7c
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 19:23:05 +0000
Received: by mail-vb0-f51.google.com with SMTP id fq11so996956vbb.38
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 11:23:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-11-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-11-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 11:23:03 -0800
Message-ID: <CAN8TOE_Db-qpWE_a_JAW7QBjyVb-uj2fYBDnuAcBn95yrHFr+Q@mail.gmail.com>
Subject: Re: [PATCH 10/12] mtd: nand_ids: introduce helper macros
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
> Introduce helper macros for defining NAND chips. These macros do not really add
> much value in the current code-base. However, we are going to add full ID
> support which adds some more complexity to the table, and helper macros become
> useful for readability.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/nand/nand_ids.c  |  159 +++++++++++++++++++++---------------------
>  drivers/mtd/nand/sm_common.c |   64 ++++++++---------
>  include/linux/mtd/nand.h     |   17 +++++
>  3 files changed, 127 insertions(+), 113 deletions(-)
>

...

> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 59dee20..f7f198e 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -539,6 +539,23 @@ struct nand_chip {
>  #define NAND_MFR_MACRONIX      0xc2
>  #define NAND_MFR_EON           0x92
>
> +/*
> + * A helper for defining older chips which did not have page size and
> + * eraseblock size encoded in the chip ID bytes.
> + */

Do the "TABLE_NAND" flash really "not have page size and eraseblock
size encoded in the chip ID bytes"? I would say they have them
"encoded" in a way: the encoding is just a 1-to-1 constant mapping!

The real difference between TABLE_NAND and EXTENDED_ID_NAND is that
with EXTENDED_ID_NAND, manufacturers overloaded the same device ID so
that the device ID now only represented a particular total chip size
(and voltage, buswidth), and the page size, eraseblock size, and OOB
size could vary while using the same device ID.

I don't know if I'm just being too picky here or if this actually is
worth clarifying/improving these comments. One candidate change:

"A helper for defining older chips whose device ID determines their
page size and eraseblock size."

> +#define TABLE_NAND(nm, devid, pagesz, chipsz, erasesz, opts) \
> +       { .name = (nm), .id = (devid), .pagesize = (pagesz), \
> +         .chipsize = (chipsz), .erasesize = (erasesz),      \
> +         .options = (opts) }
> +
> +/*
> + * A helper for defining newer chips which report their page size and
> + * eraseblock size via the extended ID bytes.
> + */
> +#define EXTENDED_ID_NAND(nm, devid, chipsz, opts)            \
> +       { .name = (nm), .id = (devid), .chipsize = (chipsz), \
> +         .options = (opts) }
> +
>  /**
>   * struct nand_flash_dev - NAND Flash Device ID Structure
>   * @name:      Identify the device type
> --
> 1.7.10.4
>

Brian
