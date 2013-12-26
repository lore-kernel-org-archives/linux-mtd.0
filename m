Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw6Fs-0006DE-8o
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 08:25:21 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE002YTNDIPD10@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 17:24:54 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Josh Triplett' <josh@joshtriplett.org>
References: <cover.1387833347.git.josh@joshtriplett.org>
 <21175198efaf34a67e5108c1dae384656012b7a0.1387833347.git.josh@joshtriplett.org>
In-reply-to: <21175198efaf34a67e5108c1dae384656012b7a0.1387833347.git.josh@joshtriplett.org>
Subject: Re: [PATCH 1/7] mtd: denali: Drop print of build date/time
Date: Thu, 26 Dec 2013 17:24:53 +0900
Message-id: <000801cf0213$f40bec50$dc23c4f0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Dinh Nguyen' <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, December 24, 2013 6:55 AM, Josh Triplett wrote:
> 
> The kernel already has this information, and individual drivers
> shouldn't duplicate that.  This also eliminates the use of __DATE__ and
> __TIME__, which make the build non-deterministic.
> 
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>

(+cc Dinh Nguyen)

It looks good. :-)
Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/mtd/nand/denali_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
> index 033f177..ab64416 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -131,7 +131,6 @@ static struct pci_driver denali_pci_driver = {
> 
>  static int denali_init_pci(void)
>  {
> -	pr_info("Spectra MTD driver built on %s @ %s\n", __DATE__, __TIME__);
>  	return pci_register_driver(&denali_pci_driver);
>  }
>  module_init(denali_init_pci);
> --
> 1.8.5.2
