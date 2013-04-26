Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVo2h-0003Jf-RV
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 19:10:49 +0000
Received: from counter.omicron.at ([212.183.10.29])
 by ns.omicron.at (8.13.1/8.13.1) with ESMTP id r3QJAdF8012667
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2013 21:10:44 +0200
Received: from mary.at.omicron.at (mary.at.omicron.at [172.22.100.48])
 by counter.omicron.at (8.14.4/8.14.4) with ESMTP id r3QJAdFK019320
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2013 21:10:39 +0200
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/4] mtd: cfi_cmdset_0002: Invalidate cache after
 entering/exiting OTP memory
Date: Fri, 26 Apr 2013 21:10:28 +0200
In-Reply-To: <1367003430-24584-1-git-send-email-christian.riesch@omicron.at>
References: <1367003430-24584-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <fce747f6-9364-48ce-b3b5-1762dae378dc@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the one time programmable (OTP) memory region is entered by
issuing the 0xaa/0x55/0x88 command, the OTP memory occupies the
addresses which are normally used by the first sector of the regular
flash memory. This patch therefore invalidates cache for this
addresses after entering/exiting OTP memory.

This patch also moves the code into separate functions.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---

Hi,

I am not sure if invalidating the cache here is required or not. The old code
(that supported only reading the first 8 bytes of OTP memory of some flashes
with AMD chipset) did not do it. Any comments on this?

Thank you!
Best regards, Christian

 drivers/mtd/chips/cfi_cmdset_0002.c |   44 +++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 353ddfb..c9c544c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1157,11 +1157,42 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
 			loff_t adr, size_t len, u_char *buf);
 
+static inline void otp_enter(struct map_info *map, struct flchip *chip,
+			     loff_t adr, size_t len)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+
+	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
+}
+
+static inline void otp_exit(struct map_info *map, struct flchip *chip,
+			    loff_t adr, size_t len)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+
+	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
+}
+
 static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
 	DECLARE_WAITQUEUE(wait, current);
 	unsigned long timeo = jiffies + HZ;
-	struct cfi_private *cfi = map->fldrv_priv;
 
  retry:
 	mutex_lock(&chip->mutex);
@@ -1183,16 +1214,9 @@ static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chi
 
 	chip->state = FL_READY;
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-
+	otp_enter(map, chip, adr, len);
 	map_copy_from(map, buf, adr, len);
-
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	otp_exit(map, chip, adr, len);
 
 	wake_up(&chip->wq);
 	mutex_unlock(&chip->mutex);
-- 
1.7.9.5
