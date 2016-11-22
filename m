Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9GdY-0001XV-Ko
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 19:21:49 +0000
Received: by mail-pg0-x242.google.com with SMTP id x23so2855310pgx.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 11:21:28 -0800 (PST)
Date: Tue, 22 Nov 2016 11:21:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Luis Henriques <henrix@camandro.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: add missing iounmap() in error path
Message-ID: <20161122192124.GF77253@google.com>
References: <20161116225016.29958-1-henrix@camandro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161116225016.29958-1-henrix@camandro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 16, 2016 at 10:50:16PM +0000, Luis Henriques wrote:
> This patch was triggered by the following Coccinelle error:
> 
> ./drivers/mtd/maps/sc520cdp.c:246:3-9: \
> 	ERROR: missing iounmap; ioremap on line 242 \
> 	and execution via conditional on line 244
> 
> Signed-off-by: Luis Henriques <henrix@camandro.org>
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

Umm, so you never unmap from sc520cdp_map[0].virt? How about:

				while (--i >= 0)

?

You can also skip the 'if (i)' part in that case. Or maybe make it a for
loop, to be even clearer.

> +					iounmap(sc520cdp_map[i].virt);

This may often be a double-iounmap. If you take a look later in the
loop, many instances of the loop may not find a device, and so they'll
unmap this memory and move on. You're just doing it a second time for
them.

> +			}
>  			return -EIO;
>  		}
>  

Please put some more care into your patch, since I very much expect that
you did not test it.

Brian
