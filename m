Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7Lj3-0002hT-Lg
 for linux-mtd@lists.infradead.org; Thu, 08 Aug 2013 08:37:42 +0000
Message-ID: <520358BD.6000808@freescale.com>
Date: Thu, 8 Aug 2013 16:37:17 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 0/4] Export the ecc step size to user applications
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607606-4344-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem & Brian:
> In order to implement the NAND boot for some Freescale's chips, such as
> imx23/imx28/imx50/imx6, we use a tool (called kobs-ng) to burn the uboot
> and some metadata to nand chip. And the ROM code will use the metadata to
> configrate the BCH, and to find the uboot.
>
> The ECC information(ecc step size, ecc strength) which is used to configrate
> the BCH is part of the metadata. The kobs-ng can gets the ecc strength from
> the sys node /sys/*/mtdX/ecc_strength now. But it can't gets the ecc step size.
>
> This patch set is used to export the ecc step size to user applications.
> With this patch set, the kobs-ng can gets the ecc step size now.
>
> v1 --> v2:
> 	[1] rename the ecc_size to ecc_step.
> 	[2] rebase on the latest l2-mtd.
>
> Huang Shijie (4):
>   mtd: add a new field to mtd_info{}
>   mtd: add a new sys node to show the ecc step size
>   mtd: set the ecc step size for master/slave mtd_info
>   mtd: gpmi: update the ecc step size for mtd_info{}
>
>  drivers/mtd/mtdcore.c                  |   11 +++++++++++
>  drivers/mtd/mtdpart.c                  |    1 +
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
>  drivers/mtd/nand/nand_base.c           |    1 +
>  include/linux/mtd/mtd.h                |    3 +++
>  5 files changed, 17 insertions(+), 0 deletions(-)
>
Could you merge this patch set ?

thanks
Huang Shijie
