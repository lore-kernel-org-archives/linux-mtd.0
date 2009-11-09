Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7Scb-00049o-22
	for linux-mtd@lists.infradead.org; Mon, 09 Nov 2009 11:41:25 +0000
Subject: Re: [PATCH resend] mtd/maps: Fix accidental removal in Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20091108.024307.183026733.anemo@mba.ocn.ne.jp>
References: <20091108.024307.183026733.anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Nov 2009 13:40:53 +0200
Message-Id: <1257766853.21596.292.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>, dwmw2@infradead.org,
	akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-11-08 at 02:43 +0900, Atsushi Nemoto wrote:
> The commit d79c326 ("gpio-addr-flash: new driver for GPIO assisted
> flash addressing") removed two lines from the Makefile by accident.
> Though I'm not sure how this accident happened, this patch reverts the
> removal.
> 
> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> ---
> This patch fixes a regression from 2.6.31
> 
>  drivers/mtd/maps/Makefile |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 1d5cf86..ae2f6db 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -58,4 +58,6 @@ obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
>  obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
>  obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
>  obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
> +obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
> +obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
>  obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o

This patch is in my l2-mtd-2.6 tree now, but I think it should be merged
to 2.6.32-rcX.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
