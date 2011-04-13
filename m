Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9qku-00078L-9G
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 03:28:37 +0000
Received: by ewy3 with SMTP id 3so62470ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 20:28:33 -0700 (PDT)
Subject: Re: [PATCH] nand: Remove meaningless delay from nand_unlock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: jiri.pinkava@vscht.cz, Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <1302402611-3878-1-git-send-email-jiri.pinkava@vscht.cz>
References: <1302402611-3878-1-git-send-email-jiri.pinkava@vscht.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 06:28:29 +0300
Message-ID: <1302665309.14691.3.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sjhill@realitydiluted.com, tglx@linutronix.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-04-10 at 04:30 +0200, jiri.pinkava@vscht.cz wrote:
> From: Jiří Pinkava <jiri.pinkava@vscht.cz>
> 
> This delay is meaningless. If delay is needed it is device specific
> and must be reimplemented by specific driver, otherwise no delay is needed.
> 
> This function is not used by any current kernel code, affects only
> external code (like main).
> 
> Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
> ---
>  drivers/mtd/nand/nand_base.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 2aef58e..5b5aff5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -922,7 +922,6 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
>  
>  	/* Call wait ready function */
>  	status = chip->waitfunc(mtd, chip);
> -	udelay(1000);
>  	/* See if device thinks it succeeded */
>  	if (status & 0x01) {
>  		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",

Hi, it looks sane to remove this udelay. However,

1. If you do this, then you also have to do it in __nand_lock() - there
is a similar udelay()
2. Let's CC Vimal who is the author of this code - may be he'll tell us
why he added the delays.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
