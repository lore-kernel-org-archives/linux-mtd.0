Received: from avasout06.plus.net ([212.159.14.18])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQbIo-00050j-7v
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 14:52:04 +0000
Date: Mon, 9 Jan 2017 14:51:35 +0000
From: Mike Crowe <mac@mcrowe.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
Message-ID: <20170109145135.GA17740@mcrowe.com>
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
 <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
 <20170105141834.GA3198@mcrowe.com>
 <20170105154824.5c9e97ee@bbrezillon>
 <20170105150402.GA3931@mcrowe.com>
 <8f046052-f092-86a0-3375-8d5ddc7572b6@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f046052-f092-86a0-3375-8d5ddc7572b6@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 January 2017 at 13:18:53 +0100, David Oberhollenzer wrote:
> On 01/05/2017 04:04 PM, Mike Crowe wrote:
> >> I think this request is acceptable (even if I don't like the option
> >> name :-)), but I'll let Richard and David decide what to do with this
> >> patch.
> > 
> > I'm not particularly attached to the option name. I chose
> > "--skip-bad-blocks-to-start" in the hope of being as clear as possible, but
> > I agree that it is a mouthful! The confusion over the meaning of the option
> > was also one of the reasons why I originally implemented the feature using
> > a separate offset.
> As I mentioned in my initial suggestion, this is IMO much clearer than
> having two different offset options and avoids the confusing corner case
> of having both set.
> 
> I would gladly accept this patch series (apart from the missing signed-off-by),
> however what actually sparked the discussion above was this snippet here:

I spotted the lack of sign-off just after I sent the patch. I'll make sure
that future versions include one.

> On 01/04/2017 03:18 PM, Mike Crowe wrote:
> > diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
> > index 9602a6e..880990f 100644
> > --- a/nand-utils/nandwrite.c
> > +++ b/nand-utils/nandwrite.c
> > @@ -349,6 +356,25 @@ int main(int argc, char * const argv[])
> >  		goto closeall;
> >  	}
> >  
> > +	/* Skip bad blocks on the way to the start address if necessary */
> > +	if (skip_bad_blocks_to_start) {
> > +		unsigned long long bbs_offset = 0;
> > +		while (bbs_offset < mtdoffset) {
> > +			ret = mtd_is_bad(&mtd, fd, bbs_offset / ebsize_aligned);
> > +			if (ret < 0) {
> > +				sys_errmsg("%s: MTD get bad block failed", mtd_device);
> > +				goto closeall;
> > +			} else if (ret == 1) {
> > +				if (!quiet)
> > +					fprintf(stderr, "Bad block at %llx, %u block(s) "
> > +						"from %llx will be skipped\n",
> > +						bbs_offset, blockalign, bbs_offset);
> > +				mtdoffset += ebsize_aligned;
> > +			}
> > +			bbs_offset += ebsize_aligned;
> > +		}
> > +	}
> > +
> >  	/* Check, if length fits into device */
> >  	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset) {
> >  		fprintf(stderr, "Image %lld bytes, NAND page %d bytes, OOB area %d"
> > 
> The nandwrite program supports working on clusters of erase blocks aka
> "virtual erase blocks", because JFFS2 supports that.
> 
> The variable ebsize_aligned is used all over the place in nandwrite and
> can hold a multiple of the actual erase block size.
> 
> Your patch skips a virtual block only if the first block is bad. IMO it
> would make more sense to check if any of the clustered blocks is bad in
> the case where ebsize_alligned is larger than a single erase block.

To be honest, I didn't entirely understand that feature. I just tried to
make sure I treated ebsize_aligned in the same way as the rest of the code.

> This prompts the questions of how your bootload would deal with that,
> on the one heand, and how JFFS2 deals with bad blocks within a virtual
> erase block.

We're not using virtual erase blocks and I don't believe our bootloader
supports them either.

If erase blocks are going to be combined into larger virtual erase blocks
then I believe the only sensible way forward is to treat the virtual erase
block as bad if any of the blocks within it are bad.

However, I can't say I understand how the main loop in nandwrite.c can work
if blockalign > 1. It contains the following lines of code:

|  ebsize_aligned = mtd.eb_size * blockalign;
|  ...
|  ret = mtd_is_bad(&mtd, fd, offs / ebsize_aligned);
|  ...		   
|  offs +=  ebsize_aligned / blockalign;

The implementation of mtd_is_bad in libmtd.c contains:

|  seek = (loff_t)eb * mtd->eb_size;

These four statements seem to be incompatible to me. mtd_is_bad expects a
physical erase block index, but it is being passed a virtual erase block
index. Furthermore, the offset is being incremented by the physical erase
block size, but this won't have any effect on the virtual erase block index
passed to mtd_is_bad until blockalign loops have been executed.

Nevertheless, I can make the initial bad-block-skipping code skip virtual
erase blocks if any physical erase block within is bad if that is deemed to
be correct.

Thanks for the review.

Mike.
