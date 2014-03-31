Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUfcV-0000Py-Pq
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 17:03:36 +0000
Received: by mail-pa0-f45.google.com with SMTP id kl14so8474678pab.18
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 10:03:14 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] ubiformat: correct "non-ubifs" warning message
Date: Mon, 31 Mar 2014 10:03:04 -0700
Message-Id: <1396285384-1757-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI's raw flash scan actually scans for UBI data, not UBIFS data (there
*are* UBI users that are not UBIFS!), so correct the warning message.
This also matches the comment in libscan.h.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/ubiformat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 97a4eaba2591..1b8f6fb108a2 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -834,7 +834,7 @@ int main(int argc, char * const argv[])
 
 	if (si->alien_cnt) {
 		if (!args.yes || !args.quiet)
-			warnmsg("%d of %d eraseblocks contain non-ubifs data",
+			warnmsg("%d of %d eraseblocks contain non-UBI data",
 				si->alien_cnt, si->good_cnt);
 		if (!args.yes && want_exit()) {
 			if (args.yes && !args.quiet)
-- 
1.8.3.2
