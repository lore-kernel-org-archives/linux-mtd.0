Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0422C88E42
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hX3bRQHoNCzhOBnbR0+KZHaYB3G0NxjhxISeG/hmqeI=; b=okzfD0wXVcHAeX
	ynyOuK7BDA02Wyvc04M55LBv2ZQ2WUy2Pfj1F+I7RaTDSJpIBpiopwLCIESY3n+mlXUx2JyjBQabV
	tyqfp9fN5EkWzIpW+VvkoJB7kY3fkxoMcZucDD19XEM1X/OaEHEa+ueoTBNYjZ3lC7iDZzGkdwJxF
	PTU9sNc8Ty+qVlHFUB1hBpy3nF0xjq5x+Dp9RawHTyf4Xfr30GYFKtTR4TZyRMUdql5S49Q0BuUPp
	2w2gIV3rashA2L7mRXUdo+wY4fgIhu1LUciBMMrRWKAUCVFZLDLnCe9waX/VfUfSSqAYsHMLM8RQl
	1YDD+Y+aXpwTQGw7hqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sz0-0000000FoqB-3GRj;
	Fri, 11 Sep 2026 04:35:26 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4syu-0000000FopZ-3ZGN
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 04:35:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38759bcd877so560509a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 21:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789101320; x=1789706120; darn=lists.infradead.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9cA0DR2ZY2xB13Au7WRv7yOzSeiiqKeGVX9UZNYUmM=;
        b=Lih9KYUvbIWj/YwQjJd2pLWCxD1FYtjdlt1acbnpZFDTquroEvVkfQJlCGtOXgrW4o
         +5a38v69L0rUaqmhEUJn5XN+u8eDDB27c6MUGr0PJniNeKjrpfCCiN3EVn5dCiz9qqs0
         YdJ34lGntRm95j+s1axS259oIpFHXU+qDtBeygAg0iFLzSC6hgCyPMfqcstyeDwHlTac
         9BI8PRIZe41JJa+Q3ZqUJO0EWpJWTjTveaG9OdfGLBKFvnaIZGkgmEdc/NJYpWg1hZr1
         YjVmxDySzyGAp0OTZNZRonlv5cawyusUyfOPXDRcuEaPp+e43zmjtx/HWzWeqqY6FIWO
         ZZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789101320; x=1789706120;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9cA0DR2ZY2xB13Au7WRv7yOzSeiiqKeGVX9UZNYUmM=;
        b=lHuLePuS+6drLiGXaUS3X831UKDitllXf0rEF074Fp8Kh0pHGBp0c4mE75xy8AuoE4
         e8X0DjAiId9NFNR6USQz/JLwgPDGvAAjQ9CqefXQCdOFuFlUeb8lvKa0bZ2PVSEoX/qg
         uAwmKiOMOFSOI9SbxdSpm0yFoyEk2rSApMwNloyj54Hfe078qofse1BBOCpKDVchBxLx
         nTWay862bW9K2W0yX4K7yK4JQkD/Z6RE26fpOsQlgUpaFpwvdbU7XKGNqUErGpsgUGH5
         ZGAgTRLjLqMAY9+TeDi0c+RcNVe0TGWzgw/00I+/G1gihnFUY2OiLlqzgAohC5Nk57d8
         2Vwg==
X-Forwarded-Encrypted: i=1; AKwUvByQM4gqV27nnW0CurcBxCqlunrO7Jck5I0vCKC6UYKu7g3UN7UZf1PsY74H+VWdKA2yZRjeOCN879o=@lists.infradead.org
X-Gm-Message-State: AFuF++krkPbqZmVQAqYR+7YbApkTCW8JZfU1hF0+rAaRepyzzlSU6MME
	xjqREQqPE0iiS0noQURQjHKGkBHDzRTiurUxgpCcnRUDHQbk76fhcWxb
X-Gm-Gg: AYBFou0PL6nzf6/LO6NJKJL0zjaNq3M9WUjjMW60e4j01rxkVnouSFl3msJwDXWpWiK
	L4TvnMKROXw8fsmi+NatLLVZDjx7R3SN+Wan2jVV0qQgT/jMNHzCKVTau+51I0IMGhNE3njRXj1
	Hbl+RGtPs9X5jlyjlzKCd767jqr472k/6MUO+1c+McptX81+l/6heUcEiMqFgk0lDAoAge8+DOp
	I1OzkVFRugKTCQJmvm9R0702bcUa9hRmPQNmjwRBxcf6h7DQ/6JldUKxWmqdleGGawau6cHZBOW
	8BTig45irStEj7nWkyWKQZZmmRO37uRQecfxrzBwzwZ709qkW3vBRFsvHwfycjiJvPmQKPaY81s
	h7Cl4B9+oK6JHIapzVirNsFxVE48Aa0eMAqEehJ/7dRfkZB3KiIZT2fIjBgUxpXJOywDEKzMDgB
	h3JJgPBUolzM8VJq8NEp6dnXzYLhH9aTl2diLv2MT8IR4+eiLzRrLofQ==
X-Received: by 2002:a17:90b:52c6:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39d9c34c55bmr3875419a91.22.1789101317574;
        Thu, 10 Sep 2026 21:35:17 -0700 (PDT)
