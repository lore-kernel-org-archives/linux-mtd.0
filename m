Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3fnk-0003w4-GP
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 10:38:02 +0000
Received: by mail-wm0-x243.google.com with SMTP id r131so41099563wmb.2
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2018 03:37:50 -0700 (PDT)
Subject: Re: [RFC PATCH 1/4] mtd: spi-nor: Add entry for mt35xu512aba flash
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 frieder.schrempf@exceet.de, suresh.gupta@nxp.com
References: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1522836371-2828-2-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b5ad43f3-1597-d79d-75df-cf1f1e054167@gmail.com>
Date: Wed, 4 Apr 2018 12:35:08 +0200
MIME-Version: 1.0
In-Reply-To: <1522836371-2828-2-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/04/2018 12:06 PM, Yogesh Gaur wrote:
> Add entry for mt35xu512aba Micron NOR flash. This flash is having uniform
> sector erase size of 128KB, have support of FSR(flag status register),
> flash size is 64MB and supports 4-byte commands.
> 
> Some MICRON related macros in spi-nor domain were ST, actually. Added REAL
> micron defination in header/source files.
> 
> This flash supports single bit and octal bit mode cmds.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 7 ++++++-
>  include/linux/mtd/cfi.h       | 1 +
>  include/linux/mtd/spi-nor.h   | 1 +
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d445a4d..a54731b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -272,6 +272,7 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>  
>  	switch (JEDEC_MFR(info)) {
>  	case SNOR_MFR_MICRON:
> +	case SNOR_MFR_MICRONO:

Separate patch adding new vendor ID please.
Also, pick a sane name, maybe even rename the old SNOR_MFR_MICRON.

>  		/* Some Micron need WREN command; all will accept it */
>  		need_wren = true;
>  	case SNOR_MFR_MACRONIX:
> @@ -1091,6 +1092,9 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  
> +	/* Micron Flashes with MFR ID as 0x2c */
> +	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512, SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },

Separate patch for new flash.

Also, split the two-three new patches from this series.

[...]

-- 
Best regards,
Marek Vasut
