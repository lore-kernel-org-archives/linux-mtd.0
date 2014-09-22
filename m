Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW8M9-00079E-Jc
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:29:02 +0000
Received: by mail-pa0-f42.google.com with SMTP id et14so4996320pad.15
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 11:28:40 -0700 (PDT)
Date: Mon, 22 Sep 2014 11:28:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: bcm47xxpart: only register partitions if the trx
 header was filled
Message-ID: <20140922182837.GP1193@ld-irv-0074>
References: <1411338793-21245-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411338793-21245-1-git-send-email-hauke@hauke-m.de>
Cc: zajec5@gmail.com, linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 22, 2014 at 12:33:13AM +0200, Hauke Mehrtens wrote:
> Sometimes the trx offsets are 0, in that case there is no partition and
> we should not try to add one.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/bcm47xxpart.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 8057f52..c3f4454 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -168,18 +168,22 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  				i++;
>  			}
>  
> -			bcm47xxpart_add_part(&parts[curr_part++], "linux",
> -					     offset + trx->offset[i], 0);
> -			i++;
> +			if (trx->offset[i]) {
> +				bcm47xxpart_add_part(&parts[curr_part++], "linux",
> +						     offset + trx->offset[i], 0);

Hmm, this indentation is getting large, and it fails checkpatch now.
But I'm not sure the alternatives are much better right now.

> +				i++;
> +			}
>  
>  			/*
>  			 * Pure rootfs size is known and can be calculated as:
>  			 * trx->length - trx->offset[i]. We don't fill it as
>  			 * we want to have jffs2 (overlay) in the same mtd.
>  			 */
> -			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
> -					     offset + trx->offset[i], 0);
> -			i++;
> +			if (trx->offset[i]) {
> +				bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
> +						     offset + trx->offset[i], 0);

Same here.

> +				i++;
> +			}
>  
>  			last_trx_part = curr_part - 1;
>  

I'll take this soon if there are no other complaints.

Brian