Received: from smtp.gmail.com ([2401:b60:16:d3::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm2729358eec.25.2026.09.10.21.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:35:17 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Fri, 11 Sep 2026 11:09:39 +0800
Subject: [PATCH v2 0/2] ubifs: add KUnit tests for scan and key helpers
Message-Id: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_213520_900268_6E2C135D 
X-CRM114-Status: GOOD (  23.86  )
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

This series adds KUnit tests for fs/ubifs/scan.c and for the helpers in
fs/ubifs/key.h, so that the node parsing code can be validated offline
without an MTD device, a UBI volume or a development board.

Changes in v2:
 - Use KUNIT_ASSERT_EQ() instead of KUNIT_EXPECT_EQ() for the
   ubifs_add_snod() return value checks.  On -ENOMEM the function leaves
   sleb->nodes empty, and list_first_entry()/list_next_entry() on an empty
   list yield a pointer before the sleb allocation, so continuing after a
   failed add would read out of bounds.  This affects expect_snod_keyed(),
   add_snod_pad_node_gets_invalid_key(), add_snod_trun_node_gets_invalid_key()
   and add_snod_appends_nodes_in_order().
 - Assert on sleb->nodes_cnt in add_snod_appends_nodes_in_order() as well,
   because the following list_next_entry() is only safe when both nodes were
   really linked.
 - Value checks that cannot be followed by a crash keep using KUNIT_EXPECT_*()
   so that a single run still reports every mismatch.
 - Link to v1: https://lore.kernel.org/all/178909365090.247910.11265261850560199708.p0-of-2@gmail.com/

Baseline:

  commit df2908090cda368b01ff43709f51890076c56157 ("Linux 7.3-rc2")
  git describe --always of that commit: v7.3-rc2
  (the describe string is that of the base commit itself; the patch
  commits sit on top of it, so a describe run at their tip reports
  v7.3-rc2-2-g3bcc6fa04 instead)

Motivation:

UBIFS has no test coverage for its on-flash parsing code: checking a
change to scan.c or key.h currently means bringing up a real NAND
device, a UBI volume and a board. KUnit makes the same checks run in a
plain QEMU boot within seconds, and it is the established in-tree
framework for this kind of unit testing, so the tests are reusable by
anyone touching this code.

Approach:

 - The tests are compiled into the ubifs module itself (ubifs-y) so
   that they can call the non-exported ubifs_scan_a_node(),
   ubifs_check_node(), ubifs_add_snod() and ubifs_end_scan() directly.
   No EXPORT_SYMBOL() is added to production code.
 - kunit_helpers.h builds a minimal fake struct ubifs_info with
   kunit_kzalloc(); only the fields read by the tested paths are
   initialised. The node length ranges mirror init_constants_early()
   in super.c, because a zeroed range means "fixed length" for
   ubifs_check_node() and would make the length checks pass for the
   wrong reason.
 - The node constructor fills the common header and payload first and
   computes the CRC last with the kernel crc32(), over exactly the
   bytes that ubifs_check_node() checksums.

Testing:

The whole suite runs with a single command:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 --timeout=300 'ubifs*'

kunit.py exits 0 on the final tree and reports 5 suites and 80 cases,
all passing:

  Testing complete. Ran 80 tests: passed: 80

with zero "not ok" lines in the KTAP output.

The fake ubifs_info environment was additionally checked against the
real stack: a nandsim smoke test booted a kernel built from the
baseline over a complete MTD -> UBI -> UBIFS stack, attached mtd0,
created and mounted the volume and wrote and read back a file
successfully.

Known limitations:

 - ubifs_scan() and ubifs_start_scan() are not covered by KUnit: the
   UBI layer is not stubbed, so they would read from a real UBI volume
   through ubi_leb_read(). They are exercised by the nandsim smoke test
   instead.
 - The tests build nodes in memory, so they cannot catch bugs in the
   on-media layout itself; they only pin down the behaviour of the
   parsing code for the layouts that UBIFS currently writes.

Notes:

checkpatch.pl --strict reports 0 errors for both patches. Each patch
also carries the generic "added, moved or deleted file(s), does
MAINTAINERS need updating?" warning; that reminder is emitted for every
patch that adds a file, and the new files live under fs/ubifs/, which
is already covered by the "UBI FILE SYSTEM (UBIFS)" entry in
MAINTAINERS ("F: fs/ubifs/"), so no MAINTAINERS change is needed.

The cover letter itself draws one more warning from checkpatch.pl, a
"Prefer a maximum 75 chars per line (possible unwrapped commit
description?)" hint for a single line of the Changes in v2 list. That
line is left unwrapped so that the four affected test names stay on
one line and the list stays easy to scan; it is prose in the cover
letter, not code or a changelog entry that a tool will reformat.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>

lichen.wang (2):
  ubifs: add KUnit test scaffolding for scan.c
  ubifs: add KUnit tests for key helpers

 fs/ubifs/Kconfig               |  16 +
 fs/ubifs/Makefile              |   1 +
 fs/ubifs/tests/key_kunit.c     | 555 ++++++++++++++++++
 fs/ubifs/tests/kunit_helpers.h | 222 ++++++++
 fs/ubifs/tests/scan_kunit.c    | 988 +++++++++++++++++++++++++++++++++
 5 files changed, 1782 insertions(+)
 create mode 100644 fs/ubifs/tests/key_kunit.c
 create mode 100644 fs/ubifs/tests/kunit_helpers.h
 create mode 100644 fs/ubifs/tests/scan_kunit.c

--
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
