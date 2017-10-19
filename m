Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e592Z-0003i3-RG
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 11:31:10 +0000
Date: Thu, 19 Oct 2017 13:30:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>, Andrew Lunn
 <andrew@lunn.ch>, Brian Norris <computersforpeace@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Daniel Mack <daniel@zonque.org>,
 David Woodhouse <dwmw2@infradead.org>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Gregory Clement
 <gregory.clement@free-electrons.com>, Han Xu <han.xu@nxp.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jason Cooper <jason@lakedaemon.net>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Richard Weinberger
 <richard@nod.at>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring
 <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner
 <stefan@agner.ch>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Wenyou Yang <wenyou.yang@atmel.com>, Will Deacon
 <will.deacon@arm.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Igor Grinberg
 <grinberg@compulab.co.il>, Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz
 <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Hanna Hawa
 <hannah@marvell.com>, linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [RFC 00/12] Marvell NAND controller rework with ->exec_op()
Message-ID: <20171019133040.0c5ded1a@bbrezillon>
In-Reply-To: <c40bff37-4a8e-2c83-6d2a-b6579ea5233c@sigmadesigns.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171019002922.5ab978ed@bbrezillon>
 <c40bff37-4a8e-2c83-6d2a-b6579ea5233c@sigmadesigns.com>
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

Hi Marc,

On Thu, 19 Oct 2017 10:47:07 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> [ Dropping all mailing lists except linux-mtd ]
> 
> On 19/10/2017 00:29, Boris Brezillon wrote:
> 
> > Still need to review patch 6, but I'd like to say I'm really happy to
> > see that happen, finally. Hopefully that will help us make the NAND
> > framework a bit easier to maintain and allow us to support advanced
> > NAND features without having to patch all NAND controller drivers every
> > time we add a new vendor specific operation. I also have in mind a few
> > NAND controller drivers that have been rejected because they were not
> > fitting in the ->cmd_ctrl() approach and I didn't want to add more
> > drivers with their own partially implemented/broken ->cmdfunc() method.
> > 
> > Kudos for the work you've done, and I hope we'll get reviews from other
> > active NAND driver maintainers/contributors. To all NAND driver
> > maintainers: note that the long term goal is to get rid of  
> > ->cmd_ctrl()/cmdfunc()/read/write_buf/byte/word() entirely and replace  
> > them with a single ->exec_op() hook. Please let us know if you need
> > extra things that are not yet exposed in nand_op_instr/nand_op_parser
> > or if you would like things to be done differently.  
> 
> A long time ago, we discussed a limitation of the API for reads
> and writes handling only a single page at a time. My controller
> is able to "burst" 1-15 contiguous pages.
> 
> Does this rewrite help with such a feature, or is it orthogonal?

It's kind of orthogonal. To do what you want to do we'd need to extend
the current nand_chip/nand_ecc_ctrl interfaces to pass the MTD request
directly to the NAND controller driver and let it detect when a burst
access makes sense. Right now this is not my priority, but yes, I've
already thought a bit about how this interface would look like (see
this presentation [1] page 31).

Regards,

Boris

[1]https://events.linuxfoundation.org/sites/events/files/slides/brezillon-nand-framework_0.pdf
