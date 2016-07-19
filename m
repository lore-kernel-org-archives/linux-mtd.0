Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPbHK-0000pH-3I
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 20:06:06 +0000
Received: by mail-pa0-x241.google.com with SMTP id hh10so1883809pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 13:05:45 -0700 (PDT)
Date: Tue, 19 Jul 2016 13:05:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Cc: kbuild test robot <fengguang.wu@intel.com>, Marek Vasut <marex@denx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 Graham Moore <grmoore@opensource.altera.com>
Subject: [PATCH] mtd: spi-nor: don't build Cadence QuadSPI on non-ARM
Message-ID: <20160719200541.GA854@google.com>
References: <201607190315.0nkQuD2W%fengguang.wu@intel.com>
 <20160718202026.GB137880@google.com> <578DC294.5090605@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578DC294.5090605@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 08:03:00AM +0200, Stefan Roese wrote:
> On 18.07.2016 22:20, Brian Norris wrote:
> >Hmm, does x86 not define readsl()/writesl()? I can never tell what
> >accessors are supposed to be "standard" across architectures.
> >
> >Either we need to drop the COMPILE_TEST or maybe make it (!X86 &&
> >COMPILE_TEST).
> 
> iowrite32_rep() etc should work for x86 as well.

Looks like it might. I'm not sure the original submitter can retest
right now (travel), so I'd probably rather just take the easy fix for
now, and we can widen to COMPILE_TEST later if desired.

If I could get an ack on something like this, I'll apply it soon:

---8<---
From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 19 Jul 2016 13:02:40 -0700
Subject: [PATCH] mtd: spi-nor: don't build Cadence QuadSPI on non-ARM

This controller driver is used only on ARM but is mostly written
portably so it can build on other arch'es. Unfortunately, at least x86
doesn't provibe readsl()/writesl() accessors. We could possibly fix this
issue in the future by using io{read,write}32_rep() instead, but let's
just drop the architectures we aren't using for now.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 1e6f037923d9..4a682ee0f632 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -40,7 +40,7 @@ config SPI_ATMEL_QUADSPI
 
 config SPI_CADENCE_QUADSPI
 	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || COMPILE_TEST)
+	depends on OF && ARM
 	help
 	  Enable support for the Cadence Quad SPI Flash controller.
 
-- 
