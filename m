Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSKtM-0002Va-4y
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 11:21:46 +0000
Date: Mon, 11 Jun 2018 13:21:31 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>
Subject: Re: atmel-nand-controller: NAND chip selects?
Message-ID: <20180611132131.4f175aea@bbrezillon>
In-Reply-To: <20180611110425.GA4059@lenoch>
References: <20180611110425.GA4059@lenoch>
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

On Mon, 11 Jun 2018 13:04:25 +0200
Ladislav Michl <ladis@linux-mips.org> wrote:

> Consider there are more NAND chips connected to the same lines and only nCE
> (connected to GPIO line one per each chip) is used to select them.
> How is driver supposed to work in such situation?
> Common memory region cannot be requested multiple times as well as the
> same gpio for R/B cannot be requested.

I thought you could request several times the same GPIO if it's in input
mode, but maybe I'm wrong.

> Something as davinci_nand for
> memory region? Use 'ranges' property? How should one express in DT gpio
> is shared between child nodes?

For both problems, the solution is to reserve the resources at the NAND
controller level instead of the NAND level. It's pretty easy for the CS
memory range, because the driver can easily detect when the same CS is
used by different NAND chips. It's a bit more complicated for the R/B
pins.
