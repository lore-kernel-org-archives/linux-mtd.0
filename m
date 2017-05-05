Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6Xon-0006R8-NA
 for linux-mtd@lists.infradead.org; Fri, 05 May 2017 07:38:27 +0000
Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: fix compiler errors with
 COMPILE_TEST
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <861b57d26929934bfc99e8db691a483ee1e2cada.1493926168.git.cyrille.pitchen@wedev4u.fr>
CC: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <2b41a072-f160-2245-5cbe-f380a0cc657d@st.com>
Date: Fri, 5 May 2017 09:36:32 +0200
MIME-Version: 1.0
In-Reply-To: <861b57d26929934bfc99e8db691a483ee1e2cada.1493926168.git.cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 05/04/2017 09:39 PM, Cyrille Pitchen wrote:
> This patch fixes some compiler errors:
> - change format strings to use %zx for size_t
> - add missing #include <linux/sizes.h>
>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> ---
>   drivers/mtd/spi-nor/stm32-quadspi.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 1056e7408d2a..86c0931543c5 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -19,6 +19,7 @@
>   #include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/reset.h>
> +#include <linux/sizes.h>
>   
>   #define QUADSPI_CR		0x00
>   #define CR_EN			BIT(0)
> @@ -375,7 +376,7 @@ static ssize_t stm32_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
>   	struct stm32_qspi_cmd cmd;
>   	int err;
>   
> -	dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#x\n",
> +	dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#zx\n",
>   		nor->read_opcode, buf, (u32)from, len);
>   
>   	memset(&cmd, 0, sizeof(cmd));
> @@ -402,7 +403,7 @@ static ssize_t stm32_qspi_write(struct spi_nor *nor, loff_t to, size_t len,
>   	struct stm32_qspi_cmd cmd;
>   	int err;
>   
> -	dev_dbg(dev, "write(%#.2x): buf:%p to:%#.8x len:%#x\n",
> +	dev_dbg(dev, "write(%#.2x): buf:%p to:%#.8x len:%#zx\n",
>   		nor->program_opcode, buf, (u32)to, len);
>   
>   	memset(&cmd, 0, sizeof(cmd));
Reviewed-by: Ludovic Barre <ludovic.barre@st.com>
