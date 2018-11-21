Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPNOR-0004HJ-Kn
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2018 07:57:53 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Robert Marko <robimarko@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [v2] mtd: spi-nor: Add Winbond w25q128jv support
Date: Wed, 21 Nov 2018 08:57:39 +0100
Message-Id: <20181121075739.327-1-boris.brezillon@bootlin.com>
In-Reply-To: <20180625111748.5108-1-robimarko@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-06-25 at 11:17:48 UTC, Robert Marko wrote:
> Datasheet:
> http://www.winbond.com/resource-files/w25q128jv%20revf%2003272018%20plus.pdf
> 
> Testing done on Mikrotik Routerboard  wAP R board.
> It does not support Dual or Quad modes.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
