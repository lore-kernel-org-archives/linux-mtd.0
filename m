Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox2bH-00020S-FR
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 18:57:28 +0000
Received: by bwz19 with SMTP id 19so5034534bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 11:57:26 -0700 (PDT)
Subject: RE: [PATCH 1/1][MTD] Adding IOCTLs for run-time partitioning support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <002c01cb4d6c$0e2bf680$2a83e380$%hs@samsung.com>
References: <000101cb2f11$86c3f5d0$944be170$%hs@samsung.com>
	<1282574026.24044.70.camel@localhost>
	<002c01cb4d6c$0e2bf680$2a83e380$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Sep 2010 21:57:21 +0300
Message-ID: <1284836241.1721.109.camel@brekeke>
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

On Mon, 2010-09-06 at 08:04 +0530, Rohit Hassan Sathyanarayan wrote:
> +	case MTDPARTITIONCREATE:
> +	{
> +		u_int64_t	uoffset = 0;
> +		u_int64_t	usize = 0;
> +		u_int32_t	i;
> +
> +			if (copy_from_user(&upart, argp,
> +				sizeof(struct user_mtd_info))) {
> +				ret = -EFAULT;
> +				break;
> +			}
> +			ppart = kzalloc(sizeof(struct user_mtd)*
> +						upart.num_partitions
> +						, GFP_KERNEL);
> +			pmtd = kzalloc(sizeof(struct mtd_partition)*
> +					upart.num_partitions,
> +					GFP_KERNEL);
> +			pmtd1 = pmtd;
> +			if (ppart == NULL) {
> +				ret = -EFAULT;
> +				break;
> +			}
> +			if (copy_from_user(ppart,
> +					upart.pst_user_partitions,
> +					sizeof(struct user_mtd)*
> +					upart.num_partitions)) {
> +				ret = -EFAULT;
> +				break;
> +			}
> +			for (i = 0; i < upart.num_partitions; i++) {
> +				pmtd->name  = ppart->name;
> +				pmtd->size  =
> +					ppart->partition_size;
> +				usize += pmtd->size;
> +				pmtd->offset =
> +					ppart->partition_offset;
> +				uoffset += pmtd->offset;
> +				pmtd->mask_flags =
> +					ppart->partition_mask;
> +
> +				ppart++;
> +				pmtd++;
> +			}
> +			add_mtd_partitions(mtd, pmtd1,
> +						upart.num_partitions);
> +			if ((mtd->size - usize) > 0) {
> +				free.name	= "FREE";
> +				free.size	= mtd->size - usize;
> +				free.offset	= usize;
> +				free.mask_flags = 0;
> +				add_mtd_partitions(mtd, &free, 1);
> +			}
> +			kfree(pmtd1);
> +		break;
> +	}

So what happens if you already have many partitions, and this ioctl is
called? Where these existing partitions and the existing master device
will go? Who will free the resources occupied by them and where?

> +struct user_mtd_info {
> +	struct user_mtd *pst_user_partitions;
> +	__u32 num_partitions;
> +};

I suggested you to look at the discussion of Roman's patches - we did
discuss there that pointers in ioctls are bad, because then you have to
have implement compat_ioctl. You need to use u64 to avoid problems in
64-bit kernel + 32-bit user-space environments.


-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
