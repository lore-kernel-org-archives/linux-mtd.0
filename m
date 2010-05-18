Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEJVc-0006vK-NE
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 09:54:46 +0000
Received: by wwf26 with SMTP id 26so15640wwf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 May 2010 02:54:40 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: Support 4096+64 page sizes.
Date: Tue, 18 May 2010 11:53:59 +0200
Message-Id: <1274176439-22351-1-git-send-email-eballetbo@gmail.com>
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>

Add support for oobsize 64 and writesize 4096 in nanddump & nandwrite.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 nanddump.c  |    1 +
 nandwrite.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index ae0e425..e44ab36 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -212,6 +212,7 @@ int main(int argc, char * const argv[])
 	if (!(meminfo.oobsize == 224 && meminfo.writesize == 4096) &&
 			!(meminfo.oobsize == 218 && meminfo.writesize == 4096) &&
 			!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
 			!(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
 			!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
diff --git a/nandwrite.c b/nandwrite.c
index b77edd6..bd45879 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -294,6 +294,7 @@ int main(int argc, char * const argv[])
 	if (!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
 			!(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
+			!(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
 			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
 		close(fd);
-- 
1.7.0.4
