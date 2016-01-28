Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVW-00046n-9o
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:39 +0000
Received: by mail-pf0-x242.google.com with SMTP id n128so1497664pfn.3
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:17 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH 0/8] mtd: spi-nor: locking fixes and updates
Date: Wed, 27 Jan 2016 21:51:39 -0800
Message-Id: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

These are an assortment of fixes and updates to the SPI NOR lock/unlock
feature. The biggest new features are:
(a) Status Register protection; I don't see why this shouldn't be enabled by
    default. See patch 4's description.
(b) Bottom-block protection support (via TB status bit)
(c) Lock/unlock support for a few Winbond flash

Patch 7 (Top/Bottom protection support) is still an RFC, as I think it deserves
a bit more work. But I'm just getting it out there, as it's been sitting on my
plate for a while.

Regards,
Brian

Brian Norris (8):
  mtd: spi-nor: wait for SR_WIP to clear on initial unlock
  mtd: spi-nor: guard against underflows in stm_is_locked_sr
  mtd: spi-nor: silently drop lock/unlock for already locked/unlocked
    region
  mtd: spi-nor: disallow further writes to SR if WP# is low
  mtd: spi-nor: use BIT() for flash_info flags
  mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
  mtd: spi-nor: add TB (Top/Bottom) protect support
  mtd: spi-nor: support lock/unlock for a few Winbond chips

 drivers/mtd/spi-nor/spi-nor.c |  153 +++++++++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h   |    2 +
 2 files changed, 128 insertions(+), 27 deletions(-)

-- 
1.7.9.5
