Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsHol-0002AT-AX
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 21:34:24 +0000
Received: by pacwv17 with SMTP id wv17so27147797pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 14:33:58 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: readtest: don't clobber error reports
Date: Tue, 12 May 2015 14:33:44 -0700
Message-Id: <1431466424-32001-1-git-send-email-computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 2a6a28e7922c ("mtd: Make MTD tests cancelable") accidentally
clobbered any read failure reports.

Coverity CID #1296020

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
regression in v4.1-rc1, so I'll probably want to queue this for 4.1

 drivers/mtd/tests/readtest.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/readtest.c b/drivers/mtd/tests/readtest.c
index a3196b750a22..58df07acdbdb 100644
--- a/drivers/mtd/tests/readtest.c
+++ b/drivers/mtd/tests/readtest.c
@@ -191,9 +191,11 @@ static int __init mtd_readtest_init(void)
 				err = ret;
 		}
 
-		err = mtdtest_relax();
-		if (err)
+		ret = mtdtest_relax();
+		if (ret) {
+			err = ret;
 			goto out;
+		}
 	}
 
 	if (err)
-- 
1.9.1
