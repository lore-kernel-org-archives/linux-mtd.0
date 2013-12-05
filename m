Received: from mail-oa0-f50.google.com ([209.85.219.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoOGX-00075z-71
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 02:02:09 +0000
Received: by mail-oa0-f50.google.com with SMTP id n16so17654863oag.37
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 18:01:41 -0800 (PST)
Date: Wed, 4 Dec 2013 18:01:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH] mtd: nand: Refactor print messages
Message-ID: <20131205020137.GH27149@ld-irv-0074.broadcom.com>
References: <1385379031-27766-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385379031-27766-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Mon, Nov 25, 2013 at 08:30:31AM -0300, Ezequiel Garcia wrote:
> Add a nice "nand:" prefix to all pr_xxx() messages. This allows
> to get rid of the "NAND" words in messages, given the context
> is already given by the prefix.

This ptach looks mostly good to me. A few comments below. If no one
objects soon, I'll push this.

> Remove the __func__ report from messages where it's not needed and refactor
> the device detection messages to show itself in several lines.

There are a few more instances of __func__ that might not be needed, but
I think we're OK for now.

> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---

...

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index bd39f7b..4bdc0df 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
...
> @@ -3372,8 +3374,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		id_data[i] = chip->read_byte(mtd);
>  
>  	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
> -		pr_info("%s: second ID read did not match "
> -			"%02x,%02x against %02x,%02x\n", __func__,
> +		pr_info("second ID read did not match "
> +			"%02x,%02x against %02x,%02x\n",

scripts/checkpatch.pl and Documentation/CodingStyle don't like this long
string (even though it would be over 80 chars). I think we should combine them.

If no one objects to the patch, I'll just make the modification myself.

>  			*maf_id, *dev_id, id_data[0], id_data[1]);
>  		return ERR_PTR(-ENODEV);
>  	}

Brian
