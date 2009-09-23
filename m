Received: from monster.nessie.de ([84.200.20.120])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqS7i-0004tQ-DB
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 13:43:16 +0000
Received: from nautilus.home (localhost.localdomain [127.0.0.1])
	by monster.nessie.de (Postfix) with ESMTP id D64382188B73
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Sep 2009 13:01:37 +0000 (GMT)
From: Michael Roth <mroth@nessie.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat, ubinize: Don't randomize 0xFFFFFFFF sequence number
Date: Wed, 23 Sep 2009 15:01:27 +0200
Message-Id: <1253710887-16731-3-git-send-email-mroth@nessie.de>
In-Reply-To: <1253710887-16731-1-git-send-email-mroth@nessie.de>
References: <1253710887-16731-1-git-send-email-mroth@nessie.de>
Cc: Michael Roth <mroth@nessie.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

args.image_seq is of type uint32_t and was initialized to -1 which
becomes 0xFFFFFFFF in this case. Later the value -1 was used as a flag
that args.image_seq should be replaced with a randomized value.

With the option --image-seq (-Q) a user could provide any sequence
number at will.

But when the user provided sequence number was 0xFFFFFFFF this was
understood effectivly as -1 and got overridden by a randomized
sequence number.

So this patch change the programm flow to respect the principle of
least surprise and never use a randomized sequence number when the
user provide one at own will.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 ubi-utils/src/ubiformat.c |    8 +++-----
 ubi-utils/src/ubinize.c   |    8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index bed0339..54363d7 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -70,7 +70,6 @@ struct args {
 static struct args args =
 {
 	.ubi_ver   = 1,
-	.image_seq = -1,
 };
 
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
@@ -131,6 +130,9 @@ static const struct option long_options[] = {
 
 static int parse_opt(int argc, char * const argv[])
 {
+	srand(getpid());
+	args.image_seq = random();
+
 	while (1) {
 		int key;
 		char *endp;
@@ -235,10 +237,6 @@ static int parse_opt(int argc, char * const argv[])
 	if (args.image && args.novtbl)
 		return errmsg("-n cannot be used together with -f");
 
-	if (!args.image_seq == -1) {
-		srand(getpid());
-		args.image_seq = random();
-	}
 
 	args.node = argv[optind];
 	return 0;
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index a46833c..74ddc0f 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -153,11 +153,13 @@ static struct args args = {
 	.min_io_size  = -1,
 	.subpage_size = -1,
 	.ubi_ver      = 1,
-	.image_seq    = -1,
 };
 
 static int parse_opt(int argc, char * const argv[])
 {
+	srand(getpid());
+	args.image_seq = random();
+
 	while (1) {
 		int key;
 		char *endp;
@@ -283,10 +285,6 @@ static int parse_opt(int argc, char * const argv[])
 			return errmsg("VID header offset has to be multiple of min. I/O unit size");
 	}
 
-	if (!args.image_seq == -1) {
-		srand(getpid());
-		args.image_seq = random();
-	}
 	return 0;
 }
 
-- 
1.6.3.3
