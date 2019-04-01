Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90DCC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:35:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A509E20883
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FTNo/BJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A509E20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gIBD2nJtnmuIPSfWuyE5pO9ghDwJgtsmmNbKuHzNY4=; b=FTNo/BJ0b+q5Mr
	GLlL1jcqFNCx7AFiu2i0WJ8cgaPEmpSdGaXp7jqG4vrpfz/MMcVXuDq8JYi/OUm6J+wdopaU7Mg0k
	tCxRZUTuK1dLqRuGrznWjVNpeFSlTtj1+44oIZOwEJVCF9JeSauDZE1DDLAjMZ/rKxIl0Oa0P8vz/
	XuPh5l5BMMbqff0rlGX61Pndu9k7TTsByVT1UsJOWoiHFbJ5lFm6kOw995QmSZIv5whtLo7ZGL4zu
	XNOeJk44x/9p/0MbXSjFhLbYjLWDR/g0klU6gVEZSujjtsH0Q3spnMZh11qTD/qfVisI7vN43wK5j
	WcRp0rInuDbGwdqRNHyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAy2L-0003pg-6m; Mon, 01 Apr 2019 14:35:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAy1r-0003Bl-G8
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 14:35:21 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hAy1o-0001yZ-33; Mon, 01 Apr 2019 16:35:12 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hAy1n-0000lm-S0; Mon, 01 Apr 2019 16:35:11 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mkfs.ubifs: Add authentication support
Date: Mon,  1 Apr 2019 16:35:11 +0200
Message-Id: <20190401143511.309-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401143511.309-1-s.hauer@pengutronix.de>
References: <20190401143511.309-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_073516_644761_2398B35C 
X-CRM114-Status: GOOD (  29.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds support for authenticated UBIFS images. In authenticated
images all UBIFS nodes are hashed as described in the UBIFS
authentication whitepaper. Additionally the superblock node contains
a hash of the master node and itself is digitally signed in a node
following the superblock node.

To generate an authenticated image these options are necessary:

--hash-algo:	The algorithm used for hashing nodes. Valid options
		contain sha1, sha256, sha512
--auth-key:	The private key used for signing
--x509:		The x509 certificate to use

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 ubifs-utils/Makemodule.am           |   3 +-
 ubifs-utils/mkfs.ubifs/lpt.c        |  12 +
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 169 +++++++++---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |   1 +
 ubifs-utils/mkfs.ubifs/sign.c       | 405 ++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/sign.h       |  80 ++++++
 ubifs-utils/mkfs.ubifs/ubifs.h      |  22 +-
 7 files changed, 653 insertions(+), 39 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/sign.c
 create mode 100644 ubifs-utils/mkfs.ubifs/sign.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index b8e4075..01dcaca 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -19,7 +19,8 @@ mkfs_ubifs_SOURCES = \
 
 if WITH_CRYPTO
 mkfs_ubifs_SOURCES += ubifs-utils/mkfs.ubifs/crypto.c \
-		ubifs-utils/mkfs.ubifs/fscrypt.c
+		ubifs-utils/mkfs.ubifs/fscrypt.c \
+		ubifs-utils/mkfs.ubifs/sign.c
 endif
 
 mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm
diff --git a/ubifs-utils/mkfs.ubifs/lpt.c b/ubifs-utils/mkfs.ubifs/lpt.c
index 6aa0b88..7ee739a 100644
--- a/ubifs-utils/mkfs.ubifs/lpt.c
+++ b/ubifs-utils/mkfs.ubifs/lpt.c
@@ -22,6 +22,10 @@
 
 #include "mkfs.ubifs.h"
 
+#ifdef WITH_CRYPTO
+#include <openssl/evp.h>
+#endif
+
 /**
  * do_calc_lpt_geom - calculate sizes for the LPT area.
  * @c: the UBIFS file-system description object
@@ -374,6 +378,7 @@ int create_lpt(struct ubifs_info *c)
 	struct ubifs_nnode *nnode = NULL;
 	void *buf = NULL, *p;
 	int *lsave = NULL;
+	unsigned int md_len;
 
 	pnode = malloc(sizeof(struct ubifs_pnode));
 	nnode = malloc(sizeof(struct ubifs_nnode));
@@ -386,6 +391,8 @@ int create_lpt(struct ubifs_info *c)
 	memset(pnode, 0 , sizeof(struct ubifs_pnode));
 	memset(nnode, 0 , sizeof(struct ubifs_nnode));
 
+	hash_digest_init();
+
 	c->lscan_lnum = c->main_first;
 
 	lnum = c->lpt_first;
@@ -429,6 +436,9 @@ int create_lpt(struct ubifs_info *c)
 			}
 		}
 		pack_pnode(c, p, pnode);
+
+		hash_digest_update(p, c->pnode_sz);
+
 		p += c->pnode_sz;
 		len += c->pnode_sz;
 		/*
@@ -439,6 +449,8 @@ int create_lpt(struct ubifs_info *c)
 		pnode->num += 1;
 	}
 
+	hash_digest_final(c->lpt_hash, &md_len);
+
 	row = c->lpt_hght - 1;
 	/* Add all nnodes, one level at a time */
 	while (1) {
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index e0c42f3..ebc025e 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -64,6 +64,7 @@ static char *secontext;
  * @lnum: LEB number
  * @offs: offset
  * @len: length
+ * @hash: hash of the node
  *
  * The index is recorded as a linked list which is sorted and used to create
  * the bottom level of the on-flash index tree. The remaining levels of the
@@ -78,6 +79,7 @@ struct idx_entry {
 	int lnum;
 	int offs;
 	int len;
+	uint8_t hash[UBIFS_MAX_HASH_LEN];
 };
 
 /**
@@ -160,6 +162,12 @@ static unsigned long long creat_sqnum;
 
 static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqaK:b:P:C:";
 
+enum {
+	HASH_ALGO_OPTION = CHAR_MAX + 1,
+	AUTH_KEY_OPTION,
+	X509_OPTION,
+};
+
 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
 	{"min-io-size",        1, NULL, 'm'},
@@ -188,6 +196,9 @@ static const struct option longopts[] = {
 	{"key-descriptor",     1, NULL, 'b'},
 	{"padding",            1, NULL, 'P'},
 	{"cipher",             1, NULL, 'C'},
+	{"hash-algo",          1, NULL, 0},
+	{"auth-key",           1, NULL, 0},
+	{"x509",               1, NULL, 0},
 	{NULL, 0, NULL, 0}
 };
 
@@ -238,6 +249,9 @@ static const char *helptext =
 "                         (default = 4).\n"
 "-C, --cipher=NAME        Specify cipher to use for file level encryption\n"
 "                         (default is \"AES-256-XTS\").\n"
+"    --hash-algo=NAME     hash algorithm to use for signed images\n"
+"    --auth-key=FILE      authentication key for signing\n"
+"    --x509=FILE          X509 certificate filename for signing\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -257,7 +271,15 @@ static const char *helptext =
 "when flashing the image and the second time when UBIFS is mounted and writes useful\n"
 "data there. A proper UBI-aware flasher should skip such NAND pages, though. Note, this\n"
 "flag may make the first mount very slow, because the \"free space fixup\" procedure\n"
-"takes time. This feature is supported by the Linux kernel starting from version 3.0.\n";
+"takes time. This feature is supported by the Linux kernel starting from version 3.0.\n"
+"\n"
+"mkfs.ubifs supports building signed images. For this the \"--hash-algo\",\n"
+"\"--auth-key\" and \"--x509\" options have to be specified.\n";
+
+static inline uint8_t *ubifs_branch_hash(struct ubifs_branch *br)
+{
+	return (void *)br + sizeof(*br) + c->key_len;
+}
 
 /**
  * make_path - make a path name from a directory and a name.
@@ -745,14 +767,27 @@ static int get_options(int argc, char**argv)
 			}
 			break;
 		}
-		case 'C':
 #ifdef WITH_CRYPTO
+		case 'C':
 			cipher_name = optarg;
+			break;
+		case HASH_ALGO_OPTION:
+			c->hash_algo_name = xstrdup(optarg);
+			break;
+		case AUTH_KEY_OPTION:
+			c->auth_key_filename = xstrdup(optarg);
+			break;
+		case X509_OPTION:
+			c->x509_filename = xstrdup(optarg);
+			break;
+		}
 #else
+		case 'C':
+		case HASH_ALGO_OPTION:
+		case AUTH_KEY_OPTION:
+		case X509_OPTION:
 			return err_msg("mkfs.ubifs was built without crypto support.");
 #endif
-			break;
-		}
 	}
 
 	if (optind != argc && !output)
@@ -1055,9 +1090,10 @@ static void set_lprops(int lnum, int offs, int flags)
  * @lnum: node LEB number
  * @offs: node offset
  * @len: node length
+ * @hash: hash of the node
  */
 static int add_to_index(union ubifs_key *key, char *name, int name_len,
-			int lnum, int offs, int len)
+			int lnum, int offs, int len, const uint8_t *hash)
 {
 	struct idx_entry *e;
 
@@ -1071,6 +1107,8 @@ static int add_to_index(union ubifs_key *key, char *name, int name_len,
 	e->lnum = lnum;
 	e->offs = offs;
 	e->len = len;
+	memcpy(e->hash, hash, c->hash_len);
+
 	if (!idx_list_first)
 		idx_list_first = e;
 	if (idx_list_last)
@@ -1129,6 +1167,7 @@ static int reserve_space(int len, int *lnum, int *offs)
 static int add_node(union ubifs_key *key, char *name, int name_len, void *node, int len)
 {
 	int err, lnum, offs, type = key_type(key);
+	uint8_t hash[UBIFS_MAX_HASH_LEN];
 
 	if (type == UBIFS_DENT_KEY || type == UBIFS_XENT_KEY) {
 		if (!name)
@@ -1148,7 +1187,9 @@ static int add_node(union ubifs_key *key, char *name, int name_len, void *node,
 	memcpy(leb_buf + offs, node, len);
 	memset(leb_buf + offs + len, 0xff, ALIGN(len, 8) - len);
 
-	add_to_index(key, name, name_len, lnum, offs, len);
+	ubifs_node_calc_hash(node, hash);
+
+	add_to_index(key, name, name_len, lnum, offs, len, hash);
 
 	return 0;
 }
@@ -2289,6 +2330,7 @@ static int write_index(void)
 	struct ubifs_idx_node *idx;
 	struct ubifs_branch *br;
 	int child_cnt = 0, j, level, blnum, boffs, blen, blast_len, err;
+	uint8_t *hashes;
 
 	dbg_msg(1, "leaf node count: %zd", idx_cnt);
 
@@ -2312,6 +2354,9 @@ static int write_index(void)
 	cnt = idx_cnt / c->fanout;
 	if (idx_cnt % c->fanout)
 		cnt += 1;
+
+	hashes = xmalloc(c->hash_len * cnt);
+
 	p = idx_ptr;
 	blnum = head_lnum;
 	boffs = head_offs;
@@ -2336,8 +2381,11 @@ static int write_index(void)
 			br->lnum = cpu_to_le32((*p)->lnum);
 			br->offs = cpu_to_le32((*p)->offs);
 			br->len = cpu_to_le32((*p)->len);
+			memcpy(ubifs_branch_hash(br), (*p)->hash, c->hash_len);
 		}
 		add_idx_node(idx, child_cnt);
+
+		ubifs_node_calc_hash(idx, hashes + i * c->hash_len);
 	}
 	/* Write level 1 index nodes and above */
 	level = 0;
@@ -2414,11 +2462,18 @@ static int write_index(void)
 				 */
 				boffs += ALIGN(blen, 8);
 				p += pstep;
+
+				memcpy(ubifs_branch_hash(br),
+				       hashes + bn * c->hash_len,
+				       c->hash_len);
 			}
 			add_idx_node(idx, child_cnt);
+			ubifs_node_calc_hash(idx, hashes + i * c->hash_len);
 		}
 	}
 
