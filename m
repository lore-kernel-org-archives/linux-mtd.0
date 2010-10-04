Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P2fgG-0005YE-HQ
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 07:41:52 +0000
Received: by fxm15 with SMTP id 15so3783953fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Oct 2010 00:41:51 -0700 (PDT)
Subject: Re: [PATCH] nand: omap2: Missing arg to gpmc_prefetch_reset()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Lo=EFc?= Minier <loic.minier@linaro.org>
In-Reply-To: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
References: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Oct 2010 10:39:05 +0300
Message-ID: <1286177945.11684.77.camel@localhost>
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
> ---
>  drivers/mtd/nand/omap2.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

FYI, a similar patch is already in Linus' tree, so I'm dropping it from
my tree:

commit f12f662f29d5801e598c6bb4a71e54b2de218f72
Author: Daniel J Blueman <daniel.blueman@gmail.com>
Date:   Wed Sep 29 21:01:55 2010 +0100

    fix OMAP2 MTD build failure
    
    Fix build failure from recent interface change and merge.
    
    Tested on OMAP3430.
    
    Signed-off-by: Daniel J Blueman <daniel.blueman@gmail.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
