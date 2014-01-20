Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5KeD-0001vX-IJ
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:36:38 +0000
Received: by mail-ig0-f173.google.com with SMTP id c10so8801666igq.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:36:16 -0800 (PST)
Date: Mon, 20 Jan 2014 11:36:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: add support for SanDisk SDTNRGAMA-008G
Message-ID: <20140120193613.GP8919@ld-irv-0074>
References: <1388043465-17441-1-git-send-email-b32955@freescale.com>
 <1388727423-8997-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388727423-8997-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 01:37:03PM +0800, Huang Shijie wrote:
> The datasheet does not tell us how to parse out the ID data,
> so handle it as a full ID nand.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_ids.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index 136a463..d3dbf59 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -43,6 +43,9 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	{"TC58NVG6D2 64G 3.3V 8-bit",
>  		{ .id = {0x98, 0xde, 0x94, 0x82, 0x76, 0x56, 0x04, 0x20} },
>  		  SZ_8K, SZ_8K, SZ_2M, 0, 8, 640, NAND_ECC_INFO(40, SZ_1K) },
> +	{"SDTNRGAMA 64G 3.3V 8-bit",
> +		{ .id = {0x45, 0xde, 0x94, 0x93, 0x76, 0x50} },
> +		  SZ_16K, SZ_8K, SZ_4M, 0, 6, 1280, NAND_ECC_INFO(40, SZ_1K) },

Looks OK, but I haven't pushed your 16KB page support (killing
NAND_MAX_PAGESIZE) yet, so this will have to wait until that has
settled. I'll probably either bump NAND_MAX_PAGESIZE to 16K temporarily,
or I'll squeeze your patch into the 3.14 pull request.

>  
>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),

Brian
