From: Richard Weinberger <richard@nod.at>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] mtd: stm32-quadspi: replace "%p" with "%pK"
Date: Fri, 06 Jul 2018 16:44:44 +0200
Message-ID: <32602293.7BQn8HeLUA@blindfold>
In-Reply-To: <20180706130525.22223-1-benjamin.gaignard@st.com>
References: <20180706130525.22223-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 6. Juli 2018, 15:05:25 CEST schrieb Benjamin Gaignard:
> The format specifier "%p" can leak kernel addresses.
> Use "%pK" instead.

Does %pK really make sense for dev_dbg()?
When the driver is being debugged "leaking" is on purpose. :)

Thanks,
//richard
 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/mtd/spi-nor/stm32-quadspi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 72553506a00b..13e9fc961d3b 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -355,7 +355,7 @@ static int stm32_qspi_read_reg(struct spi_nor *nor,
>  	struct device *dev = flash->qspi->dev;
>  	struct stm32_qspi_cmd cmd;
>  
> -	dev_dbg(dev, "read_reg: cmd:%#.2x buf:%p len:%#x\n", opcode, buf, len);
> +	dev_dbg(dev, "read_reg: cmd:%#.2x buf:%pK len:%#x\n", opcode, buf, len);
>  
>  	memset(&cmd, 0, sizeof(cmd));
>  	cmd.opcode = opcode;
> @@ -376,7 +376,7 @@ static int stm32_qspi_write_reg(struct spi_nor *nor, u8 opcode,
>  	struct device *dev = flash->qspi->dev;
>  	struct stm32_qspi_cmd cmd;
>  
> -	dev_dbg(dev, "write_reg: cmd:%#.2x buf:%p len:%#x\n", opcode, buf, len);
> +	dev_dbg(dev, "write_reg: cmd:%#.2x buf:%pK len:%#x\n", opcode, buf, len);
>  
>  	memset(&cmd, 0, sizeof(cmd));
>  	cmd.opcode = opcode;
> @@ -398,7 +398,7 @@ static ssize_t stm32_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	struct stm32_qspi_cmd cmd;
>  	int err;
>  
> -	dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#zx\n",
> +	dev_dbg(qspi->dev, "read(%#.2x): buf:%pK from:%#.8x len:%#zx\n",
>  		nor->read_opcode, buf, (u32)from, len);
>  
>  	memset(&cmd, 0, sizeof(cmd));
> 
