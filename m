Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPTZu-0004Rm-A6
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2018 14:34:08 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor.Ambarus@microchip.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v2] mtd: spi-nor: fix selection of uniform erase type in
 flexible conf
Date: Wed, 21 Nov 2018 15:33:43 +0100
Message-Id: <20181121143343.11330-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181116174624.10817-1-tudor.ambarus@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-11-16 at 17:46:37 UTC,  wrote:
> There are uniform, non-uniform and flexible erase flash configurations.
> 
> The non-uniform erase types, are the erase types that can _not_ erase
> the entire flash by their own.
> 
> As the code was, in case flashes had flexible erase capabilities
> (support both uniform and non-uniform erase types in the same flash
> configuration) and supported multiple uniform erase type sizes, the
> code did not sort the uniform erase types, and could select a wrong
> erase type size.
> 
> Sort the uniform erase mask in case of flexible erase flash
> configurations, in order to select the best uniform erase type size.
> 
> Uniform, non-uniform, and flexible configurations with just a valid
> uniform erase type, are not affected by this change.
> 
> Uniform erase tested on mx25l3273fm2i-08g and sst26vf064B-104i/sn.
> Non uniform erase tested on sst26vf064B-104i/sn.
> 
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
