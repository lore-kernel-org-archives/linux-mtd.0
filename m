Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi2da-0003DO-MU
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 09:57:51 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 1/9] UBIFS: switch to RO mode after synchronizing
Date: Sun,  8 Aug 2010 12:57:24 +0300
Message-Id: <1281261452-9868-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
References: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
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

In 'ubifs_garbage_collect()' on error path, we first switch to R/O mode, and
then synchronize write-buffers (to make sure no data are lost). But the GC
write-buffer synchronization will fail, because we are already in R/O mode.
This patch re-orders this and makes sure we first synchronize the write-buffer,
and then switch to R/O mode.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 918d158..f89a422 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -774,8 +774,8 @@ out_unlock:
 out:
 	ubifs_assert(ret < 0);
 	ubifs_assert(ret != -ENOSPC && ret != -EAGAIN);
-	ubifs_ro_mode(c, ret);
 	ubifs_wbuf_sync_nolock(wbuf);
+	ubifs_ro_mode(c, ret);
 	mutex_unlock(&wbuf->io_mutex);
 	ubifs_return_leb(c, lp.lnum);
 	return ret;
-- 
1.7.1.1
