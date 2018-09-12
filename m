Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g04cd-0007om-0j
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2018 12:52:16 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ubifs: drop false positive assertion
Date: Wed, 12 Sep 2018 14:51:38 +0200
Message-Id: <20180912125138.10751-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following sequence triggers

	ubifs_assert(c, c->lst.taken_empty_lebs > 0);

at the end of ubifs_remount_fs():

mount -t ubifs /dev/ubi0_0 /mnt
echo 1 > /sys/kernel/debug/ubifs/ubi0_0/ro_error
umount /mnt
mount -t ubifs -o ro /dev/ubix_y /mnt
mount -o remount,ro /mnt

The resulting

UBIFS assert failed in ubifs_remount_fs at 1878 (pid 161)

is a false positive. In the case above c->lst.taken_empty_lebs has
never been changed from its initial zero value. This will only happen
when the deferred recovery is done.

Fix this by doing the assertion only when recovery has been done
already.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 23e7042666a7..617197e35749 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1912,7 +1912,9 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		mutex_unlock(&c->bu_mutex);
 	}
 
-	ubifs_assert(c, c->lst.taken_empty_lebs > 0);
+	if (!c->need_recovery)
+		ubifs_assert(c, c->lst.taken_empty_lebs > 0);
+
 	return 0;
 }
 
-- 
2.18.0
