Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSKcu-0003m1-Ld
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 11:04:46 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990406AbeFKLE0TcQxf (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 11 Jun 2018 13:04:26 +0200
Date: Mon, 11 Jun 2018 13:04:25 +0200
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: atmel-nand-controller: NAND chip selects?
Message-ID: <20180611110425.GA4059@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Consider there are more NAND chips connected to the same lines and only nCE
(connected to GPIO line one per each chip) is used to select them.
How is driver supposed to work in such situation?
Common memory region cannot be requested multiple times as well as the
same gpio for R/B cannot be requested. Something as davinci_nand for
memory region? Use 'ranges' property? How should one express in DT gpio
is shared between child nodes?

Any pointers appreciated. Thank you,
	ladis
