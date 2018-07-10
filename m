Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcxPw-0006Iq-Qt
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 18:31:18 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 4.9 50/52] mtd: cfi_cmdset_0002: Change erase functions to
 check chip good only
Date: Tue, 10 Jul 2018 20:25:18 +0200
Message-Id: <20180710182454.006808585@linuxfoundation.org>
In-Reply-To: <20180710182449.285532226@linuxfoundation.org>
References: <20180710182449.285532226@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit 79ca484b613041ca223f74b34608bb6f5221724b upstream.

Currently the functions use to check both chip ready and good.
But the chip ready is not enough to check the operation status.
So change this to check the chip good instead of this.
About the retry functions to make sure the error handling remain it.

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
Cc: stable@vger.kernel.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


---
 drivers/mtd/chips/cfi_cmdset_0002.c |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2292,12 +2292,13 @@ static int __xipram do_erase_chip(struct
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_good(map, adr, map_word_ff(map)))
 			break;
 
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 				__func__ );
+			ret = -EIO;
 			break;
 		}
 
@@ -2305,15 +2306,15 @@ static int __xipram do_erase_chip(struct
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
-	if (!chip_good(map, adr, map_word_ff(map))) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 
 	chip->state = FL_READY;
@@ -2387,7 +2388,7 @@ static int __xipram do_erase_oneblock(st
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, map_word_ff(map))) {
 			xip_enable(map, chip, adr);
 			break;
 		}
@@ -2396,6 +2397,7 @@ static int __xipram do_erase_oneblock(st
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 				__func__ );
+			ret = -EIO;
 			break;
 		}
 
@@ -2403,15 +2405,15 @@ static int __xipram do_erase_oneblock(st
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
-	if (!chip_good(map, adr, map_word_ff(map))) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 
 	chip->state = FL_READY;
