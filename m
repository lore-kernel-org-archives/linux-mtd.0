Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK917-0007dl-In
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 17:50:18 +0000
Received: by pacan13 with SMTP id an13so74683570pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2015 10:49:56 -0700 (PDT)
Date: Tue, 28 Jul 2015 10:49:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ezequiel.garcia@free-electrons.com, pekon@ti.com, slash.tmp@free.fr,
 u.kleine-koenig@pengutronix.de, stable@vger.kernel.org,
 stable-commits@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Patch "mtd: nand: don't use read_buf for 8-bit ONFI transfers"
 has been added to the 3.14-stable tree
Message-ID: <20150728174953.GS8876@google.com>
References: <1438105226127118@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1438105226127118@kroah.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd

On Tue, Jul 28, 2015 at 10:40:26AM -0700, Greg Kroah-Hartman wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     mtd: nand: don't use read_buf for 8-bit ONFI transfers
> 
> to the 3.14-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      mtd-nand-don-t-use-read_buf-for-8-bit-onfi-transfers.patch
> and it can be found in the queue-3.14 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.

IIRC, that patch goes best with this one too:

    commit 3dad2344e92c6e1aeae42df1c4824f307c51bcc7
    Author: Brian Norris <computersforpeace@gmail.com>
    Date:   Wed Jan 29 14:08:12 2014 -0800

        mtd: nand: force NAND_CMD_READID onto 8-bit bus

Someone who was able to test this better (I don't have x16 chips) might be able
to say better.

Brian

> From bd9c6e99b58255b9de1982711ac9487c9a2f18be Mon Sep 17 00:00:00 2001
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Fri, 29 Nov 2013 22:04:28 -0800
> Subject: mtd: nand: don't use read_buf for 8-bit ONFI transfers
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> From: Brian Norris <computersforpeace@gmail.com>
> 
> commit bd9c6e99b58255b9de1982711ac9487c9a2f18be upstream.
> 
> Use a repeated read_byte() instead of read_buf(), since for x16 buswidth
> devices, we need to avoid the upper I/O[16:9] bits. See the following
> commit for reference:
> 
> commit 05f7835975dad6b3b517f9e23415985e648fb875
> Author: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Date:   Thu Dec 5 22:22:04 2013 +0100
> 
>     mtd: nand: don't use {read,write}_buf for 8-bit transfers
> 
> Now, I think that all barriers to probing ONFI on x16 devices are
> removed, so remove the check from nand_flash_detect_onfi().
> 
> Tested on 8-bit ONFI NAND (Micron MT29F32G08CBADAWP).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Tested-By: Pekon Gupta <pekon@ti.com>
> Cc: Mason <slash.tmp@free.fr>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> ---
>  drivers/mtd/nand/nand_base.c |   14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3063,7 +3063,7 @@ static int nand_flash_detect_onfi(struct
>  					int *busw)
>  {
>  	struct nand_onfi_params *p = &chip->onfi_params;
> -	int i;
> +	int i, j;
>  	int val;
>  
>  	/* Try ONFI for unknown chip or LP */
> @@ -3072,18 +3072,10 @@ static int nand_flash_detect_onfi(struct
>  		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
>  		return 0;
>  
> -	/*
> -	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> -	 * with NAND_BUSWIDTH_16
> -	 */
> -	if (chip->options & NAND_BUSWIDTH_16) {
> -		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
> -		return 0;
> -	}
> -
>  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>  	for (i = 0; i < 3; i++) {
> -		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> +		for (j = 0; j < sizeof(*p); j++)
> +			((uint8_t *)p)[j] = chip->read_byte(mtd);
>  		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
>  				le16_to_cpu(p->crc)) {
>  			break;
> 
> 
> Patches currently in stable-queue which might be from computersforpeace@gmail.com are
> 
> queue-3.14/mtd-nand-fix-erroneous-read_buf-call-in-nand_write_page_raw_syndrome.patch
> queue-3.14/mtd-fix-avoid-race-condition-when-accessing-mtd-usecount.patch
> queue-3.14/mtd-nand-don-t-use-read_buf-for-8-bit-onfi-transfers.patch
> queue-3.14/mtd-dc21285-use-raw-spinlock-functions-for-nw_gpio_lock.patch
