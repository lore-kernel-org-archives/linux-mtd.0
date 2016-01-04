Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCJr-0004tg-AR
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:05:36 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] MTD: lantiq: xway: various nand fixes
Date: Mon,  4 Jan 2016 22:04:55 +0100
Message-Id: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds various fixes for the nand driver used on Lantiq DSL SoC.
These patches have accumulated in openwrt over the last 2 years and the
names of the original contributors got lost over the various rebases. If it
is required to find out all the names and emails, then I can dig into the
mailing list archive and try to track them down.

John Crispin (6):
  MTD: lantiq: xway: fix invalid operator
  MTD: lantiq: xway: the latched command should be persistent
  MTD: lantiq: xway: remove endless loop
  MTD: lantiq: xway: add missing write_buf and read_buf to nand driver
  MTD: lantiq: xway: fix nand locking
  MTD: lantiq: xway: allow request line masking

 drivers/mtd/nand/xway_nand.c |  118 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 103 insertions(+), 15 deletions(-)

-- 
1.7.10.4