+	memcpy(c->root_idx_hash, hashes, c->hash_len);
+
 	/* Free stuff */
 	for (i = 0; i < idx_cnt; i++) {
 		free(idx_ptr[i]->name);
@@ -2503,44 +2558,75 @@ static int ubifs_format_version(void)
  */
 static int write_super(void)
 {
-	struct ubifs_sb_node sup;
-
-	memset(&sup, 0, UBIFS_SB_NODE_SZ);
-
-	sup.ch.node_type  = UBIFS_SB_NODE;
-	sup.key_hash      = c->key_hash_type;
-	sup.min_io_size   = cpu_to_le32(c->min_io_size);
-	sup.leb_size      = cpu_to_le32(c->leb_size);
-	sup.leb_cnt       = cpu_to_le32(c->leb_cnt);
-	sup.max_leb_cnt   = cpu_to_le32(c->max_leb_cnt);
-	sup.max_bud_bytes = cpu_to_le64(c->max_bud_bytes);
-	sup.log_lebs      = cpu_to_le32(c->log_lebs);
-	sup.lpt_lebs      = cpu_to_le32(c->lpt_lebs);
-	sup.orph_lebs     = cpu_to_le32(c->orph_lebs);
-	sup.jhead_cnt     = cpu_to_le32(c->jhead_cnt);
-	sup.fanout        = cpu_to_le32(c->fanout);
-	sup.lsave_cnt     = cpu_to_le32(c->lsave_cnt);
-	sup.fmt_version   = cpu_to_le32(ubifs_format_version());
-	sup.default_compr = cpu_to_le16(c->default_compr);
-	sup.rp_size       = cpu_to_le64(c->rp_size);
-	sup.time_gran     = cpu_to_le32(DEFAULT_TIME_GRAN);
-	uuid_generate_random(sup.uuid);
+	void *buf;
+	struct ubifs_sb_node *sup;
+	struct ubifs_sig_node *sig;
+	int err, len;
+
+	buf = xzalloc(c->leb_size);
+
+	sup = buf;
+	sig = buf + UBIFS_SB_NODE_SZ;
+
+	sup->ch.node_type  = UBIFS_SB_NODE;
+	sup->key_hash      = c->key_hash_type;
+	sup->min_io_size   = cpu_to_le32(c->min_io_size);
+	sup->leb_size      = cpu_to_le32(c->leb_size);
+	sup->leb_cnt       = cpu_to_le32(c->leb_cnt);
+	sup->max_leb_cnt   = cpu_to_le32(c->max_leb_cnt);
+	sup->max_bud_bytes = cpu_to_le64(c->max_bud_bytes);
+	sup->log_lebs      = cpu_to_le32(c->log_lebs);
+	sup->lpt_lebs      = cpu_to_le32(c->lpt_lebs);
+	sup->orph_lebs     = cpu_to_le32(c->orph_lebs);
+	sup->jhead_cnt     = cpu_to_le32(c->jhead_cnt);
+	sup->fanout        = cpu_to_le32(c->fanout);
+	sup->lsave_cnt     = cpu_to_le32(c->lsave_cnt);
+	sup->fmt_version   = cpu_to_le32(ubifs_format_version());
+	sup->default_compr = cpu_to_le16(c->default_compr);
+	sup->rp_size       = cpu_to_le64(c->rp_size);
+	sup->time_gran     = cpu_to_le32(DEFAULT_TIME_GRAN);
+	sup->hash_algo     = cpu_to_le16(c->hash_algo);
+	uuid_generate_random(sup->uuid);
+
 	if (verbose) {
 		char s[40];
 
-		uuid_unparse_upper(sup.uuid, s);
+		uuid_unparse_upper(sup->uuid, s);
 		printf("\tUUID:         %s\n", s);
 	}
 	if (c->big_lpt)
-		sup.flags |= cpu_to_le32(UBIFS_FLG_BIGLPT);
+		sup->flags |= cpu_to_le32(UBIFS_FLG_BIGLPT);
 	if (c->space_fixup)
-		sup.flags |= cpu_to_le32(UBIFS_FLG_SPACE_FIXUP);
+		sup->flags |= cpu_to_le32(UBIFS_FLG_SPACE_FIXUP);
 	if (c->double_hash)
-		sup.flags |= cpu_to_le32(UBIFS_FLG_DOUBLE_HASH);
+		sup->flags |= cpu_to_le32(UBIFS_FLG_DOUBLE_HASH);
 	if (c->encrypted)
-		sup.flags |= cpu_to_le32(UBIFS_FLG_ENCRYPTION);
+		sup->flags |= cpu_to_le32(UBIFS_FLG_ENCRYPTION);
+	if (authenticated()) {
+		sup->flags |= cpu_to_le32(UBIFS_FLG_AUTHENTICATION);
+		memcpy(sup->hash_mst, c->mst_hash, c->hash_len);
+	}
 
-	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM);
+	prepare_node(sup, UBIFS_SB_NODE_SZ);
+
+	err = sign_superblock_node(sup);
+	if (err)
+		goto out;
+
+	sig = (void *)(sup + 1);
+	prepare_node(sig, UBIFS_SIG_NODE_SZ + le32_to_cpu(sig->len));
+
+	len = do_pad(sig, UBIFS_SIG_NODE_SZ + le32_to_cpu(sig->len));
+
+	err = write_leb(UBIFS_SB_LNUM, UBIFS_SB_NODE_SZ + len, sup);
+	if (err)
+		goto out;
+
+	err = 0;
+out:
+	free(buf);
+
+	return err;
 }
 
 /**
@@ -2583,6 +2669,11 @@ static int write_master(void)
 	mst.total_dark   = cpu_to_le64(c->lst.total_dark);
 	mst.leb_cnt      = cpu_to_le32(c->leb_cnt);
 
+	if (authenticated()) {
+		memcpy(mst.hash_root_idx, c->root_idx_hash, c->hash_len);
+		memcpy(mst.hash_lpt, c->lpt_hash, c->hash_len);
+	}
+
 	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM);
 	if (err)
 		return err;
@@ -2591,6 +2682,8 @@ static int write_master(void)
 	if (err)
 		return err;
 
+	mst_node_calc_hash(&mst, c->mst_hash);
+
 	return 0;
 }
 
@@ -2855,6 +2948,10 @@ static int mkfs(void)
 	if (err)
 		goto out;
 
+	err = init_authentication();
+	if (err)
+		goto out;
+
 	err = write_data();
 	if (err)
 		goto out;
@@ -2875,11 +2972,11 @@ static int mkfs(void)
 	if (err)
 		goto out;
 
-	err = write_super();
+	err = write_master();
 	if (err)
 		goto out;
 
-	err = write_master();
+	err = write_super();
 	if (err)
 		goto out;
 
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
index 8f01860..fbbb788 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -63,6 +63,7 @@
 #include "key.h"
 #include "lpt.h"
 #include "compr.h"
+#include "sign.h"
 
 /*
  * Compression flags are duplicated so that compr.c can compile without ubifs.h.
diff --git a/ubifs-utils/mkfs.ubifs/sign.c b/ubifs-utils/mkfs.ubifs/sign.c
new file mode 100644
index 0000000..7a15c59
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/sign.c
@@ -0,0 +1,405 @@
+/*
+ * Copyright (C) 2018 Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Author: Sascha Hauer
+ */
+
+#include "mkfs.ubifs.h"
+#include "common.h"
+
+#include <openssl/evp.h>
+#include <openssl/opensslv.h>
+#include <openssl/bio.h>
+#include <openssl/pem.h>
+#include <openssl/err.h>
+#include <openssl/engine.h>
+#include <openssl/cms.h>
+#include <openssl/conf.h>
+#include <err.h>
+
+static struct ubifs_info *c = &info_;
+
+EVP_MD_CTX *hash_md;
+const EVP_MD *md;
+
+int authenticated(void)
+{
+	return c->hash_algo_name != NULL;
+}
+
+static int match_string(const char * const *array, size_t n, const char *string)
+{
+	int index;
+	const char *item;
+
+	for (index = 0; index < n; index++) {
+		item = array[index];
+		if (!item)
+			break;
+		if (!strcmp(item, string))
+			return index;
+	}
+
+	return -EINVAL;
+}
+
+#include <linux/hash_info.h>
+
+const char *const hash_algo_name[HASH_ALGO__LAST] = {
+	[HASH_ALGO_MD4]		= "md4",
+	[HASH_ALGO_MD5]		= "md5",
+	[HASH_ALGO_SHA1]	= "sha1",
+	[HASH_ALGO_RIPE_MD_160]	= "rmd160",
+	[HASH_ALGO_SHA256]	= "sha256",
+	[HASH_ALGO_SHA384]	= "sha384",
+	[HASH_ALGO_SHA512]	= "sha512",
+	[HASH_ALGO_SHA224]	= "sha224",
+	[HASH_ALGO_RIPE_MD_128]	= "rmd128",
+	[HASH_ALGO_RIPE_MD_256]	= "rmd256",
+	[HASH_ALGO_RIPE_MD_320]	= "rmd320",
+	[HASH_ALGO_WP_256]	= "wp256",
+	[HASH_ALGO_WP_384]	= "wp384",
+	[HASH_ALGO_WP_512]	= "wp512",
+	[HASH_ALGO_TGR_128]	= "tgr128",
+	[HASH_ALGO_TGR_160]	= "tgr160",
+	[HASH_ALGO_TGR_192]	= "tgr192",
+	[HASH_ALGO_SM3_256]	= "sm3-256",
+};
+
+static void display_openssl_errors(int l)
+{
+	const char *file;
+	char buf[120];
+	int e, line;
+
+	if (ERR_peek_error() == 0)
+		return;
+	fprintf(stderr, "At main.c:%d:\n", l);
+
+	while ((e = ERR_get_error_line(&file, &line))) {
+		ERR_error_string(e, buf);
+		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+	}
+}
+
+static void drain_openssl_errors(void)
+{
+	const char *file;
+	int line;
+
+	if (ERR_peek_error() == 0)
+		return;
+	while (ERR_get_error_line(&file, &line)) {}
+}
+
+#define ssl_err_msg(fmt, ...) ({			\
+	display_openssl_errors(__LINE__);		\
+	err_msg(fmt, ## __VA_ARGS__);			\
+	-1;						\
+})
+
+static const char *key_pass;
+
+static int pem_pw_cb(char *buf, int len, __attribute__((unused)) int w,
+		     __attribute__((unused)) void *v)
+{
+	int pwlen;
+
+	if (!key_pass)
+		return -1;
+
+	pwlen = strlen(key_pass);
+	if (pwlen >= len)
+		return -1;
+
+	strcpy(buf, key_pass);
+
+	/* If it's wrong, don't keep trying it. */
+	key_pass = NULL;
+
+	return pwlen;
+}
+
+static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+{
+	EVP_PKEY *private_key = NULL;
+	int err;
+
+	*cert = NULL;
+
+	if (!strncmp(private_key_name, "pkcs11:", 7)) {
+		ENGINE *e;
+		struct {
+			const char *url;
+			X509 *cert;
+		} parms;
+
+		ENGINE_load_builtin_engines();
+		drain_openssl_errors();
+		e = ENGINE_by_id("pkcs11");
+		if (!e) {
+			ssl_err_msg("Load PKCS#11 ENGINE");
+			return NULL;
+		}
+
+		if (ENGINE_init(e)) {
+			drain_openssl_errors();
+		} else {
+			ssl_err_msg("ENGINE_init");
+			return NULL;
+		}
+
+		if (key_pass)
+			if (!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0)) {
+				ssl_err_msg("Set PKCS#11 PIN");
+				return NULL;
+			}
+
+		private_key = ENGINE_load_private_key(e, private_key_name,
+						      NULL, NULL);
+
+		parms.url = private_key_name;
+		parms.cert = NULL;
+
+		err = ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 0);
+		if (!err || !parms.cert) {
+			ssl_err_msg("Load certificate");
+		}
+		*cert = parms.cert;
+		fprintf(stderr, "Using cert %p\n", *cert);
+	} else {
+		BIO *b;
+
+		b = BIO_new_file(private_key_name, "rb");
+		if (!b)
+			goto out;
+
+		private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
+						      NULL);
+		BIO_free(b);
+	}
+out:
+	if (!private_key)
+		ssl_err_msg("failed opening private key %s", private_key_name);
+
+	return private_key;
+}
+
+static X509 *read_x509(const char *x509_name)
+{
+	unsigned char buf[2];
+	X509 *x509 = NULL;
+	BIO *b;
+	int n;
+
+	b = BIO_new_file(x509_name, "rb");
+	if (!b)
+		goto out;
+
+	/* Look at the first two bytes of the file to determine the encoding */
+	n = BIO_read(b, buf, 2);
+	if (n != 2) {
+		if (BIO_should_retry(b))
+			err_msg("%s: Read wanted retry", x509_name);
+		if (n >= 0)
+			err_msg("%s: Short read", x509_name);
+		goto out;
+	}
+
+	if (BIO_reset(b))
+		goto out;
+
+	if (buf[0] == 0x30 && buf[1] >= 0x81 && buf[1] <= 0x84)
+		/* Assume raw DER encoded X.509 */
+		x509 = d2i_X509_bio(b, NULL);
+	else
+		/* Assume PEM encoded X.509 */
+		x509 = PEM_read_bio_X509(b, NULL, NULL, NULL);
+
+	BIO_free(b);
+
+out:
+	if (!x509) {
+		ssl_err_msg("%s", x509_name);
+		return NULL;
+	}
+
+	return x509;
+}
+
+int sign_superblock_node(void *node)
+{
+	EVP_PKEY *private_key;
+	CMS_ContentInfo *cms = NULL;
+	X509 *x509 = NULL;
+	BIO *bd, *bm;
+	void *obuf;
+	long len;
+	int ret;
+	void *pret;
+	struct ubifs_sig_node *sig = node + UBIFS_SB_NODE_SZ;
+
+	if (!authenticated())
+		return 0;
+
+	ERR_load_crypto_strings();
+	ERR_clear_error();
+
+	key_pass = getenv("MKFS_UBIFS_SIGN_PIN");
+
+	bm = BIO_new_mem_buf(node, UBIFS_SB_NODE_SZ);
+
+	private_key = read_private_key(c->auth_key_filename, &x509);
+	if (!private_key)
+		return -1;
+
+	if (!x509)
+		x509 = read_x509(c->x509_filename);
+	if (!x509)
+		return -1;
+
+	OpenSSL_add_all_digests();
+	display_openssl_errors(__LINE__);
+
+	cms = CMS_sign(NULL, NULL, NULL, NULL,
+		       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
+		       CMS_DETACHED | CMS_STREAM);
+	if (!cms)
+		return err_msg("CMS_sign failed");
+
+	pret = CMS_add1_signer(cms, x509, private_key, md,
+			      CMS_NOCERTS | CMS_BINARY |
+			      CMS_NOSMIMECAP | CMS_NOATTR);
+	if (!pret)
+		return err_msg("CMS_add1_signer failed");
+
+	ret = CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY);
+	if (!ret)
+		return err_msg("CMS_final failed");
+
+	bd = BIO_new(BIO_s_mem());
+
+	ret = i2d_CMS_bio_stream(bd, cms, NULL, 0);
+	if (!ret)
+		return err_msg("i2d_CMS_bio_stream failed");
+
+	len = BIO_get_mem_data(bd, &obuf);
+
+	sig->len = cpu_to_le32(len);
+	sig->ch.node_type  = UBIFS_SIG_NODE;
+
+	memcpy(sig + 1, obuf, len);
+
+	BIO_free(bd);
+	BIO_free(bm);
+
+	return 0;
+}
+
+/**
+ * ubifs_node_calc_hash - calculate the hash of a UBIFS node
+ * @c: UBIFS file-system description object
+ * @node: the node to calculate a hash for
+ * @hash: the returned hash
+ */
+void ubifs_node_calc_hash(const void *node, uint8_t *hash)
+{
+	const struct ubifs_ch *ch = node;
+	unsigned int md_len;
+
+	if (!authenticated())
+		return;
+
+	EVP_DigestInit_ex(hash_md, md, NULL);
+	EVP_DigestUpdate(hash_md, node, le32_to_cpu(ch->len));
+	EVP_DigestFinal_ex(hash_md, hash, &md_len);
+}
+
+/**
+ * mst_node_calc_hash - calculate the hash of a UBIFS master node
+ * @c: UBIFS file-system description object
+ * @node: the node to calculate a hash for
+ * @hash: the returned hash
+ */
+void mst_node_calc_hash(const void *node, uint8_t *hash)
+{
+	unsigned int md_len;
+
+	if (!authenticated())
+		return;
+
+	EVP_DigestInit_ex(hash_md, md, NULL);
+	EVP_DigestUpdate(hash_md, node + sizeof(struct ubifs_ch),
+			 UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch));
+	EVP_DigestFinal_ex(hash_md, hash, &md_len);
+}
+
+void hash_digest_init(void)
+{
+	if (!authenticated())
+		return;
+
+	EVP_DigestInit_ex(hash_md, md, NULL);
+}
+
+void hash_digest_update(const void *buf, int len)
+{
+	if (!authenticated())
+		return;
+
+	EVP_DigestUpdate(hash_md, buf, len);
+}
+
+void hash_digest_final(void *hash, unsigned int *len)
+{
+	if (!authenticated())
+		return;
+
+	EVP_DigestFinal_ex(hash_md, hash, len);
+}
+
+int init_authentication(void)
+{
+	int hash_algo;
+
+	if (!c->auth_key_filename && !c->x509_filename && !c->hash_algo_name)
+		return 0;
+
+	if (!c->auth_key_filename)
+		return err_msg("authentication key not given (-K)");
+
+	if (!c->hash_algo_name)
+		return err_msg("Hash algorithm not given (-H)");
+
+	OPENSSL_no_config();
+	OpenSSL_add_all_algorithms();
+	ERR_load_crypto_strings();
+
+	md = EVP_get_digestbyname(c->hash_algo_name);
+	if (!md)
+		return err_msg("Unknown message digest %s", c->hash_algo_name);
+
+	hash_md = EVP_MD_CTX_create();
+	c->hash_len = EVP_MD_size(md);
+
+	hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST, c->hash_algo_name);
+	if (hash_algo < 0)
+		return err_msg("Unsupported message digest %s", c->hash_algo_name);
+
+	c->hash_algo = hash_algo;
+
+	return 0;
+}
diff --git a/ubifs-utils/mkfs.ubifs/sign.h b/ubifs-utils/mkfs.ubifs/sign.h
new file mode 100644
index 0000000..fe9fdd8
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/sign.h
@@ -0,0 +1,80 @@
+/*
+ * Copyright (C) 2018 Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Author: Sascha Hauer
+ */
+
+#ifndef __UBIFS_SIGN_H__
+#define __UBIFS_SIGN_H__
+
+#ifdef WITH_CRYPTO
+#include <openssl/evp.h>
+
+void ubifs_node_calc_hash(const void *node, uint8_t *hash);
+void mst_node_calc_hash(const void *node, uint8_t *hash);
+void hash_digest_init(void);
+void hash_digest_update(const void *buf, int len);
+void hash_digest_final(void *hash, unsigned int *len);
+int init_authentication(void);
+int sign_superblock_node(void *node);
+int authenticated(void);
+
+extern EVP_MD_CTX *hash_md;
+extern const EVP_MD *md;
+
+#else
+static inline void ubifs_node_calc_hash(__attribute__((unused)) const void *node,
+					__attribute__((unused)) uint8_t *hash)
+{
+}
+
+static inline void mst_node_calc_hash(__attribute__((unused)) const void *node,
+				      __attribute__((unused)) uint8_t *hash)
+{
+}
+
+static inline void hash_digest_init(void)
+{
+}
+
+static inline void hash_digest_update(__attribute__((unused)) const void *buf,
+				      __attribute__((unused)) int len)
+{
+}
+
+static inline void hash_digest_final(__attribute__((unused)) void *hash,
+				     __attribute__((unused)) unsigned int *len)
+{
+}
+
+static inline int init_authentication(void)
+{
+	return 0;
+}
+
+static inline int sign_superblock_node(__attribute__((unused)) void *node)
+{
+	return 0;
+}
+
+static inline int authenticated(void)
+{
+	return 0;
+}
+
+#endif
+
+#endif /* __UBIFS_SIGN_H__ */
diff --git a/ubifs-utils/mkfs.ubifs/ubifs.h b/ubifs-utils/mkfs.ubifs/ubifs.h
index c26d094..efe3f30 100644
--- a/ubifs-utils/mkfs.ubifs/ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/ubifs.h
@@ -342,6 +342,15 @@ struct ubifs_znode
  * @lsave_offs: offset of LPT's save table
  * @lsave: LPT's save table
  * @lscan_lnum: LEB number of last LPT scan
