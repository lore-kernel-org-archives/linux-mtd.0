Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuYUK-0002R3-Io
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 02:42:09 +0000
Message-ID: <5397C18A.60208@huawei.com>
Date: Wed, 11 Jun 2014 10:40:10 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/4] UBIFS: Add missing error handling in dump_lpt_leb()
References: <5397C0E7.9070602@huawei.com>
In-Reply-To: <5397C0E7.9070602@huawei.com>
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

This patch checks the return value of ubifs_unpack_nnode().
If this function returns an error, @nnode may not be
initialized, so just print an error mesg and break.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/lpt_commit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 4b826ab..7e957b6 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1941,6 +1941,11 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 				pr_err("LEB %d:%d, nnode, ",
 				       lnum, offs);
 			err = ubifs_unpack_nnode(c, p, &nnode);
+			if (err) {
+				pr_err("failed to unpack_node, error %d\n",
+				       err);
+				break;
+			}
 			for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
 				pr_cont("%d:%d", nnode.nbranch[i].lnum,
 				       nnode.nbranch[i].offs);
-- 
1.8.1.4
