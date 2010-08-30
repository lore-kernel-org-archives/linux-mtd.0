Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3hF-00066d-Hd
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:42:45 +0000
Received: by vws11 with SMTP id 11so5518578vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:42:44 -0700 (PDT)
Subject: Re: [PATCH 1/1]nand/denali: Add runtime pm framework for MRST
	Denali NAND controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
In-Reply-To: <20100826081201.GA11565@intel.com>
References: <20100826081201.GA11565@intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:42:39 +0300
Message-ID: <1283172159.12995.64.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	arjan.van.de.ven@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2010-08-26 at 16:12 +0800, Chuanxiao.Dong wrote:
> +static struct dev_pm_ops denali_pm = {
> +	.runtime_suspend = denali_runtime_suspend,
> +	.runtime_resume = denali_runtime_resume,
> +	.runtime_idle = denali_runtime_idle,
> +};
> +#define DENALI_PM (&denali_pm)

I think it is confusing to use this style. Please, do not define this
DENALI_PM macro, unless this is a standard practice, which I doubt, but
not sure.

... snip ...

> +#else
> +#define DENALI_PM NULL
Ditto.
> +static inline void denali_timer_add(struct denali_nand_info *denali) {}
> +static inline void denali_timer_func(unsigned long ptr) {}
> +#endif

#endif /* !CONFIG_PM_RUNTIME */

.. snip ..

>  static struct pci_driver denali_pci_driver = {
> +	.driver = {
> +		.pm = DENALI_PM,
> +	},

This is the only place where you use this macro, just do

#ifdef CONFIG_PM_RUNTIME
	.driver = {
		.pm = DENALI_PM,
	},
#endif

And it will be more readable.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
