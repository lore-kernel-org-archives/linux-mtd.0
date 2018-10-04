Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g83Nh-0003Gn-MU
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 13:10:00 +0000
Date: Thu, 4 Oct 2018 15:09:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/10] mtd: physmap_of: Remove unused struct
 of_device_id
Message-ID: <20181004150908.71f9130c@bbrezillon>
In-Reply-To: <20181004130110.8496-2-ricardo.ribalda@gmail.com>
References: <20181004130110.8496-1-ricardo.ribalda@gmail.com>
 <20181004130110.8496-2-ricardo.ribalda@gmail.com>
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

On Thu,  4 Oct 2018 15:01:02 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> This struct does not seem to be used anywhere on the code
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Already queued that one.

> ---
>  drivers/mtd/maps/physmap_of_gemini.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of_gemini.c b/drivers/mtd/maps/physmap_of_gemini.c
> index 830b1b7e702b..9df62ca721d5 100644
> --- a/drivers/mtd/maps/physmap_of_gemini.c
> +++ b/drivers/mtd/maps/physmap_of_gemini.c
> @@ -44,11 +44,6 @@
>  
>  #define FLASH_PARALLEL_HIGH_PIN_CNT	(1 << 20)	/* else low pin cnt */
>  
> -static const struct of_device_id syscon_match[] = {
> -	{ .compatible = "cortina,gemini-syscon" },
> -	{ },
> -};
> -
>  int of_flash_probe_gemini(struct platform_device *pdev,
>  			  struct device_node *np,
>  			  struct map_info *map)
