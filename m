Received: from smtp-fw-9101.amazon.com ([207.171.184.25])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjZ8M-0001EZ-0D
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2019 00:32:43 +0000
Date: Wed, 16 Jan 2019 00:32:11 +0000
From: Przemyslaw Sobon <psobon@amazon.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "Richard Weinberger" <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <psobon@amazon.com>
Subject: [PATCH] mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Message-ID: <20190116003211.GA57460@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There was an endless loop in CFI Flash driver when a value was written
incorrectly. In such case chip_ready returns true but chip_good returns
false and we never get out of the loop.

The solution was to break the loop in 2 cases, either device is ready or
device is not ready and timeout elapsed. The correctness of the write is
checked after the loop ended. That way we ensure the loop always ends.

Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 72428b6bfc47..6cc31d2057e9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1879,15 +1879,18 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_good(map, adr, datum)) {
-			xip_enable(map, chip, adr);
-			goto op_done;
-		}
+		if (chip_ready(map, adr))
+			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
 
+	if (chip_good(map, adr, datum)) {
+		xip_enable(map, chip, adr);
+		goto op_done;
+	}
+
 	/*
 	 * Recovery from write-buffer programming failures requires
 	 * the write-to-buffer-reset sequence.  Since the last part
-- 
2.16.5
