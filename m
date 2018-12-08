Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVbkt-0001g8-Ve
 for linux-mtd@lists.infradead.org; Sat, 08 Dec 2018 12:30:50 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor.Ambarus@microchip.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at,
 Cyrille.Pitchen@microchip.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2] mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
Date: Sat,  8 Dec 2018 13:30:35 +0100
Message-Id: <20181208123035.9924-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181206144330.30860-1-tudor.ambarus@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-12-06 at 14:43:39 UTC,  wrote:
> From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> 
> Add support for SFDP (JESD216B) 4-byte Address Instruction Table. This
> table is optional but when available, we parse it to get the 4-byte
> address op codes supported by the memory.
> Using these op codes is stateless as opposed to entering the 4-byte
> address mode or setting the Base Address Register (BAR).
> 
> Flashes that have the 4BAIT table declared can now support
> SPINOR_OP_PP_1_1_4_4B and SPINOR_OP_PP_1_4_4_4B opcodes.
> 
> Tested on MX25L25673G.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> [tudor.ambarus@microchip.com:
> - rework erase and page program logic,
> - pass DMA-able buffer to spi_nor_read_sfdp(),
> - introduce SPI_NOR_HAS_4BAIT
> - various minor updates.]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
