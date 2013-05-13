Received: from mail-oa0-f54.google.com ([209.85.219.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubnew-0006pv-L1
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:59:03 +0000
Received: by mail-oa0-f54.google.com with SMTP id o17so2596653oag.27
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 00:58:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPgLHd_ETnhT-YQgyPKJJ5meTF_mibYipShRO2GPGMhpdGOuyw@mail.gmail.com>
References: <CAPgLHd_ETnhT-YQgyPKJJ5meTF_mibYipShRO2GPGMhpdGOuyw@mail.gmail.com>
Date: Mon, 13 May 2013 13:28:39 +0530
Message-ID: <CAKohponMh0-L-LAYE7Rf3frULQ3WEwJCi+Hfe9qtE+zEWtncrQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsmc_nand: fix error return code in fsmc_nand_probe()
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, rob.herring@calxeda.com, vipin.kumar@st.com,
 yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 grant.likely@linaro.org, dwmw2@infradead.org,
 devicetree-discuss@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 May 2013 12:25, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return -ENODEV in the dma channel request error handling
> case instead of 0, as done elsewhere in this function.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/mtd/nand/fsmc_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 911e243..6988fc8 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -1032,6 +1032,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>         case USE_DMA_ACCESS:
>                 dma_cap_zero(mask);
>                 dma_cap_set(DMA_MEMCPY, mask);
> +               ret = -ENODEV;
>                 host->read_dma_chan = dma_request_channel(mask, filter,
>                                 pdata->read_dma_priv);
>                 if (!host->read_dma_chan) {
>

Better do it for error cases only.. like:

>                 if (!host->read_dma_chan) {
                           ret = -ENODEV;
