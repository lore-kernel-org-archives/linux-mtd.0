Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRedv-0007qo-BA
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:29:09 +0000
Received: by pdjz10 with SMTP id z10so27146983pdj.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:28:47 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 5/5] UBI: align comment for readability
Date: Sat, 28 Feb 2015 02:23:29 -0800
Message-Id: <1425119009-28634-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kerneldoc for @vid_hdr_aloffset continues onto a second line, but
this is not obvious, because the second line isn't indented, and it
begins with '@'.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/ubi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c5be82d9d345..2251a6c4c8fa 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -479,7 +479,7 @@ struct ubi_debug_info {
  * @vid_hdr_offset: starting offset of the volume identifier header (might be
  *                  unaligned)
  * @vid_hdr_aloffset: starting offset of the VID header aligned to
- * @hdrs_min_io_size
+ *                    @hdrs_min_io_size
  * @vid_hdr_shift: contains @vid_hdr_offset - @vid_hdr_aloffset
  * @bad_allowed: whether the MTD device admits of bad physical eraseblocks or
  *               not
-- 
2.1.0
