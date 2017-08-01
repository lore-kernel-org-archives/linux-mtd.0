Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcfrr-0005ma-67
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 22:42:24 +0000
Received: by mail-qt0-x244.google.com with SMTP id u19so3067707qtc.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 15:42:02 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@wedev4u.fr,
	marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v7 0/2] Add spi-nor flash device pm support
Date: Tue,  1 Aug 2017 18:41:14 -0400
Message-Id: <1501627276-4567-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since v6 

spi-nor.h
- Reverted all v6 changes
- Added info pointer to spi-nor structure
- Added quad_enable function pointer

spi-nor.c
- Reverted all v6 changes
- Refactored spi_nor_init() function
- Added mtd resume handlers 

The V7 changes below implements power management support using the mtd
handlers for resume in the spi-nor driver. spi-nor mtd pm resume() calls
newly implemented spi_nor_init() function that sets up the spi-nor flash
to its pre-suspend/power-on probed state. This is needed S2/S3 PM 
on platfroms that turn off power to the spi-nor flash on pm suspend. 

Kamal Dasu (2):
  mtd: spi-nor: add spi_nor_init() function
  mtd: spi-nor: Add spi-nor mtd resume handler

 drivers/mtd/spi-nor/spi-nor.c | 75 ++++++++++++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h   |  9 ++++++
 2 files changed, 65 insertions(+), 19 deletions(-)

-- 
1.9.1
