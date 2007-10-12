Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IgFWn-0002Bt-E3
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 09:05:51 +0100
Date: Fri, 12 Oct 2007 09:58:05 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH] MTD: OneNAND: Avoid deadlock in erase callback;
	release chip lock first.
Message-ID: <20071012075804.GA2689@lazybastard.org>
References: <470F2369.3010103@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <470F2369.3010103@nokia.com>
Cc: linux-mtd@lists.infradead.org, ext Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 October 2007 10:34:01 +0300, Adrian Hunter wrote:
> 
> When the erase callback performs some other action on the flash, it's
> highly likely to deadlock unless we actually release the chip lock
> before calling it.
> 
> This patch mirrors that same change already done for NAND.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index a8c426b..dd28355 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1711,13 +1711,14 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
>  erase_exit:
>  
>  	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;

Can you move this line down as well?  There is no point in holding the
lock here and shrinking critical sections - even if only minimally -
is generally advantageous.

> -	/* Do call back function */
> -	if (!ret)
> -		mtd_erase_callback(instr);
>  
>  	/* Deselect and wake up anyone waiting on the device */
>  	onenand_release_device(mtd);
>  
> +	/* Do call back function */
> +	if (!ret)
> +		mtd_erase_callback(instr);
> +
>  	return ret;
>  }

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
