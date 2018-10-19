Received: from mail1.bemta23.messagelabs.com ([67.219.246.1])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDY44-0007FD-CR
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 16:55:58 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: boris.brezillon@free-electrons.com
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 02/10] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Sat, 20 Oct 2018 01:55:18 +0900
Message-Id: <20181019165526.11159-3-ikegami@allied-telesis.co.jp>
In-Reply-To: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is enough to use chip_good() only so chip_ready() is not necessary.
For this change the order to check timeout is also needed to chagne.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v1:
- None.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 251c9e1675bd..c2e51768a02c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1882,14 +1882,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
-			break;
-
 		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
 
+		if (time_after(jiffies, timeo))
+			break;
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
-- 
2.18.0
