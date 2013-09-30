Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQmmA-00024y-NN
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 23:21:15 +0000
Received: by mail-vc0-f174.google.com with SMTP id gd11so4322411vcb.33
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 16:20:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130912144918.GA18677@localhost>
References: <1378940894-27598-1-git-send-email-computersforpeace@gmail.com>
 <20130912122413.GA7309@localhost>
 <20130912144918.GA18677@localhost>
Date: Mon, 30 Sep 2013 16:20:52 -0700
Message-ID: <CAN8TOE9A=FernSi2WyJ1BsPY-==gMu3Jm1GqaOnwtbLrxmDcDA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: cleanup ONFI printed errors, warnings
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 12, 2013 at 7:49 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On Thu, Sep 12, 2013 at 09:24:14AM -0300, Ezequiel Garcia wrote:
>> Looks good. I'd suggest to put:
>>
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>
>> at the top of this file, to prefix all the messages with a nice "nand:"
>> string, but then you may want to refactor the "NAND device:" notification.
>
> FWIW, here's my proposal (which applies on top of this patch):
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d4578a1..ff5bb5a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -29,6 +29,8 @@
>   *
>   */
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/module.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -3449,10 +3451,11 @@ ident_done:
>         if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>                 chip->cmdfunc = nand_command_lp;
>
> -       pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
> -               " %dMiB, page size: %d, OOB size: %d\n",
> -               *maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
> -               chip->onfi_version ? chip->onfi_params.model : type->name,
> +       pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
> +               *maf_id, *dev_id);
> +       pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
> +               chip->onfi_version ? chip->onfi_params.model : type->name);
> +       pr_info("%dMiB, page size: %d, OOB size: %d\n",
>                 (int)(chip->chipsize >> 20), mtd->writesize, mtd->oobsize);
>
>         return type;
>

I just pushed Huang's changes, which conflict with this. If you still
want this, go ahead and send a proper, updated patch with description
and sign-off.

Thanks,
Brian
