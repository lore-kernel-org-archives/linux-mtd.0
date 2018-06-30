Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: Fix direct mode write
 timeouts
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20180630105421.550-1-vigneshr@ti.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b029ab9a-782b-b2d8-a80e-ae8e5c5e511d@gmail.com>
Date: Sat, 30 Jun 2018 15:21:33 +0200
MIME-Version: 1.0
In-Reply-To: <20180630105421.550-1-vigneshr@ti.com>
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

On 06/30/2018 12:54 PM, Vignesh R wrote:
> Sometimes when writing large size files to flash in direct/memory mapped
> mode, it is seen that flash write enable command times out with error:
> [  503.146293] cadence-qspi 47040000.ospi: Flash command execution timed out.
> 
> This is because, we need to make sure previous direct write operation
> is complete by polling for IDLE bit in CONFIG_REG before starting the
> next operation.
> 
> Fix this by polling for IDLE bit after memory mapped write.
> 
> Fixes: a27f2eaf2b27 ("mtd: spi-nor: cadence-quadspi: Add support for direct access mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vignesh R <vigneshr@ti.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index c3f7aaa5d18f..d7e10b36a0b9 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -926,10 +926,12 @@ static ssize_t cqspi_write(struct spi_nor *nor, loff_t to,
>  	if (ret)
>  		return ret;
>  
> -	if (f_pdata->use_direct_mode)
> +	if (f_pdata->use_direct_mode) {
>  		memcpy_toio(cqspi->ahb_base + to, buf, len);
> -	else
> +		ret = cqspi_wait_idle(cqspi);
> +	} else {
>  		ret = cqspi_indirect_write_execute(nor, to, buf, len);
> +	}
>  	if (ret)
>  		return ret;
>  
> 


-- 
Best regards,
Marek Vasut
