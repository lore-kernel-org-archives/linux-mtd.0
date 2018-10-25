Received: from mail1.bemta23.messagelabs.com ([67.219.246.3])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFiZ0-0004jJ-Jk
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2018 16:32:53 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: boris.brezillon@free-electrons.com
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword() to
 use chip_good()
Date: Fri, 26 Oct 2018 01:32:09 +0900
Message-Id: <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
In-Reply-To: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In OpenWrt Project the flash write error caused on some products.
Also the issue can be fixed by using chip_good() instead of chip_ready().
The chip_ready() just checks the value from flash memory twice.
And the chip_good() checks the value with the expected value.
Probably the issue can be fixed as checked correctly by the chip_good().
So change to use chip_good() instead of chip_ready().

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>
Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>
Reported-by: Fabio Bettoni <fbettoni@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v2:
- Just update the commit message for the comment.

Changes since v1:
- Just update the commit message.

Background:
This is required for OpenWrt Project to result the flash write issue as
below patche.
<https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>

Also the original patch in OpenWRT is below.
<https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>

The reason to use chip_good() is that just actually fix the issue.
And also in the past I had fixed the erase function also as same way by the
patch below.
  <https://patchwork.ozlabs.org/patch/922656/>
    Note: The reason for the patch for erase is same.

In my understanding the chip_ready() is just checked the value twice from
flash.
So I think that sometimes incorrect value is read twice and it is depended
on the flash device behavior but not sure..

So change to use chip_good() instead of chip_ready().

 drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 72428b6bfc47..251c9e1675bd 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1627,31 +1627,37 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		if (chip_good(map, adr, datum))
+			break;
+
+		if (time_after(jiffies, timeo)){
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
+			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, adr))
-			break;
-
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
+
 	/* Did we succeed? */
-	if (!chip_good(map, adr, datum)) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
+		}
 
 		ret = -EIO;
 	}
+
 	xip_enable(map, chip, adr);
+
  op_done:
 	if (mode == FL_OTP_WRITE)
 		otp_exit(map, chip, adr, map_bankwidth(map));
-- 
2.18.0
