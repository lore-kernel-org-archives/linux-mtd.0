Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC4C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6GjOy6tLk/YWMU6SWiR+dfSOadESWZPPUxWG/6zsQQ=; b=yedmYJMJQTkvNu
	y43Su0EOwis02hzyWkDST9EELMnEXPLKUP1DrkTM6qFBEH0COl+MC1uxEKAWBjN5lZYT+RMILLhfr
	t+siuKA+j6hD3Fe9Y6PXKVHa1YMogtzgWeaOVc2rFqYYPG+OQfebDkMCXkkTZ9G69Yk57R9TSZXPz
	82EV67IJHIhZfm9+5mUBmXAZMGE7X2n0Pq/7H458eBDvxfv/ELTjoAny4Re2K7uh28VSiQBU4nZ5G
	4WIR2mpPAvbPv9t6FbvGF5N8FkH0qdd7Ou41A+U2hKKOfSqubc78txnwhSttxjCG6osnymvW/E7Az
	raAtElMy7Xp+xMWXifoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9y2-006zu7-5s; Thu, 10 Nov 2022 15:59:50 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9xy-006zpy-GF
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:59:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A797AFF812;
	Thu, 10 Nov 2022 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ba0cb7gsFHd+xK+yWYfWBbu4p0hU2Y7zkofUa3ghAXw=;
	b=Mx3JUvBxypvGrRN6yZA9723171JyQG55gWD7TwxzfDWerDAeN4juM5wYXMePsbs1NFYxsI
	dK6HfP3Fy4y4BTP6egWaMjbMAtJCfCMkjvmc3iDYu/YGClgZwM2sZ0XkavORvkP+NO24ah
	cNGShILIU8l+Ri/r9twImXo1G4OPkHR2z96J90BRUM/YCXGnxsqvI68uhuF4t/vrCiYUoh
	kZGPeDbs6sUjn+O09JnJJ/i4sptEgBu/QNJRgg2DkLKMMnRb7PC32mrgFAsJdYiuaKlCqh
	8oYTvQWA0FTAbfRt9kI9HwylDr70LiLu0G3Q/x19g21rmavZ/9oIPO/pg9p60A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd-utils: flash_speed: Measure read while write latency
