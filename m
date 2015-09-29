Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgjpd-000216-FG
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 01:35:50 +0000
Received: by pacfv12 with SMTP id fv12so193869426pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 18:35:28 -0700 (PDT)
Date: Mon, 28 Sep 2015 18:35:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] UBI: Fix debug message
Message-ID: <20150929013526.GW31505@google.com>
References: <1435912576-27878-1-git-send-email-richard@nod.at>
 <1435912576-27878-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435912576-27878-3-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Digging through some old stuff:

On Fri, Jul 03, 2015 at 10:36:16AM +0200, Richard Weinberger wrote:
> We have to use j instead of i. i is the volume id
> and not the block.
> 
> Reported-by: Alexander.Block@continental-corporation.com
> Signed-off-by: Richard Weinberger <richard@nod.at>

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  drivers/mtd/ubi/eba.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index b55dc8e..98595c5 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -1409,7 +1409,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
>  					continue;
>  
>  				ubi_err(ubi, "LEB:%i:%i is PEB:%i instead of %i!",
> -					vol->vol_id, i, fm_eba[i][j],
> +					vol->vol_id, j, fm_eba[i][j],
>  					scan_eba[i][j]);
>  				ubi_assert(0);
>  			}
> -- 
> 1.8.4.5
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
