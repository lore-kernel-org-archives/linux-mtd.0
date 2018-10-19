Received: from mail1.bemta23.messagelabs.com ([67.219.246.1])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDY4B-0007FD-Ky
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 16:56:28 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: boris.brezillon@free-electrons.com
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 07/10] mtd: cfi_cmdset_0002: Remove op_done goto statement
 from do_write_oneword()
Date: Sat, 20 Oct 2018 01:55:23 +0900
Message-Id: <20181019165526.11159-8-ikegami@allied-telesis.co.jp>
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

This is just to refactor the function by removing the goto statement.

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
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 2340a5a7cc39..e97b1f390fc8 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1641,8 +1641,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		return ret;
 	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
 
 	if (mode == FL_OTP_WRITE)
 		otp_enter(map, chip, adr, map_bankwidth(map));
@@ -1655,9 +1655,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
-		goto op_done;
+		pr_debug("MTD %s(): NOP\n", __func__);
+		do_write_oneword_done(map, chip, adr, mode);
+		return ret;
 	}
 
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
@@ -1683,7 +1683,6 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
 	xip_enable(map, chip, adr);
 
- op_done:
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.18.0
