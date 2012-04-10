Received: from zmc.proxad.net ([212.27.53.206])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SHYKp-0007gD-GL
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2012 10:30:07 +0000
Message-ID: <4F840B56.403@freebox.fr>
Date: Tue, 10 Apr 2012 12:28:38 +0200
From: Florian Fainelli <ffainelli@freebox.fr>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd : print out the page size and oob size after parsing
 out the nand
References: <1333942897-7392-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1333942897-7392-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

Le 04/09/12 05:41, Huang Shijie a écrit :
> Some not-supported nand chips may pass the current parsing code,
> and get the wrong page size and oob size. Sometimes, it's hard to notice
> that you get the wrong values, because there is no warning or error.
>
> So it's useful to print out the page size and oob size in the end of
> the parsing function. We can check these values with the datasheet of the nand
> chip as soon as possible.

Relying on the kernel to print something to assert the correctness of 
the NAND detection is really weak, you'd better query these properties 
in userland. Also, I am afraid everyone adds a new NAND property print-out.

>
> Signed-off-by: Huang Shijie<b32955@freescale.com>
> ---
>   drivers/mtd/nand/nand_base.c |    7 ++++---
>   1 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 47b19c0..6315b94 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3155,9 +3155,10 @@ ident_done:
>   		chip->cmdfunc = nand_command_lp;
>
>   	pr_info("NAND device: Manufacturer ID:"
> -		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
> -		nand_manuf_ids[maf_idx].name,
> -		chip->onfi_version ? chip->onfi_params.model : type->name);
> +		" 0x%02x, Chip ID: 0x%02x (%s %s), pagesize: %d, oobsize: %d\n",
> +		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
> +		chip->onfi_version ? chip->onfi_params.model : type->name,
> +		mtd->writesize, mtd->oobsize);
>
>   	return type;
>   }
