Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReds-0007pT-0E
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:29:04 +0000
Received: by pabrd3 with SMTP id rd3so29373931pab.1
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:28:42 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/5] UBI: account for bitflips in both the VID header and data
Date: Sat, 28 Feb 2015 02:23:25 -0800
Message-Id: <1425119009-28634-2-git-send-email-computersforpeace@gmail.com>
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

We are completely discarding the earlier value of 'bitflips', which
could reflect a bitflip found in ubi_io_read_vid_hdr(). Let's use the
bitwise OR of header and data 'bitflip' statuses instead.

Coverity CID #1226856

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 9d2e16f3150a..b5e154856994 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -410,7 +410,7 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 		second_is_newer = !second_is_newer;
 	} else {
 		dbg_bld("PEB %d CRC is OK", pnum);
-		bitflips = !!err;
+		bitflips |= !!err;
 	}
 	mutex_unlock(&ubi->buf_mutex);
 
-- 
2.1.0
