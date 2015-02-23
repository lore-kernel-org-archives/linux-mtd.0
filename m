Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQ0EM-0002e2-4r
 for linux-mtd@lists.infradead.org; Mon, 23 Feb 2015 21:07:54 +0000
Received: by padfb1 with SMTP id fb1so30441509pad.8
 for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2015 13:07:32 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] UBI: fix missing brace control flow
Date: Mon, 23 Feb 2015 13:07:22 -0800
Message-Id: <1424725642-26270-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 0e707ae79ba3 ("UBI: do propagate positive error codes up") seems
to have produced an unintended change in the control flow here.

Completely untested, but it looks obvious.

Caught by Coverity, which didn't like the indentation. CID 1271184.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
---
Should go into 4.0, I expect.

 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index da4c79259f67..16e34b37d134 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -425,9 +425,10 @@ retry:
 					ubi_warn(ubi, "corrupted VID header at PEB %d, LEB %d:%d",
 						 pnum, vol_id, lnum);
 					err = -EBADMSG;
-				} else
+				} else {
 					err = -EINVAL;
 					ubi_ro_mode(ubi);
+				}
 			}
 			goto out_free;
 		} else if (err == UBI_IO_BITFLIPS)
-- 
1.9.1
