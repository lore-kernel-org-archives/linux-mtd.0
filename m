Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7k1-0001vG-Aw
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:21:52 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 12/27] ubifs: ubifs_dump: add dump_ch and dump_node
 functions
Date: Fri, 13 Nov 2015 14:13:23 +0800
Message-ID: <1447395218-7061-13-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/ubifs_dump/ubifs_dump.c | 337 ++++++++++++++++++++++++++++++++++++
 1 file changed, 337 insertions(+)

diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index bbe1269..a510aeb 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -1,7 +1,11 @@
 #include "ubifs_common.h"
 #define PROGRAM_NAME "ubifs-dump"
 #include "common.h"
+
 #include "io.h"
+#include "key.h"
+
+#define DBG_KEY_BUF_LEN		48
 
 static const char *optstring = "";
 
@@ -38,6 +42,339 @@ static int get_options(int argc, char**argv)
 	return 0;
 }
 
+static const char *node_type_to_str[] = {
+		"UBIFS_INO_NODE",
+		"UBIFS_DATA_NODE",
+		"UBIFS_DENT_NODE",
+		"UBIFS_XENT_NODE",
+		"UBIFS_TRUN_NODE",
+		"UBIFS_PAD_NODE",
+		"UBIFS_SB_NODE",
+		"UBIFS_MST_NODE",
+		"UBIFS_REF_NODE",
+		"UBIFS_IDX_NODE",
+		"UBIFS_CS_NODE",
+		"UBIFS_ORPH_NODE"
+};
+
+static const char *get_key_type(int type)
+{
+	return node_type_to_str[type];
+}
+
+static const char *group_type_to_str[] = {
+		"UBIFS_NO_NODE_GROUP",
+		"UBIFS_IN_NODE_GROUP",
+		"UBIFS_LAST_OF_NODE_GROUP"
+};
+
+static const char *hash_type_to_str[] = {
+		"UBIFS_KEY_HASH_R5",
+		"UBIFS_KEY_HASH_TEST"
+};
+
+static const char *compr_type_to_str[] = {
+		"UBIFS_COMPR_NONE",
+		"UBIFS_COMPR_LZO",
+		"UBIFS_COMPR_ZLIB",
+		"UBIFS_COMPR_TYPES_CNT",
+};
+
+static const char *key_fmt_to_str[] = {
+	"UBIFS_SIMPLE_KEY_FMT"
+};
+
+const char *dbg_snprintf_key(const struct ubifs_info *c,
+			     const union ubifs_key *key, char *buffer, int len)
+{
+	char *p = buffer;
+	int type = key_type(c, key);
+
+	if (c->key_fmt == UBIFS_SIMPLE_KEY_FMT) {
+		switch (type) {
+
+		case UBIFS_INO_KEY:
+			len -= snprintf(p, len, "(%lu, %s)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type));
+			break;
+		case UBIFS_DENT_KEY:
+		case UBIFS_XENT_KEY:
+			len -= snprintf(p, len, "(%lu, %s, %#08x)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type), key_hash(c, key));
+			break;
+		case UBIFS_DATA_KEY:
+			len -= snprintf(p, len, "(%lu, %s, %u)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type), key_block(c, key));
+			break;
+		case UBIFS_TRUN_KEY:
+			len -= snprintf(p, len, "(%lu, %s)",
+					(unsigned long)key_inum(c, key),
+					get_key_type(type));
+			break;
+		default:
+			len -= snprintf(p, len, "(bad key type: %#08x, %#08x)",
+					key->u32[0], key->u32[1]);
+		}
+	} else
+		len -= snprintf(p, len, "bad key format %d", c->key_fmt);
+	ubifs_assert(len > 0);
+	return p;
+}
+
+static void show_ch(const struct ubifs_ch *ch) 
+{ 
+	printf("\tCommon header: \n");
+        printf("\tmagic \t\t\t\t%#x\n", le32_to_cpu(ch->magic)); 
+        printf("\tcrc \t\t\t\t%#x\n", le32_to_cpu(ch->crc)); 
+        printf("\tnode_type \t\t\t%d (%s)\n", ch->node_type, 
+               node_type_to_str[ch->node_type]); 
+        printf("\tgroup_type \t\t\t%d (%s)\n", ch->group_type, 
+               group_type_to_str[ch->group_type]); 
+        printf("\tsqnum \t\t\t\t%llu\n", 
+               (unsigned long long)le64_to_cpu(ch->sqnum)); 
+        printf("\tlen \t\t\t\t%u\n", le32_to_cpu(ch->len)); 
+} 
+
+void dump_node(const struct ubifs_info *c, const void *node)
+{
+	int i, n;
+	union ubifs_key key;
+	const struct ubifs_ch *ch = node;
+	char key_buf[DBG_KEY_BUF_LEN];
+
+	show_ch(node);
+
+	switch (ch->node_type) {
+	case UBIFS_PAD_NODE:
+	{
+		const struct ubifs_pad_node *pad = node;
+
+		printf("\t\tpad_len \t\t\t%u\n", le32_to_cpu(pad->pad_len));
+		break;
+	}
+	case UBIFS_SB_NODE:
+	{
+		const struct ubifs_sb_node *sup = node;
+		unsigned int sup_flags = le32_to_cpu(sup->flags);
+		char uuid[40];
+
+		uuid_unparse_upper(sup->uuid, uuid);
+		printf("\t\tUUID \t\t\t\t%s\n", uuid);
+		printf("\t\tkey_hash \t\t\t%d (%s)\n",
+		       (int)sup->key_hash, hash_type_to_str[sup->key_hash]);
+		printf("\t\tkey_fmt \t\t\t%d (%s)\n",
+		       (int)sup->key_fmt, key_fmt_to_str[sup->key_fmt]);
+		printf("\t\tflags \t\t\t\t%#x\n", sup_flags);
+		printf("\t\tbig_lpt \t\t\t%u\n",
+		       !!(sup_flags & UBIFS_FLG_BIGLPT));
+		printf("\t\tspace_fixup \t\t\t%u\n",
+		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
+		printf("\t\tmin_io_size \t\t\t%u\n", le32_to_cpu(sup->min_io_size));
+		printf("\t\tleb_size \t\t\t%u\n", le32_to_cpu(sup->leb_size));
+		printf("\t\tleb_cnt \t\t\t%u\n", le32_to_cpu(sup->leb_cnt));
+		printf("\t\tmax_leb_cnt \t\t\t%u\n", le32_to_cpu(sup->max_leb_cnt));
+		printf("\t\tmax_bud_bytes \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(sup->max_bud_bytes));
+		printf("\t\tlog_lebs \t\t\t%u\n", le32_to_cpu(sup->log_lebs));
+		printf("\t\tlpt_lebs \t\t\t%u\n", le32_to_cpu(sup->lpt_lebs));
+		printf("\t\torph_lebs \t\t\t%u\n", le32_to_cpu(sup->orph_lebs));
+		printf("\t\tjhead_cnt \t\t\t%u\n", le32_to_cpu(sup->jhead_cnt));
+		printf("\t\tfanout \t\t\t\t%u\n", le32_to_cpu(sup->fanout));
+		printf("\t\tlsave_cnt \t\t\t%u\n", le32_to_cpu(sup->lsave_cnt));
+		printf("\t\tdefault_compr \t\t\t%u\n",
+		       (int)le16_to_cpu(sup->default_compr));
+		printf("\t\trp_size \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(sup->rp_size));
+		printf("\t\trp_uid \t\t\t\t%u\n", le32_to_cpu(sup->rp_uid));
+		printf("\t\trp_gid \t\t\t\t%u\n", le32_to_cpu(sup->rp_gid));
+		printf("\t\tfmt_version \t\t\t%u\n", le32_to_cpu(sup->fmt_version));
+		printf("\t\ttime_gran \t\t\t%u\n", le32_to_cpu(sup->time_gran));
+		break;
+	}
+	case UBIFS_MST_NODE:
+	{
+		const struct ubifs_mst_node *mst = node;
+
+		printf("\t\thighest_inum \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->highest_inum));
+		printf("\t\tcommit number \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->cmt_no));
+		printf("\t\tflags \t\t\t\t%#x\n", le32_to_cpu(mst->flags));
+		printf("\t\tlog_lnum \t\t\t%u\n", le32_to_cpu(mst->log_lnum));
+		printf("\t\troot_lnum \t\t\t%u\n", le32_to_cpu(mst->root_lnum));
+		printf("\t\troot_offs \t\t\t%u\n", le32_to_cpu(mst->root_offs));
+		printf("\t\troot_len \t\t\t%u\n", le32_to_cpu(mst->root_len));
+		printf("\t\tgc_lnum \t\t\t%u\n", le32_to_cpu(mst->gc_lnum));
+		printf("\t\tihead_lnum \t\t\t%u\n", le32_to_cpu(mst->ihead_lnum));
+		printf("\t\tihead_offs \t\t\t%u\n", le32_to_cpu(mst->ihead_offs));
+		printf("\t\tindex_size \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->index_size));
+		printf("\t\tlpt_lnum \t\t\t%u\n", le32_to_cpu(mst->lpt_lnum));
+		printf("\t\tlpt_offs \t\t\t%u\n", le32_to_cpu(mst->lpt_offs));
+		printf("\t\tnhead_lnum \t\t\t%u\n", le32_to_cpu(mst->nhead_lnum));
+		printf("\t\tnhead_offs \t\t\t%u\n", le32_to_cpu(mst->nhead_offs));
+		printf("\t\tltab_lnum \t\t\t%u\n", le32_to_cpu(mst->ltab_lnum));
+		printf("\t\tltab_offs \t\t\t%u\n", le32_to_cpu(mst->ltab_offs));
+		printf("\t\tlsave_lnum \t\t\t%u\n", le32_to_cpu(mst->lsave_lnum));
+		printf("\t\tlsave_offs \t\t\t%u\n", le32_to_cpu(mst->lsave_offs));
+		printf("\t\tlscan_lnum \t\t\t%u\n", le32_to_cpu(mst->lscan_lnum));
+		printf("\t\tleb_cnt \t\t\t%u\n", le32_to_cpu(mst->leb_cnt));
+		printf("\t\tempty_lebs \t\t\t%u\n", le32_to_cpu(mst->empty_lebs));
+		printf("\t\tidx_lebs \t\t\t%u\n", le32_to_cpu(mst->idx_lebs));
+		printf("\t\ttotal_free \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_free));
+		printf("\t\ttotal_dirty \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_dirty));
+		printf("\t\ttotal_used \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_used));
+		printf("\t\ttotal_dead \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_dead));
+		printf("\t\ttotal_dark \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_dark));
+		break;
+	}
+	case UBIFS_REF_NODE:
+	{
+		const struct ubifs_ref_node *ref = node;
+
+		printf("\t\tlnum \t\t\t\t%u\n", le32_to_cpu(ref->lnum));
+		printf("\t\toffs \t\t\t\t%u\n", le32_to_cpu(ref->offs));
+		printf("\t\tjhead \t\t\t\t%u\n", le32_to_cpu(ref->jhead));
+		break;
+	}
+	case UBIFS_INO_NODE:
+	{
+		const struct ubifs_ino_node *ino = node;
+
+		key_read(c, &ino->key, &key);
+		printf("\t\tkey \t\t\t%s\n",
+		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
+		printf("\t\tcreat_sqnum \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(ino->creat_sqnum));
+		printf("\t\tsize \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(ino->size));
+		printf("\t\tnlink \t\t\t%u\n", le32_to_cpu(ino->nlink));
+		printf("\t\tatime \t\t\t%lld.%u\n",
+		       (long long)le64_to_cpu(ino->atime_sec),
+		       le32_to_cpu(ino->atime_nsec));
+		printf("\t\tmtime \t\t\t%lld.%u\n",
+		       (long long)le64_to_cpu(ino->mtime_sec),
+		       le32_to_cpu(ino->mtime_nsec));
+		printf("\t\tctime \t\t\t%lld.%u\n",
+		       (long long)le64_to_cpu(ino->ctime_sec),
+		       le32_to_cpu(ino->ctime_nsec));
+		printf("\t\tuid \t\t\t%u\n", le32_to_cpu(ino->uid));
+		printf("\t\tgid \t\t\t%u\n", le32_to_cpu(ino->gid));
+		printf("\t\tmode \t\t\t%u\n", le32_to_cpu(ino->mode));
+		printf("\t\tflags \t\t\t%#x\n", le32_to_cpu(ino->flags));
+		printf("\t\txattr_cnt \t\t\t%u\n", le32_to_cpu(ino->xattr_cnt));
+		printf("\t\txattr_size \t\t\t%u\n", le32_to_cpu(ino->xattr_size));
+		printf("\t\txattr_names \t\t\t%u\n", le32_to_cpu(ino->xattr_names));
+		printf("\t\tcompr_type \t\t\t%#x\n",
+		       (int)le16_to_cpu(ino->compr_type));
+		printf("\t\tdata len \t\t\t%u\n", le32_to_cpu(ino->data_len));
+		break;
+	}
+	case UBIFS_DENT_NODE:
+	case UBIFS_XENT_NODE:
+	{
+		const struct ubifs_dent_node *dent = node;
+		int nlen = le16_to_cpu(dent->nlen);
+
+		key_read(c, &dent->key, &key);
+		printf("\t\tkey \t\t\t%s\n",
+		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
+		printf("\t\tinum \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(dent->inum));
+		printf("\t\ttype \t\t\t%d\n", (int)dent->type);
+		printf("\t\tnlen \t\t\t%d\n", nlen);
+		printf("\t\tname           ");
+
+		if (nlen > UBIFS_MAX_NLEN)
+			printf("(bad name length, not printing, bad or corrupted node)");
+		else {
+			for (i = 0; i < nlen && dent->name[i]; i++)
+				printf("%c", dent->name[i]);
+		}
+		printf("\n");
+
+		break;
+	}
+	case UBIFS_DATA_NODE:
+	{
+		const struct ubifs_data_node *dn = node;
+		int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
+
+		key_read(c, &dn->key, &key);
+		printf("\t\tkey \t\t\t%s\n",
+		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
+		printf("\t\tsize \t\t\t%u\n", le32_to_cpu(dn->size));
+		printf("\t\tcompr_typ \t\t\t%d\n",
+		       (int)le16_to_cpu(dn->compr_type));
+		printf("\t\tdata size \t\t\t%d\n", dlen);
+		break;
+	}
+	case UBIFS_TRUN_NODE:
+	{
+		const struct ubifs_trun_node *trun = node;
+
+		printf("\t\tinum \t\t\t%u\n", le32_to_cpu(trun->inum));
+		printf("\t\told_size \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(trun->old_size));
+		printf("\t\tnew_size \t\t\t%llu\n",
+		       (unsigned long long)le64_to_cpu(trun->new_size));
+		break;
+	}
+	case UBIFS_IDX_NODE:
+	{
+		const struct ubifs_idx_node *idx = node;
+
+		n = le16_to_cpu(idx->child_cnt);
+		printf("\t\tchild_cnt \t\t%d\n", n);
+		printf("\t\tlevel \t\t\t%d\n", (int)le16_to_cpu(idx->level));
+		printf("\t\tBranches:\n");
+
+		for (i = 0; i < n && i < c->fanout - 1; i++) {
+			const struct ubifs_branch *br;
+
+			br = ubifs_idx_branch(c, idx, i);
+			key_read(c, &br->key, &key);
+			printf("\t\t%d: LEB %d:%d len %d key %s\n",
+			       i, le32_to_cpu(br->lnum), le32_to_cpu(br->offs),
+			       le32_to_cpu(br->len),
+			       dbg_snprintf_key(c, &key, key_buf,
+						DBG_KEY_BUF_LEN));
+		}
+		break;
+	}
+	case UBIFS_CS_NODE:
+		break;
+	case UBIFS_ORPH_NODE:
+	{
+		const struct ubifs_orph_node *orph = node;
+
+		printf("\t\tcommit number \t\t\t%llu\n",
+		       (unsigned long long)
+				le64_to_cpu(orph->cmt_no) & LLONG_MAX);
+		printf("\t\tlast node flag \t\t\t%llu\n",
+		       (unsigned long long)(le64_to_cpu(orph->cmt_no)) >> 63);
+		n = (le32_to_cpu(ch->len) - UBIFS_ORPH_NODE_SZ) >> 3;
+		printf("\t\t%d orphan inode numbers:\n", n);
+		for (i = 0; i < n; i++)
+			printf("\t\t  ino \t\t\t%llu\n",
+			       (unsigned long long)le64_to_cpu(orph->inos[i]));
+		break;
+	}
+	default:
+		printf("node type \t\t\t%d was not recognized\n",
+		       (int)ch->node_type);
+	}
+	printf("\n");
+}
+
 static int dump()
 {
 	return 0;
-- 
1.8.4.2
