Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UceSL-0004tS-7C
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 16:21:34 +0000
Received: by mail-bk0-f44.google.com with SMTP id jk13so1109600bkc.3
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2013 09:21:10 -0700 (PDT)
From: Dirk Behme <dirk.behme@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS: add tolerance to use variable writesize
Date: Wed, 15 May 2013 18:21:05 +0200
Message-Id: <1368634865-4186-1-git-send-email-dirk.behme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: dirk.behme@de.bosch.com, Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>

UBIfs adapts it‘s structures according to the minimum writeSize reported
by the MTD device. For NOR flash devices, this is normally 1. For NOR
devices with internal hardware-ECC it might be more, such as the S-Die
flash chips of Micron which can use an internal ECC if the chip is
accessed in 32 byte chunks.

The UBIfs mount process checks and compares the writeSize set in the
image and the writeSize reported from the /dev/mtd . UBIfs will fail
to mount if the values differ. It should, though, not be a problem to
mount an image which was created with a writeSize larger than that of
the MTD, if it is larger by an integer factor.

This commit changes the check in a way so it will allow the image
writeSize to be larger than that of the MTD by an integer factor.
It will allow to create images and deploy them on different devices
using different writeSizes. writeSize found using values of 1, 8 and 32.

Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
---
 fs/ubifs/sb.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4c37607..69dd794 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -351,6 +351,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 {
 	long long max_bytes;
 	int err = 1, min_leb_cnt;
+	int chk_tmp;
 
 	if (!c->key_hash) {
 		err = 2;
@@ -362,9 +363,16 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}
 
-	if (le32_to_cpu(sup->min_io_size) != c->min_io_size) {
+	/*
+	 * Allow a min_io_size mismatch in the way that
+	 * the size in the superblock (the image) is larger by
+	 * an integer factor. If image-IOsize mod real-IOsize
+	 * is zero, it should be ok to mount this.
+	 */
+	chk_tmp = le32_to_cpu(sup->min_io_size);
+	if (chk_tmp != c->min_io_size && ((chk_tmp%c->min_io_size) != 0)) {
 		ubifs_err("min. I/O unit mismatch: %d in superblock, %d real",
-			  le32_to_cpu(sup->min_io_size), c->min_io_size);
+			  chk_tmp, c->min_io_size);
 		goto failed;
 	}
 
-- 
1.7.10.4
