Received: from e34.co.us.ibm.com ([32.97.110.152])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GI7Bv-0004DZ-RL
	for linux-mtd@lists.infradead.org; Tue, 29 Aug 2006 18:16:01 +0100
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e34.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id k7THClqW013836
	for <linux-mtd@lists.infradead.org>; Tue, 29 Aug 2006 13:12:47 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k7THClXe355074
	for <linux-mtd@lists.infradead.org>; Tue, 29 Aug 2006 11:12:47 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k7THCkFM013773
	for <linux-mtd@lists.infradead.org>; Tue, 29 Aug 2006 11:12:46 -0600
Subject: Re: [PATCH] CORE: adding mtd_get_partition_physaddr()
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0608282144ge2250dbv1635377c005a9f74@mail.gmail.com>
References: <6934efce0608282144ge2250dbv1635377c005a9f74@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 29 Aug 2006 12:13:47 -0500
Message-Id: <1156871627.2003.15.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-08-28 at 21:44 -0700, Jared Hulbert wrote:
> This is to allow axfs to get the physical address on the flash of it's
> partition.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 06a9303..37aed8a 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -40,6 +40,17 @@ struct mtd_part {
>   */
>  #define PART(x)  ((struct mtd_part *)(x))
> 
> +/*
> + * Allow other modules to get the physical address of a given partition
> + */
> +void * mtd_get_partition_physaddr (struct mtd_info *mtd)

Nit: No space between the paren and the function name please.

>  /*
>   * MTD methods which simply translate the effective address and pass through
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index da6b3d6..adf6207 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -68,6 +68,7 @@ extern int register_mtd_parser(struct mt
>  extern int deregister_mtd_parser(struct mtd_part_parser *parser);
>  extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
>  				struct mtd_partition **pparts, unsigned long origin);
> +extern void * mtd_get_partition_physaddr(struct mtd_info *mtd);

Couldn't this be a proper prototype instead of an extern?

josh
