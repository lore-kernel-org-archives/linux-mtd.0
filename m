Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzqBZ-0004c5-MD
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 12:18:30 +0000
Received: by bwz19 with SMTP id 19so3870552bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 05:18:28 -0700 (PDT)
Subject: Re: [PATCH] nand: omap2: Missing arg to gpmc_prefetch_reset()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Lo=EFc?= Minier <loic.minier@linaro.org>
In-Reply-To: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
References: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 26 Sep 2010 15:18:23 +0300
Message-ID: <1285503503.13050.19.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, Sukumar Ghorai <s-ghorai@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-24 at 23:45 +0200, Loïc Minier wrote:
> Fix missing cs arg to gpmc_prefetch_reset() when
> CONFIG_MTD_NAND_OMAP_PREFETCH_DMA=y which caused a build failure since
> 948d38e799f0ab87cf8ed9113fcdaaee61acf321:
> drivers/mtd/nand/omap2.c: In function 'omap_nand_dma_transfer':
> drivers/mtd/nand/omap2.c:416: error: too few arguments to function 'gpmc_prefetch_reset'
> 
> Signed-off-by: Loïc Minier <loic.minier@linaro.org>

Looks like a regression which should be merged to 2.6.36.
I've taken this patch to l2-mtd-2.6.git, will ping dwmw2 about the need
to merge this to 2.6.36.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
