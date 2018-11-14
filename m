Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMshL-0000SL-28
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 10:47:04 +0000
Date: Wed, 14 Nov 2018 11:46:51 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.De>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>, Han Xu
 <han.xu@nxp.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, David Wolfe <david.wolfe@nxp.com>, Fabio
 Estevam <fabio.estevam@nxp.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/9] spi: Add a driver for the Freescale/NXP QuadSPI
 controller
Message-ID: <20181114114651.6f995fc8@bbrezillon>
In-Reply-To: <VI1PR04MB572664063A0E237D2EB7203A99C30@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <1542116782-13118-1-git-send-email-frieder.schrempf@kontron.de>
 <1542116782-13118-4-git-send-email-frieder.schrempf@kontron.de>
 <VI1PR04MB572679944542ED6A438FD2FB99C30@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <ce9cbfc0-3257-f117-aa21-cdee068579ce@kontron.de>
 <65577d13-b17d-8f69-313c-01d23240d1d9@kontron.de>
 <VI1PR04MB572664063A0E237D2EB7203A99C30@VI1PR04MB5726.eurprd04.prod.outlook.com>
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

On Wed, 14 Nov 2018 10:43:00 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Frieder,
> 
> [..]
> > >
> > > Ok, I will have a look at what could make the chip selection fail in
> > > case of AHB read.  
> > 
> > Could you try with this change applied:
> > 
> > @@ -503,7 +503,7 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct
> > spi_device *spi)
> >                          map_addr = q->memmap_phy;
> >                  else
> >                          map_addr = q->memmap_phy +
> > -                                  2 * q->devtype_data->ahb_buf_size;
> > +                                  q->devtype_data->ahb_buf_size;
> > 
> >                  qspi_writel(q, map_addr, q->iobase + QUADSPI_SFA1AD +
> > (i * 4));
> >          }
> >   
> 
> I have tried above change and also have done few more changes but still AHB read for CS1 is falling.

Have plugged a scope on the CS1 line, to make sure it's properly
asserted when the memory is accessed?

> 
> I guess we need to implement dynamic memory mapping [1] for AHB Read as was being done in previous driver implementation.
> Would try this and update you.

Sorry but I don't see why it would solve the problem we have here, but
if it does, I'd like to have a clear explanation ;-).
