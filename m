Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNHeE-00033O-Lq
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 13:25:33 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor.Ambarus@microchip.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, yogeshnarayan.gaur@nxp.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [v2,2/5] mtd: spi-nor: fix iteration over smpt array
Date: Thu, 15 Nov 2018 14:25:26 +0100
Message-Id: <20181115132526.15556-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181109165644.30534-3-tudor.ambarus@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-11-09 at 16:56:50 UTC,  wrote:
> Iterate over smpt array using its starting address and length
> instead of the blind iterations that used data found in the array.
> 
> This prevents possible memory accesses outside of the smpt array
> boundaries in case software, or manufacturers, misrepresent smpt
> array fields.
> 
> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

Boris
