Received: from yw-out-1718.google.com ([74.125.46.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYu5J-0003T1-J3
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 02:51:38 +0000
Received: by yw-out-1718.google.com with SMTP id 5so90714ywm.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Aug 2008 19:51:36 -0700 (PDT)
Message-ID: <f17812d70808281951j4089ddeclc6f4d0a662da68e@mail.gmail.com>
Date: Fri, 29 Aug 2008 10:51:36 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "Semun Lee" <semun.lee@samsung.com>
Subject: Re: [PATCH] pxa3xx_nand: Add STM2GbX16
In-Reply-To: <20080829020341.GA23703@semunlee-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080829020341.GA23703@semunlee-desktop>
Cc: David Woodhouse <dwmw2@infradead.org>, eric.miao@marvell.com,
	linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 29, 2008 at 10:03 AM, Semun Lee <semun.lee@samsung.com> wrote:
> Add definition of STM2GbX16 NAND flashes
>
> Signed-off-by: Semun Lee <semun.lee@samsung.com>

Looks fine to me,

Acked-by: Eric Miao <eric.miao@marvell.com>

David, could you please help merge this one?

>
>  drivers/mtd/nand/pxa3xx_nand.c |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -291,10 +291,33 @@ static struct pxa3xx_nand_flash micron1GbX16 = {
>        .chip_id        = 0xb12c,
>  };
>
> +static struct pxa3xx_nand_timing stm2GbX16_timing = {
> +       .tCH = 10,
> +       .tCS = 35,
> +       .tWH = 15,
> +       .tWP = 25,
> +       .tRH = 15,
> +       .tRP = 25,
> +       .tR = 25000,
> +       .tWHR = 60,
> +       .tAR = 10,
> +};
> +
> +static struct pxa3xx_nand_flash stm2GbX16 = {
> +       .timing = &stm2GbX16_timing,
> +       .page_per_block = 64,
> +       .page_size = 2048,
> +       .flash_width = 16,
> +       .dfc_width = 16,
> +       .num_blocks = 2048,
> +       .chip_id = 0xba20,
> +};
> +
>  static struct pxa3xx_nand_flash *builtin_flash_types[] = {
>        &samsung512MbX16,
>        &micron1GbX8,
>        &micron1GbX16,
> +       &stm2GbX16,
>  };
>
>  #define NDTR0_tCH(c)   (min((c), 7) << 19)
>
>
> --
> Best Regards,
> Semun.
>
> -------------------------------------------------------------------
> List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
> FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
> Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
>



-- 
Cheers
- eric