Date: Thu, 10 Nov 2022 16:59:38 +0100
Message-Id: <20221110155938.820334-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155938.820334-1-miquel.raynal@bootlin.com>
References: <20221110155938.820334-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075946_859697_135D2333 
X-CRM114-Status: GOOD (  23.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Read While Write (RWW) feature allows to perform reads from the
flash array into cache while a program (from cache) or an erase
operation happens, provided that the two areas are located on different
banks.

The main benefit is the possible reduced latency when requesting to read
a page while a much longer operation is ongoing, like a write or an
erase.

We can try to compare the positive impact of such a feature by enhancing
the flash_speed test tool with the following test:
- Measure the time taken by an eraseblock write in parallel with an
  eraseblock read.
- Measure when the read operation ends.
- Compare the two to get the latency saved with the RWW feature.

To be sure the mtd_write actually starts (and acquires the necessary
locks) before the mtd_read does, we use SCHED_FIFO at rather high
(arbitrary) priorities, respectively 42 and 41.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/Makemodule.am |   5 +-
 tests/mtd-tests/flash_speed.c | 126 +++++++++++++++++++++++++++++++++-
 2 files changed, 127 insertions(+), 4 deletions(-)

diff --git a/tests/mtd-tests/Makemodule.am b/tests/mtd-tests/Makemodule.am
index d849e3c..d02e9e4 100644
--- a/tests/mtd-tests/Makemodule.am
+++ b/tests/mtd-tests/Makemodule.am
@@ -7,9 +7,12 @@ flash_stress_LDADD = libmtd.a
 flash_stress_CPPFLAGS = $(AM_CPPFLAGS)
 
 flash_speed_SOURCES = tests/mtd-tests/flash_speed.c
-flash_speed_LDADD = libmtd.a
+flash_speed_LDADD = libmtd.a $(PTHREAD_LIBS)
 flash_speed_CPPFLAGS = $(AM_CPPFLAGS)
 
+flash_speed_LDADD += $(PTHREAD_CFLAGS)
+flash_speed_CPPFLAGS += $(PTHREAD_CFLAGS)
+
 nandbiterrs_SOURCES = tests/mtd-tests/nandbiterrs.c
 nandbiterrs_LDADD = libmtd.a
 nandbiterrs_CPPFLAGS = $(AM_CPPFLAGS)
diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 035768b..0f82047 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -33,6 +33,7 @@
 #include <stdlib.h>
 #include <libmtd.h>
 #include <getopt.h>
+#include <pthread.h>
 #include <stdio.h>
 #include <fcntl.h>
 #include <time.h>
@@ -46,7 +47,7 @@ static const char *mtddev;
 static libmtd_t mtd_desc;
 static int fd;
 
-static int peb=-1, count=-1, skip=-1, flags=0;
+static int peb=-1, count=-1, skip=-1, flags=0, speb=-1;
 static struct timespec start, finish;
 static int pgsize, pgcnt;
 static int goodebcnt;
@@ -57,6 +58,7 @@ static const struct option options[] = {
 	{ "peb", required_argument, NULL, 'b' },
 	{ "count", required_argument, NULL, 'c' },
 	{ "skip", required_argument, NULL, 's' },
+	{ "sec-peb", required_argument, NULL, 'k' },
 	{ NULL, 0, NULL, 0 },
 };
 
@@ -69,7 +71,8 @@ static NORETURN void usage(int status)
 	"  -b, --peb <num>     Start from this physical erase block\n"
 	"  -c, --count <num>   Number of erase blocks to use (default: all)\n"
 	"  -s, --skip <num>    Number of blocks to skip\n"
-	"  -d, --destructive   Run destructive (erase and write speed) tests\n",
+	"  -d, --destructive   Run destructive (erase and write speed) tests\n"
+	"  -k, --sec-peb <num> Start of secondary block to measure RWW latency (requires -d)\n",
 	status==EXIT_SUCCESS ? stdout : stderr);
 	exit(status);
 }
@@ -93,7 +96,7 @@ static void process_options(int argc, char **argv)
 	int c;
 
 	while (1) {
-		c = getopt_long(argc, argv, "hb:c:s:d", options, NULL);
+		c = getopt_long(argc, argv, "hb:c:s:dk:", options, NULL);
 		if (c == -1)
 			break;
 
@@ -126,6 +129,13 @@ static void process_options(int argc, char **argv)
 				goto failmulti;
 			flags |= DESTRUCTIVE;
 			break;
+		case 'k':
+			if (speb >= 0)
+				goto failmulti;
+			speb = read_num(c, optarg);
+			if (speb < 0)
+				goto failarg;
+			break;
 		default:
 			exit(EXIT_FAILURE);
 		}
@@ -144,11 +154,15 @@ static void process_options(int argc, char **argv)
 		skip = 0;
 	if (count < 0)
 		count = 1;
+	if (speb >= 0 && !(flags & DESTRUCTIVE))
+		goto faildestr;
 	return;
 failmulti:
 	errmsg_die("'-%c' specified more than once!\n", c);
 failarg:
 	errmsg_die("Invalid argument for '-%c'!\n", c);
+faildestr:
+	errmsg_die("'-k' specified, -d is missing!\n");
 }
 
 static int write_eraseblock(int ebnum)
@@ -320,6 +334,32 @@ static int erase_good_eraseblocks(unsigned int eb, int ebcnt, int ebskip)
 	return err;
 }
 
