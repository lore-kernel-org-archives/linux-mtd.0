Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0d-0005ja-So
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:46:15 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 27/27] ubifs: ubifs_dump: dump data in hex format
Date: Wed, 19 Aug 2015 16:39:32 +0800
Message-ID: <1439973572-12489-28-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we dump data node, we can dump the data in it
in hex format.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                            |  2 +-
 ubifs-utils/ubifs_dump/ubifs_dump.c | 42 ++++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index af17307..e3b670d 100644
--- a/Makefile
+++ b/Makefile
@@ -133,7 +133,7 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 $(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
 
 obj-ubifs_dump = $(UBIFS_LIBS)
-obj-ubifs_dump += ../lib/scan.o ../lib/lprops.o
+obj-ubifs_dump += ../lib/scan.o ../lib/lprops.o ../lib/hexdump.o
 LDFLAGS_ubifs_dump = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_ubifs_dump = -lz -llzo2 -lm -luuid
 $(call mkdep,ubifs-utils/ubifs_dump/,ubifs_dump,,ubi-utils/libubi.a)
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 90ac322..eaf8daf 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -7,6 +7,7 @@
 #include "key.h"
 #include "lpt.h"
 #include "scan.h"
+#include "hexdump.h"
 
 #define DBG_KEY_BUF_LEN		48
 
@@ -252,26 +253,26 @@ void dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_ino_node *ino = node;
 
 		key_read(c, &ino->key, &key);
-		printf("\t\tkey \t\t\t%s\n",
+		printf("\t\tkey \t\t\t\t%s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
 		printf("\t\tcreat_sqnum \t\t\t%llu\n",
 		       (unsigned long long)le64_to_cpu(ino->creat_sqnum));
-		printf("\t\tsize \t\t\t%llu\n",
+		printf("\t\tsize \t\t\t\t%llu\n",
 		       (unsigned long long)le64_to_cpu(ino->size));
-		printf("\t\tnlink \t\t\t%u\n", le32_to_cpu(ino->nlink));
-		printf("\t\tatime \t\t\t%lld.%u\n",
+		printf("\t\tnlink \t\t\t\t%u\n", le32_to_cpu(ino->nlink));
+		printf("\t\tatime \t\t\t\t%lld.%u\n",
 		       (long long)le64_to_cpu(ino->atime_sec),
 		       le32_to_cpu(ino->atime_nsec));
-		printf("\t\tmtime \t\t\t%lld.%u\n",
+		printf("\t\tmtime \t\t\t\t%lld.%u\n",
 		       (long long)le64_to_cpu(ino->mtime_sec),
 		       le32_to_cpu(ino->mtime_nsec));
-		printf("\t\tctime \t\t\t%lld.%u\n",
+		printf("\t\tctime \t\t\t\t%lld.%u\n",
 		       (long long)le64_to_cpu(ino->ctime_sec),
 		       le32_to_cpu(ino->ctime_nsec));
-		printf("\t\tuid \t\t\t%u\n", le32_to_cpu(ino->uid));
-		printf("\t\tgid \t\t\t%u\n", le32_to_cpu(ino->gid));
-		printf("\t\tmode \t\t\t%u\n", le32_to_cpu(ino->mode));
-		printf("\t\tflags \t\t\t%#x\n", le32_to_cpu(ino->flags));
+		printf("\t\tuid \t\t\t\t%u\n", le32_to_cpu(ino->uid));
+		printf("\t\tgid \t\t\t\t%u\n", le32_to_cpu(ino->gid));
+		printf("\t\tmode \t\t\t\t%u\n", le32_to_cpu(ino->mode));
+		printf("\t\tflags \t\t\t\t%#x\n", le32_to_cpu(ino->flags));
 		printf("\t\txattr_cnt \t\t\t%u\n", le32_to_cpu(ino->xattr_cnt));
 		printf("\t\txattr_size \t\t\t%u\n", le32_to_cpu(ino->xattr_size));
 		printf("\t\txattr_names \t\t\t%u\n", le32_to_cpu(ino->xattr_names));
@@ -287,13 +288,13 @@ void dump_node(const struct ubifs_info *c, const void *node)
 		int nlen = le16_to_cpu(dent->nlen);
 
 		key_read(c, &dent->key, &key);
-		printf("\t\tkey \t\t\t%s\n",
+		printf("\t\tkey \t\t\t\t%s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printf("\t\tinum \t\t\t%llu\n",
+		printf("\t\tinum \t\t\t\t%llu\n",
 		       (unsigned long long)le64_to_cpu(dent->inum));
-		printf("\t\ttype \t\t\t%d\n", (int)dent->type);
-		printf("\t\tnlen \t\t\t%d\n", nlen);
-		printf("\t\tname           ");
+		printf("\t\ttype \t\t\t\t%d\n", (int)dent->type);
+		printf("\t\tnlen \t\t\t\t%d\n", nlen);
+		printf("\t\tname \t\t\t\t");
 
 		if (nlen > UBIFS_MAX_NLEN)
 			printf("(bad name length, not printing, bad or corrupted node)");
@@ -311,12 +312,15 @@ void dump_node(const struct ubifs_info *c, const void *node)
 		int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
 
 		key_read(c, &dn->key, &key);
-		printf("\t\tkey \t\t\t%s\n",
+		printf("\t\tkey \t\t\t\t%s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printf("\t\tsize \t\t\t%u\n", le32_to_cpu(dn->size));
+		printf("\t\tsize \t\t\t\t%u\n", le32_to_cpu(dn->size));
 		printf("\t\tcompr_typ \t\t\t%d\n",
 		       (int)le16_to_cpu(dn->compr_type));
 		printf("\t\tdata size \t\t\t%d\n", dlen);
+		printf("\t\tdata:\n");
+		print_hex_dump("\t\t", DUMP_PREFIX_OFFSET, 32, 1,
+			       (void *)&dn->data, dlen, 0);
 		break;
 	}
 	case UBIFS_TRUN_NODE:
@@ -335,8 +339,8 @@ void dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_idx_node *idx = node;
 
 		n = le16_to_cpu(idx->child_cnt);
-		printf("\t\tchild_cnt \t\t%d\n", n);
-		printf("\t\tlevel \t\t\t%d\n", (int)le16_to_cpu(idx->level));
+		printf("\t\tchild_cnt \t\t\t%d\n", n);
+		printf("\t\tlevel \t\t\t\t%d\n", (int)le16_to_cpu(idx->level));
 		printf("\t\tBranches:\n");
 
 		for (i = 0; i < n && i < c->fanout - 1; i++) {
-- 
1.8.4.2
