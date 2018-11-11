Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLvst-00014p-RN
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 19:59:05 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
CC: akpm@linux-foundation.org, "Boris Brezillon" <boris.brezillon@bootlin.com>,
 "Tokunori Ikegami" <ikegami@allied-telesis.co.jp>,
 linux-mtd@lists.infradead.org, "Marek Vasut" <marek.vasut@gmail.com>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Brian Norris" <computersforpeace@gmail.com>,
 "Cyrille Pitchen" <cyrille.pitchen@wedev4u.fr>,
 "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Richard Weinberger" <richard@nod.at>
Date: Sun, 11 Nov 2018 19:49:05 +0000
Message-ID: <lsq.1541965745.591656605@decadent.org.uk>
Subject: [PATCH 3.16 098/366] mtd: cfi_cmdset_0002: Change erase functions
 to retry for error
In-Reply-To: <lsq.1541965744.387173642@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

3.16.61-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit 45f75b8a919a4255f52df454f1ffdee0e42443b2 upstream.

For the word write functions it is retried for error.
But it is not implemented to retry for the erase functions.
To make sure for the erase functions change to retry as same.

This is needed to prevent the flash erase error caused only once.
It was caused by the error case of chip_good() in the do_erase_oneblock().
Also it was confirmed on the MACRONIX flash device MX29GL512FHT2I-11G.
But the error issue behavior is not able to reproduce at this moment.
The flash controller is parallel Flash interface integrated on BCM53003.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1900,6 +1900,7 @@ static int __xipram do_erase_chip(struct
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+	int retry_cnt = 0;
 
 	adr = cfi->addr_unlock1;
 
@@ -1917,6 +1918,7 @@ static int __xipram do_erase_chip(struct
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1971,6 +1973,9 @@ static int __xipram do_erase_chip(struct
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
+		if (++retry_cnt <= MAX_RETRIES)
+			goto retry;
+
 		ret = -EIO;
 	}
 
@@ -1990,6 +1995,7 @@ static int __xipram do_erase_oneblock(st
 	unsigned long timeo = jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+	int retry_cnt = 0;
 
 	adr += chip->start;
 
@@ -2007,6 +2013,7 @@ static int __xipram do_erase_oneblock(st
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -2064,6 +2071,9 @@ static int __xipram do_erase_oneblock(st
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
+		if (++retry_cnt <= MAX_RETRIES)
+			goto retry;
+
 		ret = -EIO;
 	}
 
