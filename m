Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1chMJ0-0001pr-Sw
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2017 20:17:33 +0000
Received: by mail-qt0-x242.google.com with SMTP id b16so3906735qte.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Feb 2017 12:17:09 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v6 0/3] Add spi-nor flash device pm support
Date: Fri, 24 Feb 2017 15:16:36 -0500
Message-Id: <1487967399-28967-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since v5 based on review comments:

spi-nor.h
- Added flash state field
- Added spin_lock for flash state change 
- Added wait queue for synchronization of spi-nor ops between 
  mtd and spi-nor driver

spi-nor.c
- Added spi_nor_get/release_device() flash state syncronization functions
- Added mtd suspend and resume handlers

rerverted m25p80.c changes 

The V5 changes below implements power management support using the mtd
handlers for resume and suspend in the spi-nor driver. Implemented flash
state synchronization methods based on other mtd device drivers.
spi-nor mtd pm resume() calls newly implemented spi_nor_init() function
that sets up the spi-nor flash to its pre-suspend state. This is needed
on platfroms that turn off power to the spi-nor flash on pm suspend. 
The code has been rebased to git://github.com/spi-nor/linux.git next
branch.

Kamal Dasu (3):
  mtd: spi-nor: Add spi-nor init function
  mtd: spi-nor: Add spi-nor flash device synchronization between flash
    states
  mtd: spi-nor: Add spi-nor mtd suspend and resume handlers

 drivers/mtd/spi-nor/spi-nor.c | 170 +++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |  22 +++++-
 2 files changed, 164 insertions(+), 28 deletions(-)

-- 
1.9.1
