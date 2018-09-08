Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyd45-0007UC-4Y
 for linux-mtd@lists.infradead.org; Sat, 08 Sep 2018 13:14:19 +0000
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] mtd concat device driver
Date: Sat,  8 Sep 2018 15:13:42 +0200
Message-Id: <20180908131345.8145-1-kernel@nospam.obeliks.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

my router firmware concatenates two identical flash chips into a single
mtd using mtd_concat_create(), and sets up partitions in a way where one
of them crosses the chip boundary. When porting OpenWRT support for the
board from a mach-file based setup to a device-tree based one, I found
that there is no generic way to create a mtd_concat device from within
the dts. The following patches attempt to provide that possibility.

This is a third roll of that patch series, the first one can be seen at
[1]. The second one [2] was a blunder of my own making. Apologies for
not being able to address the correct recipients two times in a row.

In the first discussion, concerns were raised that a driver for a
"virtual" device like this might have no place in the device tree
system. However, I would argue that specifying a composite device is
very similar to specifying the partitions of a mtd, which can also done
in the device tree. In fact, I believe this is the only way to be able
to specify the partitions of such a concat device in the dts file (but
I'm happy to be corrected if I'm mistaken).
I have made the example in the dt-binding documentation a bit more
expressive in this detail.

In the second roll I have also addressed all issues that reviewers have
brought up so far, hopefully to their satisfaction. These were mainly
whitespace fixes and improved comments.

Best regards,
Bernhard

[1] http://lists.infradead.org/pipermail/linux-mtd/2018-September/083832.html
[2] https://lkml.org/lkml/2018/9/7/1015

Bernhard Frauendienst (3):
  mtd: core: add get_mtd_device_by_node
  dt-bindings: add bindings for mtd-concat devices
  mtd: mtdconcat: add dt driver for concat devices

 .../devicetree/bindings/mtd/mtd-concat.txt    |  36 +++++
 drivers/mtd/Kconfig                           |   2 +
 drivers/mtd/Makefile                          |   3 +
 drivers/mtd/composite/Kconfig                 |  12 ++
 drivers/mtd/composite/Makefile                |   6 +
 drivers/mtd/composite/virt_concat.c           | 128 ++++++++++++++++++
 drivers/mtd/mtdcore.c                         |  38 ++++++
 include/linux/mtd/mtd.h                       |   2 +
 8 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd-concat.txt
 create mode 100644 drivers/mtd/composite/Kconfig
 create mode 100644 drivers/mtd/composite/Makefile
 create mode 100644 drivers/mtd/composite/virt_concat.c

-- 
2.18.0
