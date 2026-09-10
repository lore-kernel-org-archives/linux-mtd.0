Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3463C88E41
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To:
	Message-Id:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEAWskynR2TRAT62eWkoWAMBH4gk20vZJxtMOOfXwbw=; b=lDJrFcuuc/9fL1
	RQGoesduisHYsYpxSClFnmidbYfZp+eqSCAkl2o/PW9dPL4Q+k6zJ2CQqYgSUdnmKizSG5QQTju/I
	PhdkXA1Yt3sp3iNORjPXjPpU4hlJ+GoTtKTK5osZPZ94EzmMC68koCOsyftwvqa7UkIfnsFNTIg+B
	PH4IbOD4xrtbAaTH8Vf7H2KNaGbm9ncYxZtlBXqR7vTRSJo3dMGWkhD1SAWs3YfgVLaPtTG8WIIwF
	PgwkMknKTe4d93+VS/tDVfyhCUoCPswcVvN/tfMVzVshrcXC82rIfm8kx/jHZEZJdlMhI/kYXvX8E
	bfvpkgN8BA6f097h3rKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sz2-0000000Foqy-0BDI;
	Fri, 11 Sep 2026 04:35:28 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4syy-0000000Foq2-3FEG
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 04:35:26 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9865so3424185ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 21:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789101324; x=1789706124; darn=lists.infradead.org;
        h=cc:to:references:in-reply-to:message-id:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/8BaySv+YCNOfhzt42Sjf0iWW9NM2JTjD2K1A3/2J3U=;
        b=qHZ0J2azHzUfIGPNCBsdJ4l68i4UB7mzzhqhnNCIrsqwRnlK9XlgQwBaJ4MxlC4h0G
         bmrcI4ieqLKFy+/RQjwwjbsJw6dyCjS0hTUyfu26/aZgE7VSoI1mVuwuDyxOitAtfVTj
         BOo+cxrFrwBmxwSNP8zFERtaEhHY2fX3FTT/Ugzhm8RSHVA2zwUESwSZWq5xhYQI77Th
         9Lv0l65zixXOJ9agD1TZh7XliN1rRw9dOECrbuGQfgFmjUOIDTLYvvsbAe1a31ltALOD
         WwMm6gm2X50yzMEBkqyXVebyMmtBjJzY7lvJCQT+pqBAxMl1dDGWhPR/FUPVwZwZXjII
         gPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789101324; x=1789706124;
        h=cc:to:references:in-reply-to:message-id:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8BaySv+YCNOfhzt42Sjf0iWW9NM2JTjD2K1A3/2J3U=;
        b=jZwVGlfHZS5260c42PTyk3tv3o4a4JqzB+YOdzQSAAG90qX8FSkGYBbK0A2/qqQE2H
         l5hi+76P3Zdj3gBYxSEeoCExqkWrv9kr2gsCzB3dG1DDrQVo1RAtAX3+CGGLKN22LGrp
         lA95RgLr9wp++e7DUavKA7ESunGS2UsycV4lUVo13RzSCDtylGkYEGLka1bZMILA+cB5
         FzEFxPYIPn6eK8JPCXJ9RpKL5U7245hF2Cv01mqL0LMS4BNNtYq1f/BI+jhaD6f/+SxX
         s6O7UMBSRVsuw3EvZ44lS+OG+fTddqSPNbyqUtUVbWmYS4F/jEJcmdjX+san8/KoHb+o
         LoQA==
X-Forwarded-Encrypted: i=1; AKwUvBxdr6frlNKeZwWKYIouV2yFnaak0Ogsu7uPuDTl1BJRDb+6w61ghb0Hb/2qY0s7wFOfTXNUjh4WD6s=@lists.infradead.org
X-Gm-Message-State: AFuF++k1E5oZJzdKSXgqT+V2AmVr/xD8swxd6Msh+5lbU2AZfQHxV3AC
	mHGA3WYv9YtDlz0WbmwBVYoA0TP62dqtkpUPWOiYg4Ber+9EIDOVU2GL
X-Gm-Gg: AYBFou1ntkyaG++LBqpA5Unc3wnvAO5gU4K6+dm6izbE1dpJbOqLPNkdFkk6tbXGvx6
	fv91otYxDz8WoeY1BiPN7tzacshjtG7bQYRLPS26L54UsIFksxI2HgmwH0n7jiIkKz6CniZZ7b2
	Bw9N0OnIEePWXMLtw2RPBvc3pTgyZbq6iNYPLthLDxVlcLVyzNVm5vkfxpIcO4cDLOn6dTVH8eI
	vuGurO3d4HXKQJ3iF61zm45ckRBwMrj8pYW2pN10o1J24exw8UcI+Twrw6XOvWHFeNjPIeW+pij
	LQ4jHaYNKzf2MgNwBsYTt7wt1bQvgw1Pk5t+hNKtTS5ujRS4vB5BVskhr9WJYFRaLRDF6r49XAp
	JSQk8+vJD5FzFcqtXFgOAjjKfIu+qYnsUP++S2YuJNPNYqp92w9Vl2SumUS8om/TbsRkjZcFEnf
	g87zqGJMNZ5NzxmujjmuueC4VoOQej2NxLnW1mXdTc7x9DKsdk2jTv+A==
X-Received: by 2002:a17:903:1b48:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd2a35d8edmr46343025ad.18.1789101323590;
        Thu, 10 Sep 2026 21:35:23 -0700 (PDT)
