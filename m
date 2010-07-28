Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe0zk-0001AX-EZ
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 07:24:05 +0000
Date: Wed, 28 Jul 2010 08:23:38 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH 02/29] pxa3xx_nand: fix compile warning
Message-ID: <20100728072338.GA29277@n2100.arm.linux.org.uk>
References: <AANLkTimJbfRUwzRUT0Z6_eMOm-SpYeti-FjY-eE5a7cV@mail.gmail.com>
	<AANLkTikHFbaUjocnH9Fm8EHV75rCFEZ03EkMqbWPzHc+@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTikHFbaUjocnH9Fm8EHV75rCFEZ03EkMqbWPzHc+@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <david.woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 28, 2010 at 02:17:23PM +0800, Eric Miao wrote:
> On Wed, Jul 28, 2010 at 1:56 PM, Haojian Zhuang
> <haojian.zhuang@gmail.com> wrote:
> > From c374a3f27c56f9112b97960eaa3194a08db6f4a4 Mon Sep 17 00:00:00 2001
> > From: Lei Wen <leiwen@marvell.com>
> > Date: Tue, 22 Jun 2010 20:19:35 +0800
> > Subject: [PATCH 02/29] pxa3xx_nand: fix compile warning
> >
> > The compile output as below:
> > WARNING: modpost: Found 1 section mismatch(es).
> >
> > Signed-off-by: Lei Wen <leiwen@marvell.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index 3ffcbcd..52cec28 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -1069,7 +1069,7 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
> >        this->chip_delay = 25;
> >  }
> >
> > -static int pxa3xx_nand_probe(struct platform_device *pdev)
> > +static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
> 
> Ack

__devinit is not always the right thing for this.  Not having any
attribute is the safest thing.  Having any kind of init tag means
that there's a circumstance when the function will be freed, and
if the function pointer is called...
