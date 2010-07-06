Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OVzMm-0006Oz-HU
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2010 04:02:41 +0000
Received: by fxm3 with SMTP id 3so2949654fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jul 2010 21:02:37 -0700 (PDT)
Subject: Re: [PATCH 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <b025d903aab9bff2a1f0ddadff7f31a8@localhost>
References: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
	<b025d903aab9bff2a1f0ddadff7f31a8@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Jul 2010 07:02:33 +0300
Message-Id: <1278388953.3599.39.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-05 at 15:10 -0700, Kevin Cernekee wrote:
> Change mtd_erase() so that it attempts to use MEMERASE64 first, then falls
> back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.
> 
> Add mtd_read_oob(), mtd_write_oob() functions to wrap the OOB ioctls.
> Similar ioctl fallback logic is used in these functions as well.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  include/libmtd.h |   26 +++++++++++++++++++++
>  lib/libmtd.c     |   65 +++++++++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/include/libmtd.h b/include/libmtd.h
> index 0aea966..2241343 100644
> --- a/include/libmtd.h
> +++ b/include/libmtd.h
> @@ -149,6 +149,32 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
>  int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
>  
>  /**
> + * mtd_read_oob - read OOB bytes
> + * @fd: MTD device node file descriptor
> + * @start: page-aligned start address
> + * @length: number of OOB bytes to read
> + * @data: read buffer
> + *
> + * This function reads @length OOB bytes starting from address @start on
> + * MTD device described by @fd. Returns %0 in case of success and %-1 in
> + * case of failure.
> + */
> +int mtd_read_oob(int fd, uint64_t start, uint64_t length, void *data);
> +
> +/**
> + * mtd_write_oob - write OOB bytes
> + * @fd: MTD device node file descriptor
> + * @start: page-aligned start address
> + * @length: number of OOB bytes to write
> + * @data: write buffer
> + *
> + * This function writes @length OOB bytes starting from address @start on
> + * MTD device described by @fd. Returns %0 in case of success and %-1 in
> + * case of failure.
> + */
> +int mtd_write_oob(int fd, uint64_t start, uint64_t length, void *data);
> +
> +/**
>   * mtd_torture - torture an eraseblock.
>   * @mtd: MTD device description object
>   * @fd: MTD device node file descriptor
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index 3ff031c..368493b 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -32,6 +32,7 @@
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <mtd/mtd-user.h>
> +#include <mtd/mtd-abi.h>
>  
>  #include <libmtd.h>
>  #include "libmtd_int.h"
> @@ -791,11 +792,69 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
>  
>  int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb)
>  {
> -	struct erase_info_user ei;
> +	int ret;
> +	struct erase_info_user64 ei;
>  
> -	ei.start = eb * mtd->eb_size;;
> +	ei.start = (__u64)eb * mtd->eb_size;
>  	ei.length = mtd->eb_size;
> -	return ioctl(fd, MEMERASE, &ei);
> +	ret = ioctl(fd, MEMERASE64, &ei);
> +
> +	if (ret < 0 && errno == ENOTTY) {
> +		struct erase_info_user ei_old;
> +
> +		ei_old.start = (__u32)ei.start;
> +		ei_old.length = (__u32)ei.length;
> +
> +		if (ei_old.start != ei.start) {
> +			errno = EOVERFLOW;
> +			return -1;
> +		}
> +
> +		ret = ioctl(fd, MEMERASE, &ei_old);
> +	}
> +
> +	return ret;
> +}

Kevin, looks like a good sanitization in general, thanks. But let's
avoid calling 2 ioctls for old kernels - just introduce a flag in
'struct mtd_dev_info' and check whether 64-bit offsets are supported.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
