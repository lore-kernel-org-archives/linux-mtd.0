Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIdUi-0000ff-TJ
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 17:12:15 +0000
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01lp0178.outbound.protection.outlook.com [23.103.139.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id
 4EA1B294011
 for <linux-mtd@lists.infradead.org>; Wed, 16 May 2018 02:11:56 +0900 (JST)
 (envelope-from smtpuser@allied-telesis.co.jp)
From: smtpuser <smtpuser@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH v6 5/5] mtd: cfi_cmdset_0002: Change erase one block to enable
 XIP once
Date: Wed, 16 May 2018 02:11:20 +0900
Message-Id: <20180515171120.5629-6-smtpuser@allied-telesis.co.jp>
In-Reply-To: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
References: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
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

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

To enable XIP it is executed both normal and error cases.
This call can be moved after the for loop as same with erase chip.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
Changes since v5:
- None since this change is implemented by v6 patch series.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 6adda4dc2007..6c681cbf2d37 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2389,13 +2389,10 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_good(map, adr, map_word_ff(map))) {
-			xip_enable(map, chip, adr);
+		if (chip_good(map, adr, map_word_ff(map)))
 			break;
-		}
 
 		if (time_after(jiffies, timeo)) {
-			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 			       __func__);
 			ret = -EIO;
@@ -2418,6 +2415,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	}
 
 	chip->state = FL_READY;
+	xip_enable(map, chip, adr);
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
 	mutex_unlock(&chip->mutex);
-- 
2.16.1
