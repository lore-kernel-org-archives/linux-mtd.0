Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UMbKp-0000VW-D2
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2013 09:47:28 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: print @adr when write timeout occurs
Date: Mon, 1 Apr 2013 17:40:18 +0800
Message-ID: <1364809218-28393-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Print out the @adr when the write timeout occurs.
This is useful to check if the write timeouts occur at the
same address.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index fff665d..89b9d68 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1571,8 +1571,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	xip_enable(map, chip, adr);
 	/* FIXME - should have reset delay before continuing */
 
-	printk(KERN_WARNING "MTD %s(): software timeout\n",
-	       __func__ );
+	printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
+	       __func__, adr);
 
 	ret = -EIO;
  op_done:
-- 
1.7.1
