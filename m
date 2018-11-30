Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSfFH-0000V7-RN
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 09:38:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor.Ambarus@microchip.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: alexander.sverdlin@nokia.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [v2] mtd: spi-nor: fix erase_type array to indicate current map
 conf
Date: Fri, 30 Nov 2018 10:37:51 +0100
Message-Id: <20181130093751.5553-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181126124531.17548-1-tudor.ambarus@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-11-26 at 12:45:44 UTC,  wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> BFPT advertises all the erase types supported by all the possible
> map configurations. Mask out the erase types that are not supported
> by the current map configuration.
> 
> Backward compatibility test done on sst26vf064b.
> 
> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> Reported-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
