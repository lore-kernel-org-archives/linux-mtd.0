Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8ATu-0007zl-0L
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 12:08:06 +0000
Received: from eru.research.nokia.com (helruo-dhcp022129.ntc.nokia.com
	[172.21.22.129])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38C82Kx010601
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 15:08:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd-utils: Makefile: introduce cscope target
Date: Fri,  8 Apr 2011 15:11:29 +0300
Message-Id: <1302264689-3513-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Add a "cscope" target to make it easier to develop in the repository.
Indeed, many people like me are accustomed to "make cscope" in the
kernel, and it is very convenient to have this in mtd-utils as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 1f264e9..6a65258 100644
--- a/Makefile
+++ b/Makefile
@@ -64,3 +64,6 @@ install:: ${TARGETS} ${SCRIPTS}
 
 tests::
 	$(MAKE) -C $(TESTS)
+
+cscope:
+	cscope -bR
-- 
1.7.2.3
