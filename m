Received: from mail-pg0-f65.google.com ([74.125.83.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbVYf-0007HO-RD
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 16:57:32 +0000
Received: by mail-pg0-f65.google.com with SMTP id 194so15645853pgd.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 08:57:09 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v2 0/2] Added support for spi-nor device pm in m25p80
Date: Wed,  8 Feb 2017 11:52:59 -0500
Message-Id: <1486572781-28808-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The changes below implements power management support in m25p80 driver.
m25p80 pm resume() calls newly a implemented spi_nor_reset() function
that sets up the spi-nor flash to its probed state. This is needed on
platfroms that turn off power to the spi-nor flash on pm suspend. 

Kamal Dasu (2):
  mtd: spi-nor: Added spi-nor reset function
  mtd: m25p80: Added pm ops support

 drivers/mtd/devices/m25p80.c  | 16 +++++++++++
 drivers/mtd/spi-nor/spi-nor.c | 62 ++++++++++++++++++++++++++++---------------
 include/linux/mtd/spi-nor.h   | 21 ++++++++++++++-
 3 files changed, 77 insertions(+), 22 deletions(-)

-- 
1.9.1
