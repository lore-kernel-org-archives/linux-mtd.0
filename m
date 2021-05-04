Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DAEC433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 06:21:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61648610FC
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 06:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61648610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FeqTes4m6nFwDdUesvm5BhITCzAyT0qbjlDBZQCTu/0=; b=TzYC/6zFC1fFFDcjx0Q3rywB2K
	FZuhkEPeyaLIJN6Nrux8hC10bamxU9ztDBBwgDWXEt+aBR3IrGf/o2NMW+anmlBvLtb85B0ZRFZVn
	dPiAV0zOtCKx6PyN+RKNtRDnRmyc379lQmAF8fuCQG1rl2d/jNVHSouSZ4VCZlVTY71GGr2n3ot8l
	Gtnb58Tl+3/Wt28BmG7S2+9+t16CWGAknTHf0SGJEUqxxAyteWHpp34jj5phNK0V0Kx489JYMYeJ8
	R/+YD17N4CsIgDylKUzonvJkRoyg0i9pQMBCOx495McmiQWBCoPVvJA+QfcG4HqEswAR9rMF7IkeM
	yQYM4mcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldoQn-00FXVF-KB; Tue, 04 May 2021 06:21:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldoQi-00FXUn-K9
 for linux-mtd@desiato.infradead.org; Tue, 04 May 2021 06:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=XvLhmui0DLBspUsebj9ZhiFb3OL3QLLsT0XxkJts9GM=; b=MSZ5LY7fKz+zOXAyWideHKnYtP
 N7wNJY35SojgE1OG2odQ6+2m3rhBW1JaFFaTwcr10XLFAKhcj/pzpUr10qrT4q6uX3DhpmNNYCsLl
 nvGCIvNaB82Zw4x3sY/sEAP24ggZnehMlZGlJp8qvG02fikgvE2mDCV94e67eATTvUAtLHv5TqgCw
 6rA9lFuJ6YTZslC+xqJJK5x/S/Qg53RYfqOsAYdwz9rfnoXPwdc/tpfGEPXtr1dzxgqvEHT0yNS+H
 vKDmIYqbhq2imSHV4znTEz1kABug5TFaL838WxkYfWylasGqJlFtp46iJYmS6h+bR2mTQ0x+nbUkj
 jWrjVHLw==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldoQf-003im1-JV
 for linux-mtd@lists.infradead.org; Tue, 04 May 2021 06:21:11 +0000
Received: by mail-pg1-x529.google.com with SMTP id m37so5833682pgb.8
 for <linux-mtd@lists.infradead.org>; Mon, 03 May 2021 23:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=XvLhmui0DLBspUsebj9ZhiFb3OL3QLLsT0XxkJts9GM=;
 b=n/88DwrSGVg+p/UJg/8TjC8QfENWmOxZ6mzWRtpaudIol2IiY6LubibGpSjCe8jyRR
 YJ8ePUA7cuM0EQkGk6ICv8QHtMulLmSmdkt9Q6mi2UtIoTNDtc55Bpt8DsGZi9+19wLM
 Iwh0Ek6NFBAEYNd1w7Y8El+1S0fyAqhJgLIl6xU4Hh8yAoaEm0Gcs4l+dY8NwQSD7PL1
 7ulR4nnbZ20H40iC1pilyG7iVcdsTviWgeLt8BZEYDBvRRa1EUWHHBg0SVHC0sQZtOHl
 gQdMyySawyX/6C7vx7edLj4Ql58f5Rw5BdByHahcR9SfUWf5nha7LGo+xIimGbJBsoiz
 KTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=XvLhmui0DLBspUsebj9ZhiFb3OL3QLLsT0XxkJts9GM=;
 b=il6Qf9n9WJv13abwTYD2uVnHdcDBV2zmQpHL6gNIgLiWpafA7MVL6Bd2ZcJ3dxdtGN
 8Ns7v8170wtwRgW2SBTTVB7ZlckbkUVrgKDbfoxu25dIE2jfcF/OWTwkn8oPFGm9uc6G
 v71VVLoHNCcFOVUeXsiXAJb8K+qyBde2J3dLT2cQfsZV85mmTBcS17zwve1ytgn1PxZj
 W1ecT5ubtGDAKAx3r5/g7QZZW11uBLJ4i8s5bHg8hPRrF5CONT1PzFw5LRZDpwJuxPoG
 jt25q/ixF153ceJ5vnFkKQukN5fhLYPqDkSP6OCBEIxTOGAvZjG+ADi9QgibddF3HT54
 ZNDg==
