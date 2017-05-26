Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEF4s-0003Ct-IS
 for linux-mtd@lists.infradead.org; Fri, 26 May 2017 13:14:52 +0000
Received: by mail-lf0-x243.google.com with SMTP id m18so991551lfj.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 May 2017 06:14:28 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V6 0/5] mtd: add support for subpartitions
Date: Fri, 26 May 2017 15:14:10 +0200
Message-Id: <20170526131415.27186-1-zajec5@gmail.com>
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

Initially I wanted to keep my changes minimalistic but Brian pointed
that casting const to non-const is hacky and I should work on cleaner
solution instead.

Apart from trivial renames I needed to
1) Modify 1 line in allocate_partition
2) Add recursion to the deletion function & mtd_get_device_size

V6 mostly reworks flat structure of partitions into a tree one.

I hope this is acceptable & clean & clear enough.

Please let me know if you think further improvements should be added.

Rafał Miłecki (5):
  mtd: partitions: add helper for deleting partition
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
