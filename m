Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTxn9-0004xL-I5
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:02:04 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id A21771B401F
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 15:02:00 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] ubi-utils: send help/version info to stdout
Date: Tue,  7 Jun 2011 11:02:02 -0400
Message-Id: <1307458922-1082-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-2-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-2-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Usage/version information should go to stdout when it is expected behavior
(i.e. the user requested it explicitly).  This info should go to stderr
only when the usage info is being shown as a result of incorrect options.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- convert all ubi-utils

 ubi-utils/src/mtdinfo.c      |    8 ++++----
 ubi-utils/src/ubiattach.c    |    6 +++---
 ubi-utils/src/ubicrc32.c     |    6 +++---
 ubi-utils/src/ubidetach.c    |    6 +++---
 ubi-utils/src/ubiformat.c    |    6 +++---
 ubi-utils/src/ubimkvol.c     |    6 +++---
 ubi-utils/src/ubinfo.c       |    6 +++---
 ubi-utils/src/ubinize.c      |    8 ++++----
 ubi-utils/src/ubirmvol.c     |    6 +++---
 ubi-utils/src/ubirsvol.c     |    6 +++---
 ubi-utils/src/ubiupdatevol.c |    6 +++---
 11 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index 820c16d..666d739 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -111,13 +111,13 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'h':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			printf("%s\n", PROGRAM_VERSION);
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index 9297b56..4f18e99 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -123,9 +123,9 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'h':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubicrc32.c b/ubi-utils/src/ubicrc32.c
index a09f053..73ec595 100644
--- a/ubi-utils/src/ubicrc32.c
+++ b/ubi-utils/src/ubicrc32.c
@@ -64,9 +64,9 @@ static int parse_opt(int argc, char * const argv[])
 
 		switch (key) {
 		case 'h':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index 5ee55f1..668f1bd 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -107,9 +107,9 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'h':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 6e5cdb8..c4b944a 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -211,9 +211,9 @@ static int parse_opt(int argc, char * const argv[])
 
 		case 'h':
 		case '?':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/src/ubimkvol.c
index 935f068..25065e3 100644
--- a/ubi-utils/src/ubimkvol.c
+++ b/ubi-utils/src/ubimkvol.c
@@ -167,9 +167,9 @@ static int parse_opt(int argc, char * const argv[])
 
 		case 'h':
 		case '?':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
index 2bfee16..8e14e6e 100644
--- a/ubi-utils/src/ubinfo.c
+++ b/ubi-utils/src/ubinfo.c
@@ -118,9 +118,9 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'h':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index 52a193f..3085b66 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -227,10 +227,10 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'h':
-			ubiutils_print_text(stderr, doc, 80);
-			fprintf(stderr, "\n%s\n\n", ini_doc);
-			fprintf(stderr, "%s\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			ubiutils_print_text(stdout, doc, 80);
+			printf("\n%s\n\n", ini_doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubirmvol.c b/ubi-utils/src/ubirmvol.c
index 5a7217a..5725d90 100644
--- a/ubi-utils/src/ubirmvol.c
+++ b/ubi-utils/src/ubirmvol.c
@@ -111,9 +111,9 @@ static int parse_opt(int argc, char * const argv[])
 
 		case 'h':
 		case '?':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubirsvol.c b/ubi-utils/src/ubirsvol.c
index 34321b8..65f579c 100644
--- a/ubi-utils/src/ubirsvol.c
+++ b/ubi-utils/src/ubirsvol.c
@@ -140,9 +140,9 @@ static int parse_opt(int argc, char * const argv[])
 
 		case 'h':
 		case '?':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
diff --git a/ubi-utils/src/ubiupdatevol.c b/ubi-utils/src/ubiupdatevol.c
index 62f140b..24f38fe 100644
--- a/ubi-utils/src/ubiupdatevol.c
+++ b/ubi-utils/src/ubiupdatevol.c
@@ -97,9 +97,9 @@ static int parse_opt(int argc, char * const argv[])
 
 		case 'h':
 		case '?':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-- 
1.7.5.3
