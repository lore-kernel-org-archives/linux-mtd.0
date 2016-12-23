Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKV6T-0002nD-Bi
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 19:02:06 +0000
Received: by mail-wj0-x241.google.com with SMTP id j10so41424413wjb.3
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2016 11:01:44 -0800 (PST)
Subject: Re: [PATCH] mtd: mtdswap: use MTDSWAP_ECNT_MIN/MAX
To: Geliang Tang <geliangtang@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <254e9f859fdb1f850c1d3bd5777e97bf468b4e5a.1482225376.git.geliangtang@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <252d763e-1767-9bf9-be1a-af0c02d4078f@gmail.com>
Date: Fri, 23 Dec 2016 19:51:56 +0100
MIME-Version: 1.0
In-Reply-To: <254e9f859fdb1f850c1d3bd5777e97bf468b4e5a.1482225376.git.geliangtang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/20/2016 02:54 PM, Geliang Tang wrote:
> Since macros MTDSWAP_ECNT_MIN() and MTDSWAP_ECNT_MAX() have been
> defined in mtdswap.c, use them instead of open-coding.
> 
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>

Sorry for getting to this so late. The patch is fine, but if you grep
for 'rb_first' in the mtdswap driver , you'll see you can also use the
MTDSWAP_ECNT_MIN macro in mtdswap_map_free_block() and in
mtdswap_pick_gc_blk() . Can you fix those too ?

Otherwise:
Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/mtdswap.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index c40e2c9..f12879a 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -1235,10 +1235,8 @@ static int mtdswap_show(struct seq_file *s, void *data)
>  
>  		if (root->rb_node) {
>  			count[i] = d->trees[i].count;
> -			min[i] = rb_entry(rb_first(root), struct swap_eb,
> -					rb)->erase_count;
> -			max[i] = rb_entry(rb_last(root), struct swap_eb,
> -					rb)->erase_count;
> +			min[i] = MTDSWAP_ECNT_MIN(root);
> +			max[i] = MTDSWAP_ECNT_MAX(root);
>  		} else
>  			count[i] = 0;
>  	}
> 


-- 
Best regards,
Marek Vasut
