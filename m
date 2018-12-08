Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVbkt-0001gD-Vc
 for linux-mtd@lists.infradead.org; Sat, 08 Dec 2018 12:30:52 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liu Xiang <liu.xiang6@zte.com.cn>,
	linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, marek.vasut@gmail.com,
 richard@nod.at, linux-kernel@vger.kernel.org, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: mtd: spi-nor: Add 4B_OPCODES flag to is25lp256
Date: Sat,  8 Dec 2018 13:30:40 +0100
Message-Id: <20181208123040.10013-1-boris.brezillon@bootlin.com>
In-Reply-To: <1542200118-3024-1-git-send-email-liu.xiang6@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2018-11-14 at 12:55:18 UTC, Liu Xiang wrote:
> The is25lp256 supports 4-byte opcodes and quad output.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
