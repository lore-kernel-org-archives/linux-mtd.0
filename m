Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1j72-0007VY-2E
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 17:09:38 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 26A441B4020
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 17:09:32 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.jffs2: convert to xalloc.h helpers
Date: Fri,  1 Oct 2010 13:10:30 -0400
Message-Id: <1285953030-19539-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 mkfs.jffs2.c |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 85a8564..256eec4 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -381,7 +381,7 @@ static struct filesystem_entry *recursive_add_host_directory(
 #define GETCWD_SIZE 0
 #else
 #define SCANF_PREFIX "511"
-#define SCANF_STRING(s) (s = malloc(512))
+#define SCANF_STRING(s) (s = xmalloc(512))
 #define GETCWD_SIZE -1
 inline int snprintf(char *str, size_t n, const char *fmt, ...)
 {
@@ -1540,14 +1540,7 @@ void process_buffer(int inp_size) {
 void parse_image(){
 	int ret;
 
-	file_buffer = malloc(erase_block_size);
-
-	if (!file_buffer) {
-		perror("out of memory");
-		close (in_fd);
-		close (out_fd);
-		exit(1);
-	}
+	file_buffer = xmalloc(erase_block_size);
 
 	while ((ret = load_next_block())) {
 		process_buffer(ret);
@@ -1721,7 +1714,7 @@ int main(int argc, char **argv)
 					  jffs2_compression_check_set(1);
 					  break;
 			case 'y':
-					  compr_name = malloc(strlen(optarg));
+					  compr_name = xmalloc(strlen(optarg));
 					  sscanf(optarg,"%d:%s",&compr_prior,compr_name);
 					  if ((compr_prior>=0)&&(compr_name)) {
 						  if (jffs2_set_compressor_priority(compr_name, compr_prior))
-- 
1.7.3.1
