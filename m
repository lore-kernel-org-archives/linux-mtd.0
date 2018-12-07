Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVC9F-0008Ap-GB
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:10:15 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Subject: Re: [v3,5/5] mtd: spi-nor: Add an SPDX tag to spi-nor.{c,h}
Date: Fri,  7 Dec 2018 10:10:02 +0100
Message-Id: <20181207091002.16524-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181206104120.6280-6-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-12-06 at 10:41:20 UTC, Boris Brezillon wrote:
> Add SPDX tags to replace the license boiler-plate and fix the
> MODULE_LICENSE() definition in spi-nor.c to match the license text
> (GPL v2).
> 
> Interestingly, spi-nor.h and spi-nor.c do not use the same license
> (GPL v2+ for spi-nor.h, GPL v2 for spi-nor.c).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next.

Boris
