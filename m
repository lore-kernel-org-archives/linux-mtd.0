Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ0av-000802-EU
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 14:38:36 +0000
Received: by pdbnt7 with SMTP id nt7so27740608pdb.0
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 07:38:12 -0700 (PDT)
From: Joseph East <eastyjr@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joseph East <eastyjr@gmail.com>
Subject: [PATCH V2 0/4] mtd: bcm47xxpart.c: Extra TRX magics,
 NVRAM part handling
Date: Sun, 26 Jul 2015 00:07:39 +0930
Message-Id: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A set of four patches to upstream from the OpenWrt project

Based off of dev.openwrt.org repo r44854

<trunk/target/linux/generic/patches-3.18>
431-mtd-bcm47xx.part-support-for-Xaiomi-specific-board_da.patch
432-mtd-bcm47xx.part-detect-T_Meter_partition_da.patch

<trunk/target/linux/brcm47xx/patches-3.18>
400-mtd-bcm47xxpart-get-nvram.patch

Joseph East (4):
  mtd: bcm47xxpart.c: NVRAM partition handling
  mtd: bcm47xxpart.c: Adding Xaiomi board support
  mtd: bcm47xxpart.c: Adding T_Meter partition detection
  mtd: bcm47xxpart.c: Adding Belkin TRX signatures (Play max series)

 drivers/mtd/bcm47xxpart.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

-- 
2.4.6
