Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y481G-0005Si-07
 for linux-mtd@lists.infradead.org; Thu, 25 Dec 2014 12:59:59 +0000
Message-ID: <549C0A10.3000201@huawei.com>
Date: Thu, 25 Dec 2014 20:58:56 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH RFC 1/2] UBIFS: fix empty log leb error
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, shengyong1@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If first log leb which is indicated by @log_lnum in mst_node
is empty, current UBIFS will stop finding cs_node and directly
mount the partition.

This patch fix this problem by checking c->cs_sqnum to
guarantee the empty leb is not first log leb and return an
error if the first log leb is incorrectly empty.

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
