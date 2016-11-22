Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9H59-0000Vc-NH
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 19:50:20 +0000
Received: by mail-pg0-x244.google.com with SMTP id 3so2917152pgd.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 11:49:57 -0800 (PST)
Date: Tue, 22 Nov 2016 11:49:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mtd: mtdswap: fix spelling mistake "erassure" -> "erasure"
Message-ID: <20161122194954.GI77253@google.com>
References: <20161028182559.7887-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161028182559.7887-1-colin.king@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 28, 2016 at 07:25:59PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in dev_err message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/mtdswap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index cb06bdd..d0402df 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -587,7 +587,7 @@ static int mtdswap_erase_block(struct mtdswap_dev *d, struct swap_eb *eb)
>  	ret = wait_event_interruptible(wq, erase.state == MTD_ERASE_DONE ||
>  					   erase.state == MTD_ERASE_FAILED);
>  	if (ret) {
> -		dev_err(d->dev, "Interrupted erase block %#llx erassure on %s",
> +		dev_err(d->dev, "Interrupted erase block %#llx erasure on %s",

Applied this patch to l2-mtd.git, adding a newline to the above.

Brian

>  			erase.addr, mtd->name);
>  		return -EINTR;
>  	}
> -- 
> 2.9.3
> 
