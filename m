Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyv0u-0001DD-LH
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 23:15:41 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Thu, 23 Sep 2010 15:58:48 -0700
Subject: [PATCH] mkfs.ubifs: Fix --squash-rino-perm / --nosquash-rino-perm
Message-Id: <1a602213cef25044c025cc1aaf873cf5@localhost>
To: <dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This addresses a couple of issues:

1) Code was only allowing these options if --root was NOT specified (the
opposite of the documented usage)

2) -q / -Q short options did not work

3) Spacing fixes in the error/warning strings

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index ec38f0e..d83f6bd 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -132,7 +132,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:P:k:x:X:j:R:l:j:U";
+static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:P:k:x:X:j:R:l:j:UQq";
 
 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
@@ -698,8 +698,8 @@ static int get_options(int argc, char**argv)
 		return err_msg("Maximum count of LEBs was not specified "
 			       "(use -h for help)");
 
-	if (squash_rino_perm != -1 && root)
-		return err_msg("--squash-rino-perm and nosquash-rino-perm options"
+	if (squash_rino_perm != -1 && !root)
+		return err_msg("--squash-rino-perm and nosquash-rino-perm options "
 			       "can be used only with the --root option");
 
 	if (c->max_bud_bytes == -1) {
@@ -1673,7 +1673,7 @@ static int write_data(void)
 		if (squash_rino_perm == -1) {
 			printf("WARNING: setting root UBIFS inode UID=GID=0 (root) and permissions "
 				 "to u+rwx,go+rx; use --squash-rino-perm or --nosquash-rino-perm "
-				 "to suppress this warning");
+				 "to suppress this warning\n");
 			squash_rino_perm = 1;
 		}
 		if (squash_rino_perm) {
-- 
1.7.0.4
