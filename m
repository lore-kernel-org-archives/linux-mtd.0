Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAwqz-0005QM-TM
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 12:47:50 +0000
Date: Fri, 12 Oct 2018 14:47:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liu Xiang <liu.xiang6@zte.com.cn>
Cc: linux-mtd@lists.infradead.org, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 marek.vasut@gmail.com, liuxiang_1999@126.com, han.xu@nxp.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH v3] mtd: spi-nor: fsl-quadspi: fix read error for flash
 size larger than 16MB
Message-ID: <20181012144720.799a855f@bbrezillon>
In-Reply-To: <1535466777-3833-1-git-send-email-liu.xiang6@zte.com.cn>
References: <1535466777-3833-1-git-send-email-liu.xiang6@zte.com.cn>
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

On Tue, 28 Aug 2018 22:32:57 +0800
Liu Xiang <liu.xiang6@zte.com.cn> wrote:

> If the size of spi-nor flash is larger than 16MB, the read_opcode
> is set to SPINOR_OP_READ_1_1_4_4B, and fsl_qspi_get_seqid() will
> return -EINVAL when cmd is SPINOR_OP_READ_1_1_4_4B. This can
> cause read operation fail.
> 
> Fixes: e46ecda764dc ("mtd: spi-nor: Add Freescale QuadSPI driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>

Queued to spi-nor/next.

Thanks,

Boris

> ---
> 
> Changes in v3:
>  move changelog position.
> 
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
