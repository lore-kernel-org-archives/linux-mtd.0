Date: Tue, 9 Sep 2008 11:17:29 +0200
From: Sebastian Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: [PATCH] ubifs: create the name of the background thread in every case
Message-ID: <20080909091729.GA18689@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the ubifs partition is mounted RO and then remounted RW we end
up with no thread name in ubifs_remount_rw() and the thread appears
nameless.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 fs/ubifs/super.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f71e6b8..2fcf272 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1018,14 +1018,13 @@ static int mount_ubifs(struct ubifs_info *c)
 		goto out_dereg;
 	}
 
+	sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num, c->vi.vol_id);
 	if (!mounted_read_only) {
 		err = alloc_wbufs(c);
 		if (err)
 			goto out_cbuf;
 
 		/* Create background thread */
-		sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num,
-			c->vi.vol_id);
 		c->bgt = kthread_create(ubifs_bg_thread, c, c->bgt_name);
 		if (!c->bgt)
 			c->bgt = ERR_PTR(-EINVAL);
-- 
1.5.4.3
