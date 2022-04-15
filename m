Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6493C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 00:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KAV3dH4dEuXh8lXqI38F27Mo7q80px+FNgiOBDU6nXQ=; b=sDGpgk73QzIzCn5J59SkjNXNaA
	MUYmPr29G5KE6saFmoj7PfkUxRzQ3DX2MVMYE0ZzmdagquaZdx9800OnYdLS7VBi6Qrs4wMKB6DAR
	mFscQ6TfIhE+FmPwtFO6yNbmB0mzYSspjtanjl6JTBmdtDKQp6xbu6ELUf6lXKBNu4SJthI8x6wx+
	iXLbPqqFSmG6cfrHZDPLSTcn6MVsWazzGILdVPPA4gqKe08T8SGpN/hkS6O58c288ZvyesfbMbmW3
	nV2sCTgcfjWfF21ylQCEg8IcY+3RYaMkajMXO3N5LImVtcg1HFwXwKGJomb7m0Y2A+rdEVaoEzgZi
	MT6c6tCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9bL-007rgD-1K; Fri, 15 Apr 2022 00:14:15 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9bH-007rew-RP
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 00:14:13 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 e4-20020a056902034400b00633691534d5so5596272ybs.7
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 17:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=j+3tJjiCf78FCu6r+r65AdoN2KDRFod1PmLEraQ3coY=;
 b=Caezxcdf/vNIhgSMCI6hmDKw41eI/IzIh12p3HqrzYy5BdmkRG+GsLLOhcXFMGq52d
 3KFCwvz/AoUPz+l3+sm8mXAf5PozArFFzJ4m+Zc4phpLh7pM4DEkdrY2z4N2lzvh/I91
 oqthovmJ955Vr9DosTQHL4tWD3y1s/m95U8l5w8+091pwxD0ZzbZKXcdAP6fXbDxewqc
 5EGzuIT/q6kTl0dYwGeln0DNf7bQwGvt4r2mSNmCfYam7HwhcRMmxc/a+nt50UvKFHZ5
 ydwwD0u3cRCLONs7Ry1zb1hgIqQ1HJ/4AbfBZ59BgN0aWbxiebdJ3XQCMUYtmKhs64ZX
 oKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=j+3tJjiCf78FCu6r+r65AdoN2KDRFod1PmLEraQ3coY=;
 b=mbd8Pipe7hVYreStn8oxRb7qO8kjmb4he6mTtB2XUlDqTXirMxiIP9Y8EnK0tZZ70x
 1EXV1ah+mcZ2N7bi32/ZIC55KoEkkF7sIn9WVxm3vFJvvIL+hrxALd8Mc3bFYXti/mpu
 j39Fpz05/UbwJJ81hL7zvCScGdaHjjuOlQ06BYLvbkGoocxIBeWnN2lw4r1O+wE1CES/
 FA6WcUI/t1SeU+H2B8nfdQR+zs96CjCx7Y+Zo7GByweqaQtoqAQnRiY+kfflMssLrfMc
 h9gcZE58U4J6jz09H5wMhNPhQaelQ4MNO5qW+ZYcWd3Do3eMH6+ENZfGGUR0flDcbBL3
 Ye/w==
X-Gm-Message-State: AOAM533A82A/b8JRS14k1lOBBOwlnED84kNalQLBF7qlqu4QzpKbre/e
 //q3xBvieHl5uIumPYp4mnnQJ3PecILu
X-Google-Smtp-Source: ABdhPJyvaWs/ucoEhalwvhW30u3+I0YIcXElUI1onpLQMvainyojc+8EwtVbGmuj+WqtK6/BNgz7CR/ycm13
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:7d77:8cae:9dfe:95c])
 (user=jmeurin job=sendgmr) by 2002:a05:6902:72a:b0:641:283b:3946 with SMTP id
 l10-20020a056902072a00b00641283b3946mr3679439ybt.469.1649981649814; Thu, 14
 Apr 2022 17:14:09 -0700 (PDT)
Date: Thu, 14 Apr 2022 17:13:20 -0700
In-Reply-To: <20220415001321.252848-1-jmeurin@google.com>
Message-Id: <20220415001321.252848-3-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220415001321.252848-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH v3 2/3] mtd: mtdoops: Create a header structure for the saved
 mtdoops.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_171411_925716_DE7A095A 
X-CRM114-Status: GOOD (  16.45  )
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

Create a dump header to enable the addition of fields without having
to modify the rest of the code.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 55 +++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 09a26747f490..f80468ef31c6 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -22,9 +22,6 @@
 /* Maximum MTD partition size */
 #define MTDOOPS_MAX_MTD_SIZE (8 * 1024 * 1024)
 
