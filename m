Received: from 11.mo3.mail-out.ovh.net ([87.98.184.158]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SL9U7-00082P-4T
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 08:46:32 +0000
Received: from mail622.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 79C1EFF94B7
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 10:47:55 +0200 (CEST)
Date: Fri, 20 Apr 2012 10:27:29 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Hong Xu <hong.xu@atmel.com>
Subject: Re: [PATCH v4 2/2] MTD: AT91: Update atmel_nand_data to support PMECC
Message-ID: <20120420082729.GY16641@game.jcrosoft.org>
References: <1334906788-18704-1-git-send-email-hong.xu@atmel.com>
 <1334906788-18704-2-git-send-email-hong.xu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334906788-18704-2-git-send-email-hong.xu@atmel.com>
Cc: nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:26 Fri 20 Apr     , Hong Xu wrote:
> Added two items,
> * correction_cap: PMECC correction capability
> * sector_size:    Sector size for PMECC
> 
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> ---
>  include/linux/platform_data/atmel.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
> index b0f2c56..4d9bfd5 100644
> --- a/include/linux/platform_data/atmel.h
> +++ b/include/linux/platform_data/atmel.h
> @@ -20,6 +20,8 @@ struct atmel_nand_data {
>  	u8		bus_width_16;		/* buswidth is 16 bit */
>  	u8		ecc_mode;		/* ecc mode */
>  	u8		on_flash_bbt;		/* bbt on flash */
> +	u8		correction_cap;		/* PMECC capability */
> +	u16		sector_size;		/* Sector size for PMECC */
as this only used by DT
no need to expose it

Best Regards,
J.
