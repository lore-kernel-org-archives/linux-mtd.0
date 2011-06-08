Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEgO-0006uS-FF
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:04:13 +0000
Received: by fxm14 with SMTP id 14so229770fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:04:10 -0700 (PDT)
Subject: Re: [PATCH 02/44] mtd: lart.c: use mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-3-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-3-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 11:59:51 +0300
Message-ID: <1307523591.31223.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
> Replace custom invocations of parse_mtd_partitions and mtd_device_register
> with common mtd_device_parse_register call. This would bring: standard
> handling of all errors, fallback to default partitions, etc.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Sorry, but the code does not match the description: you do not use
'mtd_device_parse_register(); there.

> ---
>  drivers/mtd/devices/lart.c |   12 ++++--------
>  1 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
> index 772a0ff..48b513f 100644
> --- a/drivers/mtd/devices/lart.c
> +++ b/drivers/mtd/devices/lart.c
> @@ -619,6 +619,10 @@ static struct mtd_partition lart_partitions[] = {
>  		.size	= INITRD_LEN,		/* MTDPART_SIZ_FULL */
>  	}
>  };
> +#define NUM_PARTITIONS ARRAY_SIZE(lart_partitions)
> +#else
> +#define lart_partitions NULL
> +#define NUM_PARTITIONS 0
>  #endif
>  
>  static int __init lart_flash_init (void)
> @@ -683,23 +687,15 @@ static int __init lart_flash_init (void)
>  #endif
>  #endif
>  
> -#ifndef HAVE_PARTITIONS
> -   result = mtd_device_register(&mtd, NULL, 0);
> -#else
>     result = mtd_device_register(&mtd, lart_partitions,
>                                  ARRAY_SIZE(lart_partitions));
> -#endif
>  
>     return (result);
>  }
>  
>  static void __exit lart_flash_exit (void)
>  {
> -#ifndef HAVE_PARTITIONS
>     mtd_device_unregister(&mtd);
> -#else
> -   mtd_device_unregister(&mtd);
> -#endif
>  }
>  
>  module_init (lart_flash_init);


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
