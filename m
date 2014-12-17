Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y14UO-0005q7-BV
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 02:37:24 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so15326644pab.12
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 18:37:03 -0800 (PST)
Date: Tue, 16 Dec 2014 18:37:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] mtd: physmap_of: Add read-only fallback
Message-ID: <20141217023700.GT9759@ld-irv-0074>
References: <103889901.65008.1411665422229.JavaMail.zimbra@xes-inc.com>
 <2002674283.65675.1411665608272.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2002674283.65675.1411665608272.JavaMail.zimbra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An old one, but I'm curious...

On Thu, Sep 25, 2014 at 12:20:08PM -0500, Aaron Sierra wrote:
> From: Joe Schultz <jschultz@xes-inc.com>
> 
> Previously, when probing a CFI chip which was write-protected at the
> hardware level, the probe would fail due to the fact it could not put
> the chip into QUERY mode. This would result in no MTD devices being
> created.
> 
> Add a fallback to probe using the map_rom driver if the user-selected
> probe fails.

Why can't the user just select map_rom instead?

Brian

> Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
>  drivers/mtd/maps/physmap_of.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index c62e1c3..efbf416 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -272,6 +272,16 @@ static int of_flash_probe(struct platform_device *dev)
>  			info->list[i].mtd = obsolete_probe(dev,
>  							   &info->list[i].map);
>  		}
> +
> +		/* Fall back to mapping region as ROM */
> +		if (!info->list[i].mtd) {
> +			dev_warn(&dev->dev,
> +				"do_map_probe() failed for type %s\n",
> +				 probe_type);
> +
> +			info->list[i].mtd = do_map_probe("map_rom",
> +							 &info->list[i].map);
> +		}
>  		mtd_list[i] = info->list[i].mtd;
>  
>  		err = -ENXIO;
> -- 
> 1.9.1
> 
