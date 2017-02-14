Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdf6T-00015D-G2
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 15:33:19 +0000
Received: by mail-oi0-x243.google.com with SMTP id x84so2662274oix.2
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2017 07:32:56 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v4 0/2] Added support for spi-nor device pm in m25p80
Date: Tue, 14 Feb 2017 10:32:46 -0500
Message-Id: <1487086368-4118-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since v3 based on review comments:
spi-nor.h
- Moved flash_info field to end of structure
- Added flash_info entry to the spi_nor structure description
- Reworded the function description
- Reworded the commit message

m25p80.c:
- Only implement and initialize the resume() pm_op

The V4 changes below implements power management support in m25p80 driver.
m25p80 pm resume() calls newly a implemented spi_nor_init() function
that sets up the spi-nor flash to its probed state. This is needed on
platfroms that turn off power to the spi-nor flash on pm suspend.
The code has been rebased to git://github.com/spi-nor/linux.git next
branch.


Kamal Dasu (2):
  mtd: spi-nor: Added spi-nor init function
  mtd: m25p80: Added pm ops support

 drivers/mtd/devices/m25p80.c  | 11 +++++++
 drivers/mtd/spi-nor/spi-nor.c | 72 +++++++++++++++++++++++++++----------------
 include/linux/mtd/spi-nor.h   | 18 ++++++++++-
 3 files changed, 73 insertions(+), 28 deletions(-)

-- 
1.9.1
