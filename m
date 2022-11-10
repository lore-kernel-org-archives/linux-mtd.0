Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE78C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnilhV8oj9gG/Hk2ywXGiNzywfc+p6CadQNopE2w7Qk=; b=t6vH86MVk2jzxj
	hc7TbYMSi0A4D4CZA7PCoCT0Imb37yUCkhKiMWZk/VEwg8gCm+bmog0K6otN+r1TaFK8cdngIBcQU
	YuXrJayDdhWC4/rbk6hMnlGv9mxaFkPsJ1y5pVoBoUyNMl/wHw/BW9rZpzTA/kmWqItY7+MCkTyw3
	AU8mY0mrhKa59y0pRlzFVcxY/+xYdfT9898rrOfEUU7h88mMX49lj7wU6rpUKvyPbe4h6+IxdDjpR
	RcfCfIgwLLghD8H5VX/eajJMuIhp+ia0FfyqXJb/FaKTdHxE+dE8VA7Jc2xGYQwdxB2vO5KNiEK9T
	imH3PTRewea1oQk1ij/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9y3-006zuZ-Uy; Thu, 10 Nov 2022 15:59:52 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9xy-006zpJ-GW
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:59:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 82D80FF811;
	Thu, 10 Nov 2022 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qq1LmrJ2tOv0YKPCs3wdF6R5tnMRlOy1zft1xCqRC1g=;
	b=XiXuxMFQk+O7axigEuTr/dO8YT3VohtU+Bv6qo+GLf354PJZvIN+9X1U4s4QntOFbwpkAO
	0cencTJd8ae6tB1urfcSf1u5P/vSQsTn+8eQ/oJ7Ue3V+xRIOCjYBiYelxaxpW/5R1WEHr
	KUjsscHBQQyEJRej0cfZnWAhZUdUJ4dDlwjYNdNEDdFV4/r0yGLAnbp4FYkrRceZxAcsbz
	PMLK15KQvzhhUELGDt8dEf3FllBidPdHEplmxHs8YGIVQP/R3OnJie4/CTsNr3x5geIt74
	7K2cJfYMOFWi4Ikv2mBLfY/HlmoavQWP8lTZevYmwPADsOLYeS4Yh+p3hcqEeg==
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
Subject: [PATCH 1/2] mtd-utils: flash_speed: Rework the time counting helpers
Date: Thu, 10 Nov 2022 16:59:37 +0100
Message-Id: <20221110155938.820334-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155938.820334-1-miquel.raynal@bootlin.com>
References: <20221110155938.820334-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075946_881760_2298A8F1 
X-CRM114-Status: GOOD (  11.86  )
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

In order to be able to have interleaved measures, let's not use the
start and finish global variables from the time helpers directly,
provide parameters for these variables so that we can provide either the
global entries, or more specific ones when relevant.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 39 +++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 2fc70a1..035768b 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -258,22 +258,29 @@ static int read_eraseblock_by_2pages(int ebnum)
 	return err;
 }
 
-static void start_timing(void)
+static void start_timing(struct timespec *start)
 {
-	clock_gettime(CLOCK_MONOTONIC_RAW, &start);
+	clock_gettime(CLOCK_MONOTONIC_RAW, start);
 }
 
-static void stop_timing(void)
+static void stop_timing(struct timespec *finish)
 {
-	clock_gettime(CLOCK_MONOTONIC_RAW, &finish);
+	clock_gettime(CLOCK_MONOTONIC_RAW, finish);
 }
 
-static long calc_speed(void)
+static long calc_duration(struct timespec *start, struct timespec *finish)
 {
 	long ms;
 
-	ms = (finish.tv_sec - start.tv_sec) * 1000L;
-	ms += (finish.tv_nsec - start.tv_nsec) / 1000000L;
+	ms = (finish->tv_sec - start->tv_sec) * 1000L;
+	ms += (finish->tv_nsec - start->tv_nsec) / 1000000L;
+
+	return ms;
+}
+
+static long calc_speed(struct timespec *start, struct timespec *finish)
+{
+	long ms = calc_duration(start, finish);
 
 	if (ms <= 0)
 		return 0;
@@ -314,7 +321,7 @@ static int erase_good_eraseblocks(unsigned int eb, int ebcnt, int ebskip)
 }
 
 #define TIME_OP_PER_PEB( op )\
-		start_timing();\
+		start_timing(&start);\
 		for (i = 0; i < count; ++i) {\
 			if (bbt[i])\
 				continue;\
@@ -322,8 +329,8 @@ static int erase_good_eraseblocks(unsigned int eb, int ebcnt, int ebskip)
 			if (err)\
 				goto out;\
 		}\
-		stop_timing();\
-		speed = calc_speed()
+		stop_timing(&finish);\
+		speed = calc_speed(&start, &finish)
 
 int main(int argc, char **argv)
 {
@@ -428,12 +435,12 @@ int main(int argc, char **argv)
 	/* Erase all eraseblocks */
 	if (flags & DESTRUCTIVE) {
 		puts("Testing erase speed");
-		start_timing();
+		start_timing(&start);
 		err = erase_good_eraseblocks(peb, count, skip);
 		if (err)
 			goto out;
-		stop_timing();
-		speed = calc_speed();
+		stop_timing(&finish);
+		speed = calc_speed(&start, &finish);
 		printf("erase speed is %ld KiB/s\n", speed);
 	}
 
@@ -442,7 +449,7 @@ int main(int argc, char **argv)
 		for (k = 1; k < 7; ++k) {
 			blocks = 1 << k;
 			printf("Testing %dx multi-block erase speed\n", blocks);
-			start_timing();
+			start_timing(&start);
 			for (i = 0; i < count; ) {
 				for (j = 0; j < blocks && (i + j) < count; ++j)
 					if (bbt[i + j])
@@ -456,8 +463,8 @@ int main(int argc, char **argv)
 					goto out;
 				i += j;
 			}
-			stop_timing();
-			speed = calc_speed();
+			stop_timing(&finish);
+			speed = calc_speed(&start, &finish);
 			printf("%dx multi-block erase speed is %ld KiB/s\n",
 					blocks, speed);
 		}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
