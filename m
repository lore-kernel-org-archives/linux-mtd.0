Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MdugT-0000Ci-2C
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 23:35:19 +0000
Date: Wed, 19 Aug 2009 16:34:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: dimitri.gorokhovik@free.fr
Subject: Re: [PATCH] nftl: fix offset alignments
Message-Id: <20090819163426.fa90cf9f.akpm@linux-foundation.org>
In-Reply-To: <785022442.3397251250633188592.JavaMail.root@zimbra3-e1.priv.proxad.net>
References: <605152405.3397101250633087167.JavaMail.root@zimbra3-e1.priv.proxad.net>
	<785022442.3397251250633188592.JavaMail.root@zimbra3-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Scott James Remnant <scott@canonical.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	linux-mtd@lists.infradead.org, Tim Gardner <tim.gardner@canonical.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Aug 2009 00:06:28 +0200 (CEST) dimitri.gorokhovik@free.fr wrote:

> Arithmetic conversion in the mask computation makes the upper word 
> of the second argument passed down to mtd->read_oob(), be always 0
> (assuming 'offs' being a 64-bit signed long long type, and 
> 'mtd->writesize' being a 32-bit unsigned int type). 
> 
> This patch applies over the other one adding masking in nftl_write,
> "nftl: write support is broken".
> 
> Signed-off-by: <dimitri.gorokhovik@free.fr>
> ---
>  
> diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
> index 665d3eb..d2fd066 100644
> --- a/drivers/mtd/nftlcore.c
> +++ b/drivers/mtd/nftlcore.c
> @@ -135,16 +135,17 @@ static void nftl_remove_dev(struct mtd_blktrans_dev *dev)
>  int nftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
>  		  size_t *retlen, uint8_t *buf)
>  {
> +	typeof(offs) mask = mtd->writesize - 1;

I see no reason to use typeof here.  Plain old

	loff_t mask = mtd->writesize - 1;

would be more conventional.

>  	struct mtd_oob_ops ops;
>  	int res;
>  
>  	ops.mode = MTD_OOB_PLACE;
> -	ops.ooboffs = offs & (mtd->writesize - 1);
> +	ops.ooboffs = offs & mask;
>  	ops.ooblen = len;
>  	ops.oobbuf = buf;
>  	ops.datbuf = NULL;
>  
> -	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
> +	res = mtd->read_oob(mtd, offs & ~mask, &ops);

yup.
