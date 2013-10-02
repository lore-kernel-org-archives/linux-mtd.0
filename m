Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRRRR-0003P8-Fz
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:46:34 +0000
Received: by mail-oa0-f53.google.com with SMTP id i7so1219387oag.26
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 11:46:12 -0700 (PDT)
Date: Wed, 2 Oct 2013 11:46:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Flavio Silveira <fggs@terra.com.br>
Subject: Re: [PATCH v2] mtd: m25p80: Add support for ESMT F25L32PA
Message-ID: <20131002184609.GS23337@ld-irv-0074.broadcom.com>
References: <n>
 <1378250755-2674-1-git-send-email-fggs@terra.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378250755-2674-1-git-send-email-fggs@terra.com.br>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 03, 2013 at 08:25:54PM -0300, Flavio Silveira wrote:
> This flashchip is used in D-Link DIR-610 A1 router board 
> and maybe several others, yet is not kernel upstream.
> 
> So add support for it according to datasheet [0], making it easier
> to support other boards using this flashchip in the future.
> 
> Changelog v2:
>  - Better description
>  - Datasheet link at the bottom, similar to other patches.
> 
> [0] http://www.esmt.com.tw/DB/manager/upload/F25L32PA.pdf 
> 
> Signed-off-by: Flavio Silveira <fggs@terra.com.br>
> ---
>  drivers/mtd/devices/m25p80.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 2f3d2a5..3a3cf2d 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -731,6 +731,9 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
>  
> +	/* ESMT */
> +	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
> +
>  	/* Everspin */
>  	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
>  

Removed the changelog and pushed to l2-mtd.git. Thanks!

Brian
