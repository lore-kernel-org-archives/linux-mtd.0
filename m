Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXucm-0002AN-V8
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2008 09:14:05 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: added missing linefeed in 'ubinfo'
Date: Tue, 26 Aug 2008 11:13:57 +0200
Message-Id: <1219742037-16977-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trivial patch to add a missing linefeed in static volume info:

| Data bytes:  113112 bytes (110.5 KiB)State:       OK

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ubi-utils/new-utils/src/ubinfo.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/ubi-utils/new-utils/src/ubinfo.c b/ubi-utils/new-utils/src/ubinfo.c
index fdf169a..aada8e7 100644
--- a/ubi-utils/new-utils/src/ubinfo.c
+++ b/ubi-utils/new-utils/src/ubinfo.c
@@ -196,6 +196,7 @@ static int print_vol_info(libubi_t libubi, int dev_num, int vol_id)
 	if (vol_info.type == UBI_STATIC_VOLUME) {
 		printf("Data bytes:  ");
 		ubiutils_print_bytes(vol_info.data_bytes, 1);
+		printf("\n");
 	}
 	printf("State:       %s\n", vol_info.corrupted ? "corrupted" : "OK");
 	printf("Name:        %s\n", vol_info.name);
-- 
1.5.5.1
