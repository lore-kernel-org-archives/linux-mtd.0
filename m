Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDUNS-0000Ho-J9
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 12:59:44 +0000
Date: Fri, 19 Oct 2018 14:59:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Julien Su <juliensu@mxic.com.tw>, Mason Yang
 <masonccyang@mxic.com.tw>, zhengxunli@mxic.com.tw,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH RFC 00/18] mtd: spi-nor: Proposal for 8-8-8 mode support
Message-ID: <20181019145920.43f9d5ec@bbrezillon>
In-Reply-To: <20181019122527.GJ5895@sirena.org.uk>
References: <20181012084825.23697-1-boris.brezillon@bootlin.com>
 <20181019122527.GJ5895@sirena.org.uk>
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

Hi Mark,

On Fri, 19 Oct 2018 13:25:27 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Oct 12, 2018 at 10:48:07AM +0200, Boris Brezillon wrote:
> 
> > First question that might come to mind is why should we support such
> > stateful modes? If you think about it, the gain of transmitting the
> > opcode on 8 IO lines is rather small compared to the pain it is to
> > teach the SPI NOR framework how to deal with that. The problem is,
> > some SPI NOR manufacturers (Macronix for instance) only implement 1-1-1
> > and 8-8-8 (or 8D-8D-8D), and they want to be able to use their NORs in
> > 8-8-8 mode when the controller supports it.  
> 
> The SPI framework changes definitely look OK to me, if everyone agrees
> that this is a good way to go from a MTD point of view I'm happy to
> apply them.  I have no strong opinion on the MTD bits of the series.

Actually, Yogesh posted similar patches before me, so maybe you can
look at this series [1]. The spi/spi-mem side of things is rather
uncontroversial. Feel free to apply them if you think they're good
enough to go in.

Thanks for your review.

Boris

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=70822
