Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTNQB-0000vl-3c
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 08:48:12 +0000
Date: Sun, 2 Dec 2018 09:47:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2 v3] mtd: maps: Leave assigned complex mappings
Message-ID: <20181202094749.07a9687e@bbrezillon>
In-Reply-To: <20181127205358.32502-1-linus.walleij@linaro.org>
References: <20181127205358.32502-1-linus.walleij@linaro.org>
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

On Tue, 27 Nov 2018 21:53:57 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> The simple_map_init() may need to be called with some
> function pointers already assigned for complex mappings,
> just bail out if complex handlers have already been
> assigned.

The commit message no longer matches what the patch does.

How about:

"
mtd: maps: physmap: Leave assigned complex mappings

SoC-specific drivers might provide their own map->xxx() implementation,
and calling simple_map_init() unconditionally will override those
implementations.

Make sure map->read is NULL before calling simple_map_init().
"

If you're okay with this new commit message, I can fix it when applying.

Regards,

Boris

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Move check for pre-initialized simple map into
>   physmap-core.c
> ChangeLog v1->v2:
> - Rebase on latest MTD development branch
> - Use a new approach as the code changed under me
> ---
>  drivers/mtd/maps/physmap-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
> index e8c3b250d842..ecca7784de06 100644
> --- a/drivers/mtd/maps/physmap-core.c
> +++ b/drivers/mtd/maps/physmap-core.c
> @@ -514,10 +514,16 @@ static int physmap_flash_probe(struct platform_device *dev)
>  			err = physmap_addr_gpios_map_init(&info->maps[i]);
>  			if (err)
>  				goto err_out;
> -		} else {
> -			simple_map_init(&info->maps[i]);
>  		}
>  
> +		/*
> +		 * Only use the simple_map implementation if map hooks are not
> +		 * implemented. Since map->read() is mandatory checking for its
> +		 * presence is enough.
> +		 */
> +		if (!info->maps[i].read)
> +			simple_map_init(&info->maps[i]);
> +
>  		if (info->probe_type) {
>  			info->mtds[i] = do_map_probe(info->probe_type,
>  						     &info->maps[i]);
