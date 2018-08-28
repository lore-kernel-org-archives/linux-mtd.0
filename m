Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fudxm-00076T-FE
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 13:23:21 +0000
Date: Tue, 28 Aug 2018 15:23:05 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liu Xiang <liu.xiang6@zte.com.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, han.xu@nxp.com, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 liuxiang_1999@126.com
Subject: Re: [PATCH v2] mtd: spi-nor: fsl-quadspi: fix read error for flash
 size  larger than 16MB
Message-ID: <20180828152305.18df57e2@bbrezillon>
In-Reply-To: <1535462476-3540-1-git-send-email-liu.xiang6@zte.com.cn>
References: <1535462476-3540-1-git-send-email-liu.xiang6@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Aug 2018 21:21:16 +0800
Liu Xiang <liu.xiang6@zte.com.cn> wrote:

> If the size of spi-nor flash is larger than 16MB, the read_opcode
> is set to SPINOR_OP_READ_1_1_4_4B, and fsl_qspi_get_seqid() will
> return -EINVAL when cmd is SPINOR_OP_READ_1_1_4_4B. This can
> cause read operation fail.
> 
> ---
> v2:
>   add Fixes tag and CC stable suggested by Boris.
> ---

The above changelog

> 
> Fixes: e46ecda764dc ("mtd: spi-nor: Add Freescale QuadSPI driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> ---

should be placed here.

>  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 7d9620c..64304a3 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -478,6 +478,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>  {
>  	switch (cmd) {
>  	case SPINOR_OP_READ_1_1_4:
> +	case SPINOR_OP_READ_1_1_4_4B:
>  		return SEQID_READ;
>  	case SPINOR_OP_WREN:
>  		return SEQID_WREN;
