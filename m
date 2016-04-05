Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anT9H-00017L-6P
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 15:44:11 +0000
Date: Tue, 5 Apr 2016 17:43:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: gpmi: fix raw_buffer pointer double free issue
Message-ID: <20160405174341.673e1141@bbrezillon>
In-Reply-To: <1459802489-30382-1-git-send-email-han.xu@nxp.com>
References: <1459802489-30382-1-git-send-email-han.xu@nxp.com>
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

On Mon, 4 Apr 2016 15:41:29 -0500
Han Xu <han.xu@nxp.com> wrote:

> fix the raw_buffer pointer double free issue found by coverify.
> 
> CID 18344 (#2 of 2): Double free (USE_AFTER_FREE)
> 3. double_free: Calling gpmi_alloc_dma_buffer frees pointer
> this->raw_buffer which has already been freed
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied.

Thanks,

Boris

> ---
> 
> changes in v2:
>  - add coverity check log
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
>  }



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
