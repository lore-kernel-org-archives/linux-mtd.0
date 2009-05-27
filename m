Received: from mlbe2k1.cs.myharris.net ([137.237.90.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9JZq-0006nC-72
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 13:54:00 +0000
Message-ID: <4A1D45E3.2090104@harris.com>
Date: Wed, 27 May 2009 09:53:39 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: "Steven A. Falco" <sfalco@harris.com>
Subject: Re: [PATCH-V2] Bug in m25p80.c during whole-chip erase
References: <49F71052.4060505@harris.com>
In-Reply-To: <49F71052.4060505@harris.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I sent the following patch about a month ago.  There seemed to
be some interest, but I never saw anyone say they would/could
merge it.

So, is there any interest in merging this?

	Steve

> There is a logic error in "whole chip erase" for the m25p80 family.  If
> the whole device is successfully erased, erase_chip() will return 0, and
> the code will fall through to the "else" clause, and do sector-by-sector
> erase in addition to the whole-chip erase.  This patch corrects that.
> 
> Signed-off-by: Steven A. Falco <sfalco@harris.com>
> ---
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 6659b22..3a2fed8 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -251,10 +251,12 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	mutex_lock(&flash->lock);
>  
>  	/* whole-chip erase? */
> -	if (len == flash->mtd.size && erase_chip(flash)) {
> -		instr->state = MTD_ERASE_FAILED;
> -		mutex_unlock(&flash->lock);
> -		return -EIO;
> +	if (len == flash->mtd.size) {
> +		if (erase_chip(flash)) {
> +			instr->state = MTD_ERASE_FAILED;
> +			mutex_unlock(&flash->lock);
> +			return -EIO;
> +		}
>  
>  	/* REVISIT in some cases we could speed up erasing large regions
>  	 * by using OPCODE_SE instead of OPCODE_BE_4K.  We may have set up
> 
