Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CBDC5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9uAu3RYnEtV8krdSDlaIAtxg3PFmFsHkEbUykoPiP8=; b=oAtX+/jBU7h5Td
	yRq6OBBb00fVOpdcpxVt9QzqdCq4hdPZmRNp5YLovSZKmeY/xJVsVmahTLU3V/4NLnaYQwINj4OYr
	d68UxlPQ/iiGjUMQzCn4i+fZ1kwKEJYWjMnnSzDdhCbMI8wB6FlMZbTqomBSztPBJm6q/THIY61UC
	0nrqWwsqIWMIvxMlHQPdZCYnrx2mNfKu3GDiEg2v+ACcm7t3zwPq3g9flJy/sAl15RlbzEXINvCgL
	fY1ufDLKu9R+Sazd1R9JeuhbESUkmCEZO8j1q6Pya21RFi+joafpd+SXasUSPwOB8xCvmlGtnXnIx
	xeP+I27OeSPD47T9qHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWN3-00000006luT-1Emp;
	Mon, 26 Aug 2024 09:50:45 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ4-00000006kUx-0RNz
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 138ABC0013;
	Mon, 26 Aug 2024 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sob9VT6EPovz6W+AVQt+KTvzjfSlVrnl9DFkPaTm5XQ=;
	b=SuVI1Fc+k4QsOdqRov2dWuSRUxG7qrnMK7T0SFFCsmFEO5IBpVpOZu9V2Hb1zKbwDdqYbd
	ftXMnTkksrB1qHZyOmfeaOkqU2580LQBNs/DF2XVGOKO9EIYVy0nNQwXoi5F9zbDGQerTa
	Uia1k1wlVTv9XrK7XHc30cdTU0yYSHH5g6U1l1FDIQM1TVZZFa4gYPdxiW1PS5FVUYA7To
	bjJ7cgxHogByQgcadjth/Rno7vZWL4XRMjMVtYqot4Wt6jhwN6gUGXtSkUdd2moVyA3QX6
	3pcwPL8606p8AwIGvUV+23HyKKclJuXjbTSP94eOcmWileq0qBuP9fBubOKS/Q==
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
Subject: [PATCH mtd-utils 07/10] mtd-tests: flash_speed: Clarify the number of pages in each set while measuring
Date: Mon, 26 Aug 2024 11:46:26 +0200
Message-ID: <20240826094629.19065-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024638_583229_62EC029D 
X-CRM114-Status: GOOD (  12.36  )
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

So far speed calculations have only be done 1 page at a time or 2 pages
at a time in a block; so basically all the block was always read because
all blocks are multiple of 2. But in the future, if we want to extend
the number of pages in a single read, the final number of pages actually
read might be less than an erase block size, hence failing the throuput
calculations.

Make the number of pages in a set explicit.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index f542a8d..f161d6e 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -289,14 +289,17 @@ static long calc_duration(struct timespec *start, struct timespec *finish)
 	return ms;
 }
 
-static long calc_speed(struct timespec *start, struct timespec *finish)
+static long calc_speed(struct timespec *start, struct timespec *finish,
+		       int pages_per_set)
 {
 	long ms = calc_duration(start, finish);
+	int sets_in_eb = pgcnt / pages_per_set;
+	size_t sz = pgsize * pages_per_set * sets_in_eb;
 
 	if (ms <= 0)
 		return 0;
 
-	return ((long)goodebcnt * (mtd.eb_size / 1024L) * 1000L) / ms;
+	return ((long)goodebcnt * (sz / 1024L) * 1000L) / ms;
 }
 
 static void scan_for_bad_eraseblocks(unsigned int eb, int ebcnt, int ebskip)
@@ -357,7 +360,7 @@ static void *op_thread(void *ptr)
 	return (void *)err;
 }
 
-#define TIME_OP_PER_PEB( op )\
+#define TIME_OP_PER_PEB( op, npages )			\
 		start_timing(&start);\
 		for (i = 0; i < count; ++i) {\
 			if (bbt[i])\
@@ -367,7 +370,7 @@ static void *op_thread(void *ptr)
 				goto out;\
 		}\
 		stop_timing(&finish);\
-		speed = calc_speed(&start, &finish)
+		speed = calc_speed(&start, &finish, npages)
 
 int main(int argc, char **argv)
 {
@@ -428,13 +431,13 @@ int main(int argc, char **argv)
 			goto out;
 
 		puts("testing eraseblock write speed");
-		TIME_OP_PER_PEB(write_eraseblock);
+		TIME_OP_PER_PEB(write_eraseblock, 1);
 		printf("eraseblock write speed is %ld KiB/s\n", speed);
 	}
 
 	/* Read all eraseblocks, 1 eraseblock at a time */
 	puts("testing eraseblock read speed");
-	TIME_OP_PER_PEB(read_eraseblock);
+	TIME_OP_PER_PEB(read_eraseblock, 1);
 	printf("eraseblock read speed is %ld KiB/s\n", speed);
 
 	/* Write all eraseblocks, 1 page at a time */
@@ -444,13 +447,13 @@ int main(int argc, char **argv)
 			goto out;
 
 		puts("testing page write speed");
-		TIME_OP_PER_PEB(write_eraseblock_by_page);
+		TIME_OP_PER_PEB(write_eraseblock_by_page, 1);
 		printf("page write speed is %ld KiB/s\n", speed);
 	}
 
 	/* Read all eraseblocks, 1 page at a time */
 	puts("testing page read speed");
-	TIME_OP_PER_PEB(read_eraseblock_by_page);
+	TIME_OP_PER_PEB(read_eraseblock_by_page, 1);
 	printf("page read speed is %ld KiB/s\n", speed);
 
 	/* Write all eraseblocks, 2 pages at a time */
@@ -460,13 +463,13 @@ int main(int argc, char **argv)
 			goto out;
 
 		puts("testing 2 page write speed");
-		TIME_OP_PER_PEB(write_eraseblock_by_2pages);
+		TIME_OP_PER_PEB(write_eraseblock_by_2pages, 2);
 		printf("2 page write speed is %ld KiB/s\n", speed);
 	}
 
 	/* Read all eraseblocks, 2 pages at a time */
 	puts("testing 2 page read speed");
-	TIME_OP_PER_PEB(read_eraseblock_by_2pages);
+	TIME_OP_PER_PEB(read_eraseblock_by_2pages, 2);
 	printf("2 page read speed is %ld KiB/s\n", speed);
 
 	/* Erase all eraseblocks */
@@ -477,7 +480,7 @@ int main(int argc, char **argv)
 		if (err)
 			goto out;
 		stop_timing(&finish);
-		speed = calc_speed(&start, &finish);
+		speed = calc_speed(&start, &finish, 1);
 		printf("erase speed is %ld KiB/s\n", speed);
 	}
 
@@ -501,7 +504,7 @@ int main(int argc, char **argv)
 				i += j;
 			}
 			stop_timing(&finish);
-			speed = calc_speed(&start, &finish);
+			speed = calc_speed(&start, &finish, 1);
 			printf("%dx multi-block erase speed is %ld KiB/s\n",
 					blocks, speed);
 		}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
