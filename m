Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaPLa-0004Ud-2I
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 09:07:58 +0000
Received: by bwz5 with SMTP id 5so15515221bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 01:07:56 -0800 (PST)
Subject: Re: [PATCH] physmap: fix mtdconcat support if physmap/mtdconcat
	were compiled as modules
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1294192813-23549-1-git-send-email-dbaryshkov@gmail.com>
References: <1294192813-23549-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 11:07:53 +0200
Message-ID: <1294218473.2179.16.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-01-05 at 05:00 +0300, Dmitry Eremin-Solenikov wrote:
> physmap/physmap_of contained compile-time check for mtd concatenation.
> However thos modules did not consider that mtd concatenation can be
> built as modules. Fix physmap/physmap_of to also support
> CONFIG_MTD_CONCAT=m
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Stefan Roese <sr@denx.de>
> ---
>  drivers/mtd/maps/physmap.c    |    4 ++--
>  drivers/mtd/maps/physmap_of.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 4c18b98..a224afc 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -59,7 +59,7 @@ static int physmap_flash_remove(struct platform_device *dev)
>  #else
>  		del_mtd_device(info->cmtd);
>  #endif
> -#ifdef CONFIG_MTD_CONCAT
> +#if defined(CONFIG_MTD_CONCAT) || (defined(CONFIG_MTD_CONCAT_MODULE) && defined(CONFIG_MTD_PHYSMAP_MODULE))
>  		if (info->cmtd != info->mtd[0])
>  			mtd_concat_destroy(info->cmtd);
>  #endif
> @@ -159,7 +159,7 @@ static int physmap_flash_probe(struct platform_device *dev)
>  		/*
>  		 * We detected multiple devices. Concatenate them together.
>  		 */
> -#ifdef CONFIG_MTD_CONCAT
> +#if defined(CONFIG_MTD_CONCAT) || (defined(CONFIG_MTD_CONCAT_MODULE) && defined(CONFIG_MTD_PHYSMAP_MODULE))

Can we do something else to avoid these complex ifdefs? I'd vote for
making mtdconcat integral part of mtd core and just always have it
built-in - remove the Kconfig option and all the ifdefs all over the
place. Indeed, this is tiny piece of code, I believe this micro-modules
make little sense nowadays.

The same for mtdparts - but this is a different story.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
