Date: Wed, 9 May 2018 11:42:50 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Joachim Eastwood <manabian@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, ldv-project@linuxtesting.org,
 sil2review@lists.osadl.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nxp-spifi: decrement flash_np refcnt on error paths
Message-ID: <20180509114250.120eb299@bbrezillon>
In-Reply-To: <1525812456-25877-1-git-send-email-khoroshilov@ispras.ru>
References: <1525812456-25877-1-git-send-email-khoroshilov@ispras.ru>
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

On Tue,  8 May 2018 23:47:36 +0300
Alexey Khoroshilov <khoroshilov@ispras.ru> wrote:

> nxp_spifi_probe() increments refcnt of SPI flash device node by
> of_get_next_available_child() and then it passes the node
> to mtd device in nxp_spifi_setup_flash().
> But if a failure happens before mtd_device_register() succeed,
> the refcnt is left undecremented.

Why not doing that in the error path of the probe function? Also, you
probably want to call of_node_put() in the ->remove() function.

> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> ---
>  drivers/mtd/spi-nor/nxp-spifi.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
> index 15374216d4d9..8919e31f2ab8 100644
> --- a/drivers/mtd/spi-nor/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/nxp-spifi.c
> @@ -294,7 +294,8 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>  			break;
>  		default:
>  			dev_err(spifi->dev, "unsupported rx-bus-width\n");
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto err_node_put;
>  		}
>  	}
>  
> @@ -328,7 +329,8 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>  		break;
>  	default:
>  		dev_err(spifi->dev, "only mode 0 and 3 supported\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_node_put;
>  	}
>  
>  	writel(ctrl, spifi->io_base + SPIFI_CTRL);
> @@ -356,22 +358,26 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>  	ret = spi_nor_scan(&spifi->nor, NULL, &hwcaps);
>  	if (ret) {
>  		dev_err(spifi->dev, "device scan failed\n");
> -		return ret;
> +		goto err_node_put;
>  	}
>  
>  	ret = nxp_spifi_setup_memory_cmd(spifi);
>  	if (ret) {
>  		dev_err(spifi->dev, "memory command setup failed\n");
> -		return ret;
> +		goto err_node_put;
>  	}
>  
>  	ret = mtd_device_register(&spifi->nor.mtd, NULL, 0);
>  	if (ret) {
>  		dev_err(spifi->dev, "mtd device parse failed\n");
> -		return ret;
> +		goto err_node_put;
>  	}
>  
>  	return 0;
> +
> +err_node_put:
> +	of_node_put(np);
> +	return ret;
>  }
>  
>  static int nxp_spifi_probe(struct platform_device *pdev)
