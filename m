Received: from 6.mo7.mail-out.ovh.net ([188.165.39.218])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8OG5-0002PO-Na
 for linux-mtd@lists.infradead.org; Wed, 10 May 2017 09:50:15 +0000
Received: from player788.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 88A6C4CF52
 for <linux-mtd@lists.infradead.org>; Wed, 10 May 2017 11:49:41 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: fix compiler errors with
 COMPILE_TEST
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org
References: <861b57d26929934bfc99e8db691a483ee1e2cada.1493926168.git.cyrille.pitchen@wedev4u.fr>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <b52d41fa-32e6-e4b0-f04c-32f0c2757c4c@wedev4u.fr>
Date: Wed, 10 May 2017 11:49:31 +0200
MIME-Version: 1.0
In-Reply-To: <861b57d26929934bfc99e8db691a483ee1e2cada.1493926168.git.cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 04/05/2017 à 21:39, Cyrille Pitchen a écrit :
> This patch fixes some compiler errors:
> - change format strings to use %zx for size_t
> - add missing #include <linux/sizes.h>
> 
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

Applied to the github/spi-nor tree


> ---
>  drivers/mtd/spi-nor/stm32-quadspi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 1056e7408d2a..86c0931543c5 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> +#include <linux/sizes.h>
>  
>  #define QUADSPI_CR		0x00
>  #define CR_EN			BIT(0)
> @@ -375,7 +376,7 @@ static ssize_t stm32_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	struct stm32_qspi_cmd cmd;
>  	int err;
>  
> -	dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#x\n",
> +	dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#zx\n",
>  		nor->read_opcode, buf, (u32)from, len);
>  
>  	memset(&cmd, 0, sizeof(cmd));
> @@ -402,7 +403,7 @@ static ssize_t stm32_qspi_write(struct spi_nor *nor, loff_t to, size_t len,
>  	struct stm32_qspi_cmd cmd;
>  	int err;
>  
> -	dev_dbg(dev, "write(%#.2x): buf:%p to:%#.8x len:%#x\n",
> +	dev_dbg(dev, "write(%#.2x): buf:%p to:%#.8x len:%#zx\n",
>  		nor->program_opcode, buf, (u32)to, len);
>  
>  	memset(&cmd, 0, sizeof(cmd));
> 
