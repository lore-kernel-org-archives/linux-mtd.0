Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H1koq-0004QT-A6
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 14:40:52 +0000
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e33.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id l02EebSq030141
	for <linux-mtd@lists.infradead.org>; Tue, 2 Jan 2007 09:40:37 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by westrelay02.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	l02Eebp4405478
	for <linux-mtd@lists.infradead.org>; Tue, 2 Jan 2007 07:40:37 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l02EeaBA029266
	for <linux-mtd@lists.infradead.org>; Tue, 2 Jan 2007 07:40:37 -0700
Subject: Re: [PATCH] [MTD] cs553x_nand.c: support partitions;
	cs553x_cleanup() fix
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
In-Reply-To: <20070102162144.52a71884.indrek.kruusa@artecdesign.ee>
References: <20070102162144.52a71884.indrek.kruusa@artecdesign.ee>
Content-Type: text/plain
Date: Tue, 02 Jan 2007 08:40:58 -0600
Message-Id: <1167748858.3836.7.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-01-02 at 16:21 +0200, Indrek Kruusa wrote:
> Hi!
> 
> Patch for drivers/mtd/nand/cs553x_nand.c:
> - support partitions
> - cs553x_cleanup(): try the cleanup for all chip selects

Some small nit picks.

> 
> Signed-off-by: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
> 
> 
> --- cs553x_nand.c_git	2007-01-02 15:13:06.000000000 +0200
> +++ cs553x_nand.c	2007-01-02 15:45:38.000000000 +0200

Patches should have a strip level of 1.

> @@ -273,12 +273,21 @@
>  	return 0;
>  }
> 
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +const char *part_probes[] = { "cmdlinepart", NULL };
> +#endif
> +
> +
>  static int __init cs553x_init(void)
>  {
>  	int err = -ENXIO;
>  	int i;
>  	uint64_t val;
> 
> +	int mtd_parts_nb = 0;
> +	struct mtd_partition *mtd_parts = 0;

Pointers should be initialized with NULL.  Otherwise sparse will
complain.

> +
>  	/* If the CPU isn't a Geode GX or LX, abort */
>  	if (!is_geode())
>  		return -ENXIO;
> @@ -307,9 +316,20 @@
>  	   do mtdconcat etc. if we want to. */
>  	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
>  		if (cs553x_mtd[i]) {
> -			add_mtd_device(cs553x_mtd[i]);
> 
>  			/* If any devices registered, return success. Else the last error. */
> +#ifdef CONFIG_MTD_PARTITIONS
> +			cs553x_mtd[i]->name = "cs553x_nand";

You assign the same name to all the devices?

josh
