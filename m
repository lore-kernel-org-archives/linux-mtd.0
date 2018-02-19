Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enmUr-0003Yz-JQ
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 14:32:51 +0000
Date: Mon, 19 Feb 2018 15:32:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Yogesh
 Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar
 <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180219153237.2563574d@bbrezillon>
In-Reply-To: <20180219140003.GF32761@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <20180219140003.GF32761@sirena.org.uk>
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

On Mon, 19 Feb 2018 14:00:03 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Feb 06, 2018 at 12:21:15AM +0100, Boris Brezillon wrote:
> 
> > +	/*
> > +	 * The controller can implement only the high-level SPI-memory like
> > +	 * operations if it does not support regular SPI transfers.
> > +	 */
> > +	if (ctlr->mem_ops) {
> > +		if (!ctlr->mem_ops->supports_op ||
> > +		    !ctlr->mem_ops->exec_op)
> > +			return -EINVAL;
> > +	} else if (!ctlr->transfer && !ctlr->transfer_one &&
> > +		   !ctlr->transfer_one_message) {
> > +		return -EINVAL;
> > +	}  
> 
> BTW your comment isn't describing what the code does - the comment says
> that having the memory operations means the driver can't be a regular
> SPI controller while the code does not do that and only checks that if a
> driver has memory ops it implements two required ones.  Indeed the
> existing drivers that are updated to the new API continue to implement
> normal SPI operations.

Definitely not what I wanted to say :-/. I guess replacing 'can' by
'may' would be more appropriate. What I want to say is that SPI
controllers do not have to implement the hooks for regular SPI
operations if they only support SPI-mem like operations, but of course
they can implement those hooks if they support both spi_mem and regular
SPI ops.

This check is here to allow registration of SPI controllers that
support spi_mem ops, regular ops or both, and prevent registration if
both spi_mem and regular hooks are missing.

Is it clearer?

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
