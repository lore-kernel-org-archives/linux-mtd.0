Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxsd-00036x-Nk
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:58:00 +0000
Date: Tue, 26 Apr 2016 09:57:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 1/8] mtd-utils: Fix return status in mtd_torture test
 function
Message-ID: <20160426095737.5c5b1004@bbrezillon>
In-Reply-To: <1461622409-14970-2-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-2-git-send-email-richard@nod.at>
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

On Tue, 26 Apr 2016 00:13:22 +0200
Richard Weinberger <richard@nod.at> wrote:

> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> 
> This patch fixes the return status of the mtd_torture function
> in libmtd.
> 
> The torture test function is currently only used by the ubiformat
> utilitiy to check if a block is bad after a write fails (blocks are
> marked bad if the function returns an error status). However, the
> way the function was written, it ALWAYS returns an error value
> irregardless of whether it failed or not.
> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  lib/libmtd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index bf6d71f..1717468 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -939,7 +939,7 @@ static uint8_t patterns[] = {0xa5, 0x5a, 0x0};
>   * @patt: the pattern to check
>   * @size: buffer size in bytes
>   *
> - * This function returns %1 in there are only @patt bytes in @buf, and %0 if
> + * This function returns %0 if there are only @patt bytes in @buf, and %-1 if
>   * something else was also found.
>   */
>  static int check_pattern(const void *buf, uint8_t patt, int size)
> @@ -948,8 +948,8 @@ static int check_pattern(const void *buf, uint8_t patt, int size)
>  
>  	for (i = 0; i < size; i++)
>  		if (((const uint8_t *)buf)[i] != patt)
> -			return 0;
> -	return 1;
> +			return -1;
> +	return 0;
>  }
>  
>  int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
> @@ -973,7 +973,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>  			goto out;
>  
>  		err = check_pattern(buf, 0xFF, mtd->eb_size);
> -		if (err == 0) {
> +		if (err) {
>  			errmsg("erased PEB %d, but a non-0xFF byte found", eb);
>  			errno = EIO;
>  			goto out;
> @@ -992,7 +992,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>  			goto out;
>  
>  		err = check_pattern(buf, patterns[i], mtd->eb_size);
> -		if (err == 0) {
> +		if (err) {
>  			errmsg("pattern %x checking failed for PEB %d",
>  				patterns[i], eb);
>  			errno = EIO;
> @@ -1005,7 +1005,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>  
>  out:
>  	free(buf);
> -	return -1;
> +	return err;
>  }
>  
>  int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb)



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
