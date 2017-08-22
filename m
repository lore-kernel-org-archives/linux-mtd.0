Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkG4p-0003VW-JC
 for linux-mtd@lists.infradead.org; Tue, 22 Aug 2017 20:47:10 +0000
Received: by mail-wr0-x242.google.com with SMTP id p8so21023452wrf.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Aug 2017 13:46:46 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@wedev4u.fr,
	marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v8 0/2]  Add spi-nor flash device pm support
Date: Tue, 22 Aug 2017 16:45:20 -0400
Message-Id: <1503434722-5429-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since v7 

spi-nor.h
- Fix comment style

spi-nor.c
- Fix condition check to set_4byte() when nor->addr_width == 4 in spi_nor_init()
- Bring back quad_enable logic to spi_nor_setup() and remove it from spi_nor_scan()
- Remove duplicate comment section in spi_nor_scan()
- Leave dev_info() string as before in spi_nor_scan()

The V8 changes below implements power management support using the mtd
handlers for resume in the spi-nor driver. spi-nor mtd pm resume() calls
newly implemented spi_nor_init() function that sets up the spi-nor flash
to its pre-suspend/power-on probed state. This is needed S2/S3 PM 
on platfroms that turn off power to the spi-nor flash on pm suspend.

Kamal Dasu (2):
  mtd: spi-nor: add spi_nor_init() function
  mtd: spi-nor: Add spi-nor mtd resume handler

 drivers/mtd/spi-nor/spi-nor.c | 68 +++++++++++++++++++++++++++++++------------
 include/linux/mtd/spi-nor.h   | 10 +++++++
 2 files changed, 60 insertions(+), 18 deletions(-)

-- 
1.9.1
