Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vc4Jx-0007A8-0k
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 02:18:48 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MVK00HVFBOE22C0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 11:18:19 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Wei Yongjun' <weiyj.lk@gmail.com>
References: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
In-reply-to: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
Date: Fri, 01 Nov 2013 11:18:19 +0900
Message-id: <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: tony@atomide.com, artem.bityutskiy@linux.intel.com,
 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 zonque@gmail.com, yongjun_wei@trendmicro.com.cn, avinashphilip@ti.com,
 pekon@ti.com, linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, November 01, 2013 9:16 AM, Wei Yongjun wrote:
> 
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.

Commit message is right? :-(

Best regards,
Jingoo Han

> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/mtd/nand/omap2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index ec40b8d..f777250 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1953,7 +1953,8 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		nand_chip->ecc.read_page	= omap_read_page_bch;
>  		nand_chip->ecc.write_page	= omap_write_page_bch;
>  		/* This ECC scheme requires ELM H/W block */
> -		if (is_elm_present(info, pdata->elm_of_node, BCH8_ECC) < 0) {
> +		err = is_elm_present(info, pdata->elm_of_node, BCH8_ECC);
> +		if (err < 0) {
>  			pr_err("nand: error: could not initialize ELM\n");
>  			goto return_error;
>  		}