+ *
+ * @hash_algo_name: the name of the hashing algorithm to use
+ * @hash_algo: The hash algo number (from include/linux/hash_info.h)
+ * @auth_key_filename: authentication key file name
+ * @x509_filename: x509 certificate file name for authentication
+ * @hash_len: the length of the hash
+ * @root_idx_hash: The hash of the root index node
+ * @lpt_hash: The hash of the LPT
+ * @mst_hash: The hash of the master node
  */
 struct ubifs_info
 {
@@ -423,6 +432,14 @@ struct ubifs_info
 	int *lsave;
 	int lscan_lnum;
 
+	char *hash_algo_name;
+	int hash_algo;
+	char *auth_key_filename;
+	char *x509_filename;
+	int hash_len;
+	uint8_t root_idx_hash[UBIFS_MAX_HASH_LEN];
+	uint8_t lpt_hash[UBIFS_MAX_HASH_LEN];
+	uint8_t mst_hash[UBIFS_MAX_HASH_LEN];
 };
 
 /**
@@ -432,7 +449,8 @@ struct ubifs_info
  */
 static inline int ubifs_idx_node_sz(const struct ubifs_info *c, int child_cnt)
 {
-	return UBIFS_IDX_NODE_SZ + (UBIFS_BRANCH_SZ + c->key_len) * child_cnt;
+	return UBIFS_IDX_NODE_SZ + (UBIFS_BRANCH_SZ + c->key_len + c->hash_len)
+				    * child_cnt;
 }
 
 /**
@@ -447,7 +465,7 @@ struct ubifs_branch *ubifs_idx_branch(const struct ubifs_info *c,
 				      int bnum)
 {
 	return (struct ubifs_branch *)((void *)idx->branches +
-				       (UBIFS_BRANCH_SZ + c->key_len) * bnum);
+				       (UBIFS_BRANCH_SZ + c->key_len + c->hash_len) * bnum);
 }
 
 #endif /* __UBIFS_H__ */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
