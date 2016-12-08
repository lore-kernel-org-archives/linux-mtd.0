Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEsJf-00057V-BL
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2016 06:36:29 +0000
Date: Thu, 8 Dec 2016 07:35:52 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, David Oberhollenzer
 <david.oberhollenzer@sigma-star.at>, Kees Trommel <ctrommel@aimvalley.nl>
Subject: Re: [PATCH] nandwrite: Factor out buffer checking code
Message-ID: <20161208073552.64127c4a@bbrezillon>
In-Reply-To: <20161208041342.22289-1-marex@denx.de>
References: <20161208041342.22289-1-marex@denx.de>
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

Hi Marek,

On Thu,  8 Dec 2016 05:13:42 +0100
Marek Vasut <marex@denx.de> wrote:

> Pull the buffer content checking code into separate function and
> simplify the code invoking it slightly.

Thanks for taking the time to prepare and send this patch.

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Cc: Kees Trommel <ctrommel@aimvalley.nl>
> ---
> NOTE: This is only compile-tested.
> ---
>  nand-utils/nandwrite.c | 42 ++++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
> index b376869..c5bd1c2 100644
> --- a/nand-utils/nandwrite.c
> +++ b/nand-utils/nandwrite.c
> @@ -231,6 +231,31 @@ static void erase_buffer(void *buffer, size_t size)
>  		memset(buffer, kEraseByte, size);
>  }
>  
> +/* Check whether buffer is filled with character 'pattern' */
> +static int buffer_check_pattern(unsigned char *buffer, size_t size,
> +				unsigned char pattern)
> +{
> +	/* Invalid input */
> +	if (!buffer || (size == 0))
> +		return 0;
> +
> +	/* No match on first byte */
> +	if (*buffer != pattern)
> +		return 0;
> +
> +	/* First byte matched and buffer is 1 byte long, OK. */
> +	if (size == 1)
> +		return 1;
> +
> +	/*
> +	 * Check buffer longer than 1 byte. We already know that buffer[0]
> +	 * matches the pattern, so the test below only checks whether the
> +	 * buffer[0...size-2] == buffer[1...size-1] , which is a test for
> +	 * whether the buffer is filled with constant value.
> +	 */
> +	return !memcmp(buffer, buffer + 1, size - 1);
> +}
> +

Can we put that in include/common.h as an inline function so that other
tools/libs can re-use it?
I just grepped for the 0xff/0xFF pattern and found several places that
could use this function instead of open-coding it.

Looks good otherwise.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

>  /*
>   * Main program
>   */
> @@ -523,18 +548,8 @@ int main(int argc, char * const argv[])
>  			}
>  		}
>  
> -		allffs = 0;
> -		if (skipallffs) 
> -		{
> -			for (ii = 0; ii < mtd.min_io_size; ii += sizeof(uint32_t))
> -			{
> -				if (*(uint32_t*)(writebuf + ii) != 0xffffffff)
> -					break;
> -			}
> -			if (ii == mtd.min_io_size)
> -				allffs = 1;
> -		}
> -		if (!allffs) {
> +		ret = 0;
> +		if (!skipallffs || !buffer_check_pattern(writebuf, mtd.min_io_size, 0xff)) {
>  			/* Write out data */
>  			ret = mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size,
>  					mtdoffset % mtd.eb_size,
> @@ -543,9 +558,8 @@ int main(int argc, char * const argv[])
>  					writeoob ? oobbuf : NULL,
>  					writeoob ? mtd.oob_size : 0,
>  					write_mode);
> -		} else  {
> -			ret = 0;
>  		}
> +
>  		if (ret) {
>  			long long i;
>  			if (errno != EIO) {
