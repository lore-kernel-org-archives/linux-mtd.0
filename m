Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBdBU-000109-Oi
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 09:27:31 +0000
Date: Thu, 26 Apr 2018 11:27:11 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v3 0/9] spi: Extend the framework to generically support
 memory devices
Message-ID: <20180426112711.218fea51@bbrezillon>
In-Reply-To: <354d5c48-be1b-0412-8cb0-f6e4daebccc5@ti.com>
References: <20180422183522.11118-1-boris.brezillon@bootlin.com>
 <354d5c48-be1b-0412-8cb0-f6e4daebccc5@ti.com>
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

On Thu, 26 Apr 2018 14:37:10 +0530
Vignesh R <vigneshr@ti.com> wrote:

> On Monday 23 April 2018 12:05 AM, Boris Brezillon wrote:
> > Hello,
> > 
> > Shrinking a bit the explanation on why the spi-mem abstraction is
> > needed (a detailed explanation is available here [2]). In addition to
> > what as been said in my initial explanation I'll add that making it part
> > of the SPI framework instead of as an extra independent layer is
> > justified by the fact that some controllers support both SPI memory
> > operations and regular SPI transfers, and it's cleaner to have both
> > features exposed through a single driver.
> > 
> > For those who want to have the full picture, here is a branch [1]
> > containing the SPI NAND framework based on top of this spi-mem layer.
> > 
> > Thanks,
> > 
> > Boris
> > 
> > [1]https://github.com/bbrezillon/linux/tree/spi-mem
> > [2]https://www.spinics.net/lists/linux-spi/msg12058.html
> > 
> >   
> 
> I am trying to apply this on top of linux-next, but
> [PATCH v2 01/10] spi: Check presence the of ->transfer[_xxx]() before
> registering a controller
> from v2 is missing in this series and it does not seem to be in spi.git
> as well?

Hm, that's weird. I'm almost sure I received a notification saying it
had been applied. I'll double check.
