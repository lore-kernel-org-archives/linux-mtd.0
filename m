Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50852C54FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 16:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCCA2071E
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 16:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uu3bOiLK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FCCA2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grZTmFiUBKorZSBs+DDH0R/2mq/I700+d8M3AIV6jTU=; b=Uu3bOiLKXIMqxU
	Drcm164gBWE32RoKwjc4qZ3CKjJIUVNCH3g1pYhkCqzX1+dNa2gRWe+/++oRrCfbUk1a/7fNZYjzf
	bwBeZK1z0v14VXs5VtYbLxsGnudFcVUm7DB8XlKvrWnFlSiH0Wm13ZCPt8okhAel1RxCPEvkXK2UW
	EnmU/MZg5CehqUWSgpnlsUsq39oRKmF3YLjwoniyO3Bwxo2+e1WZPO4RbPwfsH7fBpRpuyJB7TlhY
	/vHHjwoddxQG1+FyyOGKMr0gUmgDLobbublc3p8tPMtE8SW6yknnk43wyV56eB0fCbjis1GetgLvG
	yiq9sITmMWHmhMGKLghg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS1FZ-0003Cb-Mb; Fri, 24 Apr 2020 16:32:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS1FV-00038p-Hf
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 16:32:23 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 32FBDFF80D;
 Fri, 24 Apr 2020 16:32:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd-utils: Add nandflipbits tool
