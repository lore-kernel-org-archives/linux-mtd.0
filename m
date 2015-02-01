Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHyBl-0004iv-NV
 for linux-mtd@lists.infradead.org; Sun, 01 Feb 2015 17:20:02 +0000
Received: by mail-wg0-f54.google.com with SMTP id b13so34808055wgh.13
 for <linux-mtd@lists.infradead.org>; Sun, 01 Feb 2015 09:19:38 -0800 (PST)
Message-ID: <54CE5F53.5040808@gmail.com>
Date: Sun, 01 Feb 2015 18:16:03 +0100
From: Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] spi-nor: m25p80: add support for deep power down
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some time ago there was a first attempt to add deep power down support.
IIRC it was rejected because the differences between the chip types were
not considered well enough.

This patch is meant as a RfC.
Support for deep power down may be relevant especially for embedded devices.
I own devices with three different SPI NOR flash chips which all use the
same opcodes for suspend / resume.
Difference ist just the time they need for waking up.
The code however supports any type of suspend / resume procedure.

Initially only support for the chips I have access to was implemented.

Heiner Kallweit (2):
  spi-nor: add chip_name to struct spi_nor
  m25p80: if supported put chip to deep power down if not used

 drivers/mtd/devices/m25p80.c  | 112 +++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/spi-nor.c |   1 +
 include/linux/mtd/spi-nor.h   |   2 +
 3 files changed, 114 insertions(+), 1 deletion(-)

-- 
2.2.2
