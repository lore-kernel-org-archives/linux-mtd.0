Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoQmP-00025Q-GN
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 07:24:34 +0000
Received: by mail-wm0-x233.google.com with SMTP id f198so53108634wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 00:24:13 -0700 (PDT)
From: Arnaud Mouiche <arnaud.mouiche@invoxia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, peterpansjtu@gmail.com
Cc: Arnaud Mouiche <arnaud.mouiche@invoxia.com>
Subject: [RFC] UBI: harden torture_peb to miss less bad blocks.
Date: Fri,  8 Apr 2016 09:23:34 +0200
Message-Id: <1460100214-31298-2-git-send-email-arnaud.mouiche@invoxia.com>
In-Reply-To: <1460100214-31298-1-git-send-email-arnaud.mouiche@invoxia.com>
References: <1460100214-31298-1-git-send-email-arnaud.mouiche@invoxia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using an uniform pattern spread all over the block under test detect
some issues but not all.

ex: bits in a page affected by bits at a same offset in another page.

Testing every cases is difficult, but at least we can use fuzzing
techniques to discover such issues.

Signed-off-by: Arnaud Mouiche <arnaud.mouiche@invoxia.com>
---
 drivers/mtd/ubi/io.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index ed0bcb3..91ab744 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -89,6 +89,7 @@
 #include <linux/crc32.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/random.h>
 #include "ubi.h"
 
 static int self_check_not_bad(const struct ubi_device *ubi, int pnum);
@@ -412,6 +413,8 @@ static uint8_t patterns[] = {0xa5, 0x5a, 0x0};
 static int torture_peb(struct ubi_device *ubi, int pnum)
 {
 	int err, i, patt_count;
+	uint8_t *peb_rnd_buff = NULL;
+	const int rnd_check_count = 4;
 
 	ubi_msg(ubi, "run torture test for PEB %d", pnum);
 	patt_count = ARRAY_SIZE(patterns);
@@ -456,12 +459,41 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 			goto out;
 		}
 	}
+	/* try a random pattern */
+	peb_rnd_buff = kmalloc(ubi->peb_size, GFP_KERNEL);
+	if (!peb_rnd_buff) {
+		err = 0;
+		goto out;
+	}
+	for (i=0; i < rnd_check_count; i++) {
+		get_random_bytes(peb_rnd_buff, ubi->peb_size);
+
+		err = do_sync_erase(ubi, pnum);
+		if (err)
+			goto out;
+
+		err = ubi_io_write(ubi, peb_rnd_buff, pnum, 0, ubi->peb_size);
+		if (err)
+			goto out;
+
+		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		if (err)
+			goto out;
+
+		if (memcmp(peb_rnd_buff, ubi->peb_buf, ubi->peb_size)) {
+			ubi_err(ubi, "random pattern checking failed for PEB %d",
+				pnum);
+			err = -EIO;
+			goto out;
+		}
+	}
 
 	err = patt_count;
 	ubi_msg(ubi, "PEB %d passed torture test, do not mark it as bad", pnum);
 
 out:
 	mutex_unlock(&ubi->buf_mutex);
+	kfree(peb_rnd_buff);
 	if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err)) {
 		/*
 		 * If a bit-flip or data integrity error was detected, the test
-- 
1.9.1
