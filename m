Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUSCD-0000mZ-20
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 08:06:15 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [v2] mtd: spi-nor: Add support for IS25LP032/064
Date: Wed,  5 Dec 2018 09:05:59 +0100
Message-Id: <20181205080559.23886-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181121133400.12437-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2018-11-21 at 13:34:00 UTC, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= wrote:
> The datasheet is publically available at
> http://www.issi.com/WW/pdf/IS25LP032-064-128.pdf. The parameters fit to
> what is already available for IS25LP128/256.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
