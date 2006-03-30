Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOw0V-0001ST-0o
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 07:12:17 -0500
Date: Thu, 30 Mar 2006 14:11:56 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
Message-ID: <20060330121156.GA31749@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 March 2006 11:57:37 +0400, Belyakov, Alexander wrote:
> diff -uNr a/drivers/mtd/maps/mphysmap.c b/drivers/mtd/maps/mphysmap.c
> --- a/drivers/mtd/maps/mphysmap.c	2006-03-28 12:08:28.000000000
> +0400
> +++ b/drivers/mtd/maps/mphysmap.c	2006-03-28 12:10:48.000000000
> +0400
> @@ -12,6 +12,9 @@
>  #ifdef CONFIG_MTD_PARTITIONS
>  #include <linux/mtd/partitions.h>
>  #endif
> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
> +#include <linux/mtd/stripe.h>
> +#endif

Move the #ifdef into the header.

>  static struct map_info mphysmap_static_maps[] = {
>  #if CONFIG_MTD_MULTI_PHYSMAP_1_WIDTH
> @@ -155,6 +158,15 @@
>  		};
>  	};
>  	up(&map_mutex);
> +
> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
> +#ifndef MODULE
> +	if(mtd_stripe_init()) {
> +	    printk(KERN_WARNING "MTD stripe initialization from cmdline
> has failed\n");
> +	}
> +#endif
> +#endif
> +
>  	return 0;
>  }

o Lindent.
o Dokumentation/CodingStyle
o remove #ifdefs

Your code suffers from a lot of very basic things that make it hard to
review.  In its current state, you get a clean NACK from me.  Whether
the design makes sense, I didn't even look at.  You seem to receive
enough feedback there already.

Jörn

-- 
You cannot suppose that Moliere ever troubled himself to be original in the
matter of ideas. You cannot suppose that the stories he tells in his plays
have never been told before. They were culled, as you very well know.
-- Andre-Louis Moreau in Scarabouche
