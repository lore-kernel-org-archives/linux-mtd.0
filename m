Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbXnC-00079Q-07
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 17:11:34 +0000
Received: by pdbni2 with SMTP id ni2so102177941pdb.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 10:11:12 -0700 (PDT)
Date: Fri, 27 Mar 2015 10:11:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] mtd/spi: support en25s64 device
Message-ID: <20150327171104.GX32500@ld-irv-0074>
References: <1427449110-24556-1-git-send-email-Shengzhou.Liu@freescale.com>
 <20150327163450.GE1743@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150327163450.GE1743@sirena.org.uk>
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org,
 Shengzhou Liu <Shengzhou.Liu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(remove linux-ppc)

On Fri, Mar 27, 2015 at 09:34:50AM -0700, Mark Brown wrote:
> On Fri, Mar 27, 2015 at 05:38:30PM +0800, Shengzhou Liu wrote:
> > Add support for EON en25s64 spi device.
> > 
> > Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> This is a MTD driver, not a SPI driver - you need to send your patch to
> the MTD maintainers not me.

I'll take care of it.

Brian
