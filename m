Received: from mail.solarflare.com ([216.237.3.220]
 helo=ocex02.SolarFlarecom.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RwyZL-0005qk-No
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 16:16:00 +0000
Message-ID: <1329149739.2697.0.camel@bwh-desktop>
Subject: Re: [PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff
From: Ben Hutchings <bhutchings@solarflare.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 13 Feb 2012 16:15:39 +0000
In-Reply-To: <20120212111308.0267f200@pixies.home.jungo.com>
References: <20120212111308.0267f200@pixies.home.jungo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-net-drivers@solarflare.com,
 linux-mtd@lists.infradead.org, David Miller <davem@davemloft.net>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2012-02-12 at 11:13 +0200, Shmulik Ladkani wrote:
> From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> 
> As of bb0eb217, MTD_FAIL_ADDR_UNKNOWN should be used to indicate mtd
> erase failure not specific to any particular block.
> 
> Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff when setting
> 'erase->fail_addr' in 'efx_mtd_erase()'.
> 
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Acked-by: Ben Hutchings <bhutchings@solarflare.com>

> ---
> diff --git a/drivers/net/ethernet/sfc/mtd.c b/drivers/net/ethernet/sfc/mtd.c
> index 6622eca..c44a03e 100644
> --- a/drivers/net/ethernet/sfc/mtd.c
> +++ b/drivers/net/ethernet/sfc/mtd.c
> @@ -193,7 +193,7 @@ static int efx_mtd_erase(struct mtd_info *mtd, struct erase_info *erase)
>  		erase->state = MTD_ERASE_DONE;
>  	} else {
>  		erase->state = MTD_ERASE_FAILED;
> -		erase->fail_addr = 0xffffffff;
> +		erase->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
>  	}
>  	mtd_erase_callback(erase);
>  	return rc;

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
