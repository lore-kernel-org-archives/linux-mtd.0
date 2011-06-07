Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpd7-0002S6-Qa
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:19:10 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 89BA61B401E
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 06:19:06 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] mtdinfo: send help/version info to stdout
Date: Tue,  7 Jun 2011 02:19:04 -0400
Message-Id: <1307427548-29306-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
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
 ubi-utils/src/mtdinfo.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index c9f6f58..f20fe49 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -110,13 +110,13 @@ static int parse_opt(int argc, char * const argv[])
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
-- 
1.7.5.3
