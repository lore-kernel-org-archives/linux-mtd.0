Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohejk-0007ae-8X
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 08:26:36 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/7] UBIFS: do not treat ENOSPC specially
Date: Sat,  7 Aug 2010 11:26:12 +0300
Message-Id: <1281169577-18664-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

'ubifs_garbage_collect_leb()' should never return '-ENOSPC', and if it
does, this is an error. Thus, do not treat this error code specially.
'-EAGAIN' is a special error code, but not '-ENOSPC'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index f89a422..29ce1b3 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -677,7 +677,7 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 
 		ret = ubifs_garbage_collect_leb(c, &lp);
 		if (ret < 0) {
-			if (ret == -EAGAIN || ret == -ENOSPC) {
+			if (ret == -EAGAIN) {
 				/*
 				 * These codes are not errors, so we have to
 				 * return the LEB to lprops. But if the
-- 
1.7.1.1
