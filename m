Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9zxX-0002NN-Co
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:18:16 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DDICG0020550
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 16:18:12 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 5/5] tests: ubi-tests: clean libubi.a and *.o
Date: Wed, 13 Apr 2011 16:20:29 +0300
Message-Id: <5dca68dbcc29a1bdc8a866b9c3d1f19853ddde3c.1302700658.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <6cb173d447de7eb92ead54f450da7752a40e476c.1302700658.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<8aa731c3a7a071bb9216500d72c9a8d7a7e2b830.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<6cb173d447de7eb92ead54f450da7752a40e476c.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The common.mk contains clean target that removes *.o and $(TARGETS). Thus, make
custom clean target only for libubi.a

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/ubi-tests/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
index d6be0dc..741a5c2 100644
--- a/tests/ubi-tests/Makefile
+++ b/tests/ubi-tests/Makefile
@@ -22,4 +22,4 @@ libubi.a: $(LIBUBI_SRC_PATH)/libubi.c  $(LIBUBI_HEADER_PATH)/libubi.h  $(LIBUBI_
 $(TARGETS): $(addprefix $(BUILDDIR)/, common.o) libubi.a
 
 clean::
-	rm -f $(TARGETS) $(addsuffix .o, $(TESTS)) libubi.*
+	rm -f libubi.a
-- 
1.6.3.3
