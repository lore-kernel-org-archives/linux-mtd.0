Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LotHK-0006sV-J0
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 05:46:29 +0000
Subject: Re: [patch/rfc 2.6.29 2/2] MTD: support driver model updates
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200903260042.50236.david-b@pacbell.net>
References: <200903260039.34013.david-b@pacbell.net>
	<200903260042.50236.david-b@pacbell.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2009 08:46:11 +0300
Message-Id: <1238564771.20906.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-26 at 00:42 -0700, David Brownell wrote:
> From: David Brownell <dbrownell@users.sourceforge.net>
> 
> Follow-on patch to the previous driver model patch for the MTD
> framework.  This one makes various MTD drivers connect to the
> driver model tree, so /sys/devices/virtual/mtd/* nodes are no
> longer present ... mostly drivers used on boards I have handy.
> 
> Based on a patch from Kay Sievers.

...

> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -866,6 +866,7 @@ static int __init mxcnd_probe(struct pla
>  	mtd = &host->mtd;
>  	mtd->priv = this;
>  	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = &pdev->dev;

Could this be done for all NANDs in nand_base.c instead?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
