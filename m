Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eywNm-0006Tl-AR
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 09:19:39 +0000
Subject: Re: [PATCH v7 2/2] mtd: fsl-quadspi: fix init AHB read in
 fsl_qspi_nor_setup()
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 marek.vasut@gmail.com, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
References: <1521631565-24413-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1521631565-24413-3-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <c6dd17bd-672e-89b5-af95-ee6359a6d5e9@exceet.de>
Date: Thu, 22 Mar 2018 10:19:25 +0100
MIME-Version: 1.0
In-Reply-To: <1521631565-24413-3-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi Yogesh,

On 21.03.2018 12:26, Yogesh Gaur wrote:
> Move AHB read initialize in fsl_qspi_nor_setup().
> 
> In file spi-nor.c, func spi_nor_scan() calls nor->read() thru
> spi_nor_read_sfdp() API.
> 
> Presently, fsl_qspi_init_ahb_read() called from fsl_qspi_nor_setup_last().
> Func fsl_qspi_probe() calls spi_nor_scan() first and then calls
> fsl_qspi_nor_setup_last().
> 
> When nor->read() being called from inside spi_nor_read_sfdp(), QSPI cntlr
> AHB mode initialization is not yet done results in data read error.
> 
> Initialize AHB read inside fsl_qspi_nor_setup().
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Changes for v7:
> - None
> Changes for v6:
> - None
> Changes for v5:
> - None
> Changes for v4:
> - None
> Changes for v3:
> - None
> Changes for v2:
> - None
> 
>   drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 64b8bb3..424094a 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -820,6 +820,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>   	/* enable the interrupt */
>   	qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
>   
> +	/* Init for AHB read */
> +	fsl_qspi_init_ahb_read(q);

Maybe I missed something, but it seems if you move 
fsl_qspi_init_ahb_read() here and fsl_qspi_read() is used before 
fsl_qspi_nor_setup_last() is called, then the read command is triggered 
with an uninitialized LUT entry (SEQID_LUT2_AHBREAD).

So shouldn't the LUT entry for AHB read be initialized with some default 
values here, before spi_nor_scan() is called?

Thanks,

Frieder

> +
>   	return 0;
>   }
>   
> @@ -842,9 +845,6 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>   	if (ret)
>   		return ret;
>   
> -	/* Init for AHB read */
> -	fsl_qspi_init_ahb_read(q);
> -
>   	/* Prepare LUT for AHB read - required for read from devmem interface */
>   	fsl_qspi_prep_ahb_read(q);
>   
> 
