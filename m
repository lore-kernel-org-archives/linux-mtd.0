Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQYwK-0004Va-Dn
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 12:20:44 +0000
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
To: Mike Crowe <mac@mcrowe.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
 <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
 <20170105141834.GA3198@mcrowe.com> <20170105154824.5c9e97ee@bbrezillon>
 <20170105150402.GA3931@mcrowe.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <8f046052-f092-86a0-3375-8d5ddc7572b6@sigma-star.at>
Date: Mon, 9 Jan 2017 13:18:53 +0100
MIME-Version: 1.0
In-Reply-To: <20170105150402.GA3931@mcrowe.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/05/2017 04:04 PM, Mike Crowe wrote:
>> I think this request is acceptable (even if I don't like the option
>> name :-)), but I'll let Richard and David decide what to do with this
>> patch.
> 
> I'm not particularly attached to the option name. I chose
> "--skip-bad-blocks-to-start" in the hope of being as clear as possible, but
> I agree that it is a mouthful! The confusion over the meaning of the option
> was also one of the reasons why I originally implemented the feature using
> a separate offset.
As I mentioned in my initial suggestion, this is IMO much clearer than
having two different offset options and avoids the confusing corner case
of having both set.

I would gladly accept this patch series (apart from the missing signed-off-by),
however what actually sparked the discussion above was this snippet here:

On 01/04/2017 03:18 PM, Mike Crowe wrote:
> diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
> index 9602a6e..880990f 100644
> --- a/nand-utils/nandwrite.c
> +++ b/nand-utils/nandwrite.c
> @@ -349,6 +356,25 @@ int main(int argc, char * const argv[])
>  		goto closeall;
>  	}
>  
> +	/* Skip bad blocks on the way to the start address if necessary */
> +	if (skip_bad_blocks_to_start) {
> +		unsigned long long bbs_offset = 0;
> +		while (bbs_offset < mtdoffset) {
> +			ret = mtd_is_bad(&mtd, fd, bbs_offset / ebsize_aligned);
> +			if (ret < 0) {
> +				sys_errmsg("%s: MTD get bad block failed", mtd_device);
> +				goto closeall;
> +			} else if (ret == 1) {
> +				if (!quiet)
> +					fprintf(stderr, "Bad block at %llx, %u block(s) "
> +						"from %llx will be skipped\n",
> +						bbs_offset, blockalign, bbs_offset);
> +				mtdoffset += ebsize_aligned;
> +			}
> +			bbs_offset += ebsize_aligned;
> +		}
> +	}
> +
>  	/* Check, if length fits into device */
>  	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset) {
>  		fprintf(stderr, "Image %lld bytes, NAND page %d bytes, OOB area %d"
> 
The nandwrite program supports working on clusters of erase blocks aka
"virtual erase blocks", because JFFS2 supports that.

The variable ebsize_aligned is used all over the place in nandwrite and
can hold a multiple of the actual erase block size.

Your patch skips a virtual block only if the first block is bad. IMO it
would make more sense to check if any of the clustered blocks is bad in
the case where ebsize_alligned is larger than a single erase block.

This prompts the questions of how your bootload would deal with that,
on the one heand, and how JFFS2 deals with bad blocks within a virtual
erase block.


Regards,

David