X-Gm-Message-State: AOAM5326xn8CvbzRVwBuK4QVBgGQ4uetoeCnF5LJt4BxRYQZu1Sb+aOD
 EItx4ss4brhSWFC146PefKI=
X-Google-Smtp-Source: ABdhPJwM0ko0KU5LpvTsmPaxv7/zz1yELmz+Zx7cOP30kAu9E5UbKS6PJIW4RsTjk9twkCjRsGylXA==
X-Received: by 2002:a17:90b:2393:: with SMTP id
 mr19mr3055929pjb.24.1620109267641; 
 Mon, 03 May 2021 23:21:07 -0700 (PDT)
Received: from localhost ([157.45.118.142])
 by smtp.gmail.com with ESMTPSA id t1sm11403542pjo.33.2021.05.03.23.21.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 May 2021 23:21:07 -0700 (PDT)
Date: Tue, 4 May 2021 11:50:59 +0530
From: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: mtd: sm_ftl.c: Fix alignment of block comment
Message-ID: <20210504062059.mywqzwveyjfawreg@kewl-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_232109_688476_F19B3741 
X-CRM114-Status: GOOD (  25.51  )
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

A star has been added to subsequent line of block comment
The closing */ has been shifted to new line
This is done to maintain code uniformity

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/mtd/sm_ftl.c | 51 +++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4d1ae25507ab..0cff2cda1b5a 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -265,7 +265,8 @@ static int sm_read_sector(struct sm_ftl *ftl,
 again:
 	if (try++) {
 		/* Avoid infinite recursion on CIS reads, sm_recheck_media
-			won't help anyway */
+		 * won't help anyway
+		 */
 		if (zone == 0 && block == ftl->cis_block && boffset ==
 			ftl->cis_boffset)
 			return ret;
@@ -276,7 +277,8 @@ static int sm_read_sector(struct sm_ftl *ftl,
 	}
 
 	/* Unfortunately, oob read will _always_ succeed,
-		despite card removal..... */
+	 * despite card removal.....
+	 */
 	ret = mtd_read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
 
 	/* Test for unknown errors */
@@ -411,9 +413,10 @@ static int sm_write_block(struct sm_ftl *ftl, uint8_t *buf,
 
 			/* If write fails. try to erase the block */
 			/* This is safe, because we never write in blocks
-				that contain valuable data.
-			This is intended to repair block that are marked
-			as erased, but that isn't fully erased*/
+			 * that contain valuable data.
+			 * This is intended to repair block that are marked
+			 * as erased, but that isn't fully erased
+			 */
 
 			if (sm_erase_block(ftl, zone, block, 0))
 				return -EIO;
@@ -448,7 +451,8 @@ static void sm_mark_block_bad(struct sm_ftl *ftl, int zone, int block)
 
 	/* We aren't checking the return value, because we don't care */
 	/* This also fails on fake xD cards, but I guess these won't expose
-		any bad blocks till fail completely */
+	 * any bad blocks till fail completely
+	 */
 	for (boffset = 0; boffset < ftl->block_size; boffset += SM_SECTOR_SIZE)
 		sm_write_sector(ftl, zone, block, boffset, NULL, &oob);
 }
@@ -505,7 +509,8 @@ static int sm_check_block(struct sm_ftl *ftl, int zone, int block)
 
 	/* First just check that block doesn't look fishy */
 	/* Only blocks that are valid or are sliced in two parts, are
-		accepted */
+	 * accepted
+	 */
 	for (boffset = 0; boffset < ftl->block_size;
 					boffset += SM_SECTOR_SIZE) {
 
@@ -554,7 +559,8 @@ static const uint8_t cis_signature[] = {
 	0x01, 0x03, 0xD9, 0x01, 0xFF, 0x18, 0x02, 0xDF, 0x01, 0x20
 };
 /* Find out media parameters.
- * This ideally has to be based on nand id, but for now device size is enough */
+ * This ideally has to be based on nand id, but for now device size is enough
+ */
 static int sm_get_media_info(struct sm_ftl *ftl, struct mtd_info *mtd)
 {
 	int i;
@@ -607,7 +613,8 @@ static int sm_get_media_info(struct sm_ftl *ftl, struct mtd_info *mtd)
 	}
 
 	/* Minimum xD size is 16MiB. Also, all xD cards have standard zone
-	   sizes. SmartMedia cards exist up to 128 MiB and have same layout*/
+	 * sizes. SmartMedia cards exist up to 128 MiB and have same layout
+	 */
 	if (size_in_megs >= 16) {
 		ftl->zone_count = size_in_megs / 16;
 		ftl->zone_size = 1024;
@@ -782,7 +789,8 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 		}
 
 		/* Test to see if block is erased. It is enough to test
-			first sector, because erase happens in one shot */
+		 * first sector, because erase happens in one shot
+		 */
 		if (sm_block_erased(&oob)) {
 			kfifo_in(&zone->free_sectors,
 				(unsigned char *)&block, 2);
@@ -792,7 +800,8 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 		/* If block is marked as bad, skip it */
 		/* This assumes we can trust first sector*/
 		/* However the way the block valid status is defined, ensures
-			very low probability of failure here */
+		 * very low probability of failure here
+		 */
 		if (!sm_block_valid(&oob)) {
 			dbg("PH %04d <-> <marked bad>", block);
 			continue;
@@ -803,7 +812,8 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 
 		/* Invalid LBA means that block is damaged. */
 		/* We can try to erase it, or mark it as bad, but
-			lets leave that to recovery application */
+		 * lets leave that to recovery application
+		 */
 		if (lba == -2 || lba >= ftl->max_lba) {
 			dbg("PH %04d <-> LBA %04d(bad)", block, lba);
 			continue;
@@ -811,7 +821,8 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 
 
 		/* If there is no collision,
-			just put the sector in the FTL table */
+		 * just put the sector in the FTL table
+		 */
 		if (zone->lba_to_phys_table[lba] < 0) {
 			dbg_verbose("PH %04d <-> LBA %04d", block, lba);
 			zone->lba_to_phys_table[lba] = block;
@@ -834,9 +845,9 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 		}
 
 		/* If both blocks are valid and share same LBA, it means that
-			they hold different versions of same data. It not
-			known which is more recent, thus just erase one of them
-		*/
+		 * they hold different versions of same data. It not
+		 * known which is more recent, thus just erase one of them
+		 */
 		sm_printk("both blocks are valid, erasing the later");
 		sm_erase_block(ftl, zone_num, block, 1);
 	}
@@ -845,7 +856,8 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 	zone->initialized = 1;
 
 	/* No free sectors, means that the zone is heavily damaged, write won't
-		work, but it can still can be (partially) read */
+	 * work, but it can still can be (partially) read
+	 */
 	if (!kfifo_len(&zone->free_sectors)) {
 		sm_printk("no free blocks in zone %d", zone_num);
 		return 0;
@@ -952,8 +964,9 @@ static int sm_cache_flush(struct sm_ftl *ftl)
 
 	/* If there are no spare blocks, */
 	/* we could still continue by erasing/writing the current block,
-		but for such worn out media it doesn't worth the trouble,
-			and the dangers */
+	 * but for such worn out media it doesn't worth the trouble,
+	 * and the dangers
+	 */
 	if (kfifo_out(&zone->free_sectors,
 				(unsigned char *)&write_sector, 2) != 2) {
 		dbg("no free sectors for write!");
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
