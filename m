Received: from imta21.fe.bosch.de ([139.15.243.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVXs-00068k-5I
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:59:19 +0000
Received: from smtp6-v.fe.bosch.de (imta23.fe.bosch.de [139.15.243.227])
 by imta21.fe.bosch.de (Postfix) with ESMTP id E3EE5C09B2
 for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2017 09:49:18 +0100 (CET)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>, Manfred Spraul
 <manfred.spraul@de.bosch.com>
Subject: [PATCH 5/5] mtdram flight recorder: Add checksums.
Date: Wed, 6 Dec 2017 09:50:39 +0100
Message-ID: <20171206085039.27164-6-dirk.behme@de.bosch.com>
In-Reply-To: <20171206085039.27164-1-dirk.behme@de.bosch.com>
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
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

From: Manfred Spraul <manfred@colorfullife.com>

Add checksums, to ensure that corruptions can be detected.
To allow userspace to detect the new fields, use new IDs
for WRITE/ERASE commands.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
Cc: Manfred Spraul <manfred@colorfullife.com>
---
 drivers/mtd/devices/mtdram.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 202696bc92ef..cdf5ae90943b 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -190,6 +190,11 @@ static const struct file_operations fr_fops = {
 
 #define FUNC_WRITE	1UL
 #define FUNC_ERASE	2UL
+#define FUNC_WRITE_CHK	3UL
+#define FUNC_ERASE_CHK	4UL
+#define CHECK_VAL1	7ULL
+#define CHECK_VAL2	(2*76777ULL)
+#define CHECK_VAL3	104677ULL
 
 static void write_u32(u32 data)
 {
@@ -348,9 +353,10 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 #ifdef CONFIG_MTDRAM_FLIGHTRECORDER
 	start_write(3*8);
-	write_u32(FUNC_ERASE);
+	write_u32(FUNC_ERASE_CHK);
 	write_u64(instr->addr);
 	write_u64(instr->len);
+	write_u64(CHECK_VAL1*(u64)instr->len + CHECK_VAL2*(u64)instr->addr);
 	end_write();
 #endif
 
@@ -407,12 +413,23 @@ static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 	memcpy((char *)mtd->priv + to, buf, len);
 
 #ifdef CONFIG_MTDRAM_FLIGHTRECORDER
-	start_write(3*8 + len);
-	write_u32(FUNC_WRITE);
-	write_u64(to);
-	write_u64(len);
-	write_blob(buf, len);
-	end_write();
+	start_write(4*8 + len);
+	{
+		u64 i;
+		u64 chk;
+
+		write_u32(FUNC_WRITE_CHK);
+
+		chk = CHECK_VAL1*(u64)to + CHECK_VAL2*(u64)len;
+		for (i = 0; i < len; i++)
+			chk += (i + buf[i])*CHECK_VAL3;
+
+		write_u64(to);
+		write_u64(len);
+		write_blob(buf, len);
+		write_u64(chk);
+		end_write();
+	}
 #endif
 
 	*retlen = len;
-- 
2.14.1
