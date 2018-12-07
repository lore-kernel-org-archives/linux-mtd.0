Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVC9T-0001DT-8l
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:10:39 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [v5,1/3] mtd: spi-nor: Add the SNOR_F_4B_OPCODES flag
Date: Fri,  7 Dec 2018 10:10:26 +0100
Message-Id: <20181207091026.17051-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181206103736.5957-2-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-12-06 at 10:37:34 UTC, Boris Brezillon wrote:
> Some flash_info entries have the SPI_NOR_4B_OPCODES flag set to let the
> core know that the flash supports 4B opcode. While this solution works
> fine for id-based caps detection, it doesn't work that well when relying
> on SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so
> that the SFDP parsing code can set it when appropriate.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next.

Boris