Received: from smtp.gmail.com ([2401:b60:16:d3::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm2729358eec.25.2026.09.10.21.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:35:23 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Thu, 10 Sep 2026 22:10:38 +0800
Subject: [PATCH v2 1/2] ubifs: add KUnit test scaffolding for scan.c
Message-Id: <178910129195.312459.9721048737689660676.p1-of-2@gmail.com>
In-Reply-To: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
References: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_213524_871561_96FD7598 
X-CRM114-Status: GOOD (  33.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add KUnit tests for the UBIFS scan path so that the node parsing code
can be validated offline, without an MTD device, a UBI volume or a
development board.

The tests are built into the ubifs module itself (ubifs-y) so that they
can call the non-exported ubifs_scan_a_node(), ubifs_check_node(),
ubifs_add_snod() and ubifs_end_scan() directly, without adding
EXPORT_SYMBOL() to production code. A new CONFIG_UBIFS_FS_KUNIT_TEST
option gates the build and defaults to KUNIT_ALL_TESTS.

kunit_helpers.h provides a minimal fake struct ubifs_info, allocated
with kunit_kzalloc() and initialised only with the fields read by the
tested paths. The node length ranges mirror init_constants_early() in
super.c, because a zeroed range means "fixed length" for
ubifs_check_node() and would make the length checks pass for the wrong
reason. The node constructor fills the common header and payload first
and computes the CRC last, over exactly the bytes that the kernel
checksums.

scan_kunit.c covers the ubifs_scan_a_node() branch table, the length
and CRC checks in ubifs_check_node(), the scanned node bookkeeping in
ubifs_add_snod() and the LEB end pointer update in ubifs_end_scan().
All cases pass quiet = 1 except one that explicitly documents the
corrupt-node logging path.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>
---
 fs/ubifs/Kconfig               |  16 +
 fs/ubifs/Makefile              |   1 +
 fs/ubifs/tests/kunit_helpers.h | 222 ++++++++
 fs/ubifs/tests/scan_kunit.c    | 988 +++++++++++++++++++++++++++++++++
 4 files changed, 1227 insertions(+)
 create mode 100644 fs/ubifs/tests/kunit_helpers.h
 create mode 100644 fs/ubifs/tests/scan_kunit.c

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 45d3d207f..c103d391b 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -99,3 +99,19 @@ config UBIFS_FS_AUTHENTICATION
 	  different options.
 
 endif # UBIFS_FS
+
+config UBIFS_FS_KUNIT_TEST
+	bool "KUnit tests for UBIFS" if !KUNIT_ALL_TESTS
+	depends on UBIFS_FS && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for the UBIFS file system. The tests are
+	  linked into the UBIFS module itself so that they can call
+	  non-exported functions.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (https://testanything.org/). Only useful for kernel
+	  developers running the KUnit test harness, and not intended for
+	  inclusion into a production build.
+
+	  If unsure, say N.
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 314c80b24..4a83b822c 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -6,6 +6,7 @@ ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o debug.o
 ubifs-y += misc.o sysfs.o
+ubifs-$(CONFIG_UBIFS_FS_KUNIT_TEST) += tests/scan_kunit.o
 ubifs-$(CONFIG_FS_ENCRYPTION) += crypto.o
 ubifs-$(CONFIG_UBIFS_FS_XATTR) += xattr.o
 ubifs-$(CONFIG_UBIFS_FS_AUTHENTICATION) += auth.o
diff --git a/fs/ubifs/tests/kunit_helpers.h b/fs/ubifs/tests/kunit_helpers.h
new file mode 100644
index 000000000..295e7742d
--- /dev/null
+++ b/fs/ubifs/tests/kunit_helpers.h
@@ -0,0 +1,222 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Shared helpers for the UBIFS KUnit tests.
+ *
+ * The tests exercise the UBIFS scanning and key helpers against a minimal
+ * fake &struct ubifs_info: no UBI device is involved and none of the tested
+ * functions dereference any other field. The fake object is allocated with
+ * kunit_kzalloc() so that KUnit frees it automatically after the test, and it
+ * is fully zeroed because some of the fields read by the tested code (for
+ * example assert_action) are bit-fields which must not contain garbage.
+ */
+
+#ifndef __UBIFS_TESTS_KUNIT_HELPERS_H__
+#define __UBIFS_TESTS_KUNIT_HELPERS_H__
+
+#include <kunit/test.h>
+#include <linux/crc32.h>
+#include <linux/fscrypt.h>
+
+#include "../ubifs.h"
+
+/* Typical NAND LEB size; large enough for any node. */
+#define UBIFS_TEST_LEB_SIZE	131072
+#define UBIFS_TEST_LEB_CNT	8
+#define UBIFS_TEST_MIN_IO_SIZE	8
+
+/* Arbitrary sequence number, distinct from the all-ones empty space. */
+#define UBIFS_TEST_SQNUM	0x0123456789ABCDEFULL
+
+/**
+ * ubifs_test_crc() - compute the checksum covered by a UBIFS node CRC.
+ * @buf: node buffer
+ * @len: node length as stored in the common header
+ *
+ * This is exactly the calculation ubifs_check_node() performs: the checksum
+ * covers everything but the magic and the CRC field itself. Note that the
+ * kernel CRC is a plain crc32_le() without the final inversion, so zlib's
+ * crc32() must never be used to compute expected values.
+ *
+ * Return: the checksum over bytes @buf[8 .. len - 1].
+ */
+static inline u32 ubifs_test_crc(const void *buf, int len)
+{
+	return crc32(UBIFS_CRC32_INIT, buf + 8, len - 8);
+}
+
+/**
+ * ubifs_test_info() - allocate a fake UBIFS file-system object.
+ * @test: KUnit test context
+ *
+ * The object is zeroed and only the fields read on the tested code paths are
+ * set: the LEB geometry, the node length ranges exactly as
+ * init_constants_early() in super.c sets them, and the key helpers used by
+ * struct fscrypt_name based key constructors.
+ *
+ * Return: the fake object, or %NULL on allocation failure.
+ */
+static inline struct ubifs_info *ubifs_test_info(struct kunit *test)
+{
+	struct ubifs_info *c;
+
+	c = kunit_kzalloc(test, sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return NULL;
+
+	c->leb_size = UBIFS_TEST_LEB_SIZE;
+	c->leb_cnt = UBIFS_TEST_LEB_CNT;
+	c->min_io_size = UBIFS_TEST_MIN_IO_SIZE;
+	c->key_fmt = UBIFS_SIMPLE_KEY_FMT;
+	c->key_hash = key_test_hash;
+
+	/*
+	 * Mirror init_constants_early(). The zeroed object is *not* a safe
+	 * default: max_len == 0 means "fixed length", so every type must be
+	 * given an explicit range before ubifs_check_node() is called.
+	 */
+	c->ranges[UBIFS_PAD_NODE].len = UBIFS_PAD_NODE_SZ;
+	c->ranges[UBIFS_SB_NODE].len = UBIFS_SB_NODE_SZ;
+	c->ranges[UBIFS_MST_NODE].len = UBIFS_MST_NODE_SZ;
+	c->ranges[UBIFS_REF_NODE].len = UBIFS_REF_NODE_SZ;
+	c->ranges[UBIFS_TRUN_NODE].len = UBIFS_TRUN_NODE_SZ;
+	c->ranges[UBIFS_CS_NODE].len = UBIFS_CS_NODE_SZ;
+	c->ranges[UBIFS_AUTH_NODE].min_len = UBIFS_AUTH_NODE_SZ;
+	c->ranges[UBIFS_AUTH_NODE].max_len = UBIFS_AUTH_NODE_SZ +
+					     UBIFS_MAX_HMAC_LEN;
+	c->ranges[UBIFS_SIG_NODE].min_len = UBIFS_SIG_NODE_SZ;
+	c->ranges[UBIFS_SIG_NODE].max_len = c->leb_size - UBIFS_SB_NODE_SZ;
+	c->ranges[UBIFS_INO_NODE].min_len = UBIFS_INO_NODE_SZ;
+	c->ranges[UBIFS_INO_NODE].max_len = UBIFS_MAX_INO_NODE_SZ;
+	c->ranges[UBIFS_ORPH_NODE].min_len = UBIFS_ORPH_NODE_SZ +
+					     sizeof(__le64);
+	c->ranges[UBIFS_ORPH_NODE].max_len = c->leb_size;
+	c->ranges[UBIFS_DENT_NODE].min_len = UBIFS_DENT_NODE_SZ;
+	c->ranges[UBIFS_DENT_NODE].max_len = UBIFS_MAX_DENT_NODE_SZ;
+	c->ranges[UBIFS_XENT_NODE].min_len = UBIFS_XENT_NODE_SZ;
+	c->ranges[UBIFS_XENT_NODE].max_len = UBIFS_MAX_XENT_NODE_SZ;
+	c->ranges[UBIFS_DATA_NODE].min_len = UBIFS_DATA_NODE_SZ;
+	c->ranges[UBIFS_DATA_NODE].max_len = UBIFS_MAX_DATA_NODE_SZ;
+	c->ranges[UBIFS_IDX_NODE].min_len = UBIFS_IDX_NODE_SZ + UBIFS_BRANCH_SZ;
+	c->ranges[UBIFS_IDX_NODE].max_len = INT_MAX;
+
+	return c;
+}
+
+/**
+ * ubifs_test_scan_leb() - allocate an initialized scanning object.
+ * @test: KUnit test context
+ *
+ * Return: an empty &struct ubifs_scan_leb, or %NULL on allocation failure.
+ */
+static inline struct ubifs_scan_leb *ubifs_test_scan_leb(struct kunit *test)
+{
+	struct ubifs_scan_leb *sleb;
+
+	sleb = kunit_kzalloc(test, sizeof(*sleb), GFP_KERNEL);
+	if (!sleb)
+		return NULL;
+
+	INIT_LIST_HEAD(&sleb->nodes);
+	return sleb;
+}
+
+/**
+ * ubifs_test_node_init() - fill in the common header of a node.
+ * @buf: node buffer
+ * @type: node type
+ * @len: full node length stored in the header
+ *
+ * The payload (including any key or pad_len field) has to be filled in by
+ * the caller, and ubifs_test_node_sign() has to be called last.
+ */
+static inline void ubifs_test_node_init(void *buf, u8 type, int len)
+{
+	struct ubifs_ch *ch = buf;
+
+	ch->magic = cpu_to_le32(UBIFS_NODE_MAGIC);
+	ch->sqnum = cpu_to_le64(UBIFS_TEST_SQNUM);
+	ch->len = cpu_to_le32(len);
+	ch->node_type = type;
+	ch->group_type = UBIFS_NO_NODE_GROUP;
+	ch->padding[0] = 0;
+	ch->padding[1] = 0;
+}
+
+/**
+ * ubifs_test_node_sign() - compute and store the CRC of a node.
+ * @buf: node buffer
+ * @len: full node length stored in the header
+ */
+static inline void ubifs_test_node_sign(void *buf, int len)
+{
+	struct ubifs_ch *ch = buf;
+
+	ch->crc = cpu_to_le32(ubifs_test_crc(buf, len));
+}
+
+/**
+ * ubifs_test_make_node() - allocate a valid node with a zeroed payload.
+ * @test: KUnit test context
+ * @buf_size: size of the buffer to allocate, must be >= @len
+ * @type: node type
+ * @len: full node length stored in the header
+ *
+ * Return: the node, or %NULL if @buf_size < @len or on allocation failure.
+ */
+static inline void *ubifs_test_make_node(struct kunit *test, size_t buf_size,
+					 u8 type, int len)
+{
+	void *buf;
+
+	if (buf_size < (size_t)len)
+		return NULL;
+
+	buf = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	ubifs_test_node_init(buf, type, len);
+	ubifs_test_node_sign(buf, len);
+
+	return buf;
+}
+
+/**
+ * ubifs_test_make_pad_node() - allocate a valid padding node.
+ * @test: KUnit test context
+ * @pad_len: value of the pad_len field (may be negative)
+ *
+ * Return: the padding node, or %NULL on allocation failure.
+ */
+static inline struct ubifs_pad_node *
+ubifs_test_make_pad_node(struct kunit *test, int pad_len)
+{
+	struct ubifs_pad_node *pad;
+
+	pad = kunit_kzalloc(test, sizeof(*pad), GFP_KERNEL);
+	if (!pad)
+		return NULL;
+
+	ubifs_test_node_init(pad, UBIFS_PAD_NODE, UBIFS_PAD_NODE_SZ);
+	pad->pad_len = cpu_to_le32((u32)pad_len);
+	ubifs_test_node_sign(pad, UBIFS_PAD_NODE_SZ);
+
+	return pad;
+}
+
+/**
+ * ubifs_test_node_set_key() - store an on-flash key in a keyed node.
+ * @buf: node buffer
+ * @inum: value of the first key word (inode number)
+ * @val: value of the second key word (key type and block/hash)
+ */
+static inline void ubifs_test_node_set_key(void *buf, u32 inum, u32 val)
+{
+	union ubifs_key *key = (union ubifs_key *)
+			       ((char *)buf + UBIFS_KEY_OFFSET);
+
+	key->j32[0] = cpu_to_le32(inum);
+	key->j32[1] = cpu_to_le32(val);
+}
+
+#endif /* __UBIFS_TESTS_KUNIT_HELPERS_H__ */
diff --git a/fs/ubifs/tests/scan_kunit.c b/fs/ubifs/tests/scan_kunit.c
new file mode 100644
index 000000000..f0ee40669
--- /dev/null
+++ b/fs/ubifs/tests/scan_kunit.c
@@ -0,0 +1,988 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for fs/ubifs/scan.c
+ *
+ * The tests build UBIFS nodes in memory and feed them to the scanner; no UBI
+ * device is involved. They all pass quiet = 1 unless the logging behaviour is
+ * the thing under test, so that ubifs_dump_node() cannot flood the kernel log.
+ */
+
+#include <kunit/test.h>
+
+#include "kunit_helpers.h"
+
+/*
+ * LEB number and offset used by the scanner tests; both satisfy the
+ * ubifs_assert() checks at the beginning of ubifs_check_node().
+ */
+#define TEST_LNUM	0
+#define TEST_OFFS	0
+
+/* Data nodes are the simplest variable length nodes. */
+#define TEST_DATA_SZ	UBIFS_DATA_NODE_SZ
+
+/*
+ * Allocate a buffer of exactly @len bytes and fill it with a valid node of
+ * type @type. The buffer is never smaller than the length recorded in the
+ * common header, as ubifs_check_node() reads the CRC over @ch->len bytes.
+ */
+static void *make_node(struct kunit *test, u8 type, int len)
+{
+	return ubifs_test_make_node(test, len, type, len);
+}
+
+/*
+ * Check that a node with a corrupted payload is reported as corrupt by the
+ * scanner and rejected by ubifs_check_node() with the given error code.
+ */
+static void expect_corrupt(struct kunit *test, void *node, int len, int err)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, len, TEST_LNUM,
+					       TEST_OFFS, 1, 1), err);
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, len, TEST_LNUM,
+						TEST_OFFS, 1),
+			SCANNED_A_CORRUPT_NODE);
+}
+
+/* ------------------------------------------------------------------------- */
+/* ubifs_scan_a_node(): the node path                                         */
+/* ------------------------------------------------------------------------- */
+
+static void scan_a_node_valid_data_node_returns_a_node(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1), 0);
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, TEST_DATA_SZ,
+						TEST_LNUM, TEST_OFFS, 1),
+			SCANNED_A_NODE);
+}
+
+static void scan_a_node_crc_covers_byte_8(struct kunit *test)
+{
+	void *node;
+
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	/* The first byte covered by the CRC is the first sqnum byte. */
+	((u8 *)node)[8] ^= 0xff;
+	expect_corrupt(test, node, TEST_DATA_SZ, -EUCLEAN);
+}
+
+static void scan_a_node_crc_covers_last_byte(struct kunit *test)
+{
+	void *node;
+
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	((u8 *)node)[TEST_DATA_SZ - 1] ^= 0xff;
+	expect_corrupt(test, node, TEST_DATA_SZ, -EUCLEAN);
+}
+
+static void scan_a_node_crc_field_not_covered_by_crc(struct kunit *test)
+{
+	struct ubifs_ch *ch;
+	void *node;
+
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	/* magic and crc themselves are outside the CRC coverage. */
+	ch = node;
+	ch->crc = cpu_to_le32(le32_to_cpu(ch->crc) ^ 1);
+	expect_corrupt(test, node, TEST_DATA_SZ, -EUCLEAN);
+}
+
+static void scan_a_node_crc_covers_whole_payload(struct kunit *test)
+{
+	void *node;
+
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	((u8 *)node)[UBIFS_CH_SZ] ^= 0xff;
+	expect_corrupt(test, node, TEST_DATA_SZ, -EUCLEAN);
+}
+
+static void scan_a_node_data_len_below_min_returns_corrupt(struct kunit *test)
+{
+	void *node;
+
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ - 1);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	expect_corrupt(test, node, TEST_DATA_SZ - 1, -EINVAL);
+}
+
+static void scan_a_node_data_len_at_min_returns_a_node(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, UBIFS_DATA_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, UBIFS_DATA_NODE_SZ,
+						TEST_LNUM, TEST_OFFS, 1),
+			SCANNED_A_NODE);
+}
+
+static void scan_a_node_data_len_at_max_returns_a_node(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, UBIFS_MAX_DATA_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node,
+						UBIFS_MAX_DATA_NODE_SZ,
+						TEST_LNUM, TEST_OFFS, 1),
+			SCANNED_A_NODE);
+}
+
+static void scan_a_node_data_len_above_max_returns_corrupt(struct kunit *test)
+{
+	void *node;
+
+	node = make_node(test, UBIFS_DATA_NODE, UBIFS_MAX_DATA_NODE_SZ + 1);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	expect_corrupt(test, node, UBIFS_MAX_DATA_NODE_SZ + 1, -EINVAL);
+}
+
+static void scan_a_node_crossing_leb_end_returns_corrupt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const int offs = UBIFS_TEST_LEB_SIZE - 40;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	/* offs + node_len == leb_size + 8, which is past the LEB end. */
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, offs, 1, 1),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, TEST_DATA_SZ,
+						TEST_LNUM, offs, 1),
+			SCANNED_A_CORRUPT_NODE);
+}
+
+static void scan_a_node_fixed_len_below_size_returns_corrupt(struct kunit *test)
+{
+	const int len = UBIFS_PAD_NODE_SZ - 1;
+	void *node;
+
+	node = make_node(test, UBIFS_PAD_NODE, len);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	expect_corrupt(test, node, len, -EINVAL);
+}
+
+static void scan_a_node_fixed_len_above_size_returns_corrupt(struct kunit *test)
+{
+	const int len = UBIFS_PAD_NODE_SZ + 1;
+	void *node;
+
+	node = make_node(test, UBIFS_PAD_NODE, len);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	expect_corrupt(test, node, len, -EINVAL);
+}
+
+static void scan_a_node_bad_type_returns_corrupt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_stats_info *stats;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	stats = kunit_kzalloc(test, sizeof(*stats), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, stats);
+	c->stats = stats;
+
+	node = make_node(test, UBIFS_NODE_TYPES_CNT, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, stats->node_errors, 1);
+
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, TEST_DATA_SZ,
+						TEST_LNUM, TEST_OFFS, 1),
+			SCANNED_A_CORRUPT_NODE);
+	KUNIT_EXPECT_EQ(test, stats->node_errors, 2);
+}
+
+static void scan_a_node_valid_trun_node_returns_a_node(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_TRUN_NODE, UBIFS_TRUN_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	/* Any valid node which is not a padding node is SCANNED_A_NODE. */
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, UBIFS_TRUN_NODE_SZ,
+						TEST_LNUM, TEST_OFFS, 1),
+			SCANNED_A_NODE);
+}
+
+/* ------------------------------------------------------------------------- */
+/* ubifs_scan_a_node(): padding and empty space                               */
+/* ------------------------------------------------------------------------- */
+
+static void expect_padding(struct kunit *test, int count, int len,
+			   int expected)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	u8 *buf;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	buf = kunit_kzalloc(test, 64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	memset(buf, UBIFS_PADDING_BYTE, count);
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, buf, len, TEST_LNUM,
+						TEST_OFFS, 1),
+			expected);
+}
+
+static void scan_a_node_padding_8_returns_8(struct kunit *test)
+{
+	expect_padding(test, 8, 64, 8);
+}
+
+static void scan_a_node_padding_16_returns_16(struct kunit *test)
+{
+	expect_padding(test, 16, 64, 16);
+}
+
+static void scan_a_node_padding_24_returns_24(struct kunit *test)
+{
+	expect_padding(test, 24, 64, 24);
+}
+
+static void scan_a_node_padding_short_count_returns_garbage(struct kunit *test)
+{
+	int i;
+
+	for (i = 1; i <= 7; i++)
+		expect_padding(test, i, 64, SCANNED_GARBAGE);
+}
+
+static void scan_a_node_padding_28_or_more_returns_garbage(struct kunit *test)
+{
+	expect_padding(test, 28, 64, SCANNED_GARBAGE);
+	expect_padding(test, 32, 64, SCANNED_GARBAGE);
+	expect_padding(test, 64, 64, SCANNED_GARBAGE);
+}
+
+static void scan_a_node_padding_limited_by_len(struct kunit *test)
+{
+	expect_padding(test, 32, 8, 8);
+	expect_padding(test, 32, 16, 16);
+	expect_padding(test, 32, 24, 24);
+	expect_padding(test, 32, 28, SCANNED_GARBAGE);
+	expect_padding(test, 32, 7, SCANNED_GARBAGE);
+	expect_padding(test, 32, 4, SCANNED_GARBAGE);
+}
+
+static void
+scan_a_node_bad_magic_without_padding_returns_garbage(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	u8 *buf;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	buf = kunit_kzalloc(test, 64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	/* A zeroed buffer has magic 0 and starts with a non-padding byte. */
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, buf, 64, TEST_LNUM,
+						TEST_OFFS, 1),
+			SCANNED_GARBAGE);
+
+	/*
+	 * The padding count starts at byte 0, so a bogus magic followed by
+	 * padding bytes is still reported as garbage.
+	 */
+	*(__le32 *)buf = cpu_to_le32(0xDEADBEEF);
+	memset(buf + 4, UBIFS_PADDING_BYTE, 8);
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, buf, 64, TEST_LNUM,
+						TEST_OFFS, 1),
+			SCANNED_GARBAGE);
+}
+
+static void scan_a_node_empty_space_returns_empty(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	u8 *buf;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	buf = kunit_kzalloc(test, 64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+	memset(buf, 0xff, 64);
+
+	/* Empty space is detected before the header length is checked. */
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, buf, 64, TEST_LNUM,
+						TEST_OFFS, 1),
+			SCANNED_EMPTY_SPACE);
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, buf, 4, TEST_LNUM,
+						TEST_OFFS, 1),
+			SCANNED_EMPTY_SPACE);
+}
+
+static void scan_a_node_short_header_returns_garbage(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	/* A valid magic but fewer than UBIFS_CH_SZ readable bytes. */
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, UBIFS_CH_SZ - 1,
+						TEST_LNUM, TEST_OFFS, 1),
+			SCANNED_GARBAGE);
+}
+
+/* ------------------------------------------------------------------------- */
+/* ubifs_scan_a_node(): padding nodes                                         */
+/* ------------------------------------------------------------------------- */
+
+static void expect_pad(struct kunit *test, int pad_len, int offs, int expected)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_pad_node *pad;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	pad = ubifs_test_make_pad_node(test, pad_len);
+	KUNIT_ASSERT_NOT_NULL(test, pad);
+
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, pad, UBIFS_PAD_NODE_SZ,
+						TEST_LNUM, offs, 1),
+			expected);
+}
+
+static void
+scan_a_node_pad_len_beyond_leb_returns_bad_pad(struct kunit *test)
+{
+	expect_pad(test, UBIFS_TEST_LEB_SIZE, TEST_OFFS,
+		   SCANNED_A_BAD_PAD_NODE);
+}
+
+static void
+scan_a_node_pad_len_crossing_leb_end_returns_bad_pad(struct kunit *test)
+{
+	expect_pad(test, UBIFS_TEST_LEB_SIZE - UBIFS_PAD_NODE_SZ, 8,
+		   SCANNED_A_BAD_PAD_NODE);
+}
+
+static void scan_a_node_pad_len_negative_returns_bad_pad(struct kunit *test)
+{
+	expect_pad(test, -1, TEST_OFFS, SCANNED_A_BAD_PAD_NODE);
+}
+
+static void
+scan_a_node_pad_len_not_aligned_returns_bad_pad(struct kunit *test)
+{
+	static const int pad_lens[] = { 0, 1, 5, 7 };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pad_lens); i++)
+		expect_pad(test, pad_lens[i], TEST_OFFS,
+			   SCANNED_A_BAD_PAD_NODE);
+}
+
+static void scan_a_node_valid_pad_returns_skip_len(struct kunit *test)
+{
+	static const int pad_lens[] = { 4, 12, 20 };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pad_lens); i++)
+		expect_pad(test, pad_lens[i], TEST_OFFS,
+			   UBIFS_PAD_NODE_SZ + pad_lens[i]);
+}
+
+static void scan_a_node_pad_len_reaching_leb_end_is_ok(struct kunit *test)
+{
+	/* offs + node_len + pad_len == leb_size is still a valid pad node. */
+	expect_pad(test, UBIFS_TEST_LEB_SIZE - UBIFS_PAD_NODE_SZ, TEST_OFFS,
+		   UBIFS_TEST_LEB_SIZE);
+}
+
+static void
+scan_a_node_corrupt_node_quiet_off_returns_corrupt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_ch *ch;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	ch = node;
+	ch->crc = cpu_to_le32(le32_to_cpu(ch->crc) ^ 1);
+
+	/* quiet = 0 only enables the error messages and ubifs_dump_node(). */
+	KUNIT_EXPECT_EQ(test, ubifs_scan_a_node(c, node, TEST_DATA_SZ,
+						TEST_LNUM, TEST_OFFS, 0),
+			SCANNED_A_CORRUPT_NODE);
+}
+
+/* ------------------------------------------------------------------------- */
+/* ubifs_check_node()                                                         */
+/* ------------------------------------------------------------------------- */
+
+static void check_node_valid_data_node_returns_zero(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1), 0);
+}
+
+static void check_node_does_not_validate_len_argument(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	/* The CRC is read according to ch->len, len is only used for dumps. */
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, UBIFS_CH_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1), 0);
+}
+
+static void check_node_bad_magic_returns_euclean(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_ch *ch;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	ch = node;
+	ch->magic = cpu_to_le32(0xDEADBEEF);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EUCLEAN);
+}
+
+static void check_node_bad_type_returns_einval(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_NODE_TYPES_CNT, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EINVAL);
+}
+
+static void check_node_data_len_below_min_returns_einval(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ - 1);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ - 1,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EINVAL);
+}
+
+static void check_node_data_len_at_min_returns_zero(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, UBIFS_DATA_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, UBIFS_DATA_NODE_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1), 0);
+}
+
+static void check_node_data_len_at_max_returns_zero(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, UBIFS_MAX_DATA_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, UBIFS_MAX_DATA_NODE_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1), 0);
+}
+
+static void check_node_data_len_above_max_returns_einval(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, UBIFS_MAX_DATA_NODE_SZ + 1);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node,
+					       UBIFS_MAX_DATA_NODE_SZ + 1,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EINVAL);
+}
+
+static void
+check_node_data_crc_skipped_with_no_chk_data_crc(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	((u8 *)node)[TEST_DATA_SZ - 1] ^= 0xff;
+
+	c->no_chk_data_crc = 1;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 0), 0);
+}
+
+static void check_node_data_crc_checked_while_mounting(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	((u8 *)node)[TEST_DATA_SZ - 1] ^= 0xff;
+
+	c->no_chk_data_crc = 1;
+	c->mounting = 1;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 0),
+			-EUCLEAN);
+}
+
+static void
+check_node_data_crc_checked_while_remounting_rw(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	((u8 *)node)[TEST_DATA_SZ - 1] ^= 0xff;
+
+	c->no_chk_data_crc = 1;
+	c->remounting_rw = 1;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 0),
+			-EUCLEAN);
+}
+
+static void
+check_node_data_crc_checked_with_must_chk_crc(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	((u8 *)node)[TEST_DATA_SZ - 1] ^= 0xff;
+
+	c->no_chk_data_crc = 1;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EUCLEAN);
+}
+
+static void check_node_non_data_crc_is_never_skipped(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_pad_node *pad;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	pad = ubifs_test_make_pad_node(test, 4);
+	KUNIT_ASSERT_NOT_NULL(test, pad);
+	pad->ch.crc = cpu_to_le32(le32_to_cpu(pad->ch.crc) ^ 1);
+
+	c->no_chk_data_crc = 1;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, pad, UBIFS_PAD_NODE_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 0),
+			-EUCLEAN);
+}
+
+static void check_node_updates_stats_counters(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_stats_info *stats;
+	struct ubifs_ch *ch;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	stats = kunit_kzalloc(test, sizeof(*stats), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, stats);
+	c->stats = stats;
+
+	/* A wrong magic number. */
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	ch = node;
+	ch->magic = 0;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EUCLEAN);
+	KUNIT_EXPECT_EQ(test, stats->magic_errors, 1);
+
+	/* An unknown node type. */
+	node = make_node(test, UBIFS_NODE_TYPES_CNT, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, stats->node_errors, 1);
+
+	/* A wrong CRC. */
+	node = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	((u8 *)node)[TEST_DATA_SZ - 1] ^= 0xff;
+	KUNIT_EXPECT_EQ(test, ubifs_check_node(c, node, TEST_DATA_SZ,
+					       TEST_LNUM, TEST_OFFS, 1, 1),
+			-EUCLEAN);
+	KUNIT_EXPECT_EQ(test, stats->crc_errors, 1);
+}
+
+/* ------------------------------------------------------------------------- */
+/* ubifs_add_snod()                                                           */
+/* ------------------------------------------------------------------------- */
+
+static void free_scanned_nodes(struct ubifs_scan_leb *sleb)
+{
+	struct ubifs_scan_node *node, *tmp;
+
+	list_for_each_entry_safe(node, tmp, &sleb->nodes, list) {
+		list_del(&node->list);
+		kfree(node);
+	}
+}
+
+static void expect_snod_keyed(struct kunit *test, u8 type, int len)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	const u32 inum = 0x11223344;
+	const u32 val = 0x55667788;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+	node = ubifs_test_make_node(test, len, type, len);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	ubifs_test_node_set_key(node, inum, val);
+
+	/*
+	 * The node has to be linked before the list is dereferenced below;
+	 * on -ENOMEM ubifs_add_snod() leaves sleb->nodes empty.
+	 */
+	KUNIT_ASSERT_EQ(test, ubifs_add_snod(c, sleb, node, 0x40), 0);
+	KUNIT_EXPECT_EQ(test, sleb->nodes_cnt, 1);
+	KUNIT_ASSERT_FALSE(test, list_empty(&sleb->nodes));
+
+	snod = list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
+	KUNIT_EXPECT_EQ(test, snod->type, type);
+	KUNIT_EXPECT_EQ(test, snod->offs, 0x40);
+	KUNIT_EXPECT_EQ(test, snod->len, len);
+	KUNIT_EXPECT_EQ(test, snod->sqnum, UBIFS_TEST_SQNUM);
+	KUNIT_EXPECT_EQ(test, snod->key.u32[0], inum);
+	KUNIT_EXPECT_EQ(test, snod->key.u32[1], val);
+
+	free_scanned_nodes(sleb);
+}
+
+static void add_snod_extracts_key_from_ino_node(struct kunit *test)
+{
+	expect_snod_keyed(test, UBIFS_INO_NODE, UBIFS_INO_NODE_SZ);
+}
+
+static void add_snod_extracts_key_from_dent_node(struct kunit *test)
+{
+	expect_snod_keyed(test, UBIFS_DENT_NODE, UBIFS_DENT_NODE_SZ);
+}
+
+static void add_snod_extracts_key_from_xent_node(struct kunit *test)
+{
+	expect_snod_keyed(test, UBIFS_XENT_NODE, UBIFS_XENT_NODE_SZ);
+}
+
+static void add_snod_extracts_key_from_data_node(struct kunit *test)
+{
+	expect_snod_keyed(test, UBIFS_DATA_NODE, UBIFS_DATA_NODE_SZ);
+}
+
+static void add_snod_pad_node_gets_invalid_key(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	struct ubifs_pad_node *pad;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+	pad = ubifs_test_make_pad_node(test, 4);
+	KUNIT_ASSERT_NOT_NULL(test, pad);
+
+	KUNIT_ASSERT_EQ(test, ubifs_add_snod(c, sleb, pad, 0x40), 0);
+	KUNIT_EXPECT_EQ(test, sleb->nodes_cnt, 1);
+
+	snod = list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
+	KUNIT_EXPECT_EQ(test, snod->type, UBIFS_PAD_NODE);
+	KUNIT_EXPECT_EQ(test, snod->key.u32[0], 0xDEADBEAF);
+	KUNIT_EXPECT_EQ(test, snod->key.u32[1], UBIFS_INVALID_KEY);
+
+	free_scanned_nodes(sleb);
+}
+
+static void add_snod_trun_node_gets_invalid_key(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	void *node;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+	node = make_node(test, UBIFS_TRUN_NODE, UBIFS_TRUN_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+
+	KUNIT_ASSERT_EQ(test, ubifs_add_snod(c, sleb, node, 0), 0);
+
+	snod = list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
+	KUNIT_EXPECT_EQ(test, snod->type, UBIFS_TRUN_NODE);
+	KUNIT_EXPECT_EQ(test, snod->key.u32[0], 0xDEADBEAF);
+	KUNIT_EXPECT_EQ(test, snod->key.u32[1], UBIFS_INVALID_KEY);
+
+	free_scanned_nodes(sleb);
+}
+
+static void add_snod_appends_nodes_in_order(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *first, *second;
+	void *node1, *node2;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+	node1 = make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node1);
+	node2 = make_node(test, UBIFS_INO_NODE, UBIFS_INO_NODE_SZ);
+	KUNIT_ASSERT_NOT_NULL(test, node2);
+
+	KUNIT_ASSERT_EQ(test, ubifs_add_snod(c, sleb, node1, 0), 0);
+	KUNIT_ASSERT_EQ(test, ubifs_add_snod(c, sleb, node2, 64), 0);
+	/*
+	 * list_next_entry() below walks past the first entry, so both nodes
+	 * must have been linked before the list is dereferenced.
+	 */
+	KUNIT_ASSERT_EQ(test, sleb->nodes_cnt, 2);
+
+	first = list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
+	second = list_next_entry(first, list);
+	KUNIT_EXPECT_PTR_EQ(test, first->node, node1);
+	KUNIT_EXPECT_PTR_EQ(test, second->node, node2);
+	KUNIT_EXPECT_EQ(test, first->offs, 0);
+	KUNIT_EXPECT_EQ(test, second->offs, 64);
+
+	free_scanned_nodes(sleb);
+}
+
+/* ------------------------------------------------------------------------- */
+/* ubifs_end_scan()                                                           */
+/* ------------------------------------------------------------------------- */
+
+static void end_scan_aligned_offset_sets_endpt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+
+	ubifs_end_scan(c, sleb, TEST_LNUM, 16);
+	KUNIT_EXPECT_EQ(test, sleb->endpt, 16);
+}
+
+static void end_scan_zero_offset_sets_endpt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+
+	ubifs_end_scan(c, sleb, TEST_LNUM, 0);
+	KUNIT_EXPECT_EQ(test, sleb->endpt, 0);
+}
+
+static void
+end_scan_unaligned_offset_is_reported_but_aligns(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct ubifs_scan_leb *sleb;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	sleb = ubifs_test_scan_leb(test);
+	KUNIT_ASSERT_NOT_NULL(test, sleb);
+
+	/*
+	 * This trips ubifs_assert(); with the zeroed assert_action the failure
+	 * is only reported (and a stack trace dumped).
+	 */
+	ubifs_end_scan(c, sleb, TEST_LNUM, 12);
+	KUNIT_EXPECT_EQ(test, sleb->endpt, 16);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Test suite registration                                                    */
+/* ------------------------------------------------------------------------- */
+
+static struct kunit_case ubifs_scan_test_cases[] = {
+	KUNIT_CASE(scan_a_node_valid_data_node_returns_a_node),
+	KUNIT_CASE(scan_a_node_crc_covers_byte_8),
+	KUNIT_CASE(scan_a_node_crc_covers_last_byte),
+	KUNIT_CASE(scan_a_node_crc_field_not_covered_by_crc),
+	KUNIT_CASE(scan_a_node_crc_covers_whole_payload),
+	KUNIT_CASE(scan_a_node_data_len_below_min_returns_corrupt),
+	KUNIT_CASE(scan_a_node_data_len_at_min_returns_a_node),
+	KUNIT_CASE(scan_a_node_data_len_at_max_returns_a_node),
+	KUNIT_CASE(scan_a_node_data_len_above_max_returns_corrupt),
+	KUNIT_CASE(scan_a_node_crossing_leb_end_returns_corrupt),
+	KUNIT_CASE(scan_a_node_fixed_len_below_size_returns_corrupt),
+	KUNIT_CASE(scan_a_node_fixed_len_above_size_returns_corrupt),
+	KUNIT_CASE(scan_a_node_bad_type_returns_corrupt),
+	KUNIT_CASE(scan_a_node_valid_trun_node_returns_a_node),
+	KUNIT_CASE(scan_a_node_padding_8_returns_8),
+	KUNIT_CASE(scan_a_node_padding_16_returns_16),
+	KUNIT_CASE(scan_a_node_padding_24_returns_24),
+	KUNIT_CASE(scan_a_node_padding_short_count_returns_garbage),
+	KUNIT_CASE(scan_a_node_padding_28_or_more_returns_garbage),
+	KUNIT_CASE(scan_a_node_padding_limited_by_len),
+	KUNIT_CASE(scan_a_node_bad_magic_without_padding_returns_garbage),
+	KUNIT_CASE(scan_a_node_empty_space_returns_empty),
+	KUNIT_CASE(scan_a_node_short_header_returns_garbage),
+	KUNIT_CASE(scan_a_node_pad_len_beyond_leb_returns_bad_pad),
+	KUNIT_CASE(scan_a_node_pad_len_crossing_leb_end_returns_bad_pad),
+	KUNIT_CASE(scan_a_node_pad_len_negative_returns_bad_pad),
+	KUNIT_CASE(scan_a_node_pad_len_not_aligned_returns_bad_pad),
+	KUNIT_CASE(scan_a_node_valid_pad_returns_skip_len),
+	KUNIT_CASE(scan_a_node_pad_len_reaching_leb_end_is_ok),
+	KUNIT_CASE(scan_a_node_corrupt_node_quiet_off_returns_corrupt),
+	{}
+};
+
+static struct kunit_case ubifs_check_node_test_cases[] = {
+	KUNIT_CASE(check_node_valid_data_node_returns_zero),
+	KUNIT_CASE(check_node_does_not_validate_len_argument),
+	KUNIT_CASE(check_node_bad_magic_returns_euclean),
+	KUNIT_CASE(check_node_bad_type_returns_einval),
+	KUNIT_CASE(check_node_data_len_below_min_returns_einval),
+	KUNIT_CASE(check_node_data_len_at_min_returns_zero),
+	KUNIT_CASE(check_node_data_len_at_max_returns_zero),
+	KUNIT_CASE(check_node_data_len_above_max_returns_einval),
+	KUNIT_CASE(check_node_data_crc_skipped_with_no_chk_data_crc),
+	KUNIT_CASE(check_node_data_crc_checked_while_mounting),
+	KUNIT_CASE(check_node_data_crc_checked_while_remounting_rw),
+	KUNIT_CASE(check_node_data_crc_checked_with_must_chk_crc),
+	KUNIT_CASE(check_node_non_data_crc_is_never_skipped),
+	KUNIT_CASE(check_node_updates_stats_counters),
+	{}
+};
+
+static struct kunit_case ubifs_add_snod_test_cases[] = {
+	KUNIT_CASE(add_snod_extracts_key_from_ino_node),
+	KUNIT_CASE(add_snod_extracts_key_from_dent_node),
+	KUNIT_CASE(add_snod_extracts_key_from_xent_node),
+	KUNIT_CASE(add_snod_extracts_key_from_data_node),
+	KUNIT_CASE(add_snod_pad_node_gets_invalid_key),
+	KUNIT_CASE(add_snod_trun_node_gets_invalid_key),
+	KUNIT_CASE(add_snod_appends_nodes_in_order),
+	{}
+};
+
+static struct kunit_case ubifs_end_scan_test_cases[] = {
+	KUNIT_CASE(end_scan_aligned_offset_sets_endpt),
+	KUNIT_CASE(end_scan_zero_offset_sets_endpt),
+	KUNIT_CASE(end_scan_unaligned_offset_is_reported_but_aligns),
+	{}
+};
+
+static struct kunit_suite ubifs_scan_test_suite = {
+	.name = "ubifs-scan",
+	.test_cases = ubifs_scan_test_cases,
+};
+
+static struct kunit_suite ubifs_check_node_test_suite = {
+	.name = "ubifs-check-node",
+	.test_cases = ubifs_check_node_test_cases,
+};
+
+static struct kunit_suite ubifs_add_snod_test_suite = {
+	.name = "ubifs-add-snod",
+	.test_cases = ubifs_add_snod_test_cases,
+};
+
+static struct kunit_suite ubifs_end_scan_test_suite = {
+	.name = "ubifs-end-scan",
+	.test_cases = ubifs_end_scan_test_cases,
+};
+
+kunit_test_suites(&ubifs_scan_test_suite, &ubifs_check_node_test_suite,
+		  &ubifs_add_snod_test_suite, &ubifs_end_scan_test_suite);
-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