-#define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define MTDOOPS_HEADER_SIZE   8
-
 static unsigned long record_size = 4096;
 module_param(record_size, ulong, 0400);
 MODULE_PARM_DESC(record_size,
@@ -40,6 +37,13 @@ module_param(dump_oops, int, 0600);
 MODULE_PARM_DESC(dump_oops,
 		"set to 1 to dump oopses, 0 to only dump panics (default 1)");
 
+#define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
+
+struct mtdoops_hdr {
+	u32 seq;
+	u32 magic;
+} __packed;
+
 static struct mtdoops_context {
 	struct kmsg_dumper dump;
 
@@ -178,16 +182,16 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
-	u32 *hdr;
+	struct mtdoops_hdr *hdr;
 	int ret;
 
 	if (test_and_set_bit(0, &cxt->oops_buf_busy))
 		return;
 
 	/* Add mtdoops header to the buffer */
-	hdr = cxt->oops_buf;
-	hdr[0] = cxt->nextcount;
-	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
+	hdr = (struct mtdoops_hdr *)cxt->oops_buf;
+	hdr->seq = cxt->nextcount;
+	hdr->magic = MTDOOPS_KERNMSG_MAGIC;
 
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
@@ -222,8 +226,9 @@ static void mtdoops_workfunc_write(struct work_struct *work)
 static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
+	struct mtdoops_hdr hdr;
 	int ret, page, maxpos = 0;
-	u32 count[MTDOOPS_HEADER_SIZE/sizeof(u32)], maxcount = 0xffffffff;
+	u32 maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
@@ -231,32 +236,31 @@ static void find_next_position(struct mtdoops_context *cxt)
 			continue;
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-		ret = mtd_read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
-			       &retlen, (u_char *)&count[0]);
-		if (retlen != MTDOOPS_HEADER_SIZE ||
+		ret = mtd_read(mtd, page * record_size, sizeof(hdr),
+			       &retlen, (u_char *)&hdr);
+		if (retlen != sizeof(hdr) ||
 				(ret < 0 && !mtd_is_bitflip(ret))) {
-			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
-			       page * record_size, retlen,
-			       MTDOOPS_HEADER_SIZE, ret);
+			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %ld read), err %d\n",
+			       page * record_size, retlen, sizeof(hdr), ret);
 			continue;
 		}
 
-		if (count[0] == 0xffffffff && count[1] == 0xffffffff)
+		if (hdr.seq == 0xffffffff && hdr.magic == 0xffffffff)
 			mark_page_unused(cxt, page);
-		if (count[0] == 0xffffffff || count[1] != MTDOOPS_KERNMSG_MAGIC)
+		if (hdr.seq == 0xffffffff || hdr.magic != MTDOOPS_KERNMSG_MAGIC)
 			continue;
 		if (maxcount == 0xffffffff) {
-			maxcount = count[0];
+			maxcount = hdr.seq;
 			maxpos = page;
-		} else if (count[0] < 0x40000000 && maxcount > 0xc0000000) {
-			maxcount = count[0];
+		} else if (hdr.seq < 0x40000000 && maxcount > 0xc0000000) {
+			maxcount = hdr.seq;
 			maxpos = page;
-		} else if (count[0] > maxcount && count[0] < 0xc0000000) {
-			maxcount = count[0];
+		} else if (hdr.seq > maxcount && hdr.seq < 0xc0000000) {
+			maxcount = hdr.seq;
 			maxpos = page;
-		} else if (count[0] > maxcount && count[0] > 0xc0000000
+		} else if (hdr.seq > maxcount && hdr.seq > 0xc0000000
 					&& maxcount > 0x80000000) {
-			maxcount = count[0];
+			maxcount = hdr.seq;
 			maxpos = page;
 		}
 	}
@@ -287,8 +291,9 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 
 	if (test_and_set_bit(0, &cxt->oops_buf_busy))
 		return;
-	kmsg_dump_get_buffer(&iter, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
-			     record_size - MTDOOPS_HEADER_SIZE, NULL);
+	kmsg_dump_get_buffer(&iter, true,
+			     cxt->oops_buf + sizeof(struct mtdoops_hdr),
+			     record_size - sizeof(struct mtdoops_hdr), NULL);
 	clear_bit(0, &cxt->oops_buf_busy);
 
 	if (reason != KMSG_DUMP_OOPS) {
-- 
2.36.0.rc0.470.gd361397f0d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
