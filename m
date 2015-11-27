Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2RUE-0001Qi-M5
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2015 22:27:27 +0000
Received: by padhx2 with SMTP id hx2so124267519pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2015 14:27:05 -0800 (PST)
Date: Fri, 27 Nov 2015 14:27:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] Revert "mtd: spi-nor: disable protection for Winbond
 flash at startup"
Message-ID: <20151127222701.GA19615@localhost>
References: <1448555221-24257-1-git-send-email-nbd@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448555221-24257-1-git-send-email-nbd@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Felix,

On Thu, Nov 26, 2015 at 05:27:01PM +0100, Felix Fietkau wrote:
> This reverts commit c6fc2171b249e73745c497b578b417a2946f1b2f.
> 
> This commit is breaking read access on at least s25fl064k, but also
> possibly other Spansion flash chips.

This makes no sense. This patch is about Winbond flash, but you're
referencing Spansion flash in the commit subject. I suspect you have
either some more explaining, or some better investigation to do, because
I don't understand how the commit in question could be the problem for
you.

> Any mtd read seems to succeed, but simply returns a zero-filled buffer.

If this is the symptom you're looking at, I doubt you have the right
fix. Wild guess: something similar to this patch:

  http://patchwork.ozlabs.org/patch/547367/
  "mtd: spi-nor: wait until lock/unlock operations are ready"

Brian

> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4988390..8b8842e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1194,14 +1194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	mutex_init(&nor->lock);
>  
>  	/*
> -	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> -	 * with the software protection bits set
> +	 * Atmel, SST and Intel/Numonyx serial nor tend to power
> +	 * up with the software protection bits set
>  	 */
>  
>  	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
>  	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
> -	    JEDEC_MFR(info) == SNOR_MFR_SST ||
> -	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
> +	    JEDEC_MFR(info) == SNOR_MFR_SST) {
>  		write_enable(nor);
>  		write_sr(nor, 0);
>  	}
> -- 
> 2.2.2
> 
