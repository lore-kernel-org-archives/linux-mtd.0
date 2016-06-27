Received: from mail-db3on0102.outbound.protection.outlook.com
 ([157.55.234.102] helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHTgg-0001SX-Oj
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 10:22:43 +0000
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <hramrach@gmail.com>, <jteki@openedev.com>, <cyrille.pitchen@atmel.com>,
 <rfsw-patches@mlist.nokia.com>, <pawel.lenkow@itlen.com>
Subject: [RFC 0/3] mtd: spi-nor: DUAL/QUAD I/O read modes implementation
Date: Mon, 27 Jun 2016 12:20:57 +0200
Message-ID: <1467022860-17552-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

This small series adds support for new spi-nor Cypress(Spansion) FS-S
family based on s25fs512s device. This family stopped to support
QUAD/DUAL read modes, so fastest supported read is FAST_READ
in current framework. Series implements DUAL/QUAD I/O
read modes, as well as continuous read mode configuration byte.

Chnages are under KConfig entry because it is easier for me
to merge them between kernel version.

RFC since you are working on new framework, this might help to define
some requirememnts.

Marcin Krzeminski (3):
  mtd: spi-nor: DUAL I/O and QUAD I/O modes support
  mtd: spi-nor: Read Mode byte implementation
  mtd: spi-nor: Support for s25fs512s

 drivers/mtd/spi-nor/Kconfig   |  8 ++++
 drivers/mtd/spi-nor/spi-nor.c | 91 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   | 21 ++++++++++
 3 files changed, 118 insertions(+), 2 deletions(-)

-- 
2.7.4
