Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a235Y-00064x-1d
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 20:24:21 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/3] mtd: ubi: don't leak e if schedule_erase() fails
Date: Thu, 26 Nov 2015 21:23:49 +0100
Message-Id: <1448569430-885-2-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
References: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If __erase_worker() fails to erase the EB and schedule_erase() fails as
well to do anything about it then we go RO. But that is not a reason to
leak the e argument here. Therefore clean up e.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/ubi/wl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f73233fa737c..56065632a5b8 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1060,6 +1060,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 		/* Re-schedule the LEB for erasure */
 		err1 = schedule_erase(ubi, e, vol_id, lnum, 0);
 		if (err1) {
+			wl_entry_destroy(ubi, e);
 			err = err1;
 			goto out_ro;
 		}
-- 
2.6.2
