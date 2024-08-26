Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6651C5472E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZykWKGKouI4IU6Cy/xL8VwM8q/dcbIqyjSVBVPkMOE=; b=FFTHlh25PoH4BW
	vmw2ri925/FoJVNtiY2k1dLlsAq2NoMfOIN7c2yHoG2u5AdR8/31VFc305O0qDC0YJT2peP8TMCA0
	w2xXJRmvRdwngV9/iS8XDNEjaCd7a1zAiNIdBYP/CxOhhQB+OJzI+2wWJg8W2WNCipcEXd0t7TTi3
	ow8ekBsO/ZRLwuEJx8pajWfl9lYq7tn4n1aE2ukIqqm7VD3zJVtItmmiMXKzfooCqLvLi7eqZkDbr
	4xO12L7wnkVrJcOeHDrb2hQerjmgH8WqCumFfk/i2HcxAy5trPGYxnsevWQqyd1a8Hum+zRGejToo
	1iMffJVrrumnlVgJ+//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWN5-00000006lwt-46at;
	Mon, 26 Aug 2024 09:50:47 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ4-00000006kVH-3IJE
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4B0DC0014;
	Mon, 26 Aug 2024 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPPvh/MuYoTpRzKw7HtQSZzmnK49i2gb/XwVx8RWVRI=;
	b=n8TpKREldnKDeaSr5mA6P/ExV/B8eSzCUwlIER9fXq3iMAInCY6ht61H8TGg7RjJZHirw5
	J0h1X8fjNvBTyJvDXlcXQnShlSxXMPSiACbWlddcMTm07a59yHb52f3kMJzTfv3lNeY1gD
	m8VF3gs0P/4XT097EP+kCyJmBQmxoxyb73XTKssF3XN61ASYDWI1I3ASludHLI8wFlFLiv
	3EkTpASTcHoH42gFTZnabzKegu76PpRSxMJMyBpES1Sm+A544khKdJdTDq+0r23QChHRWm
	KKoXi2vVwOy7pNbnyk5zl6nKVTT5Cn2W9WY38bl2tfs58TlAik4Smbv9MeyVIw==
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
Subject: [PATCH mtd-utils 08/10] mtd-tests: flash_speed: Generalize read_eraseblock_by_2pages()
Date: Mon, 26 Aug 2024 11:46:27 +0200
Message-ID: <20240826094629.19065-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024639_212884_74B27CD1 
X-CRM114-Status: GOOD (  12.96  )
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

Right now there are only 2 pages that may be read continuously, but why
not trying more? At least when the continuous feature is out, this type
of benchmarking will be interesting. In order to facilitate later
additions, lets make this helper more generic and accept a global
'npages' variable as parameter (because this function is called in a
macro, it is simpler like that).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index f161d6e..6df0568 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -47,6 +47,7 @@ static const char *mtddev;
 static libmtd_t mtd_desc;
 static int fd;
 
+static int npages = 1;
 static int peb=-1, count=-1, skip=-1, flags=0, speb=-1;
 static struct timespec start, finish;
 static int pgsize, pgcnt;
@@ -250,17 +251,17 @@ static int read_eraseblock_by_page(int ebnum)
 	return err;
 }
 
-static int read_eraseblock_by_2pages(int ebnum)
+static int read_eraseblock_by_npages(int ebnum)
 {
-	int i, n = pgcnt / 2, err = 0;
-	size_t sz = pgsize * 2;
+	int i, n = pgcnt / npages, err = 0;
+	size_t sz = pgsize * npages;
 	void *buf = iobuf;
 
 	for (i = 0; i < n; ++i) {
 		err = mtd_read(&mtd, fd, ebnum, i * sz, iobuf, sz);
 		if (err) {
-			fprintf(stderr, "Error reading block %d, page %d + %d!\n",
-					ebnum, i*2, i*2+1);
+			fprintf(stderr, "Error reading block %d, page [%d-%d]!\n",
+				ebnum, i*npages, (i*npages) + npages- 1);
 			return err;
 		}
 		buf += sz;
@@ -469,7 +470,8 @@ int main(int argc, char **argv)
 
 	/* Read all eraseblocks, 2 pages at a time */
 	puts("testing 2 page read speed");
-	TIME_OP_PER_PEB(read_eraseblock_by_2pages, 2);
+	npages = 2;
+	TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
 	printf("2 page read speed is %ld KiB/s\n", speed);
 
 	/* Erase all eraseblocks */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
