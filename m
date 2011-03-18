Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0Wom-0006SK-Rr
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 10:22:05 +0000
Received: by wwc33 with SMTP id 33so3278523wwc.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Mar 2011 03:22:02 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: vapier@gentoo.org,
	dedekind1@gmail.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] flash_erase: start position should be in bytes
Date: Fri, 18 Mar 2011 11:21:57 +0100
Message-Id: <1300443717-3881-1-git-send-email-jacmet@sunsite.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit a8801d8 (unify flash_erase and flash_eraseall) changed the
flash_erase interface in a backwards incompatible way. Before that
commit start position was given in bytes, and now it must be provided
in blocks.

While I agree the new interface is nicer, we shouldn't break the
interface. I have scripts that expect the old behaviour, and I'm
most likely not alone, so change the interface back to the old
way.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 flash_erase.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 1a7b52e..3ce701b 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -60,7 +60,7 @@ static void show_progress(struct mtd_dev_info *mtd, uint64_t start, int eb,
 
 static void display_help (void)
 {
-	printf("Usage: %s [options] MTD_DEVICE <start block> <block count>\n"
+	printf("Usage: %s [options] MTD_DEVICE <start offset> <block count>\n"
 			"Erase blocks of the specified MTD device.\n"
 			"Specify a count of 0 to erase to end of device.\n"
 			"\n"
@@ -94,6 +94,7 @@ int main(int argc, char *argv[])
 	libmtd_t mtd_desc;
 	struct mtd_dev_info mtd;
 	int fd, clmpos = 0, clmlen = 8;
+	unsigned long long start;
 	unsigned int eb, eb_start, eb_cnt;
 	int isNAND;
 	int error = 0;
@@ -153,7 +154,7 @@ int main(int argc, char *argv[])
 	switch (argc - optind) {
 	case 3:
 		mtd_device = argv[optind];
-		eb_start = simple_strtoul(argv[optind + 1], &error);
+		start = simple_strtoull(argv[optind + 1], &error);
 		eb_cnt = simple_strtoul(argv[optind + 2], &error);
 		break;
 	default:
@@ -182,6 +183,8 @@ int main(int argc, char *argv[])
 	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
 		return errmsg("mtd_get_dev_info failed");
 
+	eb_start = start / mtd.eb_size;
+
 	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
 
 	if (jffs2) {
-- 
1.7.2.3
