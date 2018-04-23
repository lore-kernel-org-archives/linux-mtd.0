Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAjfH-0006A2-85
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 22:10:29 +0000
Date: Tue, 24 Apr 2018 00:10:04 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v3 3/9] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180424000805.6c015a40@bbrezillon>
In-Reply-To: <CAHp75VfNzxGoSk==sdnOzp7LhuHVuanWAHOQk0eQC_g3Y3miQA@mail.gmail.com>
References: <20180422183522.11118-1-boris.brezillon@bootlin.com>
 <20180422183522.11118-4-boris.brezillon@bootlin.com>
 <CAHp75VfNzxGoSk==sdnOzp7LhuHVuanWAHOQk0eQC_g3Y3miQA@mail.gmail.com>
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

Hi Andy,

On Tue, 24 Apr 2018 00:53:22 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sun, Apr 22, 2018 at 9:35 PM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> > Some controllers are exposing high-level interfaces to access various
> > kind of SPI memories. Unfortunately they do not fit in the current
> > spi_controller model and usually have drivers placed in
> > drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> > memories in general.
> >
> > This is an attempt at defining a SPI memory interface which works for
> > all kinds of SPI memories (NORs, NANDs, SRAMs).  
> 
> > +config SPI_MEM
> > +       bool "SPI memory extension"  
> 
> > +#if IS_ENABLED(CONFIG_SPI_MEM)  
> 
> IS_BUILTIN().
> You defined it as boolean, IS_ENABLE() is superfluous.

Sorry but I don't see the problem here. Yes, IS_BUILTIN() would work,
but IS_ENABLED() works fine too and has not impact on runtime perfs
(and probably near zero impact on compilation time). Anyway, I'll let
Mark decide if this is important enough to send a new version.

Regards,

Boris
