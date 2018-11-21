Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPSFj-0001uC-Ty
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2018 13:09:13 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: mtd: spi-nor: Add support for mx25u12835f
Date: Wed, 21 Nov 2018 14:09:00 +0100
Message-Id: <20181121130900.24838-1-boris.brezillon@bootlin.com>
In-Reply-To: <20180713130646.30523-1-alexander.sverdlin@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-07-13 at 13:06:46 UTC, Alexander Sverdlin wrote:
> This chip supports dual and quad read and uniform 4K-byte erase.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
