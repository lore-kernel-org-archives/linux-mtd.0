Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDSqn-0006Sx-IN
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 09:45:11 +0000
Received: by mail-lf0-x242.google.com with SMTP id 99so10405014lfu.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 May 2017 02:44:45 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V5 0/4] mtd: add support for subpartitions
Date: Wed, 24 May 2017 11:44:33 +0200
Message-Id: <20170524094437.2174-1-zajec5@gmail.com>
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
that casting const to non-const is hacky and I should work with
add_mtd_partitions / allocate_partition instead.

Apart from trivial rename I needed to add 1 condition to the
allocate_partition and modify 3 lines of code. I hope this is
acceptable.

Please let me know if you can still see any problems with this.

Rafał Miłecki (4):
  mtd: partitions: rename allocate_partition master argument to the
    parent
  mtd: partitions: add support for allocating subpartition
  mtd: partitions: add support for partition parsers
  mtd: extract TRX parser out of bcm47xxpart into a separated module

 drivers/mtd/Kconfig              |   4 +
 drivers/mtd/Makefile             |   1 +
 drivers/mtd/bcm47xxpart.c        |  99 ++---------------------
 drivers/mtd/mtdpart.c            | 170 +++++++++++++++++++++++++--------------
 drivers/mtd/parsers/Kconfig      |   8 ++
 drivers/mtd/parsers/Makefile     |   1 +
 drivers/mtd/parsers/parser_trx.c | 126 +++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h   |   7 ++
 8 files changed, 260 insertions(+), 156 deletions(-)
 create mode 100644 drivers/mtd/parsers/Kconfig
 create mode 100644 drivers/mtd/parsers/Makefile
 create mode 100644 drivers/mtd/parsers/parser_trx.c

-- 
2.11.0
