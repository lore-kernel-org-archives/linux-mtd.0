Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF4606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qVKcnCgO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mx5frlho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DyQrSV+dfEmLZLiPsy4NO2PPsUQylH6q5J/Lhr6Vy1A=; b=qVKcnCgOq4weIpMPYFSsgVNk9K
	rr0G35z+vwx76ColxW1zspgyBeQnPDoBmVjTRzW3hQ81eE4f8x2vljcW5AKxAN2VghkS/37BtkUrI
	CIVruE0ueAefQC4zgBrl5LFDo9I7EpXAXnzxfM0V6KMMtQ5lYgJqjFruLtdSG9bFgXsP27PIf4MkQ
	p0e+r8N8ZSEWNjG3hI45jMToSiyKlQrU5RkLZkQTwEvAkYhIZVFuwuFTKv4wdBSD7bJcwygdy3Wlc
	j9yIH9KX86o/ZJSR5QAl9Mr4eFNln0yv4NbS6y9z2hcczhoywa4r+YlDVuld86KyUQhKY/xZMfDTP
	7B8WEGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnnK-0000000BsLJ-43mG;
	Fri, 30 Oct 2026 14:41:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnnH-0000000BsKr-3AAK
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 14:41:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D2ECA1A13B4;
	Fri, 30 Oct 2026 14:41:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97F1F603C2;
	Fri, 30 Oct 2026 14:41:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 512B2103290DC;
	Fri, 30 Oct 2026 15:41:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793371278; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=B94Zz5t56mit3UdY+Y1+lMxMrkBUxUQdT6Ko6EBgvbQ=;
	b=Mx5frlho6sJIN+CC9IuY6d72xvB5h4QAdWW1E1iMZdSsleL68C1Mr37hDqIa2+MUdMeSJS
	YG4EXniqM4b6Tuw3OdyJ80IDKQMcHyF9RYmS13+Uo4xZrMEALi5QvOpvKyPAJCf02wdrTQ
	q42oV2Pas2PMZqGoLdHPurh0K0XPYrm3BLxiMQw3hOiRglDO3roB4K5VB4y9z7b41Yx9PB
	fAGhJUcQYmJIEieSHBFTe5vb1jUfW2+JqwceFfLbdT9HsX5zVshK7hpVXWkoWVeLNJa2zc
	TGYOz1h0XjCynfcnFFBS7ycitT55vFVtw+TVHdUkBZwxVprWkw19B/gSTYu7FA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils] tests: mtd-tests: add nandcontreadtest
