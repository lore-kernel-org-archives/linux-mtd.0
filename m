Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYd9Q-0001vH-5v
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 10:55:49 +0000
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <c65631c48fb5d2de8d25f65bffa5e22d@localhost>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 13:50:43 +0300
Message-ID: <1279018243.31639.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-07 at 17:30 -0700, Kevin Cernekee wrote:
> Change mtd_erase() so that it attempts to use MEMERASE64 first, then falls
> back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.
> 
> Add mtd_read_oob(), mtd_write_oob() functions to wrap the OOB ioctls.
> Similar ioctl fallback logic is used in these functions as well.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  include/libmtd.h |   36 ++++++++++++++++++++++-
>  lib/libmtd.c     |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 111 insertions(+), 7 deletions(-)
> 
> diff --git a/include/libmtd.h b/include/libmtd.h
> index 0aea966..292d8c3 100644
> --- a/include/libmtd.h
> +++ b/include/libmtd.h
> @@ -66,6 +66,7 @@ struct mtd_info
>   * @region_cnt: count of additional erase regions
>   * @writable: zero if the device is read-only
>   * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
> + * @legacy_ioctls: non-zero if the kernel lacks MEMERASE64, MEM*OOB64
>   */
>  struct mtd_dev_info
>  {
> @@ -84,6 +85,7 @@ struct mtd_dev_info
>  	int region_cnt;
>  	unsigned int writable:1;
>  	unsigned int bb_allowed:1;
> +	unsigned int legacy_ioctls:1;
>  };
>  
>  /**
> @@ -146,7 +148,37 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
>   * This function erases eraseblock @eb of MTD device described by @fd. Returns
>   * %0 in case of success and %-1 in case of failure.
>   */
> -int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
> +int mtd_erase(struct mtd_dev_info *mtd, int fd, int eb);
> +
> +/**
> + * mtd_read_oob - read OOB bytes
> + * @mtd: MTD device description object
> + * @fd: MTD device node file descriptor
> + * @start: page-aligned start address
> + * @length: number of OOB bytes to read
> + * @data: read buffer
> + *
> + * This function reads @length OOB bytes starting from address @start on
> + * MTD device described by @fd. Returns %0 in case of success and %-1 in
> + * case of failure.
> + */
> +int mtd_read_oob(struct mtd_dev_info *mtd, int fd, uint64_t start,
> +	uint64_t length, void *data);

Minor, but for consistency, please, use the same indentation style as
the rest of the code. Namely, aline the second line:

int mtd_read_oob(struct mtd_dev_info *mtd, int fd, uint64_t start,
		 uint64_t length, void *data);

Use tabs, but then adjust by adding spaces.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
