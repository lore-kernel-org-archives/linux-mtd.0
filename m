Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QE1vj-0002zm-0Q
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 16:13:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3OGD1pY010535
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 19:13:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] fs-tests: integck: fix line number in CHECK() output
Date: Sun, 24 Apr 2011 19:16:16 +0300
Message-Id: <1303661778-13214-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
References: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

In 'check_failed()' use the file and line number provided by the CHECK()
macro via the function parameters, rather than using __LINE__ directly.
Otherwise the funtion prints its own line, instead of the line where the
CHECK() failed.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 80d34c0..9f03709 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -233,7 +233,7 @@ static void check_failed(const char *cond, const char *func, const char *file,
 
 	fflush(stdout);
 	errmsg("condition '%s' failed in %s() at %s:%d",
-	       cond, func, __FILE__, __LINE__);
+	       cond, func, file, line);
 	normsg("error %d (%s)", error, strerror(error));
 	/*
 	 * Note, to make this work well you need:
-- 
1.7.2.3
