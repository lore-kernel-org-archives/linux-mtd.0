Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEfbn-0005PQ-GW
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 18:39:09 +0000
Date: Fri, 4 May 2018 20:38:44 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Radu Pirea <radu.pirea@microchip.com>
Cc: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] spi-nor: Add support for Atmel Dataflash memories
Message-ID: <20180504203844.0c09bf6d@bbrezillon>
In-Reply-To: <1519818901-7116-1-git-send-email-radu.pirea@microchip.com>
References: <1519818901-7116-1-git-send-email-radu.pirea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Radu,

Sorry for the late reply.

On Wed, 28 Feb 2018 13:55:01 +0200
Radu Pirea <radu.pirea@microchip.com> wrote:

> This patch add support in spi-nor for allmost all dataflash memories
> supported by old mtd_dataflash driver.

Those devices clearly use a different instruction set, so I don't think
they fit in this framework. Can you tell us why you want to move
dataflash support to the SPI NOR framework. I think I know why, but I'd
like to get your version. My guess is that some people want to connect
dataflash chips to the Atmel QSPI controller, and it's not supported
right now because the Atmel QSPI controller implements the SPI-NOR
interface and not the generic SPI one, thus preventing anything that
is not a SPI NOR from being connected to this controller.

If I'm right, then the solution is to convert the QSPI driver to the
spi-mem interface [1] and move it to drivers/spi/.

Regards,

Boris

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=41174
