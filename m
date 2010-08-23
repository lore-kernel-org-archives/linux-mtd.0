Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnY7L-0004pJ-44
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 14:35:24 +0000
Received: by fxm12 with SMTP id 12so3665551fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 07:35:17 -0700 (PDT)
Subject: Re: [PATCH 1/1][MTD] Adding IOCTLs for run-time partitioning support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <000101cb2f11$86c3f5d0$944be170$%hs@samsung.com>
References: <000101cb2f11$86c3f5d0$944be170$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 17:33:46 +0300
Message-ID: <1282574026.24044.70.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'David Woodhouse' <dwmw2@infradead.org>, v.dalal@samsung.com,
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

On Thu, 2010-07-29 at 17:00 +0530, Rohit Hassan Sathyanarayan wrote:
> Hi All
> 
> Sending the patch on MTD for adding four IOCTLs.
> MTDPARTITIONCREATE
> MTDPARTITIONDELETE
> MTDPARTITIONSETPERMISSION
> MTDPARTITIONMERGE
> 
> 
> 
> Signed-off-by: Rohit HS <rohit.hs@samsung.com>

Could you pleas make scripts/checkpatch.pl happy?

Could you please take a look at the solution from Roman and compare it
to your solution: what is the difference, which one is better? He
submitted the patch earlier than you. And I may be mistaken, but your
solution looks broken, but I did not really look deep enough. See below.

Could you please also take a look at the discussion of Roman's patch and
the request for the interface - Arn asked to have it look as much as
possible as the corresponding ioctl for block devices.

I did not really review your patch, but few things are below.

> +#ifdef CONFIG_MTD_PARTITIONS
> +
> +		case MTDPARTITIONCREATE:
> +		{
> +		struct mtd_partition *pst_minfo = NULL;
> +		struct mtd_partition *pst_minfo_hold = NULL;
> +		struct mtd_partition st_free;
> +		uint64_t u64_userfreeoffset = 0;
> +		uint64_t u64_userfreesize = 0;

Do not prefix variable names with types - kernel people hate this, and
they will hate your patches if you do like this!

General suggestion: when you modify an existing file, stick to the style
used in this file, do not push for your own style. Or change the style
of the whole file.

> +		struct user_mtd *puser_partitions = NULL;
> +		struct user_mtd_info upartition;
> +		int i;

Variable names are too long and cryptic, try to think about s

> +			add_mtd_partitions(mtd, pst_minfo_hold,
> +						upartition.num_partitions);

So 'pst_minfo_hold' (bad name!) becomes the master partition. You
allocate it in this function. But who delets it? When? Could you please
point to the code which kfree()s this object?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
