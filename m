Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an95b-0001OV-So
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 18:19:04 +0000
Subject: Re: [PATCH] mtd: gpmi: fix raw_buffer pointer double free issue
To: Han Xu <han.xu@nxp.com>, boris.brezillon@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
References: <1459790710-25747-1-git-send-email-han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5702AFFF.1010700@nod.at>
Date: Mon, 4 Apr 2016 20:18:39 +0200
MIME-Version: 1.0
In-Reply-To: <1459790710-25747-1-git-send-email-han.xu@nxp.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.04.2016 um 19:25 schrieb Han Xu:
> fix the raw_buffer pointer double free issue found by coverify.

Can you please include the coverity message in you changelog?

> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 8122c69..dcb60b0 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -797,6 +797,7 @@ static void gpmi_free_dma_buffer(struct gpmi_nand_data *this)
>  
>  	this->cmd_buffer	= NULL;
>  	this->data_buffer_dma	= NULL;
> +	this->raw_buffer	= NULL;
>  	this->page_buffer_virt	= NULL;
>  	this->page_buffer_size	=  0;

So, gpmi_free_dma_buffer() is called twice and therefore we need to NULL all
these pointers?

Thanks,
//richard
