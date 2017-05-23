Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dD4Qg-0002u8-Jt
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 07:40:32 +0000
Date: Tue, 23 May 2017 09:39:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] mtd: mchp23k256: device tree and mchp23lcv1024
Message-ID: <20170523093957.24110476@bbrezillon>
In-Reply-To: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
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

On Tue, 23 May 2017 12:43:12 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> This series adds device tree support to the mchp23k256 driver and
> support for the mchp23lcv1024 chip. I suspect there are more compatible
> variants that we could now enumerate if desired.
> 
> Chris Packham (5):
>   mtd: mchp23k256: Add OF device ID table
>   mtd: mchp23k256: switch to mtd_device_register()
>   mtd: handle partitioning on devices with 0 erasesize
>   mtd: mchp23k256: add partitioning support
>   mtd: mchp23k256: Add support for mchp23lcv1024

Shouldn't we add a spi_device_id table to allow non-DT users to probe
mchp23lcv1024 chips?

> 
>  .../bindings/mtd/microchip,mchp23k256.txt          | 18 ++++++
>  drivers/mtd/devices/mchp23k256.c                   | 65 ++++++++++++++++++----
>  drivers/mtd/mtdpart.c                              | 25 ++++++---
>  3 files changed, 87 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> 
