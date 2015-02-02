Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIAgA-0008Lb-GX
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 06:40:16 +0000
Message-ID: <54CF1B76.7030207@huawei.com>
Date: Mon, 2 Feb 2015 14:38:46 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH resend V2] UBIFS: return -EINVAL if log head is empty
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CS node is recognized as a sign in UBIFS log replay mechanism.
Log relaying during mount should find the CS node in log head
at beginning and then replay the following uncommitted buds.

Here is a bug in log replay path: If the log head, which is
indicated by @log_lnum in mst_node, is empty, current UBIFS
replay nothing and directly mount the partition without any
warning. This action will put filesystem in an abnormal state,
e.g. space management in LPT area is incorrect to the real
space usage in main area.

We reproduced this bug by fault injection: turn log head leb
into all 0xFF. UBIFS driver mount the polluted partition
normally. But errors occur while running fs_stress on this
mount:

[89068.055183] UBI error: ubi_io_read: error -74 (ECC error) while reading 59 bytes from PEB 711:33088, read 59 bytes
[89068.179877] UBIFS error (pid 10517): ubifs_check_node: bad magic 0x101031, expected 0x6101831
[89068.179882] UBIFS error (pid 10517): ubifs_check_node: bad node at LEB 591:28992
[89068.179891] Not a node, first 24 bytes:
[89068.179892] 00000000: 31 10 10 00 37 84 64 04 10 04 00 00 00 00 00 00 20 00 00 00 02 01 00 00                          1...7.d......... .......
[89068.180282] UBIFS error (pid 10517): ubifs_read_node: expected node type 2

This patch fix the problem by checking *lnum* to guarantee
the empty leb is not log head leb and return an error if the
log head leb is incorrectly empty. After this, we could catch
*log head empty* error in place.

Changes in V2, suggested by Artem:
	- use 'log head' term instead of 'first log LEB' for
	  consistency.
	- catch this error by checking 'lnum' in 'ubifs_replay
	  _journal' instead of checking 'c->cs_sqnum' for better
	  understanding.
	- expand comments and phrase error message properly.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/replay.c |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 3187925..88e41a9 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1028,9 +1028,22 @@ int ubifs_replay_journal(struct ubifs_info *c)

 	do {
 		err = replay_log_leb(c, lnum, 0, c->sbuf);
-		if (err == 1)
-			/* We hit the end of the log */
-			break;
+		if (err == 1) {
+			if (lnum != c->lhead_lnum)
+				/* We hit the end of the log */
+				break;
+
+			/*
+			 * The head of the log must always start with the
+			 * "commit start" node on a properly formatted UBIFS.
+			 * But we found no nodes at all, which means that
+			 * someting went wrong and we cannot proceed mounting
+			 * the file-system.
+			 */
+			ubifs_err("no UBIFS nodes found at the log head LEB %d:%d, possibly corrupted\n",
+				  lnum, 0);
+			err = -EINVAL;
+		}
 		if (err)
 			goto out;
 		lnum = ubifs_next_log_lnum(c, lnum);
-- 
1.6.0.2
