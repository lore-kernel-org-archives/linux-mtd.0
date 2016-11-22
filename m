Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9GtU-0003I9-La
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 19:38:17 +0000
Received: by mail-pf0-x243.google.com with SMTP id i88so1890126pfk.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 11:37:56 -0800 (PST)
Date: Tue, 22 Nov 2016 11:37:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Colin King <colin.king@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdswap: fix spelling mistake "erassure" -> "erasure"
Message-ID: <20161122193753.GG77253@google.com>
References: <20161028182559.7887-1-colin.king@canonical.com>
 <1477680707.7945.13.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1477680707.7945.13.camel@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 28, 2016 at 11:51:47AM -0700, Joe Perches wrote:
> I'd suggest as well fixing all the dev_<level> uses
> to be a consistent form: (this also fixes the typo)
> and a few other bits
> 
> o Coalesce formats
> o Realign arguments
> o Add missing newlines

Yeah, Colin missed this on the line he was fixing.

> o Convert printk(KERN_<LEVEL> to pr_<level>(
> o Add #define pr_fmt, remove MTDSWAP_PREFIX
> 
> Reduces object size a little too

Thanks, these all look good but:

 (a) you didn't provide a Signed-off-by and
 (b) your patch is full of non-breaking spaces (0xA0), instead of proper
 ASCII spaces (0x20)

I feel like we've had this conversation before about your Evolution
mailer a long time ago; you still haven't fixed that?

I'm sorry, but I just can't take your patch. I'm not going to hand-edit
this one...

Brian

(Leaving context intact, in case it helps to see your improper patch
text.)

> ---
>  drivers/mtd/mtdswap.c | 74 +++++++++++++++++++++++----------------------------
>  1 file changed, 34 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index cb06bdd21a1b..60ca953b3314 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -24,6 +24,8 @@
>   * 02110-1301 USA
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include 
>  #include 
>  #include 
> @@ -39,8 +41,6 @@
>  #include 
>  #include 
>  
> -#define MTDSWAP_PREFIX "mtdswap"
> -
>  /*
>   * The number of free eraseblocks when GC should stop
>   */
> @@ -282,8 +282,8 @@ static int mtdswap_handle_badblock(struct mtdswap_dev *d, struct swap_eb *eb)
>  	ret = mtd_block_markbad(d->mtd, offset);
>  
>  	if (ret) {
> -		dev_warn(d->dev, "Mark block bad failed for block at %08llx "
> -			"error %d\n", offset, ret);
> +		dev_warn(d->dev, "Mark block bad failed for block at %08llx error %d\n",
> +			 offset, ret);
>  		return ret;
>  	}
>  
> @@ -319,14 +319,13 @@ static int mtdswap_read_oob(struct mtdswap_dev *d, loff_t from,
>  
>  	if (ret) {
>  		dev_warn(d->dev, "Read OOB failed %d for block at %08llx\n",
> -			ret, from);
> +			 ret, from);
>  		return ret;
>  	}
>  
>  	if (ops->oobretlen < ops->ooblen) {
> -		dev_warn(d->dev, "Read OOB return short read (%zd bytes not "
> -			"%zd) for block at %08llx\n",
> -			ops->oobretlen, ops->ooblen, from);
> +		dev_warn(d->dev, "Read OOB return short read (%zd bytes not %zd) for block at %08llx\n",
> +			 ops->oobretlen, ops->ooblen, from);
>  		return -EIO;
>  	}
>  
> @@ -406,17 +405,16 @@ static int mtdswap_write_marker(struct mtdswap_dev *d, struct swap_eb *eb,
>  	ret = mtd_write_oob(d->mtd, offset, &ops);
>  
>  	if (ret) {
> -		dev_warn(d->dev, "Write OOB failed for block at %08llx "
> -			"error %d\n", offset, ret);
> +		dev_warn(d->dev, "Write OOB failed for block at %08llx error %d\n",
> +			 offset, ret);
>  		if (ret == -EIO || mtd_is_eccerr(ret))
>  			mtdswap_handle_write_error(d, eb);
>  		return ret;
>  	}
>  
>  	if (ops.oobretlen != ops.ooblen) {
> -		dev_warn(d->dev, "Short OOB write for block at %08llx: "
> -			"%zd not %zd\n",
> -			offset, ops.oobretlen, ops.ooblen);
> +		dev_warn(d->dev, "Short OOB write for block at %08llx: %zd not %zd\n",
> +			 offset, ops.oobretlen, ops.ooblen);
>  		return ret;
>  	}
>  
> @@ -571,8 +569,8 @@ static int mtdswap_erase_block(struct mtdswap_dev *d, struct swap_eb *eb)
>  	if (ret) {
>  		if (retries++ < MTDSWAP_ERASE_RETRIES) {
>  			dev_warn(d->dev,
> -				"erase of erase block %#llx on %s failed",
> -				erase.addr, mtd->name);
> +				 "erase of erase block %#llx on %s failed\n",
> +				 erase.addr, mtd->name);
>  			yield();
>  			goto retry;
>  		}
> @@ -587,7 +585,7 @@ static int mtdswap_erase_block(struct mtdswap_dev *d, struct swap_eb *eb)
>  	ret = wait_event_interruptible(wq, erase.state == MTD_ERASE_DONE ||
>  					   erase.state == MTD_ERASE_FAILED);
>  	if (ret) {
> -		dev_err(d->dev, "Interrupted erase block %#llx erassure on %s",
> +		dev_err(d->dev, "Interrupted erase block %#llx erasure on %s\n",
>  			erase.addr, mtd->name);
>  		return -EINTR;
>  	}
> @@ -595,8 +593,8 @@ static int mtdswap_erase_block(struct mtdswap_dev *d, struct swap_eb *eb)
>  	if (erase.state == MTD_ERASE_FAILED) {
>  		if (retries++ < MTDSWAP_ERASE_RETRIES) {
>  			dev_warn(d->dev,
> -				"erase of erase block %#llx on %s failed",
> -				erase.addr, mtd->name);
> +				 "erase of erase block %#llx on %s failed\n",
> +				 erase.addr, mtd->name);
>  			yield();
>  			goto retry;
>  		}
> @@ -699,13 +697,13 @@ static int mtdswap_write_block(struct mtdswap_dev *d, char *buf,
>  	}
>  
>  	if (ret < 0) {
> -		dev_err(d->dev, "Write to MTD device failed: %d (%zd written)",
> +		dev_err(d->dev, "Write to MTD device failed: %d (%zd written)\n",
>  			ret, retlen);
>  		goto err;
>  	}
>  
>  	if (retlen != PAGE_SIZE) {
> -		dev_err(d->dev, "Short write to MTD device: %zd written",
> +		dev_err(d->dev, "Short write to MTD device: %zd written\n",
>  			retlen);
>  		ret = -EIO;
>  		goto err;
> @@ -742,8 +740,7 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
>  		oldeb = d->eb_data + oldblock / d->pages_per_eblk;
>  		oldeb->flags |= EBLOCK_READERR;
>  
> -		dev_err(d->dev, "Read Error: %d (block %u)\n", ret,
> -			oldblock);
> +		dev_err(d->dev, "Read Error: %d (block %u)\n", ret, oldblock);
>  		retries++;
>  		if (retries < MTDSWAP_IO_RETRIES)
>  			goto retry;
> @@ -752,8 +749,8 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
>  	}
>  
>  	if (retlen != PAGE_SIZE) {
> -		dev_err(d->dev, "Short read: %zd (block %u)\n", retlen,
> -		       oldblock);
> +		dev_err(d->dev, "Short read: %zd (block %u)\n",
> +			retlen, oldblock);
>  		ret = -EIO;
>  		goto read_error;
>  	}
> @@ -1404,7 +1401,7 @@ static int mtdswap_init(struct mtdswap_dev *d, unsigned int eblocks,
>  revmap_fail:
>  	vfree(d->page_data);
>  page_data_fail:
> -	printk(KERN_ERR "%s: init failed (%d)\n", MTDSWAP_PREFIX, ret);
> +	pr_err("init failed (%d)\n", ret);
>  	return ret;
>  }
>  
> @@ -1435,21 +1432,20 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
>  		return;
>  
>  	if (mtd->erasesize < PAGE_SIZE || mtd->erasesize % PAGE_SIZE) {
> -		printk(KERN_ERR "%s: Erase size %u not multiple of PAGE_SIZE "
> -			"%lu\n", MTDSWAP_PREFIX, mtd->erasesize, PAGE_SIZE);
> +		pr_err("Erase size %u not multiple of PAGE_SIZE %lu\n",
> +		       mtd->erasesize, PAGE_SIZE);
>  		return;
>  	}
>  
>  	if (PAGE_SIZE % mtd->writesize || mtd->writesize > PAGE_SIZE) {
> -		printk(KERN_ERR "%s: PAGE_SIZE %lu not multiple of write size"
> -			" %u\n", MTDSWAP_PREFIX, PAGE_SIZE, mtd->writesize);
> +		pr_err("PAGE_SIZE %lu not multiple of write size %u\n",
> +		       PAGE_SIZE, mtd->writesize);
>  		return;
>  	}
>  
>  	if (!mtd->oobsize || mtd->oobavail < MTDSWAP_OOBSIZE) {
> -		printk(KERN_ERR "%s: Not enough free bytes in OOB, "
> -			"%d available, %zu needed.\n",
> -			MTDSWAP_PREFIX, mtd->oobavail, MTDSWAP_OOBSIZE);
> +		pr_err("Not enough free bytes in OOB, %d available, %zu needed\n",
> +			mtd->oobavail, MTDSWAP_OOBSIZE);
>  		return;
>  	}
>  
> @@ -1460,8 +1456,8 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
>  	size_limit = (uint64_t) BLOCK_MAX * PAGE_SIZE;
>  
>  	if (mtd->size > size_limit) {
> -		printk(KERN_WARNING "%s: Device too large. Limiting size to "
> -			"%llu bytes\n", MTDSWAP_PREFIX, size_limit);
> +		pr_warn("Device too large - limiting size to %llu bytes\n",
> +			size_limit);
>  		use_size = size_limit;
>  	}
>  
> @@ -1471,9 +1467,8 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
>  	eavailable = eblocks - bad_blocks;
>  
>  	if (eavailable < MIN_ERASE_BLOCKS) {
> -		printk(KERN_ERR "%s: Not enough erase blocks. %u available, "
> -			"%d needed\n", MTDSWAP_PREFIX, eavailable,
> -			MIN_ERASE_BLOCKS);
> +		pr_err("Not enough erase blocks. %u available, %d needed\n",
> +		       eavailable, MIN_ERASE_BLOCKS);
>  		return;
>  	}
>  
> @@ -1488,9 +1483,8 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
>  	swap_size = (uint64_t)(eavailable - spare_cnt) * mtd->erasesize +
>  		(header ? PAGE_SIZE : 0);
>  
> -	printk(KERN_INFO "%s: Enabling MTD swap on device %lu, size %llu KB, "
> -		"%u spare, %u bad blocks\n",
> -		MTDSWAP_PREFIX, part, swap_size / 1024, spare_cnt, bad_blocks);
> +	pr_info("Enabling MTD swap on device %lu, size %llu KB, %u spare, %u bad blocks\n",
> +		part, swap_size / 1024, spare_cnt, bad_blocks);
>  
>  	d = kzalloc(sizeof(struct mtdswap_dev), GFP_KERNEL);
>  	if (!d)
