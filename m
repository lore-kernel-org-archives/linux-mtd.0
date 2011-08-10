Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qr1rU-0006RR-Pe
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2011 06:01:53 +0000
Received: by gyh20 with SMTP id 20so517965gyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 23:01:49 -0700 (PDT)
Message-ID: <4E421EC7.6090505@gmail.com>
Date: Wed, 10 Aug 2011 16:01:43 +1000
From: Ryan Mallon <rmallon@gmail.com>
MIME-Version: 1.0
To: Julia Lawall <julia@diku.dk>
Subject: Re: [PATCH] drivers/mtd/nand/bcm_umi_nand.c: add missing kfree/ioremap
References: <1312954935-14592-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312954935-14592-1-git-send-email-julia@diku.dk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Scott Branden <sbranden@broadcom.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jiandong Zheng <jdzheng@broadcom.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/08/11 15:42, Julia Lawall wrote:
> From: Julia Lawall<julia@diku.dk>
>
> The error handling code under the #if should be the same as elsewhere in
> the function.
>
> Signed-off-by: Julia Lawall<julia@diku.dk>
>
> ---
>   drivers/mtd/nand/bcm_umi_nand.c |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
> index a8ae898..72e8ec2 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -433,8 +433,11 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
>
>   #if USE_DMA
>   	err = nand_dma_init();
> -	if (err != 0)
> +	if (err != 0) {
> +		iounmap(bcm_umi_io_base);
> +		kfree(board_mtd);
>   		return err;
> +	}
>   #endif

This probe function should possibly use goto exits on failure. It 
reduces a bit of code duplication and helps prevent this type of error.

~Ryan
