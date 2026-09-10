Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2EC88E42
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 04:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To:
	Message-Id:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usI2Y8W8zJsB7JFUrjRFyP3tvTCXDclv/7zPKF0ODVI=; b=zPH/i/z67Fnkj5
	W9Q2WNXj5Mwzi2XpoDeuGYa8qzHapDmIuf2/HVitUsX8hvmXs0zMXHLIEt3AtKPmnUerdiqPAmwpv
	QxZa1f8Fp90hLD4g/Q++V/lwEHUt0pNk7hI0kBm0pjLOXVyvEmjNO5mb2nUGldy31a1qF8xAGsevf
	5wOb1aKF82CUz9jTORl/e5jevl9zmarcxGwqbCDN8RqQ5cZSaUUrpATfI9pliui/31QQFlhxM/ruR
	SWDW5tRzLYAgdZuYtcYgC6SwsvHp7GQD7xI25uGC126jb5Ov+vvLnv2EShGXKe85I0MtOepvaq4Xh
	snP2UXlQ7pjPxw10x/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4szB-0000000FosV-164t;
	Fri, 11 Sep 2026 04:35:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sz4-0000000ForV-0A0D
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 04:35:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d91ded8174so4157375ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 21:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789101329; x=1789706129; darn=lists.infradead.org;
        h=cc:to:references:in-reply-to:message-id:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jrRmtzgJrhcnTyWN4ddzwpfMPQykj+K/5w8UnPOxI8g=;
        b=lFyS/0MVyuQlZ8UTbS8iklqH6o9jBTU9rb/mv4qiCTWHPpi+OXi5zOEx9idgzTG1T4
         H3CXHZHLl5zv2vdfL6W49PyveyV3GmvtKuCqx/1+pETLxNoBJz2nHjQ6zbidRI3+oIaz
         aThD19Nry1GnzpWfZaJwzcXAh6W0VZHvDq2Aqzd7tmDoc4+e5+s/gwWpsxcAEYUlhjt5
         UAya0G/Y537i8FuX9tWvX5lGGupZqVWabtyzhjSaGWtZ5QpcMH/pWSTte9OlPaXcAqPH
         jcBJ8LQY88zOTKk64CzUvQfu09TWRHtVu/AfRCStDT/eFozvgJjtpBmxz74S6ZJNZoen
         APOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789101329; x=1789706129;
        h=cc:to:references:in-reply-to:message-id:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrRmtzgJrhcnTyWN4ddzwpfMPQykj+K/5w8UnPOxI8g=;
        b=gmZRntagzJGh8jJPQpPLDHIyHUtlEoBV6+PyznCAEYziYqQ4bWGAa6hNa6YhXwcP5j
         kP/iD6cHx2uWoYthhcVob995SsJUuCYRjgIPP+Mlonz/7XDcr2+vvkMZa/E0kd3t6qof
         r/Ct3m5EedGXfvQBADi4f8lwv9xRZO28vayzijmXJl913TeVGXjvhVoKaGXLh1aWOIeR
         IiZd26sRGlcW4g3KAuhkftNVMPXZpduVN8FsNQhes9G7Sr/aK6uiWY5A2kvv9s2c9r2q
         a8eiP9McPrexMbMqT7wtD67AauMOa3KJnYMkvSHyYhq4NU0z0nvfl2UOIuaPODz3XXMk
         q8iA==
X-Forwarded-Encrypted: i=1; AKwUvByEFMQEBzYdqwG39GNIxamUR91AcB8TeIH1KU2qhRyCcn/NG+vMUnCcp+9UNk2fywQ/ftREPbgsiYg=@lists.infradead.org
X-Gm-Message-State: AFuF++k2vOIPUQk/xm8y2dx1OYJlXYFGkP0/M0Q4avPBWmInFAHQz9Mg
	5fIaRE3kFwMn0GEv4LUh1cA7WHDEXXN6wHnkN17kbbzwQxXle0nyjwuy
