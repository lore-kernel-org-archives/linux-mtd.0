Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHOzM-0003Ma-Bw
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 03:44:53 +0000
Message-ID: <54CC4F77.1000801@huawei.com>
Date: Sat, 31 Jan 2015 11:43:51 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CS node is recognized as a sign in UBIFS log replay mechanism.
Log relaying during mount should find the CS node in first log
leb at beginning and then replay the following uncommitted
buds.

Here is a bug in log replay path: If first log leb, which is
indicated by @log_lnum in mst_node, is empty, current UBIFS
replay nothing and directly mount the partition without any
warning. This action will put filesystem in an abnormal state,
e.g. space management in LPT area is incorrect to the real
space usage in main area.

We reproduced this bug by fault injection: turn first log leb
into all 0xFF. UBIFS driver mount the polluted partition
normally. But errors occur while running fs_stress on this
mount:

[89068.055183] UBI error: ubi_io_read: error -74 (ECC error) while reading 59 bytes from PEB 711:33088, read 59 bytes
[89068.179877] UBIFS error (pid 10517): ubifs_check_node: bad magic 0x101031, expected 0x6101831
[89068.179882] UBIFS error (pid 10517): ubifs_check_node: bad node at LEB 591:28992
[89068.179891] Not a node, first 24 bytes:
[89068.179892] 00000000: 31 10 10 00 37 84 64 04 10 04 00 00 00 00 00 00 20 00 00 00 02 01 00 00                          1...7.d......... .......
[89068.180282] UBIFS error (pid 10517): ubifs_read_node: expected node type 2

This patch fix the problem by checking c->cs_sqnum to
guarantee the empty leb is not first log leb and return an
error if the first log leb is incorrectly empty. After this,
we could catch *first log empty* error in place.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/replay.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 3187925..f13f4b2 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -846,7 +846,14 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 	}

 	if (sleb->nodes_cnt == 0) {
-		err = 1;
+		if (unlikely(c->cs_sqnum == 0)) {
+			/* This is the first log LEB, should not be empty */
+			ubifs_err("first log leb LEB %d:%d is empty, no CS node exist",
+				  lnum, offs);
+			err = -EINVAL;
+		} else {
+			err = 1;
+		}
 		goto out;
 	}

-- 
1.6.0.2
