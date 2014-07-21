Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9KV3-0008OC-F0
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 20:47:58 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd: physmap: actually prevent unaligned accesses
Date: Mon, 21 Jul 2014 22:47:25 +0200
Message-Id: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Gregory Fong <gregory.0xf0@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d0788ce4924758249c9552c91cc33024d3434419 ("mtd: physmap_of: Add
"no-unaligned-direct-access" DT property") intended to prevent
unaligned accesses to the mapped flash by setting map.virt to NO_XIP.

But simple mapping's read_from/write_to still just call memcpy, which
will do unaligned reads/writes at least on mips.

This causes problems on e.g. bcm63xx with smp, as both cores share a
unaligned load/store unit, and unaligned reads sometimes read garbage.

This patchset aims at preventing unaligned accesses for good by making
read_from/write_to check for NO_XIP and do a bytewise copy if one of
to or from is unaligned.

Since this is mostly mtd stuff, it should go through the mtd tree.

Jonas Gorski (3):
  mtd: simple_map: make NO_XIP actually prevent unaligned accesses
  mtd: physmap: allow setting no_unaligned_access for !OF
  MIPS: BCM63XX: disable unaligned accesses for SMP

 arch/mips/bcm63xx/dev-flash.c |  1 +
 drivers/mtd/maps/physmap.c    |  3 +++
 include/linux/mtd/map.h       | 26 +++++++++++++++++++++++---
 include/linux/mtd/physmap.h   |  1 +
 4 files changed, 28 insertions(+), 3 deletions(-)

-- 
2.0.0
