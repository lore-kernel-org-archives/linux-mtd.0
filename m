Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA2dN-0005rZ-4c
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 13:28:17 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 01BEB65192
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Dec 2008 13:28:03 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat.c: fix printf(%d, size_t) warning
Date: Tue,  9 Dec 2008 08:28:03 -0500
Message-Id: <1228829283-27226-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A size_t should be printed using %zu (unsigned size_t) rather than %d.  This
fixes the following warning on my system:
gcc -O2 -Werror -Wall -Iinclude -Isrc -I../../include src/ubiformat.c -c -o ubiformat.o
cc1: warnings being treated as errors
src/ubiformat.c: In function ‘read_all’:
src/ubiformat.c:345: error: format ‘%d’ expects type ‘int’, but argument 3 has type ‘size_t’
src/ubiformat.c:352: error: format ‘%d’ expects type ‘int’, but argument 3 has type ‘size_t’
make: *** [ubiformat.o] Error 1

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/new-utils/src/ubiformat.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/src/ubiformat.c
index fb4f2ee..7a6d1b7 100644
--- a/ubi-utils/new-utils/src/ubiformat.c
+++ b/ubi-utils/new-utils/src/ubiformat.c
@@ -342,14 +342,14 @@ static int read_all(int fd, void *buf, size_t len)
 	while (len > 0) {
 		ssize_t l = read(fd, buf, len);
 		if (l == 0)
-			return errmsg("eof reached; %d bytes remaining", len);
+			return errmsg("eof reached; %zu bytes remaining", len);
 		else if (l > 0) {
 			buf += l;
 			len -= l;
 		} else if (errno == EINTR || errno == EAGAIN)
 			continue;
 		else
-			return sys_errmsg("reading failed; %d bytes remaining", len);
+			return sys_errmsg("reading failed; %zu bytes remaining", len);
 	}
 
 	return 0;
-- 
1.6.0.4
