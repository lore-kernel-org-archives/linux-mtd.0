Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4GV9-0004uY-Vc
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 23:07:56 +0000
Received: by pacej9 with SMTP id ej9so53543603pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 15:07:35 -0800 (PST)
Date: Wed, 2 Dec 2015 15:07:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <han.xu@freescale.com>
Cc: Michal Suchanek <hramrach@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Brown <broonie@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v6 03/10] mtd: fsl-quadspi: return amount of data
 read/written or error
Message-ID: <20151202230732.GT64635@google.com>
References: <cover.1449052427.git.hramrach@gmail.com>
 <ad10a42f8c502b9b91fcba05b3e46c42663e1141.1449052427.git.hramrach@gmail.com>
 <20151202210626.GA21512@chopperman.am.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151202210626.GA21512@chopperman.am.freescale.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 03:06:28PM -0600, Han Xu wrote:
> On Wed, Dec 02, 2015 at 10:38:19AM +0000, Michal Suchanek wrote:
> > Return amount of data read/written or error as read(2)/write(2) does.
> > 
> > Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 10d2b59..9beb739 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -575,7 +575,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
> >  	writel(reg, q->iobase + QUADSPI_MCR);
> >  }
> >  
> > -static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
> > +static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
> 
> conflict with the patch I acked.
> 
> https://patchwork.ozlabs.org/patch/545925/
> 
> I may change it and test on my side.

I'll let you know if I need things rebased. If conflicts are trivial, I
can handle it. But right now, the linked patch (big endian support) is
incomplete (no documentation), and Michal's was just sent today. So it
remains to be seen which will be "ready" first.

Brian