Date: Fri, 24 Apr 2020 18:32:09 +0200
Message-Id: <20200424163209.26359-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_093221_858577_238DBD4E 
X-CRM114-Status: GOOD (  24.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

The nandflipbits tool is intended to be used when one need to flip one or
several specific bits on a NAND media.
It can be useful to manually recover from an unexpected bit flip on a flash
device, though the main purpose of this tool is to provide a way to test
ECC algorithms robustness.

One typical example I used this tool for is testing HW ECC engines behavior
when bitflips occur in an erased page: most HW engines do not correctly
handle this case, because, most of the time, ECC bits generated for an
empty page are not all 1s, and, empty page detection embedded in such
engines is only validating that all bits are set to 1s (which is not true
when a bit-flip has occurred).

Another use of this tool is replacing nandbiterrs test which
absolutely do not work with MLC-like chips because of the rewriting of
the pages in raw mode to toggle ones into zeroes.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
[miquel: Took Boris' work from 2014, addressed comments from Brian made
         in 2015, updated it, tested more extensively and fixed issues]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .gitignore                |   1 +
 nand-utils/Makemodule.am  |   5 +-
 nand-utils/nandflipbits.c | 323 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 nand-utils/nandflipbits.c

diff --git a/.gitignore b/.gitignore
index 488b35c..bdb0669 100644
--- a/.gitignore
+++ b/.gitignore
@@ -84,6 +84,7 @@ flash_stress
 flash_speed
 flash_readtest
 nandbiterrs
+nandflipbits
 nandpagetest
 nandsubpagetest
 ubiattach
diff --git a/nand-utils/Makemodule.am b/nand-utils/Makemodule.am
index d75b0cb..b5a15ac 100644
--- a/nand-utils/Makemodule.am
+++ b/nand-utils/Makemodule.am
@@ -13,8 +13,11 @@ nftldump_LDADD = libmtd.a
 nftl_format_SOURCES = nand-utils/nftl_format.c
 nftl_format_LDADD = libmtd.a
 
+nandflipbits_SOURCES = nand-utils/nandflipbits.c
+nandflipbits_LDADD = libmtd.a
+
 NAND_BINS = \
-	nanddump nandwrite nandtest nftldump nftl_format
+	nanddump nandwrite nandtest nftldump nftl_format nandflipbits
 
 NAND_SH = \
 	nand-utils/load_nandsim.sh
diff --git a/nand-utils/nandflipbits.c b/nand-utils/nandflipbits.c
new file mode 100644
index 0000000..aa6850f
--- /dev/null
+++ b/nand-utils/nandflipbits.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2014 Bootlin
+ *
+ * Authors: Boris Brezillon <boris.brezillon@collabora.com>
+ *          Miquel Raynal <miquel.raynal@bootlin.com>
+ *
+ * Overview:
+ *   This utility manually flips specified bits in a NAND flash.
+ */
+
+#define PROGRAM_NAME "nandflipbits"
+
+#include <mtd/mtd-user.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <libmtd.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <fcntl.h>
+
+#include "common.h"
+
+struct bit_flip {
+	uint32_t block;
+	uint64_t offset;
+	int bit;
+	bool done;
+};
+
+static void usage(int status)
+{
+	fprintf(status == EXIT_SUCCESS ? stdout : stderr,
+"Usage: "PROGRAM_NAME" [OPTIONS] <device> <bit>@<address> [<bit>@<address>...]\n"
+"\n"
+"       Test ECC engines, see if they match the specified correction strength:\n"
+"         * Reads in raw mode the data from an MTD device\n"
+"         * Flips the indicated bit(s)\n"
+"         * Write it back in raw mode.\n"
+"\n"
+"       -h, --help              Display this help and exit\n"
+"       -o, --oob               Provided addresses take OOB area into account\n"
+"       -q, --quiet             Don't display progress messages\n"
+"\n"
+	);
+	exit(status);
+}
+
+static const char *mtd_device;
+static bool quiet = false;
+static bool oob_mode = false;
+static struct bit_flip *bits_to_flip;
+static int nbits_to_flip = 0;
+
+static void process_options(int argc, char * const argv[])
+{
+	int error = 0;
+	int i;
+
+	for (;;) {
+		int option_index = 0;
+		static const char short_options[] = "hoq";
+		static const struct option long_options[] = {
+			{"help", no_argument, 0, 'h'},
+			{"oob", no_argument, 0, 'o'},
+			{"quiet", no_argument, 0, 'q'},
+			{0, 0, 0, 0},
+		};
+
+		int c = getopt_long(argc, argv, short_options,
+				    long_options, &option_index);
+		if (c == EOF)
+			break;
+
+		switch (c) {
+		case 'q':
+			quiet = true;
+			break;
+		case 'o':
+			oob_mode = true;
+			break;
+		case 'h':
+			usage(EXIT_SUCCESS);
+			break;
+		case '?':
+		default:
+			error++;
+			break;
+		}
+	}
+
+	argc -= optind;
+	argv += optind;
+
+	/*
+	 * There must be at least the MTD device node path argument remaining
+	 * and a list of minimum one 'bits-to-flip'.
+	 */
+
+	if (argc < 2 || error)
+		usage(EXIT_FAILURE);
+
+	/* MTD device */
+	mtd_device = argv[0];
+	argc--;
+	argv++;
+
+	/* Parse the bits to flip */
+	nbits_to_flip = argc;
+	bits_to_flip = malloc(sizeof(*bits_to_flip) * nbits_to_flip);
+	if (!bits_to_flip)
+		exit(EXIT_FAILURE);
+
+	for (i = 0; i < nbits_to_flip; i++) {
+		struct bit_flip	*bit_to_flip = &bits_to_flip[i];
+		char *desc = argv[i];
+
+		bit_to_flip->bit = strtol(desc, &desc, 0);
+		if (errno || bit_to_flip->bit > 7)
+			goto free_bits;
+
+		if (!desc || *desc++ != '@')
+			goto free_bits;
+
+		bit_to_flip->offset = strtol(desc, &desc, 0);
+		if (errno)
+			goto free_bits;
+	}
+
+	return;
+
+free_bits:
+	free(bits_to_flip);
+
+	fprintf(stderr, "Invalid bit description\n");
+
+	exit(EXIT_FAILURE);
+}
+
+int main(int argc, char **argv)
+{
+	struct mtd_dev_info mtd;
+	libmtd_t mtd_desc;
+	uint64_t mtdlen;
+	uint32_t pagelen, pages_per_blk, blklen;
+	uint8_t *buffer;
+	int fd, ret, i;
+
+	process_options(argc, argv);
+
+	/* Open the libmtd */
+	mtd_desc = libmtd_open();
+	if (!mtd_desc) {
+		fprintf(stderr, "Cannot initialize libmtd\n");
+		ret = EXIT_FAILURE;
+		goto free_bits;
+	}
+
+	/* Fill in MTD device capability structure */
+	ret = mtd_get_dev_info(mtd_desc, mtd_device, &mtd);
+	if (ret < 0) {
+		fprintf(stderr, "Cannot retrieve MTD device information\n");
+		ret = EXIT_FAILURE;
+		goto close_lib;
+	}
+
+	/* Verify we are using a NAND device */
+	if (mtd.type != MTD_NANDFLASH && mtd.type != MTD_MLCNANDFLASH) {
+		fprintf(stderr, "%s is not a NAND flash\n", mtd_device);
+		ret = EXIT_FAILURE;
+		goto close_lib;
+	}
+
+	/* Open the MTD device */
+	fd = open(mtd_device, O_RDWR);
+	if (fd < 0) {
+		fprintf(stderr, "Cannot open %s\n", mtd_device);
+		ret = EXIT_FAILURE;
+		goto close_lib;
+	}
+
+	/* Select raw mode */
+	ret = ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW);
+	if (ret) {
+		fprintf(stderr, "Unavailable raw mode ioctl\n");
+		ret = EXIT_FAILURE;
+		goto close_fd;
+	}
+
+	pagelen = mtd.min_io_size + (oob_mode ? mtd.oob_size : 0);
+	pages_per_blk = mtd.eb_size / mtd.min_io_size;
+	blklen = pages_per_blk * pagelen;
+	mtdlen = (uint64_t)blklen * (uint64_t)mtd.eb_cnt;
+	buffer = malloc((mtd.min_io_size + mtd.oob_size) * pages_per_blk);
+	if (!buffer) {
+		ret = EXIT_FAILURE;
+		goto close_fd;
+	}
+
+	for (i = 0; i < nbits_to_flip; i++) {
+		int page;
+
+		if (bits_to_flip[i].offset >= mtdlen) {
+			fprintf(stderr, "Invalid byte offset %lld (max %lld)\n",
+				bits_to_flip[i].offset, mtdlen);
+			ret = EXIT_FAILURE;
+			goto free_buf;
+		}
+
+		bits_to_flip[i].block = bits_to_flip[i].offset / blklen;
+		bits_to_flip[i].offset %= blklen;
+		page = bits_to_flip[i].offset / pagelen;
+		bits_to_flip[i].offset = (page *
+					  (mtd.min_io_size + mtd.oob_size)) +
+					 (bits_to_flip[i].offset % pagelen);
+	}
+
+	while (1) {
+		struct bit_flip	*bit_to_flip = NULL;
+		int blkoffs;
+		int bufoffs;
+
+		/* Look for the next bitflip to insert */
+		for (i = 0; i < nbits_to_flip; i++) {
+			if (bits_to_flip[i].done == false) {
+				bit_to_flip = &bits_to_flip[i];
+				break;
+			}
+		}
+
+		if (!bit_to_flip) {
+			ret = EXIT_SUCCESS;
+			break;
+		}
+
+		/* Read the content of all the pages of a block */
+		blkoffs = 0;
+		bufoffs = 0;
+		for (i = 0; i < pages_per_blk; i++) {
+			ret = mtd_read(&mtd, fd, bit_to_flip->block, blkoffs,
+				       buffer + bufoffs, mtd.min_io_size);
+			if (ret) {
+				fprintf(stderr, "MTD read failure\n");
+				ret = EXIT_FAILURE;
+				goto free_buf;
+			}
+
+			bufoffs += mtd.min_io_size;
+
+			ret = mtd_read_oob(mtd_desc, &mtd, fd, blkoffs,
+					   mtd.oob_size, buffer + bufoffs);
+			if (ret) {
+				fprintf(stderr, "MTD OOB read failure\n");
+				ret = EXIT_FAILURE;
+				goto free_buf;
+			}
+
+			bufoffs += mtd.oob_size;
+			blkoffs += mtd.min_io_size;
+		}
+
+		/* Flip all bits that are located in this particular block */
+		for (i = 0; i < nbits_to_flip; i++) {
+			unsigned char val, mask;
+
+			if (bits_to_flip[i].block != bit_to_flip->block)
+				continue;
+
+			mask = 1 << bits_to_flip[i].bit;
+			val = buffer[bits_to_flip[i].offset] & mask;
+			if (val)
+				buffer[bits_to_flip[i].offset] &= ~mask;
+			else
+				buffer[bits_to_flip[i].offset] |= mask;
+		}
+
+		/* Erase the block */
+		ret = mtd_erase(mtd_desc, &mtd, fd, bit_to_flip->block);
+		if (ret) {
+			fprintf(stderr, "MTD erase failure\n");
+			ret = EXIT_FAILURE;
+			goto free_buf;
+		}
+
+		/* Rewrite the pages, still in raw mode, with the bitflips */
+		blkoffs = 0;
+		bufoffs = 0;
+		for (i = 0; i < pages_per_blk; i++) {
+			ret = mtd_write(mtd_desc, &mtd, fd, bit_to_flip->block,
+					blkoffs, buffer + bufoffs, mtd.min_io_size,
+					buffer + bufoffs + mtd.min_io_size,
+					mtd.oob_size,
+					MTD_OPS_RAW);
+			if (ret) {
+				fprintf(stderr, "MTD write failure\n");
+				ret = EXIT_FAILURE;
+				goto free_buf;
+			}
+
+			blkoffs += mtd.min_io_size;
+			bufoffs += mtd.min_io_size + mtd.oob_size;
+		}
+
+		/* Mark the added bitflips as done */
+		for (i = 0; i < nbits_to_flip; i++) {
+			if (bits_to_flip[i].block == bit_to_flip->block)
+				bits_to_flip[i].done = true;
+		}
+	}
+
+free_buf:
+	free(buffer);
+close_fd:
+	close(fd);
+close_lib:
+	libmtd_close(mtd_desc);
+free_bits:
+	free(bits_to_flip);
+
+	exit(ret);
+}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
