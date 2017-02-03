Received: from mail-qt0-f196.google.com ([209.85.216.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZnLZ-0004oy-KS
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 23:32:55 +0000
Received: by mail-qt0-f196.google.com with SMTP id n13so7744412qtc.0
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2017 15:32:32 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v1 0/5] Added support for spi-nor device pm in m25p80
Date: Fri,  3 Feb 2017 18:31:11 -0500
Message-Id: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The changes below implements power management support in m25p80.
m25p80 pm resume() calls newly a implemented spi_nor_pm_rescan()
function that sets up the spi-nor flash to its probed state. 
This is needed on platfroms that turn off power to the spi-nor
part on suspend, in such cases some parts might need to: 
1. remove flash protection (if applicable)
2. set the address width and/or
3. set the read mode to quad mode depending on the probed configuration

The changes use existing spi-nor framework by refactoring code a bit so
that it can be reused in scan and rescan functions. Changes also ensures
that for platforms that do not need pm support shall not be affected. 

Kamal Dasu (5):
  mtd: spi-nor: Added way to rescan spi-nor device
  mtd: m25p80: Added pm ops support
  spi: Added way to check for pm support for flash devices
  mtd: m25p80: Check if the spi flash device has pm support
  spi: bcm-qspi: Implement the master flash_pm_supported() call

 drivers/mtd/devices/m25p80.c  | 21 ++++++++++
 drivers/mtd/spi-nor/spi-nor.c | 93 +++++++++++++++++++++++++++++++++++++------
 drivers/spi/spi-bcm-qspi.c    |  6 +++
 include/linux/mtd/spi-nor.h   | 17 ++++++++
 include/linux/spi/spi.h       |  8 ++++
 5 files changed, 133 insertions(+), 12 deletions(-)

-- 
1.9.1
