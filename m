Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxyu-0002xc-T3
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 08:04:32 +0000
Date: Tue, 26 Apr 2016 10:04:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 2/8] mtd-utils: Add multi-block erase function
Message-ID: <20160426100406.452b2378@bbrezillon>
In-Reply-To: <1461622409-14970-3-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard, David,

On Tue, 26 Apr 2016 00:13:23 +0200
Richard Weinberger <richard@nod.at> wrote:

> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  include/libmtd.h | 14 ++++++++++++++
>  lib/libmtd.c     | 16 +++++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/include/libmtd.h b/include/libmtd.h
> index a78c8cb..f3089d4 100644
> --- a/include/libmtd.h
> +++ b/include/libmtd.h
> @@ -174,6 +174,20 @@ int mtd_lock(const struct mtd_dev_info *mtd, int fd, int eb);
>  int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb);
>  
>  /**
> + * mtd_erase - erase multiple eraseblocks.
> + * @desc: MTD library descriptor
> + * @mtd: MTD device description object
> + * @fd: MTD device node file descriptor
> + * @eb: index of first eraseblock to erase
> + * @blocks: the number of eraseblocks to erase
> + *
> + * This function erases eraseblock @eb of MTD device described by @fd. Returns
      
		    ^ erases @blocks starting at eraseblock @eb

> + * %0 in case of success and %-1 in case of failure.
> + */
> +int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
> +			int fd, int eb, int blocks);
> +
> +/**
>   * mtd_erase - erase an eraseblock.
>   * @desc: MTD library descriptor
>   * @mtd: MTD device description object
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index 1717468..6101238 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -845,7 +845,8 @@ int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb)
>  	return mtd_xlock(mtd, fd, eb, MEMUNLOCK);
>  }
>  
> -int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
> +int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
> +			int fd, int eb, int blocks)
>  {
>  	int ret;
>  	struct libmtd *lib = (struct libmtd *)desc;
> @@ -856,8 +857,12 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>  	if (ret)
>  		return ret;
>  
> -	ei64.start = (__u64)eb * mtd->eb_size;
> -	ei64.length = mtd->eb_size;
> +	ret = mtd_valid_erase_block(mtd, eb + blocks - 1);
> +	if (ret)
> +		return ret;

Maybe you should also check if @eb is a valid block (what if @eb < 0,
but @eb + @blocks >= 0).

> +
> +	ei64.start = (__u64)eb * (__u64)mtd->eb_size;

I'm not sure you really need the second (__u64) cast, AFAIR, the first
one already guarantees that the intermediate result will be stored in a
__u64 variable.

> +	ei64.length = (__u64)mtd->eb_size * (__u64)blocks;

Ditto.

>  
>  	if (lib->offs64_ioctls == OFFS64_IOCTLS_SUPPORTED ||
>  	    lib->offs64_ioctls == OFFS64_IOCTLS_UNKNOWN) {
> @@ -892,6 +897,11 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>  	return 0;
>  }
>  
> +int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
> +{
> +	return mtd_erase_multi(desc, mtd, fd, eb, 1);
> +}
> +
>  int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
>  {
>  	int ret;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
