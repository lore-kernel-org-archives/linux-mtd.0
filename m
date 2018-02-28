Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1er0oI-00025f-3n
 for linux-mtd@lists.infradead.org; Wed, 28 Feb 2018 12:26:36 +0000
Date: Wed, 28 Feb 2018 13:25:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar
 <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180228132549.75727e55@bbrezillon>
In-Reply-To: <CAAyFORKQCBMOGajA6-evsO8FfFz7_8-PGqU4MmhRic18PFrLUQ@mail.gmail.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <CAAyFORKQCBMOGajA6-evsO8FfFz7_8-PGqU4MmhRic18PFrLUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 Feb 2018 15:51:29 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> > +int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> > +{
> > +       unsigned int tmpbufsize, xferpos = 0, totalxferlen = 0;
> > +       struct spi_controller *ctlr = mem->spi->controller;
> > +       struct spi_transfer xfers[4] = { };
> > +       struct spi_message msg;
> > +       u8 *tmpbuf;
> > +       int ret;
> > +
> > +       if (!spi_mem_supports_op(mem, op))
> > +               return -ENOTSUPP;
> > +
> > +       if (ctlr->mem_ops) {
> > +               if (ctlr->auto_runtime_pm) {
> > +                       ret = pm_runtime_get_sync(ctlr->dev.parent);
> > +                       if (ret < 0) {
> > +                               dev_err(&ctlr->dev,
> > +                                       "Failed to power device: %d\n",
> > +                                       ret);
> > +                               return ret;
> > +                       }
> > +               }
> > +
> > +               mutex_lock(&ctlr->bus_lock_mutex);
> > +               mutex_lock(&ctlr->io_mutex);
> > +               ret = ctlr->mem_ops->exec_op(mem, op);
> > +               mutex_unlock(&ctlr->io_mutex);
> > +               mutex_unlock(&ctlr->bus_lock_mutex);
> > +
> > +               if (ctlr->auto_runtime_pm)
> > +                       pm_runtime_put(ctlr->dev.parent);
> > +
> > +               /*
> > +                * Some controllers only optimize specific paths (typically the
> > +                * read path) and expect the core to use the regular SPI
> > +                * interface in these cases.
> > +                */
> > +               if (!ret || ret != -ENOTSUPP)
> > +                       return ret;
> > +       }
> > +
> > +       tmpbufsize = sizeof(op->cmd.opcode) + op->addr.nbytes +
> > +                    op->dummy.nbytes;  
> 
> Here you are using sizeof(op->cmd.opcode) while the code after this
> assumes opcode is u8(ie. "memcpy(tmpbuf + 1, op->addr.buf, op->addr.nbytes);")
> It may be confused.

Will use sizeof(op->cmd.opcode) everywhere then.

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
