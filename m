Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddXMF-00036l-0x
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 07:49:23 +0000
Date: Fri, 4 Aug 2017 09:48:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 09/25] mtd: nand: qcom: remove memset for clearing
 read register buffer
Message-ID: <20170804094852.59c9fbcb@bbrezillon>
In-Reply-To: <1500464893-11352-10-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-10-git-send-email-absahu@codeaurora.org>
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

On Wed, 19 Jul 2017 17:17:57 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> The memset in clear_read_regs is overhead. All the register data
> will be filled by DMA during NAND operation so making these
> register variables zero is not required.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 5b71478..7ecd0f8 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -826,8 +826,6 @@ static void free_descs(struct qcom_nand_controller *nandc)
>  static void clear_read_regs(struct qcom_nand_controller *nandc)
>  {
>  	nandc->reg_read_pos = 0;
> -	memset(nandc->reg_read_buf, 0,
> -	       MAX_REG_RD * sizeof(*nandc->reg_read_buf));
>  }
>  
>  static void pre_command(struct qcom_nand_host *host, int command)
