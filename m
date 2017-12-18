Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQyAu-0005Jx-1Q
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:21:57 +0000
Date: Mon, 18 Dec 2017 17:21:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdswap: make array 'name' static const, shrinks
 object size
Message-ID: <20171218172134.7fa7df8c@bbrezillon>
In-Reply-To: <20171128185946.25026-1-colin.king@canonical.com>
References: <20171128185946.25026-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Nov 2017 18:59:46 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the read-only array 'name' on the stack but instead
> make it static and constify it. Makes the object code smaller by 35
> bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   26304	   4444	    352	  31100	   797c	drivers/mtd/mtdswap.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   26205	   4508	    352	  31065	   7959	drivers/mtd/mtdswap.o
> 
> (gcc version 7.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/mtdswap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index f07492c6f4b2..7eb0e1f4f980 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -1223,8 +1223,9 @@ static int mtdswap_show(struct seq_file *s, void *data)
>  	unsigned int max[MTDSWAP_TREE_CNT];
>  	unsigned int i, cw = 0, cwp = 0, cwecount = 0, bb_cnt, mapped, pages;
>  	uint64_t use_size;
> -	char *name[] = {"clean", "used", "low", "high", "dirty", "bitflip",
> -			"failing"};
> +	static const char * const name[] = {
> +		"clean", "used", "low", "high", "dirty", "bitflip", "failing"
> +	};
>  
>  	mutex_lock(&d->mbd_dev->lock);
>  
