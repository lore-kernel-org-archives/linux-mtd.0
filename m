Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6n56-0002Dm-Pg
 for linux-mtd@lists.infradead.org; Thu, 01 Jan 2015 21:14:57 +0000
Date: Thu, 1 Jan 2015 22:14:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3 1/3] mtd: nand: add asm9260 NFC driver
Message-ID: <20150101221433.46e25a37@bbrezillon>
In-Reply-To: <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 Dec 2014 13:58:51 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> Add driver for Nand Flash Controller used on Alphascales ASM9260 chips.
> The IP core of this controller has some similarities with
> Evatronix NANDFLASH-CTRL IP (unknown revision), so probably it can be reused
> by some other SoCs.
> 
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  drivers/mtd/nand/Kconfig        |   7 +
>  drivers/mtd/nand/Makefile       |   1 +
>  drivers/mtd/nand/asm9260_nand.c | 989 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 997 insertions(+)
>  create mode 100644 drivers/mtd/nand/asm9260_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index dd10646..580a608 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -41,6 +41,13 @@ config MTD_SM_COMMON
>  	tristate
>  	default n

[...]

> +
> +static void asm9260_nand_command_lp(struct mtd_info *mtd,
> +		unsigned int command, int column, int page_addr)
> +{
> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> +
> +	switch (command) {
> +	case NAND_CMD_RESET:
> +		asm9260_nand_cmd_prep(priv, NAND_CMD_RESET, 0, 0, SEQ0);
> +		asm9260_nand_cmd_comp(mtd, 0);
> +		break;
> +
> +	case NAND_CMD_READID:
> +		iowrite32(1, priv->base + HW_FIFO_INIT);
> +		iowrite32((ADDR_CYCLE_1 << BM_CTRL_ADDR_CYCLE1_S)
> +			| BM_CTRL_CUSTOM_PAGE_SIZE
> +			| (PAGE_SIZE_4096B << BM_CTRL_PAGE_SIZE_S)
> +			| (BLOCK_SIZE_32P << BM_CTRL_BLOCK_SIZE_S)
> +			| BM_CTRL_INT_EN
> +			| (ADDR_CYCLE_1 << BM_CTRL_ADDR_CYCLE0_S),
> +			priv->base + HW_CTRL);
> +
> +		iowrite32(8, priv->base + HW_DATA_SIZE);
> +		iowrite32(column, priv->base + HW_ADDR0_0);
> +		asm9260_nand_cmd_prep(priv, NAND_CMD_READID, 0, 0, SEQ1);
> +
> +		priv->read_cache_cnt = 0;
> +		break;
> +
> +	case NAND_CMD_READOOB:
> +		column += mtd->writesize;
> +		command = NAND_CMD_READ0;
> +	case NAND_CMD_READ0:
> +		iowrite32(1, priv->base + HW_FIFO_INIT);
> +
> +		if (column == 0) {
> +			asm9260_nand_ctrl(priv, 0);
> +			iowrite32(priv->spare_size, priv->base + HW_SPARE_SIZE);
> +		} else if (column == mtd->writesize) {
> +			asm9260_nand_ctrl(priv, BM_CTRL_CUSTOM_PAGE_SIZE);
> +			iowrite32(mtd->oobsize, priv->base + HW_SPARE_SIZE);
> +			iowrite32(mtd->oobsize, priv->base + HW_DATA_SIZE);
> +		} else {
> +			dev_err(priv->dev, "Couldn't support the column\n");
> +			break;
> +		}
> +
> +		asm9260_nand_set_addr(priv, page_addr, column);
> +
> +		asm9260_nand_cmd_prep(priv, NAND_CMD_READ0,
> +				NAND_CMD_READSTART, 0, SEQ10);
> +
> +		priv->read_cache_cnt = 0;
> +		break;
> +	case NAND_CMD_SEQIN:
> +		iowrite32(1, priv->base + HW_FIFO_INIT);
> +
> +		if (column == 0) {
> +			priv->page_cache = page_addr;
> +			asm9260_nand_ctrl(priv, 0);
> +			iowrite32(priv->spare_size, priv->base + HW_SPARE_SIZE);
> +		} else if (column == mtd->writesize) {
> +			asm9260_nand_ctrl(priv, BM_CTRL_CUSTOM_PAGE_SIZE);
> +			iowrite32(mtd->oobsize, priv->base + HW_DATA_SIZE);
> +		}
> +
> +		asm9260_nand_set_addr(priv, page_addr, column);
> +
> +		asm9260_nand_cmd_prep(priv, NAND_CMD_SEQIN, NAND_CMD_PAGEPROG,
> +			0, SEQ12);
> +
> +		break;
> +	case NAND_CMD_STATUS:
> +		iowrite32(1, priv->base + HW_FIFO_INIT);
> +		asm9260_nand_ctrl(priv, BM_CTRL_CUSTOM_PAGE_SIZE);
> +
> +		/*
> +		 * Workaround for status bug.
> +		 * Instead of SEQ4 we need to use SEQ1 here, which will
> +		 * send cmd with address. For this case we need to make sure
> +		 * ADDR == 0.
> +		 */
> +		asm9260_nand_set_addr(priv, 0, 0);
> +		iowrite32(4, priv->base + HW_DATA_SIZE);
> +		asm9260_nand_cmd_prep(priv, NAND_CMD_STATUS, 0, 0, SEQ1);
> +
> +		priv->read_cache_cnt = 0;
> +		break;
> +
> +	case NAND_CMD_ERASE1:
> +		priv->wait_time = 400;
> +		asm9260_nand_set_addr(priv, page_addr, column);
> +
> +		asm9260_nand_ctrl(priv, 0);
> +
> +		/*
> +		 * Prepare and send command now. We don't need to split it in
> +		 * two stages.
> +		 */
> +		asm9260_nand_cmd_prep(priv, NAND_CMD_ERASE1, NAND_CMD_ERASE2,
> +				0, SEQ14);
> +		asm9260_nand_cmd_comp(mtd, 0);
> +		break;
> +	default:
> +		break;

You should support other NAND commands (like the ONFI related ones)
instead of silently ignoring them.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
