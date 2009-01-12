Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMPKj-00089K-0d
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 16:08:11 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id AAA5064DCC
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jan 2009 16:08:07 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi-utils: fix warning in fprintf() code
Date: Mon, 12 Jan 2009 11:08:07 -0500
Message-Id: <1231776487-21240-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When building with gcc security warnings enabled, the ubimirror.c code
triggers this warning:
./src/ubimirror.c: In function 'main':
./src/ubimirror.c:206: error: format not a string literal and no format arguments

Since the buffer in question should be a straight string anyways, avoid
ugly printf exploits by outputting the string indirectly:
	printf("%s", buffer)

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/src/ubimirror.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/src/ubimirror.c b/ubi-utils/src/ubimirror.c
index 2cc4596..a20e1af 100644
--- a/ubi-utils/src/ubimirror.c
+++ b/ubi-utils/src/ubimirror.c
@@ -203,7 +203,7 @@ main(int argc, char **argv) {
 		       err_buf, sizeof(err_buf));
 	if( rc ){
 		err_buf[sizeof err_buf - 1] = '\0';
-		fprintf(stderr, err_buf);
+		fprintf(stderr, "%s", err_buf);
 		if( rc < 0 )
 			rc = -rc;
 	}
-- 
1.6.1
