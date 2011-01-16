Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeWiN-0000DY-MB
	for linux-mtd@lists.infradead.org; Sun, 16 Jan 2011 17:48:32 +0000
Received: by fxm19 with SMTP id 19so5004008fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Jan 2011 09:48:30 -0800 (PST)
Subject: Re: ubifs: sync() causes writes even if nothing is changed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Hans J. Koch" <hjk@linutronix.de>, "Adrian.Hunter"
	<Adrian.Hunter@nokia.com>
In-Reply-To: <20101013163005.GB1889@silverbox.local>
References: <20101013163005.GB1889@silverbox.local>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 16 Jan 2011 19:48:24 +0200
Message-ID: <1295200104.2470.5.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-13 at 18:30 +0200, Hans J. Koch wrote:
> Running this command:
> 
> # while true ; do sync; sleep 1; done
> 
> causes two eraseblocks being erased every second, although there
> are no writes to the ubifs filesystem. I hacked some printks into
> my NAND driver that print page_address and column for each erase.
> With that, I get this output every second:
> 
> ...
> [   63.701765] erase p=0x0000ae40 c=0xffffffff
> [   63.706534] erase p=0xffffffff c=0xffffffff
> [   63.725492] erase p=0x0000ae80 c=0xffffffff
> [   63.730260] erase p=0xffffffff c=0xffffffff
> ...
> 
> From a quick glance at the ubifs code, this might come out of the
> garbage collector that is triggered on every sync() and writes
> something even if nothing has changed.

With nandsim I only can see one erase, but this is anyway suboptimal.
The below patch should fix the issue, please, test if you can. I've also
pushed it to ubifs-2.6.git.


>From dca0fe61489805e0eb4ada7c6922856ca91eae52 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 16 Jan 2011 19:22:02 +0200
Subject: [PATCH] UBIFS: do not start the commit if there is nothing to commit

This patch fixes suboptimal UBIFS 'sync_fs()' implementation which causes
flash I/O even if the file-system is synchronized. E.g., a 'printk()'
in the MTD erasure function (e.g., 'nand_erase_nand()') can show that
for every 'sync' shell command UBIFS erases at least one eraseblock.

So '$ while true; do sync; done' will cause huge amount of flash I/O.

The reason for this is that UBIFS commits in 'sync_fs()', and starts the
commit even if there is nothing to commit, e.g., it anyway changes the
log. This patch adds a check in the 'do_commit()' UBIFS functions which
prevents the commit if there are not dirty znodes (hence, nothing to
commit).

Reported-by: Hans J. Koch <hjk@linutronix.de>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 02429d8..a963d96 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -70,6 +70,21 @@ static int do_commit(struct ubifs_info *c)
 		goto out_up;
 	}
 
+	/*
+	 * Every file-system change changes the TNC, and makes the root znode
+	 * dirty. So if the root znode is clean we can just return immediately
+	 * because there must be nothing to commit. Note, se do not have to
+	 * lock @c->tnc_mutex because we have @c->commit_sem in write mode,
+	 * which guarantees that no one else can access TNC functions
+	 * concurrently.
+	 */
+	if (!c->zroot.znode || !test_bit(DIRTY_ZNODE, &c->zroot.znode->flags)) {
+		ubifs_assert(atomic_long_read(&c->dirty_zn_cnt) == 0);
+		err = 0;
+		up_write(&c->commit_sem);
+		goto out_cancel;
+	}
+
 	/* Sync all write buffers (necessary for recovery) */
 	for (i = 0; i < c->jhead_cnt; i++) {
 		err = ubifs_wbuf_sync(&c->jheads[i].wbuf);
@@ -162,12 +177,12 @@ static int do_commit(struct ubifs_info *c)
 	if (err)
 		goto out;
 
+out_cancel:
 	spin_lock(&c->cs_lock);
 	c->cmt_state = COMMIT_RESTING;
 	wake_up(&c->cmt_wq);
 	dbg_cmt("commit end");
 	spin_unlock(&c->cs_lock);
-
 	return 0;
 
 out_up:
-- 
1.7.3.4

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
