Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8Xnm-0001kG-RG
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 10:20:51 +0000
Received: from www.tglx.de (www.tglx.de [127.0.0.1])
	by www.tglx.de (8.13.8/8.13.8/TGLX-2007100201) with ESMTP id
	mB5AKkJE010426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 5 Dec 2008 11:20:46 +0100
Received: (from bigeasy@localhost)
	by www.tglx.de (8.13.8/8.13.8/Submit) id mB5AKkhh010425
	for linux-mtd@lists.infradead.org; Fri, 5 Dec 2008 11:20:46 +0100
Date: Fri, 5 Dec 2008 11:20:46 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: clean the hashtable target as well
Message-ID: <20081205102046.GA9601@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 mkfs.ubifs/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index f802bff..9471ac4 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -11,7 +11,7 @@ mkfs.ubifs: crc16.o crc32.o lpt.o compr.o hashtable/hashtable.o \
             hashtable/hashtable_itr.o devtable.o
 
 clean:
-	rm -f *.o $(TARGETS) cscope.*
+	rm -f *.o hashtable/*.o $(TARGETS) cscope.*
 
 cscope:
 	@echo $(ALL_SOURCES) > cscope.files
-- 
1.5.6.5
