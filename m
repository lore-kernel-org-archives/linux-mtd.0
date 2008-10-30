Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvVJG-0006dv-Hz
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 11:03:26 +0000
Date: Thu, 30 Oct 2008 14:03:24 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH] NAND: fsl_upm: fix build problem with 2.6.28-rc2
Message-ID: <20081030110324.GA22008@oksana.dev.rtsoft.ru>
References: <49099022.40908@grandegger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Disposition: inline
In-Reply-To: <49099022.40908@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 30, 2008 at 11:44:50AM +0100, Wolfgang Grandegger wrote:
> This patch fixes a problem with building the 2.6.28-rc2 kernel with
> FSL UPM NAND support for the TQM8548 modules. For some reason
> of_mtd_parse_partitions() requires on argument less in the meantime.
> Furthermore, the return value is checks properly.

This is becase of this commit:

commit 69fd3a8d098faf41a04930afa83757c0555ee360
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Sun Oct 12 16:18:36 2008 +0200

    [MTD] remove unused mtd parameter in of_mtd_parse_partitions()


> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Acked-by: Anton Vorontsov <avorontsov@ru.mvista.com>

> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 024e3ff..a83192f 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -163,9 +163,11 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
>  	ret = parse_mtd_partitions(&fun->mtd, part_types, &fun->parts, 0);
>  
>  #ifdef CONFIG_MTD_OF_PARTS
> -	if (ret == 0)
> -		ret = of_mtd_parse_partitions(fun->dev, &fun->mtd,
> -					      flash_np, &fun->parts);
> +	if (ret == 0) {
> +		ret = of_mtd_parse_partitions(fun->dev, flash_np, &fun->parts);
> +		if (ret < 0)
> +			goto err;
> +	}
>  #endif
>  	if (ret > 0)
>  		ret = add_mtd_partitions(&fun->mtd, fun->parts, ret);

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
