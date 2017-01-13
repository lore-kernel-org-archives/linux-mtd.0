Received: from avasout05.plus.net ([84.93.230.250])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS67g-0006QY-1y
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2017 17:58:47 +0000
Date: Fri, 13 Jan 2017 17:58:15 +0000
From: Mike Crowe <mac@mcrowe.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH 3/3] nandwrite: fix/cleanup bad block skipping
Message-ID: <20170113175815.GA27998@mcrowe.com>
References: <20170112102828.13124-1-david.oberhollenzer@sigma-star.at>
 <20170112102828.13124-4-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170112102828.13124-4-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 12 January 2017 at 11:28:28 +0100, David Oberhollenzer wrote:
> JFFS2 supports clustering erase blocks to virtual erase blocks.
> nandwrite supports this, but previously mixed up virtual and
> physical erase block numbers when checking for bad blocks.
> 
> This patch adds a function for checking if a virtual erase block
> is bad and replaces the broken mtd_is_bad loop.
> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> ---
>  nand-utils/nandwrite.c | 57 ++++++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 27 deletions(-)
> 
> diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
> index 22c741d..c7a53d1 100644
> --- a/nand-utils/nandwrite.c
> +++ b/nand-utils/nandwrite.c
> @@ -235,6 +235,20 @@ static void erase_buffer(void *buffer, size_t size)
>  		memset(buffer, kEraseByte, size);
>  }
>  
> +static int is_virt_block_bad(struct mtd_dev_info *mtd, int fd,
> +				long long offset)
> +{
> +	int i, ret = 0;
> +
> +	for (i = 0; i < blockalign; ++i) {
> +		ret = mtd_is_bad(mtd, fd, offset / mtd->eb_size + i);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * Main program
>   */
> @@ -246,10 +260,8 @@ int main(int argc, char * const argv[])
>  	int ifd = -1;
>  	int pagelen;
>  	long long imglen = 0;
> -	bool baderaseblock = false;
>  	long long blockstart = -1;
>  	struct mtd_dev_info mtd;
> -	long long offs;
>  	int ret;
>  	bool failed = true;
>  	/* contains all the data read from the file so far for the current eraseblock */
> @@ -391,7 +403,6 @@ int main(int argc, char * const argv[])
>  		 */
>  		while (blockstart != (mtdoffset & (~ebsize_aligned + 1))) {
>  			blockstart = mtdoffset & (~ebsize_aligned + 1);
> -			offs = blockstart;
>  
>  			/*
>  			 * if writebuf == filebuf, we are rewinding so we must
> @@ -403,40 +414,32 @@ int main(int argc, char * const argv[])
>  				writebuf = filebuf;
>  			}
>  
> -			baderaseblock = false;
>  			if (!quiet)
>  				fprintf(stdout, "Writing data to block %lld at offset 0x%llx\n",
>  						 blockstart / ebsize_aligned, blockstart);
>  
> -			/* Check all the blocks in an erase block for bad blocks */
>  			if (noskipbad)
>  				continue;
>  
> -			do {
> -				ret = mtd_is_bad(&mtd, fd, offs / ebsize_aligned);
> -				if (ret < 0) {
> -					sys_errmsg("%s: MTD get bad block failed", mtd_device);
> -					goto closeall;
> -				} else if (ret == 1) {
> -					baderaseblock = true;
> -					if (!quiet)
> -						fprintf(stderr, "Bad block at %llx, %u block(s) "
> -								"from %llx will be skipped\n",
> -								offs, blockalign, blockstart);
> -				}
> +			ret = is_virt_block_bad(&mtd, fd, blockstart);
>  
> -				if (baderaseblock) {
> -					mtdoffset = blockstart + ebsize_aligned;
> -
> -					if (mtdoffset > mtd.size) {
> -						errmsg("too many bad blocks, cannot complete request");
> -						goto closeall;
> -					}
> -				}
> +			if (ret < 0) {
> +				sys_errmsg("%s: MTD get bad block failed", mtd_device);
> +				goto closeall;
> +			} else if (ret == 1) {
> +				if (!quiet)
> +					fprintf(stderr,
> +						"Bad block at %llx, %u block(s) "
> +						"will be skipped\n",
> +						blockstart, blockalign);
>  
> -				offs +=  ebsize_aligned / blockalign;
> -			} while (offs < blockstart + ebsize_aligned);
> +				mtdoffset = blockstart + ebsize_aligned;
>  
> +				if (mtdoffset > mtd.size) {
> +					errmsg("too many bad blocks, cannot complete request");
> +					goto closeall;
> +				}
> +			}
>  		}
>  
>  		/* Read more data from the input if there isn't enough in the buffer */
> -- 
> 2.10.2

I think that this change does probably fix the problems I raised in
http://lists.infradead.org/pipermail/linux-mtd/2017-January/071516.html and
its parents. I can't test it since we don't use virtual erase blocks.

It might be worth is_virt_block_bad checking that it has been passed a
multiple of ebsize_aligned. The caller in this patch is obviously aligned
(so hopefully the compiler would throw away such a check when it inlines
the static function) but that may not always be the case.

I will rebase my --skip-bad-blocks-to-start patch to make use of the new
function.

Thanks.

Mike.
