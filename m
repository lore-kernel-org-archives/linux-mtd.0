Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNZ72-0003al-Cf
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 06:27:38 +0000
Received: by mail-lf0-x241.google.com with SMTP id u62so18683486lfg.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 23:27:15 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V7 0/6] mtd: add support for subpartitions
Date: Wed, 21 Jun 2017 08:26:41 +0200
Message-Id: <20170621062647.6072-1-zajec5@gmail.com>
In-Reply-To: <20170526131415.27186-1-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

This patchset adds support for subpartitions. This feature means support
for partitions that are containers with extra subpartitions / volumes.

V7 splits the first patch into two separated ones (see 1/6 and 2/6). It
also rebases 3/6 on top of l2-mtd.git and its recent changes.

I hope this is acceptable & clean & clear enough.

Please let me know if you think further improvements should be added.

Rafał Miłecki (6):
  mtd: partitions: add helper for deleting partition
  mtd: partitions: remove sysfs files when deleting all master's
    partitions
  mtd: partitions: rename "master" to the "parent" where appropriate
  mtd: partitions: add support for subpartitions
  mtd: partitions: add support for partition parsers
  mtd: extract TRX parser out of bcm47xxpart into a separated module

 drivers/mtd/Kconfig              |   4 +
 drivers/mtd/Makefile             |   1 +
 drivers/mtd/bcm47xxpart.c        |  99 +------------
 drivers/mtd/mtdpart.c            | 311 +++++++++++++++++++++++----------------
 drivers/mtd/parsers/Kconfig      |   8 +
 drivers/mtd/parsers/Makefile     |   1 +
 drivers/mtd/parsers/parser_trx.c | 126 ++++++++++++++++
 include/linux/mtd/partitions.h   |   7 +
 8 files changed, 336 insertions(+), 221 deletions(-)
 create mode 100644 drivers/mtd/parsers/Kconfig
 create mode 100644 drivers/mtd/parsers/Makefile
 create mode 100644 drivers/mtd/parsers/parser_trx.c

-- 
2.11.0
