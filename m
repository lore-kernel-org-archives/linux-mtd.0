Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vedcz-0002Pt-Iq
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 04:25:02 +0000
Message-ID: <527C677E.1030404@ti.com>
Date: Fri, 8 Nov 2013 09:54:30 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv3 0/2] m25p80: QUAD read support + cleanup.
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
 <20131107182955.GV20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131107182955.GV20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
On Thursday 07 November 2013 11:59 PM, Brian Norris wrote:
> + Huang
>
> On Wed, Nov 06, 2013 at 08:05:33PM +0530, Sourav Poddar wrote:
>> Patch series does the following:
>> 1. Cleanup the m25p80 driver to convert bool check for
>>     read into an enum. This will help adding more read
>>     commands into the driver easily.
>>
>> 2. Add quad read support for spansion and macronix flash devices.
> Do we have any testing results? I know that some QSPI controllers still
> need some more work to be able to support this, but has someone tested
> this current patch set with a "true" SPI controller on mainline?
>
I have tested this with a 3.12-rc6  based internal kernel(as dt patches 
are not in).
  You can check the controller at drivers/spi/spi-ti-qspi.c. From driver 
perspective, there
is an additional patch[1] required, it was pulled in by Mark, and I can 
see it in his tree.
Testing details:
flash_erase the entire chip
mtd write the flash with a particular pattern
mtd read the flash
diff the write and the read value.

[1]:
Add dual/quad read mode bit flag for the master controller.
These check will be used in the spi framework to determine
whether the master controller can do dual/quad read respectively.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
v1->v2
Added dual mode bit also.
  drivers/spi/spi-ti-qspi.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index e12d962..7a45c3e 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -472,7 +472,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
      if (!master)
          return -ENOMEM;

-    master->mode_bits = SPI_CPOL | SPI_CPHA;
+    master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_DUAL | SPI_RX_QUAD;

      master->bus_num = -1;
      master->flags = SPI_MASTER_HALF_DUPLEX;

> Bri
> an
