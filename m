Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egHaJ-00010a-Mq
 for linux-mtd@lists.infradead.org; Mon, 29 Jan 2018 22:07:29 +0000
Received: by mail-wm0-x244.google.com with SMTP id r71so17340515wmd.1
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2018 14:07:16 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 1/2] mtd-utils: common.c: convert to integer arithmetic
Date: Mon, 29 Jan 2018 23:07:11 +0100
Message-Id: <1517263632-11126-2-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1517263632-11126-1-git-send-email-andrea.adami@gmail.com>
References: <1517263632-11126-1-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We use floating point just to print out KiB, MiB, GiB.
Avoid that to be klibc friendly.

Fixes compilation for aarch64 against klibc:

error: '-mgeneral-regs-only' is incompatible with floating-point argument
|    printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
etc.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
v2 fixes -Wformat warnings for printf() using %d instead of %lld

 lib/common.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/lib/common.c b/lib/common.c
index 69b03b3..8041878 100644
--- a/lib/common.c
+++ b/lib/common.c
@@ -107,6 +107,9 @@ long long util_get_bytes(const char *str)
 void util_print_bytes(long long bytes, int bracket)
 {
 	const char *p;
+	int GiB = 1024 * 1024 * 1024;
+	int MiB = 1024 * 1024;
+	int KiB = 1024;
 
 	if (bracket)
 		p = " (";
@@ -115,12 +118,15 @@ void util_print_bytes(long long bytes, int bracket)
 
 	printf("%lld bytes", bytes);
 
-	if (bytes > 1024 * 1024 * 1024)
-		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
-	else if (bytes > 1024 * 1024)
-		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
-	else if (bytes > 1024 && bytes != 0)
-		printf("%s%.1f KiB", p, (double)bytes / 1024);
+	if (bytes > GiB)
+		printf("%s%lld.%lld GiB", p,
+		       bytes / GiB, bytes % GiB / (GiB / 10));
+	else if (bytes > MiB)
+		printf("%s%lld.%lld MiB", p,
+		        bytes / MiB, bytes % MiB / (MiB / 10));
+	else if (bytes > KiB && bytes != 0)
+		printf("%s%lld.%lld KiB", p,
+		        bytes / KiB, bytes % KiB / (KiB / 10));
 	else
 		return;
 
-- 
2.7.4
