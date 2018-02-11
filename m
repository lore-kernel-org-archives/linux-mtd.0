Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ekquj-0001di-UD
 for linux-mtd@lists.infradead.org; Sun, 11 Feb 2018 12:39:27 +0000
Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement anyreg functions for
 fsl-quadspi
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 poonam.aggrwal@nxp.com, suresh.gupta@nxp.com, yogeshnarayan.gaur@nxp.com
References: <1517494776-2816-1-git-send-email-prabhakar.kushwaha@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <7cb5b7ec-b6f9-651c-ca22-e1ccb7b60c06@wedev4u.fr>
Date: Sun, 11 Feb 2018 13:39:12 +0100
MIME-Version: 1.0
In-Reply-To: <1517494776-2816-1-git-send-email-prabhakar.kushwaha@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Prabhakar,

Le 01/02/2018 à 15:19, Prabhakar Kushwaha a écrit :
> Read Any Register and Write Any Register commands provides a way to
> read or write all device registers - non-volatile and volatile.
> These commands are followed by a 3- or 4-byte address, followed by
> a number of latency (dummy) cycles set by volatile configuration
> registers. Then the selected register contents are returned or written.
> 
> This patch update quadspi controller driver to implement above behavior.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 2e44234..87f87ed 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -893,6 +893,22 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  	return ret;
>  }
>  
> +static int fsl_qspi_read_anyreg(struct spi_nor *nor, u8 opcode, u32 offset,
> +				u8 *buf, int len)
> +{
> +	/* TODO: It will be updated during controller changes*/
> +

I guess new handlers should be added at the same time they are implemented.

Best regards,

Cyrille

> +	return 0;
> +}
> +
> +static int fsl_qspi_write_anyreg(struct spi_nor *nor, u8 opcode, u32 offset,
> +				 u8 *buf, int len)
> +{
> +	/* TODO: It will be updated during controller changes*/
> +
> +	return 0;
> +}
> +
>  static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
>  			      size_t len, const u_char *buf)
>  {
> @@ -1100,6 +1116,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		/* fill the hooks */
>  		nor->read_reg = fsl_qspi_read_reg;
>  		nor->write_reg = fsl_qspi_write_reg;
> +		nor->read_anyreg = fsl_qspi_read_anyreg;
> +		nor->write_anyreg = fsl_qspi_write_anyreg;
>  		nor->read = fsl_qspi_read;
>  		nor->write = fsl_qspi_write;
>  		nor->erase = fsl_qspi_erase;
> 
