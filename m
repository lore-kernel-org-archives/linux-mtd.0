Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8Zwt-0006Ky-Pu
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 21:46:56 +0000
Received: by mail-wj0-x243.google.com with SMTP id jb2so2593777wjb.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 13:46:35 -0800 (PST)
Subject: Re: [PATCH] mtd: maps: add missing iounmap() in error path
To: Luis Henriques <henrix@camandro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20161116225016.29958-1-henrix@camandro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <26e25b8b-5169-0262-b850-3108cb8d0cde@gmail.com>
Date: Sun, 20 Nov 2016 22:13:25 +0100
MIME-Version: 1.0
In-Reply-To: <20161116225016.29958-1-henrix@camandro.org>
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

On 11/16/2016 11:50 PM, Luis Henriques wrote:
> This patch was triggered by the following Coccinelle error:
> 
> ./drivers/mtd/maps/sc520cdp.c:246:3-9: \
> 	ERROR: missing iounmap; ioremap on line 242 \
> 	and execution via conditional on line 244
> 
> Signed-off-by: Luis Henriques <henrix@camandro.org>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/maps/sc520cdp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
> index 093edd51bdc7..7a27ed345d0d 100644
> --- a/drivers/mtd/maps/sc520cdp.c
> +++ b/drivers/mtd/maps/sc520cdp.c
> @@ -243,6 +243,10 @@ static int __init init_sc520cdp(void)
>  
>  		if (!sc520cdp_map[i].virt) {
>  			printk("Failed to ioremap_nocache\n");
> +			if (i) {
> +				while (--i)
> +					iounmap(sc520cdp_map[i].virt);
> +			}
>  			return -EIO;
>  		}
>  
> 


-- 
Best regards,
Marek Vasut
