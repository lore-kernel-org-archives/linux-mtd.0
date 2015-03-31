Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcmU3-0000yk-AF
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 03:04:56 +0000
Received: by pdnc3 with SMTP id c3so5875240pdn.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 20:04:32 -0700 (PDT)
Date: Mon, 30 Mar 2015 20:04:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH] mtd: hisilicon: remove deprecated IRQF_DISABLED
Message-ID: <20150331030425.GU32500@ld-irv-0074>
References: <1427420393-28723-1-git-send-email-michael.opdenacker@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427420393-28723-1-git-send-email-michael.opdenacker@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Ingo Molnar <mingo@kernel.org>, dan.carpenter@oracle.com,
 Valentin Rothberg <valentinrothberg@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2015 at 06:39:53PM -0700, Michael Opdenacker wrote:
> This removes the use of the IRQF_DISABLED flag
> from drivers/mtd/nand/hisi504_nand.c
> 
> It's a NOOP since 2.6.35.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
> ---
>  drivers/mtd/nand/hisi504_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> index 289ad3ac3e80..e39482441430 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -758,7 +758,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
>  
>  	hisi_nfc_host_init(host);
>  
> -	ret = devm_request_irq(dev, irq, hinfc_irq_handle, IRQF_DISABLED,
> +	ret = devm_request_irq(dev, irq, hinfc_irq_handle, 0,
>  				"nandc", host);
>  	if (ret) {
>  		dev_err(dev, "failed to request IRQ\n");

linux-next has this:

commit d8bf368d0631d4bc2612d8bf2e4e8e74e620d0cc
Author: Valentin Rothberg <valentinrothberg@gmail.com>
Date:   Thu Mar 5 15:23:08 2015 +0100

    genirq: Remove the deprecated 'IRQF_DISABLED' request_irq() flag entirely

Thanks,
Brian
