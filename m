Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfT-00043j-G8
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:11 +0000
Received: by pacdd16 with SMTP id dd16so152798842pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 10/11] flash_{un,}lock: don't allow "last byte + 1"
Date: Mon, 31 Aug 2015 15:34:31 -0700
Message-Id: <1441060472-82169-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
References: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A lock/unlock/islocked ioctl() should be prevented from anything past
the last byte, inclusive. But we were doing an exclusive check.

This isn't a big deal, as the kernel MTD APIs would be guarding this
anyway, but let's do this for completeness.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 7a7a773d1d76..d775c0b01950 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -168,7 +168,7 @@ int main(int argc, char *argv[])
 	} else {
 		mtdLockInfo.start = 0;
 	}
-	if (mtdLockInfo.start > mtdInfo.size)
+	if (mtdLockInfo.start >= mtdInfo.size)
 		errmsg_die("%#x is beyond device size %#x",
 			mtdLockInfo.start, mtdInfo.size);
 
-- 
2.5.0.457.gab17608
