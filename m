Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q76j8-0004Ye-C0
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:55:30 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DtMmo007560
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:55:23 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 5/5] tests: ubi-tests: seed_random_generator() was used w/o
	prototype
Date: Tue,  5 Apr 2011 16:55:54 +0300
Message-Id: <079428894ea293560f65737475e222af2332bfa9.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <741f4ff14ea8ad70001e78a94e98e01dbe783b3b.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<aeae7a7b14f785f1bd3ee5fd74dea8e7521a160b.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<741f4ff14ea8ad70001e78a94e98e01dbe783b3b.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/ubi-tests/integ.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
index f293444..4e13b73 100644
--- a/tests/ubi-tests/integ.c
+++ b/tests/ubi-tests/integ.c
@@ -14,6 +14,7 @@
 #include <sys/stat.h>
 
 #include "libubi.h"
+#include "common.h"
 
 struct erase_block_info;
 struct volume_info;
@@ -586,7 +587,7 @@ static void reload_ubi(void)
 	sleep(1);
 }
 
-static void check_volume(struct volume_info *vol)
+static void integ_check_volume(struct volume_info *vol)
 {
 	struct erase_block_info *eb = vol->erase_blocks;
 	int pos;
@@ -607,7 +608,7 @@ static void check_ubi_device(struct ubi_device_info *ubi_device)
 
 	vol = ubi_device->volumes;
 	while (vol) {
-		check_volume(vol);
+		integ_check_volume(vol);
 		vol = vol->next;
 	}
 }
-- 
1.6.3.3
