Received: from mho-04-ewr.mailhop.org ([204.13.248.74]
 helo=mho-02-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBEAG-0001xa-Ii
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 00:17:17 +0000
Date: Mon, 10 Sep 2012 17:17:10 -0700
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v3 10/10] mtd: nand: omap2: use gpmc provided irqs
Message-ID: <20120911001710.GD1303@atomide.com>
References: <cover.1344609341.git.afzal@ti.com>
 <c5a608a70a875191e1323958c74fb2ac8dfa34b3.1344609341.git.afzal@ti.com>
 <1345895326.1815.4.camel@kyv> <20120830195349.GW1303@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120830195349.GW1303@atomide.com>
Cc: artem.bityutskiy@linux.intel.com, Afzal Mohammed <afzal@ti.com>,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Tony Lindgren <tony@atomide.com> [120830 12:54]:
> * Artem Bityutskiy <dedekind1@gmail.com> [120825 04:49]:
> > On Tue, 2012-08-21 at 15:14 +0530, Afzal Mohammed wrote:
> > > GPMC platform initialization provides it's clients
> > > with interrupts that can be used through struct
> > > resource. Make use of it for irq mode functionality.
> > > 
> > > Also now write protect disable is done by GPMC,
> > > hence remove it.
> > > 
> > > Signed-off-by: Afzal Mohammed <afzal@ti.com>
> > 
> > Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Thanks I'll apply these into omap devel-gpmc branch.

FYI, looks like a new warning got introduced, so I've
committed the following trivial patch on top of this series.

Regards,

Tony

From: Tony Lindgren <tony@atomide.com>
Date: Mon, 10 Sep 2012 17:14:13 -0700
Subject: [PATCH] mtd: nand omap2: Fix uninitialized err warning

Commit bd4156fd (mtd: nand: omap2: use gpmc provided irqs)
introduced a new warning:

drivers/mtd/nand/omap2.c: In function ‘omap_nand_probe’:
drivers/mtd/nand/omap2.c:1267: warning: ‘err’ may be used uninitialized in this function

Signed-off-by: Tony Lindgren <tony@atomide.com>

--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1389,6 +1389,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		info->gpmc_irq_fifo = platform_get_irq(pdev, 0);
 		if (info->gpmc_irq_fifo <= 0) {
 			dev_err(&pdev->dev, "error getting fifo irq\n");
+			err = -ENODEV;
 			goto out_release_mem_region;
 		}
 		err = request_irq(info->gpmc_irq_fifo,	omap_nand_irq,
