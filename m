Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPH0V-0007ND-K4
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 22:27:24 +0000
Date: Tue, 19 Jul 2016 00:26:55 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
Subject: [PATCH for-4.8] ubifs: silence early error messages if MS_SILENT is
 set
Message-ID: <20160718222649.GA17394@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Probe-mounting a volume too small for UBIFS results in kernel log
polution which might irritate users.
Address this by silencing errors which may happen during boot if the
rootfs is e.g. squashfs (and thus rather small) stored on a UBI volume.
This commit should be seen in context with
commit 65fb47721925628bf85ec08c4302ac5e7224a66a
and
commit 90bea5a3f0bf680b87b90516f3c231997f4b8f3b

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 fs/ubifs/super.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 736dd58..4ec0510 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -520,19 +520,19 @@ static int init_constants_early(struct ubifs_info *c)
 	c->max_write_shift = fls(c->max_write_size) - 1;
 
 	if (c->leb_size < UBIFS_MIN_LEB_SZ) {
-		ubifs_err(c, "too small LEBs (%d bytes), min. is %d bytes",
-			  c->leb_size, UBIFS_MIN_LEB_SZ);
+		ubifs_errc(c, "too small LEBs (%d bytes), min. is %d bytes",
+			   c->leb_size, UBIFS_MIN_LEB_SZ);
 		return -EINVAL;
 	}
 
 	if (c->leb_cnt < UBIFS_MIN_LEB_CNT) {
-		ubifs_err(c, "too few LEBs (%d), min. is %d",
-			  c->leb_cnt, UBIFS_MIN_LEB_CNT);
+		ubifs_errc(c, "too few LEBs (%d), min. is %d",
+			   c->leb_cnt, UBIFS_MIN_LEB_CNT);
 		return -EINVAL;
 	}
 
 	if (!is_power_of_2(c->min_io_size)) {
-		ubifs_err(c, "bad min. I/O size %d", c->min_io_size);
+		ubifs_errc(c, "bad min. I/O size %d", c->min_io_size);
 		return -EINVAL;
 	}
 
@@ -543,8 +543,8 @@ static int init_constants_early(struct ubifs_info *c)
 	if (c->max_write_size < c->min_io_size ||
 	    c->max_write_size % c->min_io_size ||
 	    !is_power_of_2(c->max_write_size)) {
-		ubifs_err(c, "bad write buffer size %d for %d min. I/O unit",
-			  c->max_write_size, c->min_io_size);
+		ubifs_errc(c, "bad write buffer size %d for %d min. I/O unit",
+			   c->max_write_size, c->min_io_size);
 		return -EINVAL;
 	}
 
-- 
2.9.0
