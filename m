Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP6JX-0005PV-9k
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 13:43:41 +0000
Date: Tue, 20 Nov 2018 14:43:17 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2 v2] mtd: maps: Leave assigned complex mappings
Message-ID: <20181120144317.4661d57f@bbrezillon>
In-Reply-To: <20181112210729.23580-1-linus.walleij@linaro.org>
References: <20181112210729.23580-1-linus.walleij@linaro.org>
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

Hi Linus,

On Mon, 12 Nov 2018 22:07:28 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> The simple_map_init() may need to be called with some
> function pointers already assigned for complex mappings,
> just bail out if complex handlers have already been
> assigned.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rebase on latest MTD development branch
> - Use a new approach as the code changed under me
> ---
>  drivers/mtd/maps/map_funcs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
> index 3f268370eeca..60e132293e1c 100644
> --- a/drivers/mtd/maps/map_funcs.c
> +++ b/drivers/mtd/maps/map_funcs.c
> @@ -31,6 +31,10 @@ static void __xipram simple_map_copy_to(struct map_info *map, unsigned long to,
>  
>  void simple_map_init(struct map_info *map)
>  {
> +	/* Complex map functions already assigned */
> +	if (map->read)
> +		return;
> +
>  	BUG_ON(!map_bankwidth_supported(map->bankwidth));
>  
>  	map->read = simple_map_read;

Can we move that to the physmap driver?

--->8---
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index e8c3b250d842..043c7de39757 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -514,10 +514,16 @@ static int physmap_flash_probe(struct platform_device *dev)
                        err = physmap_addr_gpios_map_init(&info->maps[i]);
                        if (err)
                                goto err_out;
-               } else {
-                       simple_map_init(&info->maps[i]);
                }
 
+               /*
+                * Only use the simple_map implementation if map hooks are not
+                * implemented. Since map->read() is mandatory checking for its
+                * presence is enough.
+                */
+               if (map->read)
+                       simple_map_init(&info->maps[i]);
+
                if (info->probe_type) {
                        info->mtds[i] = do_map_probe(info->probe_type,
                                                     &info->maps[i]);
