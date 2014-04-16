Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaKTX-0007NN-0t
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 07:41:43 +0000
Received: by mail-pd0-f176.google.com with SMTP id r10so10405552pdi.21
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 00:41:21 -0700 (PDT)
Date: Wed, 16 Apr 2014 00:41:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH] nand: omap2: Fix warning when CONFIG_MTD_NAND_OMAP_BCH=n
Message-ID: <20140416074117.GD5512@norris-Latitude-E6410>
References: <1396962300-4956-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396962300-4956-1-git-send-email-fabio.estevam@freescale.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

On Tue, Apr 08, 2014 at 10:05:00AM -0300, Fabio Estevam wrote:
> When CONFIG_MTD_NAND_OMAP_BCH is not defined the following build warning 
> happens:
> 
> drivers/mtd/nand/omap2.c:1250:12: warning: 'erased_sector_bitflips' defined but not used [-Wunused-function]
> 
> Protect the definition of erased_sector_bitflips() with 
> 'ifdef CONFIG_MTD_NAND_OMAP_BCH' to fix the warning.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

I've already merged a patch for this. (Incidentally, it was sent after
yours, but I noticed it first. Oh well.)

Thanks,
Brian