X-Gm-Gg: AYBFou2b3K7pu1UpQut+6t7vh2tx3PJHF11Q0x2fzC7L8fecUmCMGhO1IzpxvtVCZM4
	CFRU2/mvlzWWHGRNevLC/aOmuCXpLaBky+xNTjzAMZ3d8S1xTS96biKfZ07OFYyjvIeWAwAz4OI
	DKPE+Dcq8YrI6M9AnB1I0fBtWd2IM0Tw3VSuhFISEfY7E4hzxmh6jM8wMFw8w5Bp10iECjY/TSX
	jQD4WoR8JabDRrDDNpR9DqlwPsEGT3IVvbYHcBvO9yh+gDUC/V3NCmww6oXFcW2O2Iu1GmR/TI7
	en0mRDAll5mGvSax6BjTnegU9dWSxlrBRo/n2/mUA1zxwg2BI/M8glEgr9HEh+ZfjX/IVMlVWc/
	aa779vqjOBAAewBbgMBxHX8oGwcOpyt7bg8D2moMZXU0kMSS7Mjf23PSVD3bABak93YBJK7umyA
	UYSKuTkzxWd/zlw6rQUQK1OT22umXfkn/t4/8N8xaIAx8vJTlj1hwsaA==
X-Received: by 2002:a17:902:e88e:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2dd2a1c3dc4mr50596885ad.4.1789101328993;
        Thu, 10 Sep 2026 21:35:28 -0700 (PDT)
