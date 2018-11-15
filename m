Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNHeQ-00034F-G1
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 13:25:43 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor.Ambarus@microchip.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, yogeshnarayan.gaur@nxp.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [v2,
 1/5] mtd: spi-nor: don't drop sfdp data if optional parsers fail
Date: Thu, 15 Nov 2018 14:25:31 +0100
Message-Id: <20181115132531.15649-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181109165644.30534-2-tudor.ambarus@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-11-09 at 16:56:48 UTC,  wrote:
> JESD216C states that just the Basic Flash Parameter Table is mandatory.
> Already defined (or future) additional parameter headers and tables are
> optional.
> 
> Don't drop already collected sfdp data in case an optional table
> parser fails. In case of failing, each optional parser is responsible
> to roll back to the previously known spi_nor data.
> 
> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> Reported-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

Boris
