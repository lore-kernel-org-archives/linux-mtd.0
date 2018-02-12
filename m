Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elDEG-00035g-Bu
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 12:29:05 +0000
Date: Mon, 12 Feb 2018 13:28:34 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180212132834.10781446@bbrezillon>
In-Reply-To: <40a44152-e62c-d57e-7646-7699301c29cc@ti.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <40a44152-e62c-d57e-7646-7699301c29cc@ti.com>
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

On Mon, 12 Feb 2018 17:20:46 +0530
Vignesh R <vigneshr@ti.com> wrote:

> Hi,
> 
> On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:
> > From: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> > Some controllers are exposing high-level interfaces to access various
> > kind of SPI memories. Unfortunately they do not fit in the current
> > spi_controller model and usually have drivers placed in
> > drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> > memories in general.
> > 
> > This is an attempt at defining a SPI memory interface which works for
> > all kinds of SPI memories (NORs, NANDs, SRAMs).  
> 
> Wouldn't it be better if spi_mem* implementations were in separate file?
> drivers/spi/spi.c is 3.5K+ lines and is bit difficult to follow.

No strong opinion about where the spi_mem code should lie, so if Mark
agrees I can move it to a different file and possibly make it optional
with a Kconfig option.


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
