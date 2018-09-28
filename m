Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5miS-0002tp-OT
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2018 06:57:46 +0000
Date: Fri, 28 Sep 2018 08:56:56 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Daniel Mack
 <daniel@zonque.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20180928085656.6b0be35a@bbrezillon>
In-Reply-To: <20180928084046.221bdda0@bbrezillon>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13>
 <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <20180928084046.221bdda0@bbrezillon>
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

On Fri, 28 Sep 2018 08:40:46 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > ttyS ttyS1: tty_port_close_start: tty->count = 1 port count = 2
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining 
> > FIFO (data) (NDSR: 0x00000810)
> > 
> > ... (RDDREQ messages repeat).  
> 
> Hm, that's weird, unless RDDREQ is a 'clear-on-read' bit, that
> shouldn't happen.

BTW, I dropped the patch.