+struct thread_arg {
+	int (*op)(int peb);
+	int peb;
+	struct timespec start;
+	struct timespec finish;
+};
+
+static void *op_thread(void *ptr)
+{
+	struct thread_arg *args = ptr;
+	unsigned long err = 0;
+	int i;
+
+	start_timing(&args->start);
+	for (i = 0; i < count; ++i) {
+		if (bbt[i])
+			continue;
+		err = args->op(args->peb + i * (skip + 1));
+		if (err)
+			break;
+	}
+	stop_timing(&args->finish);
+
+	return (void *)err;
+}
+
 #define TIME_OP_PER_PEB( op )\
 		start_timing(&start);\
 		for (i = 0; i < count; ++i) {\
@@ -470,6 +510,86 @@ int main(int argc, char **argv)
 		}
 	}
 
+	/* Write a page and immediately after try to read another page. Report
+	 * the latency difference when performed on different banks (NOR only).
+	 */
+	if (speb >= 0 && mtd.subpage_size == 1) {
+		long duration_w, duration_r, rww_duration_w, rww_latency_end;
+		long rww_duration_rnw, rww_duration_r_end;
+		bool rww_r_end_first;
+		struct thread_arg write_args_peb = {
+			.op = write_eraseblock,
+			.peb = peb,
+		};
+		struct thread_arg read_args_speb = {
+			.op = read_eraseblock,
+			.peb = speb,
+		};
+		struct sched_param param_write, param_read;
+		pthread_attr_t attr_write, attr_read;
+		pthread_t write_thread, read_thread;
+		void *retval;
+
+		puts("testing read while write latency");
+
+		/* Change scheduling priorities so that the write thread gets
+		 *scheduled more aggressively than the read thread.
+		 */
+		pthread_attr_init(&attr_write);
+		pthread_attr_setinheritsched(&attr_write, PTHREAD_EXPLICIT_SCHED);
+		pthread_attr_setschedpolicy(&attr_write, SCHED_FIFO);
+		param_write.sched_priority = 42;
+		pthread_attr_setschedparam(&attr_write, &param_write);
+
+		pthread_attr_init(&attr_read);
+		pthread_attr_setinheritsched(&attr_read, PTHREAD_EXPLICIT_SCHED);
+		pthread_attr_setschedpolicy(&attr_read, SCHED_FIFO);
+		param_read.sched_priority = 41;
+		pthread_attr_setschedparam(&attr_read, &param_read);
+
+		err = pthread_create(&write_thread, &attr_write,
+				     (void *)op_thread, &write_args_peb);
+		if (err) {
+			errmsg("parallel write pthread create failed");
+			goto out;
+		}
+
+		err = pthread_create(&read_thread, &attr_read,
+				     (void *)op_thread, &read_args_speb);
+		if (err) {
+			errmsg("parallel read pthread create failed");
+			goto out;
+		}
+
+		pthread_join(read_thread, &retval);
+		if ((long)retval) {
+			errmsg("parallel read pthread failed");
+			goto out;
+		}
+
+		pthread_join(write_thread, &retval);
+		if ((long)retval) {
+			errmsg("parallel write pthread failed");
+			goto out;
+		}
+
+		rww_duration_w = calc_duration(&write_args_peb.start,
+					       &write_args_peb.finish);
+		rww_latency_end = calc_duration(&write_args_peb.finish,
+						&read_args_speb.finish);
+		rww_r_end_first = rww_latency_end < 0;
+		if (rww_r_end_first)
+			rww_duration_rnw = rww_duration_w;
+		else
+			rww_duration_rnw = calc_duration(&write_args_peb.start,
+							 &read_args_speb.finish);
+
+		rww_duration_r_end = calc_duration(&write_args_peb.start,
+						   &read_args_speb.finish);
+		printf("read while write took %ldms, read ended after %ldms\n",
+		       rww_duration_rnw, rww_duration_r_end);
+	}
+
 	puts("finished");
 	status = EXIT_SUCCESS;
 out:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
