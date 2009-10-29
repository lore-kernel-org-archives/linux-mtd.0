Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3TkY-00049w-EK
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:05:11 +0000
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: add lock fixup for AT49BV640D and AT49BV640DT chips
Date: Thu, 29 Oct 2009 13:05:02 +0100
Message-Id: <1256817902-16534-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch sets the MTD_POWERUP_LOCK flag for AT49BV640D and AT49BV640DT
devices, since the devices are locked when powered up and needs to be unlocked
before interfaced.

Quote datasheet; "At power-up and reset, all sectors have their Softlock
protection mode enabled.".

Tested on AVR32 hardware platform with an AT49BV640D flash device.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e7563a9..6228115 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -52,6 +52,7 @@
 #define M50FLW080A	0x0080
 #define M50FLW080B	0x0081
 #define AT49BV640D	0x02de
+#define AT49BV640DT	0x02db
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -255,6 +256,11 @@ static void fixup_use_point(struct mtd_info *mtd, void *param)
 	}
 }
 
+static void fixup_use_at49bv640dx_lock(struct mtd_info *mtd, void *param)
+{
+	mtd->flags |= MTD_POWERUP_LOCK;
+}
+
 static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
 {
 	struct map_info *map = mtd->priv;
@@ -313,6 +319,8 @@ static struct cfi_fixup fixup_table[] = {
 	 * we know that is the case.
 	 */
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point, NULL },
+	{ CFI_MFR_ATMEL, AT49BV640D, fixup_use_at49bv640dx_lock, NULL },
+	{ CFI_MFR_ATMEL, AT49BV640DT, fixup_use_at49bv640dx_lock, NULL },
 	{ 0, 0, NULL, NULL }
 };
 
-- 
1.6.0.4
