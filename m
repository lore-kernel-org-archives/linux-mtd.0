Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSKLk-0004FI-AY
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 10:14:45 +0000
Subject: Re: [PATCH] mtd: spi-nor: use _lock_and_prep() in _read_sfdp()
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <prabhakar.kushwaha@nxp.com>,
 <suresh.gupta@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>
References: <1513931752-23387-1-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <39a223af-234f-84ea-bb8b-b5684346ac82@ti.com>
Date: Fri, 22 Dec 2017 15:44:45 +0530
MIME-Version: 1.0
In-Reply-To: <1513931752-23387-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset="utf-8"
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

Hi,

On Friday 22 December 2017 02:05 PM, Yogesh Gaur wrote:
> spi_nor_read_sfdp() calls nor->read() to read the SFDP data.
> But first needs to call nor->prepare() to prepare the READ command before
> calling nor->read().
> 
> Patch adds call to spi_nor_lock_and_prep() to prepare the READ command
> and add subsequent call to spi_nor_unlock_and_unprep() to release lock
> and call nor->unprepare().
> 

Can spi_nor_read() be used here instead then?

> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2203d6ef..9fb85ae 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1807,6 +1807,10 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  	nor->addr_width = 3;
>  	nor->read_dummy = 8;
>  
> +	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_READ);
> +	if (ret)
> +		goto lock_err;
> +
>  	while (len) {
>  		ret = nor->read(nor, addr, len, (u8 *)buf);
>  		if (!ret || ret > len) {
> @@ -1822,6 +1826,8 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  	}
>  	ret = 0;
>  
> +	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
> +lock_err:
>  read_err:
>  	nor->read_opcode = read_opcode;
>  	nor->addr_width = addr_width;
> 

-- 
Regards
Vignesh