Received: from smtp.gmail.com ([2401:b60:16:d3::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm2729358eec.25.2026.09.10.21.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:35:28 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Thu, 10 Sep 2026 22:10:55 +0800
Subject: [PATCH v2 2/2] ubifs: add KUnit tests for key helpers
Message-Id: <178910129195.312459.7034570155359269266.p2-of-2@gmail.com>
In-Reply-To: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
References: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_213534_607270_58DEEFE8 
X-CRM114-Status: GOOD (  20.59  )
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

Add KUnit coverage for the key.h helpers: on-flash encoding and
decoding, comparison, the key constructors and the hash handling. These
are pure functions, so the whole set runs in the same offline KUnit
environment as the scan tests.

The tests reuse the fake struct ubifs_info from kunit_helpers.h, and
key_kunit.o is built into the ubifs module for the same reason as
scan_kunit.o: key.h needs no exported symbols, but the suite is kept
next to the code it tests.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>
---
 fs/ubifs/Makefile          |   2 +-
 fs/ubifs/tests/key_kunit.c | 555 +++++++++++++++++++++++++++++++++++++
 2 files changed, 556 insertions(+), 1 deletion(-)
 create mode 100644 fs/ubifs/tests/key_kunit.c

diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 4a83b822c..96e277611 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -6,7 +6,7 @@ ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o debug.o
 ubifs-y += misc.o sysfs.o
-ubifs-$(CONFIG_UBIFS_FS_KUNIT_TEST) += tests/scan_kunit.o
+ubifs-$(CONFIG_UBIFS_FS_KUNIT_TEST) += tests/scan_kunit.o tests/key_kunit.o
 ubifs-$(CONFIG_FS_ENCRYPTION) += crypto.o
 ubifs-$(CONFIG_UBIFS_FS_XATTR) += xattr.o
 ubifs-$(CONFIG_UBIFS_FS_AUTHENTICATION) += auth.o
diff --git a/fs/ubifs/tests/key_kunit.c b/fs/ubifs/tests/key_kunit.c
new file mode 100644
index 000000000..71d4fba70
--- /dev/null
+++ b/fs/ubifs/tests/key_kunit.c
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for fs/ubifs/key.h
+ *
+ * The tested helpers are self-contained, so they only need a zeroed fake
+ * struct ubifs_info; the ones which call c->key_hash use the test hash
+ * function installed by ubifs_test_info().
+ */
+
+#include <kunit/test.h>
+
+#include "kunit_helpers.h"
+
+/*
+ * Check that @buf holds the little-endian on-flash form of the key word pair
+ * (@v0, @v1).
+ */
+static void expect_le_key(struct kunit *test, const void *buf, u32 v0, u32 v1)
+{
+	__le32 expected[2];
+
+	expected[0] = cpu_to_le32(v0);
+	expected[1] = cpu_to_le32(v1);
+	KUNIT_EXPECT_MEMEQ(test, buf, expected, sizeof(expected));
+}
+
+/* ------------------------------------------------------------------------- */
+/* key_write() / key_read() / key_write_idx()                                 */
+/* ------------------------------------------------------------------------- */
+
+static void key_write_encodes_key_and_zeroes_tail(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key = { .u32 = { 0x12345678, 0x89ABCDEF } };
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	u8 buf[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(buf, 0xaa, sizeof(buf));
+	key_write(c, &key, buf);
+
+	expect_le_key(test, buf, key.u32[0], key.u32[1]);
+	KUNIT_EXPECT_MEMEQ(test, buf + 8, zero, sizeof(zero));
+}
+
+static void key_write_stays_within_sixteen_bytes(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key = { .u32 = { 0xDEADBEEF, 0xCAFEBABE } };
+	const u8 zero[8] = { 0 };
+	u8 guard[8];
+	u8 buf[32];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(guard, 0xaa, sizeof(guard));
+	memset(buf, 0xaa, sizeof(buf));
+	key_write(c, &key, buf + 8);
+
+	/* Nothing before the 16-byte key and nothing after it is written. */
+	KUNIT_EXPECT_MEMEQ(test, buf, guard, sizeof(guard));
+	KUNIT_EXPECT_MEMEQ(test, buf + 24, guard, sizeof(guard));
+	expect_le_key(test, buf + 8, key.u32[0], key.u32[1]);
+	KUNIT_EXPECT_MEMEQ(test, buf + 16, zero, sizeof(zero));
+}
+
+static void key_read_reads_only_first_eight_bytes(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const u8 src[UBIFS_MAX_KEY_LEN] = {
+		0x78, 0x56, 0x34, 0x12, 0xef, 0xcd, 0xab, 0x89,
+		0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+	};
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	key_read(c, src, &key);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x12345678);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x89ABCDEF);
+}
+
+static void key_write_read_roundtrip(struct kunit *test)
+{
+	static const u32 keys[][2] = {
+		{ 0x00000000, 0x00000000 },
+		{ 0x00000001, 0x00000000 },
+		{ 0xffffffff, 0xffffffff },
+		{ 0x12345678, 0x9abcdef0 },
+		{ 0xdeadbeaf, UBIFS_INVALID_KEY },
+	};
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key in, out;
+	u8 buf[UBIFS_MAX_KEY_LEN];
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	for (i = 0; i < ARRAY_SIZE(keys); i++) {
+		in.u32[0] = keys[i][0];
+		in.u32[1] = keys[i][1];
+		key_write(c, &in, buf);
+		key_read(c, buf, &out);
+		KUNIT_EXPECT_EQ(test, out.u32[0], in.u32[0]);
+		KUNIT_EXPECT_EQ(test, out.u32[1], in.u32[1]);
+	}
+}
+
+static void key_write_idx_does_not_zero_tail(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key = { .u32 = { 0x01020304, 0x05060708 } };
+	const u8 zero[8] = { 0 };
+	const u8 guard[8] = { 0xaa, 0xaa, 0xaa, 0xaa,
+			      0xaa, 0xaa, 0xaa, 0xaa };
+	u8 idx[UBIFS_MAX_KEY_LEN];
+	u8 full[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(idx, 0xaa, sizeof(idx));
+	memset(full, 0xaa, sizeof(full));
+	key_write_idx(c, &key, idx);
+	key_write(c, &key, full);
+
+	expect_le_key(test, idx, key.u32[0], key.u32[1]);
+	KUNIT_EXPECT_MEMEQ(test, idx, full, 8);
+	KUNIT_EXPECT_MEMEQ(test, idx + 8, guard, sizeof(guard));
+	KUNIT_EXPECT_MEMEQ(test, full + 8, zero, sizeof(zero));
+}
+
+static void key_copy_copies_whole_key(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key from = { .u32 = { 0x11223344, 0x55667788 } };
+	union ubifs_key to;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	to.u64[0] = 0;
+	key_copy(c, &from, &to);
+	KUNIT_EXPECT_EQ(test, to.u32[0], from.u32[0]);
+	KUNIT_EXPECT_EQ(test, to.u32[1], from.u32[1]);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &from, &to), 1);
+}
+
+/* ------------------------------------------------------------------------- */
+/* keys_cmp() / keys_eq()                                                     */
+/* ------------------------------------------------------------------------- */
+
+static void keys_cmp_orders_by_inum_first(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key k1 = { .u32 = { 1, 0xffffffff } };
+	union ubifs_key k2 = { .u32 = { 2, 0x00000000 } };
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k1, &k2), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k2, &k1), 1);
+}
+
+static void keys_cmp_orders_by_second_word(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key k1 = { .u32 = { 7, 0x00000000 } };
+	union ubifs_key k2 = { .u32 = { 7, 0x00000001 } };
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k1, &k2), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k2, &k1), 1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k1, &k1), 0);
+}
+
+static void keys_cmp_and_keys_eq_agree(struct kunit *test)
+{
+	static const u32 pairs[][4] = {
+		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
+		{ 0x00000001, 0x00000000, 0x00000001, 0x00000001 },
+		{ 0x00000001, 0x00000001, 0x00000001, 0x00000000 },
+		{ 0xffffffff, 0x00000000, 0x00000000, 0xffffffff },
+		{ 0x00000005, 0x40000000, 0x00000005, 0x40000000 },
+	};
+	struct ubifs_info *c = ubifs_test_info(test);
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	for (i = 0; i < ARRAY_SIZE(pairs); i++) {
+		union ubifs_key a = { .u32 = { pairs[i][0], pairs[i][1] } };
+		union ubifs_key b = { .u32 = { pairs[i][2], pairs[i][3] } };
+		int cmp = keys_cmp(c, &a, &b);
+
+		KUNIT_EXPECT_EQ(test, cmp, -keys_cmp(c, &b, &a));
+		KUNIT_EXPECT_EQ(test, keys_eq(c, &a, &b), cmp == 0);
+	}
+}
+
+/* ------------------------------------------------------------------------- */
+/* Key constructors                                                           */
+/* ------------------------------------------------------------------------- */
+
+static void ino_key_init_sets_type_and_inum(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const ino_t inum = 0x12345678;
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	ino_key_init(c, &key, inum);
+	KUNIT_EXPECT_EQ(test, key.u32[0], inum);
+	KUNIT_EXPECT_EQ(test, key.u32[1], UBIFS_INO_KEY <<
+			UBIFS_S_KEY_BLOCK_BITS);
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_INO_KEY);
+	KUNIT_EXPECT_EQ(test, key_inum(c, &key), inum);
+	KUNIT_EXPECT_EQ(test, key_block(c, &key), 0);
+}
+
+static void ino_key_init_flash_zeroes_tail_and_roundtrips(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	const ino_t inum = 0x12345678;
+	union ubifs_key key, out;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(flash, 0xaa, sizeof(flash));
+	ino_key_init_flash(c, flash, inum);
+	KUNIT_EXPECT_MEMEQ(test, flash + 8, zero, sizeof(zero));
+
+	key_read(c, flash, &out);
+	ino_key_init(c, &key, inum);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &key, &out), 1);
+}
+
+static void dent_key_init_sets_type_and_hash(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	const u32 hash = 0x00000005;
+	union ubifs_key key;
+	u32 expected;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	expected = c->key_hash(fname_name(&nm), fname_len(&nm));
+	KUNIT_EXPECT_LE(test, expected, UBIFS_S_KEY_HASH_MASK);
+
+	dent_key_init(c, &key, 0x1234, &nm);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x1234);
+	KUNIT_EXPECT_EQ(test, key.u32[1], expected |
+			(UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS));
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_DENT_KEY);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), expected);
+
+	dent_key_init_hash(c, &key, 0x1234, hash);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x40000005);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), hash);
+}
+
+static void dent_key_init_flash_zeroes_tail_and_roundtrips(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	union ubifs_key key, out;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(flash, 0xaa, sizeof(flash));
+	dent_key_init_flash(c, flash, 0x20, &nm);
+	KUNIT_EXPECT_MEMEQ(test, flash + 8, zero, sizeof(zero));
+
+	key_read(c, flash, &out);
+	dent_key_init(c, &key, 0x20, &nm);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &key, &out), 1);
+	KUNIT_EXPECT_EQ(test, key_type(c, &out), UBIFS_DENT_KEY);
+}
+
+static void xent_key_init_sets_type_and_hash(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	union ubifs_key key;
+	u32 expected;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	expected = c->key_hash(fname_name(&nm), fname_len(&nm));
+	xent_key_init(c, &key, 0x1234, &nm);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x1234);
+	KUNIT_EXPECT_EQ(test, key.u32[1], expected |
+			(UBIFS_XENT_KEY << UBIFS_S_KEY_HASH_BITS));
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_XENT_KEY);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), expected);
+}
+
+static void xent_key_init_flash_zeroes_tail_and_roundtrips(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	union ubifs_key key, out;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(flash, 0xaa, sizeof(flash));
+	xent_key_init_flash(c, flash, 0x20, &nm);
+	KUNIT_EXPECT_MEMEQ(test, flash + 8, zero, sizeof(zero));
+
+	key_read(c, flash, &out);
+	xent_key_init(c, &key, 0x20, &nm);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &key, &out), 1);
+	KUNIT_EXPECT_EQ(test, key_type(c, &out), UBIFS_XENT_KEY);
+}
+
+static void data_key_init_sets_type_and_block(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	data_key_init(c, &key, 0x77, 0x12345);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x77);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x12345 |
+			(UBIFS_DATA_KEY << UBIFS_S_KEY_BLOCK_BITS));
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_DATA_KEY);
+	KUNIT_EXPECT_EQ(test, key_block(c, &key), 0x12345);
+}
+
+static void trun_key_init_sets_truncation_type(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	trun_key_init(c, &key, 0x77);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x77);
+	KUNIT_EXPECT_EQ(test, key.u32[1], UBIFS_TRUN_KEY <<
+			UBIFS_S_KEY_BLOCK_BITS);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x80000000);
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_TRUN_KEY);
+}
+
+static void invalid_key_init_sets_invalid_marker(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	invalid_key_init(c, &key);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0xDEADBEAF);
+	KUNIT_EXPECT_EQ(test, key.u32[1], UBIFS_INVALID_KEY);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x00000004);
+	/* UBIFS_INVALID_KEY is not shifted, unlike UBIFS_TRUN_KEY. */
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_INO_KEY);
+}
+
+static void lowest_and_highest_keys_are_bounds(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key lino, hino, ldent, lxent, hdata, dzero;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	lowest_ino_key(c, &lino, 1);
+	highest_ino_key(c, &hino, 1);
+	lowest_dent_key(c, &ldent, 1);
+	lowest_xent_key(c, &lxent, 1);
+	highest_data_key(c, &hdata, 1);
+	data_key_init(c, &dzero, 1, 0);
+
+	KUNIT_EXPECT_EQ(test, lino.u32[1], 0x00000000);
+	KUNIT_EXPECT_EQ(test, hino.u32[1], 0xffffffff);
+	KUNIT_EXPECT_EQ(test, ldent.u32[1], 0x40000000);
+	KUNIT_EXPECT_EQ(test, lxent.u32[1], 0x60000000);
+	KUNIT_EXPECT_EQ(test, hdata.u32[1], 0x3fffffff);
+
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &lino, &dzero), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &dzero, &hdata), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &hdata, &ldent), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &ldent, &lxent), -1);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Key accessors                                                              */
+/* ------------------------------------------------------------------------- */
+
+static void key_accessors_roundtrip(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	data_key_init(c, &key, 0x77, 0x12345);
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_DATA_KEY);
+	KUNIT_EXPECT_EQ(test, key_inum(c, &key), 0x77);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), 0x12345);
+	KUNIT_EXPECT_EQ(test, key_block(c, &key), 0x12345);
+
+	key_write(c, &key, flash);
+	KUNIT_EXPECT_EQ(test, key_type_flash(c, flash), UBIFS_DATA_KEY);
+	KUNIT_EXPECT_EQ(test, key_inum_flash(c, flash), 0x77);
+	KUNIT_EXPECT_EQ(test, key_hash_flash(c, flash), 0x12345);
+	KUNIT_EXPECT_EQ(test, key_block_flash(c, flash), 0x12345);
+}
+
+static void highest_ino_key_type_is_out_of_range(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	highest_ino_key(c, &key, 1);
+	/* 7 is the sorting upper bound, not a valid key type. */
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), 7);
+	KUNIT_EXPECT_GT(test, key_type(c, &key), UBIFS_KEY_TYPES_CNT - 1);
+}
+
+static void is_hash_key_identifies_hashed_keys(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	ino_key_init(c, &key, 1);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 0);
+	data_key_init(c, &key, 1, 0);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 0);
+	dent_key_init_hash(c, &key, 1, 3);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 1);
+	xent_key_init(c, &key, 1, &nm);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 1);
+	trun_key_init(c, &key, 1);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 0);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Hash helpers                                                               */
+/* ------------------------------------------------------------------------- */
+
+static void key_mask_hash_maps_reserved_values(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0), 3);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(1), 4);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(2), 5);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(3), 3);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0x1fffffff), 0x1fffffff);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0xffffffff), 0x1fffffff);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0x20000002), 5);
+}
+
+static void key_r5_hash_invariants(struct kunit *test)
+{
+	static const char *const names[] = { "", "a", "abc", "file", "name" };
+	int i;
+
+	/* An empty name hashes to the first non-reserved value. */
+	KUNIT_EXPECT_EQ(test, key_r5_hash("", 0), 3);
+
+	for (i = 0; i < ARRAY_SIZE(names); i++) {
+		const char *name = names[i];
+		int len = strlen(name);
+		u32 h = key_r5_hash(name, len);
+
+		KUNIT_EXPECT_GE(test, h, 3);
+		KUNIT_EXPECT_LE(test, h, UBIFS_S_KEY_HASH_MASK);
+		KUNIT_EXPECT_EQ(test, h, key_r5_hash(name, len));
+	}
+}
+
+static void key_test_hash_invariants(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, key_test_hash("", 0), 3);
+	KUNIT_EXPECT_GE(test, key_test_hash("abc", 3), 3);
+	KUNIT_EXPECT_LE(test, key_test_hash("abc", 3),
+			UBIFS_S_KEY_HASH_MASK);
+
+	/* Only the first four bytes of the name are read. */
+	KUNIT_EXPECT_EQ(test, key_test_hash("abcd", 100),
+			key_test_hash("abcd", 4));
+	KUNIT_EXPECT_EQ(test, key_test_hash("abcd", 100),
+			key_test_hash("abcd", 5));
+}
+
+static void key_max_inode_size_depends_on_key_fmt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, key_max_inode_size(c), 2199023255552ULL);
+	KUNIT_EXPECT_EQ(test, key_max_inode_size(c),
+			(1ULL << UBIFS_S_KEY_BLOCK_BITS) * UBIFS_BLOCK_SIZE);
+
+	/* An unknown key format has no size limit to report. */
+	c->key_fmt = 1;
+	KUNIT_EXPECT_EQ(test, key_max_inode_size(c), 0);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Test suite registration                                                    */
+/* ------------------------------------------------------------------------- */
+
+static struct kunit_case ubifs_key_test_cases[] = {
+	KUNIT_CASE(key_write_encodes_key_and_zeroes_tail),
+	KUNIT_CASE(key_write_stays_within_sixteen_bytes),
+	KUNIT_CASE(key_read_reads_only_first_eight_bytes),
+	KUNIT_CASE(key_write_read_roundtrip),
+	KUNIT_CASE(key_write_idx_does_not_zero_tail),
+	KUNIT_CASE(key_copy_copies_whole_key),
+	KUNIT_CASE(keys_cmp_orders_by_inum_first),
+	KUNIT_CASE(keys_cmp_orders_by_second_word),
+	KUNIT_CASE(keys_cmp_and_keys_eq_agree),
+	KUNIT_CASE(ino_key_init_sets_type_and_inum),
+	KUNIT_CASE(ino_key_init_flash_zeroes_tail_and_roundtrips),
+	KUNIT_CASE(dent_key_init_sets_type_and_hash),
+	KUNIT_CASE(dent_key_init_flash_zeroes_tail_and_roundtrips),
+	KUNIT_CASE(xent_key_init_sets_type_and_hash),
+	KUNIT_CASE(xent_key_init_flash_zeroes_tail_and_roundtrips),
+	KUNIT_CASE(data_key_init_sets_type_and_block),
+	KUNIT_CASE(trun_key_init_sets_truncation_type),
+	KUNIT_CASE(invalid_key_init_sets_invalid_marker),
+	KUNIT_CASE(lowest_and_highest_keys_are_bounds),
+	KUNIT_CASE(key_accessors_roundtrip),
+	KUNIT_CASE(highest_ino_key_type_is_out_of_range),
+	KUNIT_CASE(is_hash_key_identifies_hashed_keys),
+	KUNIT_CASE(key_mask_hash_maps_reserved_values),
+	KUNIT_CASE(key_r5_hash_invariants),
+	KUNIT_CASE(key_test_hash_invariants),
+	KUNIT_CASE(key_max_inode_size_depends_on_key_fmt),
+	{}
+};
+
+static struct kunit_suite ubifs_key_test_suite = {
+	.name = "ubifs-key",
+	.test_cases = ubifs_key_test_cases,
+};
+
+kunit_test_suite(ubifs_key_test_suite);
-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
