Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a68LR-0000T3-K2
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 02:49:38 +0000
Received: by pfdd184 with SMTP id d184so4042760pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 18:49:16 -0800 (PST)
Date: Mon, 7 Dec 2015 18:49:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-mtd@lists.infradead.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] Revert "mtd: spi-nor: disable protection for Winbond
 flash at startup"
Message-ID: <20151208024914.GB121937@google.com>
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

+ others

Hi Felix,

On Thu, Nov 26, 2015 at 05:27:01PM +0100, Felix Fietkau wrote:
> This reverts commit c6fc2171b249e73745c497b578b417a2946f1b2f.
> 
> This commit is breaking read access on at least s25fl064k, but also
> possibly other Spansion flash chips.
> 
> Any mtd read seems to succeed, but simply returns a zero-filled buffer.
> 
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

So I think we've more or less agreed that this part needs applied for
4.4 (to prevent regressions), and hopefully we can work out a good way
forward for 4.5, to keep Winbond support.

But, I think if this part is breaking you, then ioctl(MEMLOCK) would
also mess up your flash, and so you'll need something like this too:

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3b2460efc019..3c88ebddf4db 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1236,8 +1236,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->_read = spi_nor_read;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
-	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
 		nor->flash_is_locked = stm_is_locked;

Do you think you can put together (and test) a patch with a fuller
description soon? Might mention the fact that Winbond and Spansion
shared vendor IDs on some parts. Then I can apply it for 4.4 and try for
a better solution on 4.5.

Thanks,
Brian
