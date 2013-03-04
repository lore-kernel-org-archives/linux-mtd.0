Received: from mail-ve0-f171.google.com ([209.85.128.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCaFG-0007qW-BO
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 18:36:18 +0000
Received: by mail-ve0-f171.google.com with SMTP id b10so4966401vea.2
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 10:36:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-2-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-2-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 10:36:16 -0800
Message-ID: <CAN8TOE-bJxgJ3HJCWyqkRJuOGjtoq0sLMNsDeFmZLAoB+Qg0bg@mail.gmail.com>
Subject: Re: [PATCH 01/12] mtd: nand_ids: minor clean-ups
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
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index e3aa274..b110742 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -10,17 +10,17 @@
>   */
>  #include <linux/module.h>
>  #include <linux/mtd/nand.h>
> +
> +#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
> +#define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
> +
>  /*
> -*      Chip ID list
> -*
> -*      Name. ID code, pagesize, chipsize in MegaByte, eraseblock size,
> -*      options
> -*
> -*      Pagesize; 0, 256, 512
> -*      0       get this information from the extended chip ID
> -+      256     256 Byte page size
> -*      512     512 Byte page size
> -*/
> + * The chip ID list:
> + *    name, device ID, page size, chip size in MiB, eraseblock size, options
> + *
> + * If page size and eraseblock size is 0, the sizes are taken from the extended

Grammar correction: "is" should be "are".

> + * chip ID.
> + */
>  struct nand_flash_dev nand_flash_ids[] = {
>
>  #ifdef CONFIG_MTD_NAND_MUSEUM_IDS
> @@ -67,11 +67,9 @@ struct nand_flash_dev nand_flash_ids[] = {
>         {"NAND 256MiB 3,3V 8-bit",      0x71, 512, 256, 0x4000, 0},
>
>         /*
> -        * These are the new chips with large page size. The pagesize and the
> -        * erasesize is determined from the extended id bytes

The original form has incorrect grammar; "is" should be "are".

> +        * These are the new chips with large page size, page size and
> +        * eraseblock size is determined from the extended id bytes.

This is also incorrect grammar. It uses a comma to divide sentences
and also uses "is". I would write something like this:

"These are the new chips with large page size. Their page size and
eraseblock size are determined from the extended ID bytes."

>          */
> -#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
> -#define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
>
>         /* 512 Megabit */
>         {"NAND 64MiB 1,8V 8-bit",       0xA2, 0,  64, 0, LP_OPTIONS},
> --
> 1.7.10.4
>

Brian
