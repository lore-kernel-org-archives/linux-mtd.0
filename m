Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZTkK-00071m-4w
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 22:51:16 +0000
Date: Thu, 24 Oct 2013 19:50:50 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH 4/5] mtd: nand: omap2: Use devm_kzalloc
Message-ID: <20131024225049.GB20462@localhost>
References: <1382652737-20239-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382652737-20239-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAAfyv37SL94Ohwqqs6u5AMvdj4aAgQMGRe_9zze=TcS5An_U0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAfyv37SL94Ohwqqs6u5AMvdj4aAgQMGRe_9zze=TcS5An_U0w@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 12:24:38AM +0200, Belisko Marek wrote:
> Hi,
> 
> On Fri, Oct 25, 2013 at 12:12 AM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > This simplifies the error path and makes the code less error-prone.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/nand/omap2.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> > index e01a936..d4cafb0 100644
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
> > @@ -1837,7 +1837,7 @@ static int omap_nand_probe(struct platform_device *pdev)
> >                 return -ENODEV;
> >         }
> >
> > -       info = kzalloc(sizeof(struct omap_nand_info), GFP_KERNEL);
> > +       info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> >         if (!info)
> >                 return -ENOMEM;
> >
> > @@ -2066,9 +2066,6 @@ out_release_mem_region:
> >         if (info->gpmc_irq_fifo > 0)
> >                 free_irq(info->gpmc_irq_fifo, info);
> >         release_mem_region(info->phys_base, info->mem_size);
> > -out_free_info:
> You remove ^^^^ statement but it's still used in line ~1868 as return when
> cannot get resource.

Right, I missed that. This happens when you do two cleanups at once and then
try to commit them separatedly!

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