Date: Fri, 30 Oct 2026 15:41:08 +0100
Message-ID: <20261030144108.2211604-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_074124_127554_BD71EC74 
X-CRM114-Status: GOOD (  30.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Continuous reads are enabled by both raw NAND and SPI NAND cores when a
read spans several pages within the same eraseblock. We discovered
experimentally that some controllers may not be able to keep the CS line
asserted for the whole operation (which has the side effect of stopping
continuous reads, therefore leading to 0xFF's being returned by the
chip). The biggest the read, the highest the likelihood of falling into
the trap. Also, so far Linux's policy has been to pause continuous reads
at block boundaries even though some devices might support it.

Add a dedicated test which writes pseudo-random data to a range of
physical eraseblocks and then performs a single read over the whole
area. The goal is to catch all following situations:
- Broken continuous read handlin in the core or the vendor drivers,
- SPI controller drivers without full control over their CS state.

The usual options (start peb, count, PRNG seed, keep, help) have been
kept. No argument/option implies:
- a 2-block read,
- from the firt good PEB.

Upon success, a message indicates the time spent in the read operation
and the equivalent throughput of the read. This value can then be
compared with the `flash_speed -C` output.

This tools has been designed by a human. The human then heavily used
copy pasting from the other tools and got an LLM to finish shaping it,
finding a few corner cases and trying to produce more informative
messages upon failure (in ordre to help for the development).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .gitignore                         |   1 +
 tests/mtd-tests/Makemodule.am      |   6 +-
 tests/mtd-tests/nandcontreadtest.c | 424 +++++++++++++++++++++++++++++
 3 files changed, 430 insertions(+), 1 deletion(-)
 create mode 100644 tests/mtd-tests/nandcontreadtest.c

diff --git a/.gitignore b/.gitignore
index 673536e93823..ae2193184e50 100644
--- a/.gitignore
+++ b/.gitignore
@@ -87,6 +87,7 @@ flash_stress
 flash_speed
 flash_readtest
 nandbiterrs
+nandcontreadtest
 nandflipbits
 nandpagetest
 nandsubpagetest
diff --git a/tests/mtd-tests/Makemodule.am b/tests/mtd-tests/Makemodule.am
index d02e9e486e99..dfa88465924c 100644
--- a/tests/mtd-tests/Makemodule.am
+++ b/tests/mtd-tests/Makemodule.am
@@ -25,10 +25,14 @@ nandpagetest_SOURCES = tests/mtd-tests/nandpagetest.c
 nandpagetest_LDADD = libmtd.a
 nandpagetest_CPPFLAGS = $(AM_CPPFLAGS)
 
+nandcontreadtest_SOURCES = tests/mtd-tests/nandcontreadtest.c
+nandcontreadtest_LDADD = libmtd.a
+nandcontreadtest_CPPFLAGS = $(AM_CPPFLAGS)
+
 nandsubpagetest_SOURCES = tests/mtd-tests/nandsubpagetest.c
 nandsubpagetest_LDADD = libmtd.a
 nandsubpagetest_CPPFLAGS = $(AM_CPPFLAGS)
 
 test_PROGRAMS += \
 	flash_torture flash_stress flash_speed nandbiterrs flash_readtest \
-	nandpagetest nandsubpagetest
+	nandpagetest nandcontreadtest nandsubpagetest
diff --git a/tests/mtd-tests/nandcontreadtest.c b/tests/mtd-tests/nandcontreadtest.c
new file mode 100644
index 000000000000..e53be19fb55e
--- /dev/null
+++ b/tests/mtd-tests/nandcontreadtest.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Bootlin
+ *
+ * Test continuous reads across eraseblock boundaries on NAND devices.
+ *
+ * The tool writes pseudo-random data to a range of eraseblocks and then
+ * performs a single read over the whole physical span. This exercises both
+ * continuous reads within an eraseblock and the transitions between
+ * eraseblocks or even LUNs or dies.
+ *
+ * Author: Miquel Raynal <miquel.raynal@bootlin.com>
+ *
+ * Based on nandpagetest.c.
+ */
+#define PROGRAM_NAME "nandcontreadtest"
+
+#include <mtd/mtd-user.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <libmtd.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <time.h>
+
+#include "common.h"
+
+static struct mtd_dev_info mtd;
+static const char *mtddev;
+static libmtd_t mtd_desc;
+
+static unsigned char *writebuf, *readbuf, *backup, *bbt;
+static int peb = -1, count = -1, seed = -1, nb;
+static int fd;
+static unsigned int rnd_state;
+static int keep_contents;
+
+static const struct option options[] = {
+	{ "help", no_argument, NULL, 'h' },
+	{ "peb", required_argument, NULL, 'b' },
+	{ "count", required_argument, NULL, 'c' },
+	{ "seed", required_argument, NULL, 'S' },
+	{ "keep", no_argument, NULL, 'k' },
+	{ NULL, 0, NULL, 0 },
+};
+
+static NORETURN void usage(int status)
+{
+	fputs(
+	"Usage: "PROGRAM_NAME" [OPTIONS] <device>\n\n"
+	"Options:\n"
+	"  -h, --help         Display this help output\n"
+	"  -b, --peb <num>    First physical erase block (default 0)\n"
+	"  -c, --count <num>  Number of physical blocks to span (default 2,\n"
+	"                     0 means all blocks from --peb to the end)\n"
+	"  -S, --seed <num>   Seed for the pseudo random number generator\n"
+	"  -k, --keep         Restore existing contents after the test\n",
+	status == EXIT_SUCCESS ? stdout : stderr);
+	exit(status);
+}
+
+static long read_num(int opt, const char *arg)
+{
+	char *end;
+	long num;
+
+	num = strtol(arg, &end, 0);
+
+	if (!end || *end != '\0') {
+		fprintf(stderr, "-%c: expected integer argument\n", opt);
+		exit(EXIT_FAILURE);
+	}
+
+	return num;
+}
+
+static void process_options(int argc, char **argv)
+{
+	int c;
+
+	while (1) {
+		c = getopt_long(argc, argv, "hb:c:S:k", options, NULL);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'b':
+			if (peb >= 0)
+				goto failmulti;
+			peb = read_num(c, optarg);
+			if (peb < 0)
+				goto failarg;
+			break;
+		case 'c':
+			if (count >= 0)
+				goto failmulti;
+			count = read_num(c, optarg);
+			if (count < 0)
+				goto failarg;
+			break;
+		case 'S':
+			if (seed >= 0)
+				goto failmulti;
+			seed = read_num(c, optarg);
+			if (seed < 0)
+				goto failarg;
+			break;
+		case 'k':
+			if (keep_contents)
+				goto failmulti;
+			keep_contents = 1;
+			break;
+		case 'h':
+			usage(EXIT_SUCCESS);
+		default:
+			exit(EXIT_FAILURE);
+		}
+	}
+
+	if (optind < argc)
+		mtddev = argv[optind++];
+	else
+		errmsg_die("No device specified!\n");
+
+	if (optind < argc)
+		usage(EXIT_FAILURE);
+	if (peb < 0)
+		peb = 0;
+	if (count < 0)
+		count = 2;
+	if (seed < 0)
+		seed = time(NULL);
+	return;
+failmulti:
+	errmsg_die("'-%c' specified more than once!", c);
+failarg:
+	errmsg_die("Invalid argument for '-%c'!", c);
+}
+
+static void fill_random(unsigned char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = rand_r(&rnd_state);
+}
+
+static void report_read_location(const char *what, off_t off)
+{
+	int eb = off / mtd.eb_size;
+	int page = (off % mtd.eb_size) / mtd.min_io_size;
+	int inpage = (off % mtd.eb_size) % mtd.min_io_size;
+
+	fprintf(stderr, "%s at block %d page %d offset 0x%x (absolute offset 0x%llx)",
+		what, eb, page, inpage, (unsigned long long)off);
+	if (bbt && eb >= peb && eb < peb + nb && bbt[eb - peb])
+		fprintf(stderr, " [block was skipped as bad]");
+	fputc('\n', stderr);
+}
+
+static void diagnose_read(off_t start, size_t len)
+{
+	unsigned char *pagebuf;
+	off_t off = start;
+	size_t left = len;
+	size_t chunk;
+	ssize_t ret;
+
+	pagebuf = malloc(mtd.min_io_size);
+	if (!pagebuf) {
+		fprintf(stderr, "cannot allocate page buffer for diagnostics\n");
+		return;
+	}
+
+	while (left) {
+		chunk = min(left, (size_t)mtd.min_io_size);
+		ret = pread(fd, pagebuf, chunk, off);
+		if (ret != (ssize_t)chunk) {
+			report_read_location("diagnostic re-read failed", off);
+			goto out;
+		}
+		off += chunk;
+		left -= chunk;
+	}
+
+	fprintf(stderr, "big read failed but page-by-page diagnostic re-read succeeded\n");
+out:
+	free(pagebuf);
+}
+
+static int read_span(off_t start, unsigned char *buf, size_t len)
+{
+	size_t done = 0;
+	ssize_t ret;
+
+	while (done < len) {
+		ret = pread(fd, buf + done, len - done, start + done);
+		if (ret < 0) {
+			if (done)
+				fprintf(stderr, "read failed after %zu of %zu bytes\n",
+					done, len);
+			else
+				fprintf(stderr, "big read failed\n");
+			if (done)
+				report_read_location("read failed", start + done);
+			else
+				diagnose_read(start, len);
+			return -1;
+		}
+		if (ret == 0) {
+			fprintf(stderr, "short read in %zu-byte span starting at block %d: got %zu bytes\n",
+				len, (int)(start / mtd.eb_size), done);
+			report_read_location("first missing data", start + done);
+			return -1;
+		}
+		done += ret;
+	}
+
+	return 0;
+}
+
+static int verify_block(const unsigned char *read, const unsigned char *expected,
+			int eb)
+{
+	int i;
+
+	for (i = 0; i < mtd.eb_size; i++) {
+		if (read[i] == expected[i])
+			continue;
+
+		fprintf(stderr,
+			"data mismatch in block %d page %d offset 0x%x (absolute offset 0x%llx): got 0x%02x, expected 0x%02x\n",
+			eb, i / mtd.min_io_size, i % mtd.min_io_size,
+			(unsigned long long)eb * mtd.eb_size + i,
+			read[i], expected[i]);
+		return -1;
+	}
+
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int i, eb, bad, ngood, status = EXIT_FAILURE;
+	size_t span_size, backup_size;
+	unsigned char *backupptr;
+	off_t start;
+	struct timespec read_start, read_end;
+	double elapsed_ms, kib_per_s;
+
+	process_options(argc, argv);
+
+	mtd_desc = libmtd_open();
+	if (!mtd_desc)
+		return errmsg("can't initialize libmtd");
+
+	if (mtd_get_dev_info(mtd_desc, mtddev, &mtd) < 0)
+		return errmsg("mtd_get_dev_info failed");
+
+	if (mtd.type != MTD_MLCNANDFLASH && mtd.type != MTD_NANDFLASH)
+		return errmsg("%s is not a NAND flash!", mtddev);
+
+	if (peb >= mtd.eb_cnt)
+		return errmsg("physical erase block %d is out of range (device has %d blocks)!",
+			      peb, mtd.eb_cnt);
+
+	nb = count ? count : mtd.eb_cnt - peb;
+	if (nb <= 0)
+		return errmsg("no erase block to test from block %d!", peb);
+	if (peb + nb > mtd.eb_cnt)
+		return errmsg("range %d..%d exceeds device block count %d!",
+			      peb, peb + nb - 1, mtd.eb_cnt - 1);
+
+	if ((fd = open(mtddev, O_RDWR)) == -1) {
+		perror(mtddev);
+		return EXIT_FAILURE;
+	}
+
+	/* Find the good blocks in the range. */
+	bbt = xzalloc(nb);
+	ngood = 0;
+	for (i = 0; i < nb; i++) {
+		eb = peb + i;
+		bad = mtd_is_bad(&mtd, fd, eb);
+		if (bad < 0) {
+			errmsg("cannot check bad block status of block %d", eb);
+			goto out_cleanup;
+		}
+		bbt[i] = bad;
+		if (bad) {
+			printf("skipping bad erase block %d\n", eb);
+			continue;
+		}
+		ngood++;
+	}
+
+	if (!ngood) {
+		errmsg("no good erase block found in range %d..%d",
+		       peb, peb + nb - 1);
+		goto out_cleanup;
+	}
+
+	span_size = (size_t)nb * mtd.eb_size;
+	readbuf = malloc(span_size);
+	if (!readbuf) {
+		errmsg("cannot allocate %zu bytes for the %d-block read buffer",
+		       span_size, nb);
+		goto out_cleanup;
+	}
+
+	writebuf = malloc(mtd.eb_size);
+	if (!writebuf) {
+		errmsg("cannot allocate %d bytes for the write buffer",
+		       mtd.eb_size);
+		goto out_cleanup;
+	}
+
+	/* Save the original contents before modifying anything. */
+	if (keep_contents) {
+		backup_size = (size_t)ngood * mtd.eb_size;
+		backup = malloc(backup_size);
+		if (!backup) {
+			errmsg("cannot allocate %zu bytes to keep %d blocks; use a smaller --count or drop --keep",
+			       backup_size, ngood);
+			goto out_cleanup;
+		}
+
+		backupptr = backup;
+		for (i = 0; i < nb; i++) {
+			if (bbt[i])
+				continue;
+			eb = peb + i;
+			if (mtd_read(&mtd, fd, eb, 0, backupptr, mtd.eb_size)) {
+				errmsg("cannot read original contents of block %d", eb);
+				goto out_cleanup;
+			}
+			backupptr += mtd.eb_size;
+		}
+	}
+
+	printf("testing %d blocks from %d to %d (%d good), seed %d\n",
+	       nb, peb, peb + nb - 1, ngood, seed);
+
+	/* Write the test data to every good block. */
+	rnd_state = seed;
+	for (i = 0; i < nb; i++) {
+		if (bbt[i])
+			continue;
+		eb = peb + i;
+
+		fill_random(writebuf, mtd.eb_size);
+		if (mtd_erase(mtd_desc, &mtd, fd, eb)) {
+			errmsg("cannot erase block %d", eb);
+			goto out_restore;
+		}
+		if (mtd_write(mtd_desc, &mtd, fd, eb, 0, writebuf,
+			      mtd.eb_size, NULL, 0, 0)) {
+			errmsg("cannot write block %d", eb);
+			goto out_restore;
+		}
+	}
+
+	/* One big read over the whole physical range. */
+	start = (off_t)peb * mtd.eb_size;
+	clock_gettime(CLOCK_MONOTONIC_RAW, &read_start);
+	if (read_span(start, readbuf, span_size))
+		goto out_restore;
+	clock_gettime(CLOCK_MONOTONIC_RAW, &read_end);
+
+	/* Verify the good blocks against the regenerated data. */
+	rnd_state = seed;
+	for (i = 0; i < nb; i++) {
+		if (bbt[i])
+			continue;
+		eb = peb + i;
+
+		fill_random(writebuf, mtd.eb_size);
+		if (verify_block(readbuf + (size_t)i * mtd.eb_size,
+				 writebuf, eb))
+			goto out_restore;
+	}
+
+	elapsed_ms = (read_end.tv_sec - read_start.tv_sec) * 1000.0 +
+		     (read_end.tv_nsec - read_start.tv_nsec) / 1000000.0;
+	if (elapsed_ms > 0.0)
+		kib_per_s = (double)span_size / 1024.0 /
+			    (elapsed_ms / 1000.0);
+	else
+		kib_per_s = 0.0;
+
+	printf("success: verified %zu bytes read in %.3f ms (%.2f KiB/s)\n",
+	       span_size, elapsed_ms, kib_per_s);
+
+	status = EXIT_SUCCESS;
+
+out_restore:
+	if (keep_contents) {
+		backupptr = backup;
+		for (i = 0; i < nb; i++) {
+			if (bbt[i])
+				continue;
+			eb = peb + i;
+			if (mtd_erase(mtd_desc, &mtd, fd, eb)) {
+				errmsg("restoring: cannot erase block %d", eb);
+				status = EXIT_FAILURE;
+			} else if (mtd_write(mtd_desc, &mtd, fd, eb, 0,
+					     backupptr, mtd.eb_size, NULL, 0, 0)) {
+				errmsg("restoring: cannot write block %d", eb);
+				status = EXIT_FAILURE;
+			}
+			backupptr += mtd.eb_size;
+		}
+	}
+
+out_cleanup:
+	free(bbt);
+	free(backup);
+	free(readbuf);
+	free(writebuf);
+	close(fd);
+	return status;
+}
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
