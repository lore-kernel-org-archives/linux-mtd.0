Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B13C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYS3CJJFUs+mzn/FEK76txMKcgZIG8wFlQPNCArKzjc=; b=IGl1Rg/hGYfShW
	gwig34jS0r4RWJvQTsTMgs+KH65INRpRr94fpuqJ1Lx7W8lsiDhHd1k0WcJMCaw71YEZf3EWWsWbA
	k+uYovaulMJG4u1qg09RsmlsSePkNZEr0mH0s5sDi84ciNR/rTn+b/KKmfbGmGvjP959kMXWxcGll
	mSaWHq0rtIy8Wt97MO3Y14dKiXzLlPBxKD2qCbqK7p44b8vSpsx2YpKqAPNPddpMH5WrDRcXi4zgQ
	z1EGYeWwmnu5aK19TkPngM+fVk5LqG4s6IlrzDFxtUPJS0uUqt+FLKj69g6hH3kssNyke1PPATqoc
	KoAGTLrLtDYjN+5hRt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siXSO-000000073FM-34eb;
	Mon, 26 Aug 2024 11:00:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ6-00000006kW5-06Jj
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05000C000A;
	Mon, 26 Aug 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fy4u7qrc1WiACZyE9Io1FSrviUO5JaPXsZHQ37m2wkk=;
	b=WZW/RF/p/Mj1w+QdFAoHllw45xD8bAk6Pd7UnCOY3ReUxGsxbYAbF7eXZboc9LNTZO4sMN
	kDJcwWFPpW1gEp0L1ENHAYnOVKON0UERB0fuCY4cDM5LU9onMYRP6F+dz/Fr7bVu0m5fz4
	GX6Ov/InjP0e4d5Pl2Fyv264qLFSyvJL4nmCC5pBS1ORIEry6aWcj/H5B2LLHT3CzyCiuv
	cjxe54/0sPF5qDVV6MvhFhh2ryoVf/t4q7UqVWfS+jpwcysXa2iaptRGxFc6XtvlQyCGj9
	qPHYu52uoTKOE0DTZLCAj+jcTQskIe2FvFroo7ML1G2xwhDhe7ScMty3bkI2jg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 10/10] mtd-tests: flash_speed: Benchmark continuous reads
Date: Mon, 26 Aug 2024 11:46:29 +0200
Message-ID: <20240826094629.19065-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024640_364760_B32D7C14 
X-CRM114-Status: GOOD (  16.80  )
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

Currently the read throuput test tries:
- 1 page
- 2 pages
- 1 block (64 or more pages, usually)

But it might be interesting to see how the speed gradually increases,
eg. testing all number of pages from 1 to maybe 16, and then
arbitrarilly 32 and 64.

Let's add a -C parameter to enable this additional test.

The 2-page read/write tests are also moved under this new option.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 52 ++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 1064491..11f396c 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -23,6 +23,7 @@
  * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 #define DESTRUCTIVE 0x01
+#define CONTINOUS 0x02
 
 #define PROGRAM_NAME "flash_speed"
 
@@ -49,6 +50,7 @@ static int fd;
 
 static int npages = 1;
 static int peb=-1, count=-1, skip=-1, flags=0, speb=-1;
+static bool continuous = false;
 static struct timespec start, finish;
 static int pgsize, pgcnt;
 static int goodebcnt;
@@ -60,6 +62,7 @@ static const struct option options[] = {
 	{ "count", required_argument, NULL, 'c' },
 	{ "skip", required_argument, NULL, 's' },
 	{ "sec-peb", required_argument, NULL, 'k' },
+	{ "continuous", no_argument, NULL, 'C' },
 	{ NULL, 0, NULL, 0 },
 };
 
@@ -73,7 +76,8 @@ static NORETURN void usage(int status)
 	"  -c, --count <num>   Number of erase blocks to use (default: all)\n"
 	"  -s, --skip <num>    Number of blocks to skip\n"
 	"  -d, --destructive   Run destructive (erase and write speed) tests\n"
-	"  -k, --sec-peb <num> Start of secondary block to measure RWW latency (requires -d)\n",
+	"  -k, --sec-peb <num> Start of secondary block to measure RWW latency (requires -d)\n"
+	"  -C, --continuous    Increase the number of consecutive pages gradually\n",
 	status==EXIT_SUCCESS ? stdout : stderr);
 	exit(status);
 }
@@ -97,7 +101,7 @@ static void process_options(int argc, char **argv)
 	int c;
 
 	while (1) {
-		c = getopt_long(argc, argv, "hb:c:s:dk:", options, NULL);
+		c = getopt_long(argc, argv, "hb:c:s:dk:C", options, NULL);
 		if (c == -1)
 			break;
 
@@ -137,6 +141,9 @@ static void process_options(int argc, char **argv)
 			if (speb < 0)
 				goto failarg;
 			break;
+		case 'C':
+			continuous = true;
+			break;
 		default:
 			exit(EXIT_FAILURE);
 		}
@@ -440,23 +447,36 @@ int main(int argc, char **argv)
 	TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
 	printf("page read speed is %ld KiB/s\n", speed);
 
-	/* Write all eraseblocks, 2 pages at a time */
-	if (flags & DESTRUCTIVE) {
-		err = erase_good_eraseblocks(peb, count, skip);
-		if (err)
-			goto out;
+	if (continuous) {
+		/* Write all eraseblocks, 2 pages at a time */
+		if (flags & DESTRUCTIVE) {
+			err = erase_good_eraseblocks(peb, count, skip);
+			if (err)
+				goto out;
 
-		puts("testing 2 page write speed");
-		TIME_OP_PER_PEB(write_eraseblock_by_2pages, 2);
-		printf("2 page write speed is %ld KiB/s\n", speed);
+			puts("testing 2 page write speed");
+			TIME_OP_PER_PEB(write_eraseblock_by_2pages, 2);
+			printf("2 page write speed is %ld KiB/s\n", speed);
+		}
+
+		/* Read all eraseblocks, N pages at a time */
+		puts("testing multiple pages read speed");
+		for (npages = 2; npages <= 16 && npages <= pgcnt; npages++) {
+			TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
+			printf("%d page read speed is %ld KiB/s\n", npages, speed);
+		}
+		if (pgcnt >= 32) {
+			npages = 32;
+			TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
+			printf("%d page read speed is %ld KiB/s\n", npages, speed);
+		}
+		if (pgcnt >= 64) {
+			npages = 64;
+			TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
+			printf("%d page read speed is %ld KiB/s\n", npages, speed);
+		}
 	}
 
-	/* Read all eraseblocks, 2 pages at a time */
-	puts("testing 2 page read speed");
-	npages = 2;
-	TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
-	printf("2 page read speed is %ld KiB/s\n", speed);
-
 	/* Erase all eraseblocks */
 	if (flags & DESTRUCTIVE) {
 		puts("Testing erase speed");
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
