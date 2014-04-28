Received: from mail-yh0-f50.google.com ([209.85.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WelOz-0003cF-Go
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 13:15:21 +0000
Received: by mail-yh0-f50.google.com with SMTP id b6so3307990yha.9
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 06:14:55 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] nandtest: Remove redundant check
Date: Mon, 28 Apr 2014 10:14:17 -0300
Message-Id: <1398690859-11494-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit removes a redundant 'len' check, which is already performed
just after the pread call.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 nandtest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index 1876bb2..fd78b95 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -107,8 +107,6 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 		printf("\nECC failed at %08x\n", (unsigned) ofs);
 		oldstats.failed = newstats.failed;
 	}
-	if (len < meminfo.erasesize)
-		exit(1);
 
 	printf("\r%08x: checking...", (unsigned)ofs);
 	fflush(stdout);
-- 
1.9.1
