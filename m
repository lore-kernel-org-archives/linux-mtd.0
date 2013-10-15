Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW4vM-00009v-9p
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 13:44:38 +0000
From: Marek Vasut <marex@denx.de>
To: Priyanka Jain <Priyanka.Jain@freescale.com>
Subject: Re: [PATCH][v2] mtd: m25p80: Add support for Micron N25Q512A memory
Date: Tue, 15 Oct 2013 15:44:11 +0200
References: <1381815545-4518-1-git-send-email-Priyanka.Jain@freescale.com>
In-Reply-To: <1381815545-4518-1-git-send-email-Priyanka.Jain@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310151544.11481.marex@denx.de>
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Priyanka Jain,

> Micron N25Q512A is a spi flash memory with following features:
> -64MB size, 1.8V, Mulitple I/O, 4KB Sector erase memory.
> -Memory is organised as 1024(64KB) main sectors.
> -Each sector is divided into 256 pages.
> -Register set/Opcodes are similar to other N25Q family products.
> 
> Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>

Feel free to add my

Acked-by: Marek Vasut <marex@denx.de>

Thanks!

> ---
>  Changes for v2:
> 	Corrected number of sectors to 1024 based on
> 	inputs from Marek Vasut and Brian Norris
> 
>  drivers/mtd/devices/m25p80.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 26b14f9..94e3b53 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -774,6 +774,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
>  	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
> +	{ "n25q512a", INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> 
>  	/* PMC */
>  	{ "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },

Best regards,
Marek Vasut
