Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MP8wT-0006nh-SB
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 05:46:48 +0000
Subject: Re: [PATCH] nand_base.c: removing repeated comment
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <52073.192.168.10.89.1247152282.squirrel@dbdmail.itg.ti.com>
References: <52073.192.168.10.89.1247152282.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Jul 2009 08:46:25 +0300
Message-Id: <1247204785.20721.344.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-09 at 20:41 +0530, vimal singh wrote:
> Removing repeated comment.
> 
> Singed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c index
> 8c21b89..30c4c32 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -689,7 +689,6 @@ nand_get_device(struct nand_chip *chip, struct mtd_info
> *mtd, int new_state)
>  	spin_lock(lock);
> 
>  	/* Hardware controller shared among independend devices */
> -	/* Hardware controller shared among independend devices */
>  	if (!chip->controller->active)
>  		chip->controller->active = chip;

Hi Vimal,

I'm applying your patch to l2-mtd-2.6.git. But I cannot, because it is
line-wrapped, so let me flame a little:

your e-mails used to contain unreadable "From: Singh, Vimal
<IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com>"

Now you fixed this, which is good. How about starting using
git-send-email?

Anyway, I'm amending your patch and applying, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
