Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd1Aa-00061M-C8
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 18:45:49 +0000
Received: by pacgg7 with SMTP id gg7so27691497pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 31 Mar 2015 11:45:24 -0700 (PDT)
Date: Tue, 31 Mar 2015 11:45:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH v4 3/3] mtd: part: Remove partition overlap checks
Message-ID: <20150331184521.GX32500@ld-irv-0074>
References: <1427749298-31714-1-git-send-email-dehrenberg@chromium.org>
 <1427749298-31714-4-git-send-email-dehrenberg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1427749298-31714-4-git-send-email-dehrenberg@chromium.org>
Cc: Richard Weinberger <richard@nod.at>, gwendal@chromium.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 30, 2015 at 02:01:38PM -0700, Dan Ehrenberg wrote:
> This patch makes MTD dynamic partitioning more flexible by removing
> overlap checks for dynamic partitions. I don't see any  particular
> reason why overlapping dynamic partitions should be prohibited while
> static partitions are allowed to overlap freely.
> 
> The checks previously had an off-by-one error, where 'end' should be
> one less than what it is currently set at, and adding partitions out of
> increasing order will fail. Disabling the checks resolves this issue.
> 
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
>  drivers/mtd/mtdpart.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index be80340..c444842 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -582,7 +582,7 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>  		      long long offset, long long length)
>  {
>  	struct mtd_partition part;
> -	struct mtd_part *p, *new;
> +	struct mtd_part *new;
>  	uint64_t start, end;

drivers/mtd/mtdpart.c: In function ‘mtd_add_partition’:
drivers/mtd/mtdpart.c:586:18: warning: variable ‘end’ set but not used [-Wunused-but-set-variable]
  uint64_t start, end;
                  ^
drivers/mtd/mtdpart.c:586:11: warning: variable ‘start’ set but not used [-Wunused-but-set-variable]
  uint64_t start, end;
           ^

>  	int ret = 0;
>  
> @@ -611,17 +611,6 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>  	end = offset + length;
>  
>  	mutex_lock(&mtd_partitions_mutex);
> -	list_for_each_entry(p, &mtd_partitions, list)
> -		if (p->master == master) {
> -			if ((start >= p->offset) &&
> -			    (start < (p->offset + p->mtd.size)))
> -				goto err_inv;
> -
> -			if ((end >= p->offset) &&
> -			    (end < (p->offset + p->mtd.size)))
> -				goto err_inv;
> -		}
> -
>  	list_add(&new->list, &mtd_partitions);
>  	mutex_unlock(&mtd_partitions_mutex);
>  
> @@ -630,10 +619,6 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>  	mtd_add_partition_attrs(new);
>  
>  	return ret;
> -err_inv:
> -	mutex_unlock(&mtd_partitions_mutex);
> -	free_partition(new);
> -	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(mtd_add_partition);
>  

Brian
