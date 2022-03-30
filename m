Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B50FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+4mvJlvKEm5pRVrrLujhJg2Kg64rcwB9Kp7L648XcJs=; b=ZvIDcNDJv5sebLzn6g+lhhzCRH
	w9fB7m25GS2Y/sPFu2MAXwnxDGgMaNdtQ8toChzK7gi5EYnOcTuRPd6ZZ73TnWbEMs6Gg4O7jxDZ0
	QymqT9EUAs2bAP24bMEmre4LASoTGyN5niDU8+DZ1ZEiSR2CAI3jBDpy9mp3vUIaRloyLwPLgNjeV
	QqB2cOyrQhWriIhssaLRYInSG1iTYoZBIvE48lmH12HVvK8hcmDu1K110qeZnSFC9JHRpuR5ctSkQ
	6MNZh54mFmGG3BhUnWic/3NV/M+NaF/NdkKDWHBYTzuaDDM1wSSkoJfhUz4ozmK75zUhL5pGfXir6
	bXRSUz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZd40-00H83j-0i; Wed, 30 Mar 2022 18:29:00 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZd3e-00H7wi-O4
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 18:28:40 +0000
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2ea05573995so101775237b3.8
 for <linux-mtd@lists.infradead.org>; Wed, 30 Mar 2022 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KfcUkaTckWUYUZ9aQp31D6YQqt9tokDiP9MkQHNDrEc=;
 b=VSSiIRlHk2quuVAOW2Z7xaW09hmCV7pBg92ysUgXNZLEpHs6ywnJe6abK25mO88cKI
 uGMeD+NghlCFc2FQ2UyirjrfptH5lqUqkfttIjjo/XEk5HdoRjAVn9mGT+vtJU64foFA
 AagKpYgaYlnQsEPPae2J+Qj9FYKaiwtXUwQxjOASYZPXEpFrvpNWZlVqea6yRtDvOWBK
 gU8K8hSAFTa5oQe1ktSSt4SDxa/bR0yJPED+Msz4++moo2HSBwbK3agZjzjq2ItMOBBo
 2LwQI3d/+SY+I15NSNX3M0fbtVT25xP1JmhNuOI0JY0XnxLZ7HVqlbNutYS3k1Csj0QZ
 4aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KfcUkaTckWUYUZ9aQp31D6YQqt9tokDiP9MkQHNDrEc=;
 b=TFSI8xbb5LR1RrVRZuNPntc0IkNYX1BPAQu2WHx9DighCoEyki3jT7ixDzGLs4U3o+
 Lq9tWOzNmsRjhieHP7T28aCVCXPPM5Al2/t1MkHRhjWt1D/8NgdAzDi7MyIA0xJmeTz9
 0NOWoWSwVWDvkoVZ6Tor0sX4CtngspqhLQH6NbmADBnnsieYnUJoy9Hk4ol/IEaRI2RL
 2tWoBSu5i14kLjMGyURKgQYyX9dWTpqu6HIewYhIhwszK9/jmiOYBBDOOpq55/6PGDKJ
 0LdsoC2Y2VYLfeOL9ufsouMnIRWFyBUcbJCaLkcLqN3rv3Q4kGgT4zAjcKwZoNoiig7+
 gzaA==
X-Gm-Message-State: AOAM531+j+2wCBFFtb5iNc2EJq3DOBPKQvBjBEwJum+DOCtxdiVOvbSQ
 DJQS3CBo7daTasi+vZHiJt2vGrDPxrXM
X-Google-Smtp-Source: ABdhPJyVW2ytMhj6Q4XtA6yzFixRhf4Yh+fFRBPhl1KuBAdL+CRox9+LHBCljq0H/ihZ7kDSEcGZrww7dP8Q
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:1db:3f32:3ad1:f38])
 (user=jmeurin job=sendgmr) by 2002:a25:dd87:0:b0:628:e822:bd with SMTP id
 u129-20020a25dd87000000b00628e82200bdmr888447ybg.505.1648664916670; Wed, 30
 Mar 2022 11:28:36 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:28:16 -0700
In-Reply-To: <20220330182816.1177341-1-jmeurin@google.com>
Message-Id: <20220330182816.1177341-4-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220330182816.1177341-1-jmeurin@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v2 2/2] mtd: mtdoops: Create a header structure for the saved
 mtdoops.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_112838_814875_2F4C94E4 
X-CRM114-Status: GOOD (  15.93  )
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

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 53 +++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 09a26747f490..9ca82c2dbf60 100644
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
 			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
-			       page * record_size, retlen,
-			       MTDOOPS_HEADER_SIZE, ret);
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
2.35.1.1094.g7c7d902a7c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
