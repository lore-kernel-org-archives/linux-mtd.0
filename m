Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HF4IO-0007sw-0j
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 03:06:20 -0500
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] Utils: Add 1KB page & 32 bytes spare NAND
Date: Thu, 8 Feb 2007 17:06:12 +0900
Message-ID: <003301c74b58$0422c020$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 8d5c48ee5369203fed3df8b6b58967d0e63e43a5 Mon Sep 17 00:00:00 2001
From: Kyungmin Park <kyungmin.park@samsung.com>
Date: Thu, 8 Feb 2007 17:04:54 +0900
Subject: [PATCH] [MTD] Utils: Add 1KB page & 32 bytes spare NAND

Some OneNAND chips use this spec.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 nanddump.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index b2323f6..a8cb378 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -196,6 +196,7 @@ int main(int argc, char **argv)
 
 	/* Make sure device page sizes are valid */
 	if (!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
+	    !(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
 	    !(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
 	    !(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
-- 
1.4.4.2
