From: Ronald Wahl <ronald.wahl@raritan.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH] mtd: cfi_cmdset_0001.c: Take lock when determining block
 lock status.
Date: Wed, 22 Apr 2015 14:37:04 +0200
Message-Id: <1429706224-17356-1-git-send-email-ronald.wahl@raritan.com>
Cc: Ronald Wahl <ronald.wahl@raritan.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Determining block lock status modifies chip status without taking lock.
This can lead to hanging flash operations

Signed-off-by: Ronald Wahl <ronald.wahl@raritan.com>
---

Not sure is this patch is efficient in the suspend/resume path since the lock
is then taken and released for every flash block. This is also the reason why
I split out a separate do_getlockstatus_oneblock_unlocked() routine. Maybe we
need to take the lock separately in the suspend/resume path and then call this
_unlocked variant for each flash block.

In my own use case I do not use suspend resume so I just ignored this. So the
question is: Is the patch usable in it's current form respective what needs to
change.

 drivers/mtd/chips/cfi_cmdset_0001.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 286b97a..cad687f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2044,10 +2044,10 @@ static void cfi_intelext_sync (struct mtd_info *mtd)
 	}
 }
 
-static int __xipram do_getlockstatus_oneblock(struct map_info *map,
-						struct flchip *chip,
-						unsigned long adr,
-						int len, void *thunk)
+static int __xipram do_getlockstatus_oneblock_unlocked(struct map_info *map,
+						       struct flchip *chip,
+						       unsigned long adr,
+						       int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int status, ofs_factor = cfi->interleave * cfi->device_type;
@@ -2061,6 +2061,27 @@ static int __xipram do_getlockstatus_oneblock(struct map_info *map,
 	return status;
 }
 
+static int __xipram do_getlockstatus_oneblock(struct map_info *map,
+					      struct flchip *chip,
+					      unsigned long adr,
+					      int len, void *thunk)
+{
+	int ret;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, adr + chip->start, FL_JEDEC_QUERY);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	ret = do_getlockstatus_oneblock_unlocked(map, chip, adr, len, thunk);
+
+	put_chip(map, chip, adr);
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
 #ifdef DEBUG_LOCK_BITS
 static int __xipram do_printlockstatus_oneblock(struct map_info *map,
 						struct flchip *chip,
-- 
2.1.0
