Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVC9S-00015p-Jf
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
Subject: Re: [v5,3/3] mtd: spi-nor: Add a post BFPT fixup for MX25L25635E
Date: Fri,  7 Dec 2018 10:10:19 +0100
Message-Id: <20181207091019.16907-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181206103736.5957-4-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-12-06 at 10:37:36 UTC, Boris Brezillon wrote:
> MX25L25635F and MX25L25635E share the same JEDEC-ID, but the F variant
> supports 4-byte opcodes while the E variant doesn't. We need a way to
> differentiate those 2 chips and set the SNOR_F_4B_OPCODES flag only for
> the F variant.
> 
> Luckily, 4-byte opcode support is not the only difference: Fast Read
> 4-4-4 is only supported by the F variant, and this feature is
> advertised in the BFPT table. Use this to decide when to set the
> SNOR_F_4B_OPCODES flag.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next.

Boris
