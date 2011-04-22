Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3W-0002nf-OE
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8Sj025949
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:09 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/13] fs-tests: integck: do not inlcude lib directory
Date: Fri, 22 Apr 2011 20:25:13 +0300
Message-Id: <1303493124-7619-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
References: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
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

The integck test does not depend on the "common" directory any more,
so we do not have to have -I ../lib for compilation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index 03652a2..976c3ce 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -5,7 +5,7 @@ endif
 
 COMMON_HEADERS_DIR := ../../../include
 
-CFLAGS := $(CFLAGS) -Wall -g -O2 -I../lib -I$(COMMON_HEADERS_DIR)
+CFLAGS := $(CFLAGS) -Wall -g -O2 -I$(COMMON_HEADERS_DIR)
 
 LDFLAGS := $(LDFLAGS)
 
-- 
1.7.2.3
