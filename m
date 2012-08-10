From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: add NAND write verify support
Date: Fri, 10 Aug 2012 13:25:22 +0200
References: <1344568737-902-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1344568737-902-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208101325.23075.marex@denx.de>
Cc: fabio.estevam@freescale.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> Add NAND write verify support in gpmi-nand driver.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index 8c0d2f0..6394483 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1488,6 +1488,22 @@ static int gpmi_set_geometry(struct gpmi_nand_data
> *this) return gpmi_alloc_dma_buffer(this);
>  }
> 
> +#define MAX_PAGESIZE 8192

Use NAND_MAX_PAGESIZE, see include/linux/mtd/nand.h .

> +static uint8_t verify_buf[MAX_PAGESIZE];

What will happen when you have two NANDs attached to GPMI controller and they 
hit this place both at once? Race condition, causing this function to fail for 
both?

Possibly devm_kmalloc() such buffer per-controller?

> +static int gpmi_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int
> len) +{
> +	struct nand_chip *nand = mtd->priv;
> +	int ret;
> +
> +	ret = gpmi_ecc_read_page(mtd, nand, verify_buf, 0, 0);

mtd->chip.ecc.read_page() ?

> +	if (ret)
> +		return -EFAULT;
> +	if (memcmp(buf, verify_buf, len))
> +		return -EFAULT;
> +	return 0;
> +}
> +
>  static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
>  {
>  	int ret;
> @@ -1556,6 +1572,7 @@ static int __devinit gpmi_nfc_init(struct
> gpmi_nand_data *this) chip->read_byte		= gpmi_read_byte;
>  	chip->read_buf		= gpmi_read_buf;
>  	chip->write_buf		= gpmi_write_buf;
> +	chip->verify_buf	= gpmi_verify_buf;
>  	chip->ecc.read_page	= gpmi_ecc_read_page;
>  	chip->ecc.write_page	= gpmi_ecc_write_page;
>  	chip->ecc.read_oob	= gpmi_ecc_read_oob;

Best regards,
Marek Vasut
