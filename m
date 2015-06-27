Message-ID: <558E59C9.2070207@huawei.com>
Date: Sat, 27 Jun 2015 16:07:37 +0800
From: Wei Fang <fangwei1@huawei.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH] jffs2: remove unneeded conditions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since len must not be smaller than JFFS2_MIN_NODE_HEADER, if
"len < X" is true, than "JFFS2_MIN_NODE_HEADER < X" must be true,
so it can be removed.

Signed-off-by: Wei Fang <fangwei1@huawei.com>
---
 fs/jffs2/readinode.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index dddbde4..b9bd3ad 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1059,8 +1059,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf

 		case JFFS2_NODETYPE_DIRENT:

-			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent) &&
-			    len < sizeof(struct jffs2_raw_dirent)) {
+			if (len < sizeof(struct jffs2_raw_dirent)) {
 				err = read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf);
 				if (unlikely(err))
 					goto free_out;
@@ -1074,8 +1073,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf

 		case JFFS2_NODETYPE_INODE:

-			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode) &&
-			    len < sizeof(struct jffs2_raw_inode)) {
+			if (len < sizeof(struct jffs2_raw_inode)) {
 				err = read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf);
 				if (unlikely(err))
 					goto free_out;
@@ -1088,8 +1086,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
 			break;

 		default:
-			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node) &&
-			    len < sizeof(struct jffs2_unknown_node)) {
+			if (len < sizeof(struct jffs2_unknown_node)) {
 				err = read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf);
 				if (unlikely(err))
 					goto free_out;
-- 
1.8.3.1
