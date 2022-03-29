Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 22:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YdJrdA7jZIdSrDjU+sYSguCFyYC/bFrzPXXJuEUqWf8=; b=LNF
	kVP5WFb20WjnUkZ6FE/YUDRoNVQFjAWXWyCE8EGYYIdW0ISboWHh4t+BoCvLkf9Qce9zG9vpayv7L
	X9sqbjNMmNvc8kXoE9I2KGyoAbsYK7Bx+TB28F96Av6nIChn9b3yeBJK5GhRzb+AtMV+N8MDN5ELn
	kvJ707WLDP7G1jmfO5BkeeVJPHcf9BE3lDQd3QY5LIBBIpszFhFv2CMoc2adR/XNi2h6ZD+NqRKAy
	SMnFF2mhVrnLX/5U7kutJbYO3Xj4vQ8Qt5nvI4JFzKJTeoAS5WoOLcalhGhu3CQc3j5o1SJB+HHhG
	KC4q4pTsqb1OuvtQAhF1bcF0XE6n9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZKif-00Dg5S-L3; Tue, 29 Mar 2022 22:53:45 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZKid-00Dg4e-41
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2022 22:53:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2e6aaf57a0eso149753187b3.11
 for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2022 15:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=SzAb5E3ABDSvH+2ozGaLa0QM9bLWPv1NLfKOiNeNHW0=;
 b=hLuWt3Wh6c1WKbkWz2FXUQtO9uWwj1vJSmaOgqaqeZhJstAmkHfUjufdCCD4s/ZcsN
 a2u40ugbMbDuuh9+A8tFgwhdzgRquqAJgVsS4q8q9rcxJH5GTwRC3vni5+RfSL2VJBRO
 etrPRLrucKoEgdUayyiPfNA98+1CmHws5IZlqSotuJfeheZOKxbvAyasutiuXCs/IBOU
 nuAB2hzUKnUATdSEAIGQYGHSQMrNAA9Mct1u0B9yX39e+a/P0iS4r1nApHnl2rUORuWj
 3/Mdluwzl0yamL5er0zOG94AdQDZqtych0dkQ9+esBGPIDNIvpA1pC+Ep397wEmyP1V2
 cP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=SzAb5E3ABDSvH+2ozGaLa0QM9bLWPv1NLfKOiNeNHW0=;
 b=7XMyYknbWBibWhOa1OTkDpm5PNKmHpDYxtsYBDkVwLmGhJB4hTen69LZdONotVJBe2
 fdBJFvnp0aEwvYUb7MhCuwgTi0lFO31tM/EOTNZ87Yu9bjM2VdXMKIzAk2CBpMy9rQHq
 ytnbdzd/OLO0fX9FAVJvpa02A5OgS16CL7KNL4HPtsuaSGFOaVJdtdExnUPZ/S9ai2vh
 VbmhJgcdWx7tSUy3gqDBvW0dRUK1BGdMT7fUSIe5lVu39p945MXyO8W0YE6tW+xJQi8I
 1hs6aY84QEON6zUM3AL6QX3Lx5IHSNRNcm99U2Udp7mxgXle5GTBCsOesLdp6AvX+74k
 Vjng==
X-Gm-Message-State: AOAM530n0yM9ze2/PGJp1O364kB05UnorjGk00NTHqrxg3jU+JSDJeYV
 4Dsw30IxByTcna0Aemceiy05LTuwWU+K
X-Google-Smtp-Source: ABdhPJwi/lpJr0Q8f1NyiiOQaOVbt13viRmpl1VWnPjkgS0XIaJgmVzLfNxzE9JQhfqZ2o36j+Y/PlMHT2MI
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:4a29:1258:961f:3676])
 (user=jmeurin job=sendgmr) by 2002:a25:3796:0:b0:633:7633:941f with SMTP id
 e144-20020a253796000000b006337633941fmr30268972yba.518.1648594419425; Tue, 29
 Mar 2022 15:53:39 -0700 (PDT)
Date: Tue, 29 Mar 2022 15:53:28 -0700
Message-Id: <20220329225328.396209-1-jmeurin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [PATCH] Create a proper header for the saved mtdoops.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_155343_187566_FDFD0781 
X-CRM114-Status: GOOD (  16.70  )
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

Avoid a panic if the header size changes.
Add a timestamp to the oops header.

Tested:
Triggered panic saved correctly:
xxd -l 0x20 -s 0x0000 /dev/mtdblock1
00000000: 0100 0000 005e 005d 935d 4117 c5bf df16  .....^.].]A.....
00000010: 3c36 3e5b 2020 3133 392e 3938 3039 3533  <6>[  139.980953

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 57 +++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 227df24387df..6a51baa172ae 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -16,15 +16,13 @@
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/timekeeping.h>
 #include <linux/mtd/mtd.h>
 #include <linux/kmsg_dump.h>
 
 /* Maximum MTD partition size */
 #define MTDOOPS_MAX_MTD_SIZE (8 * 1024 * 1024)
 
-#define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define MTDOOPS_HEADER_SIZE   8
-
 static unsigned long record_size = 4096;
 module_param(record_size, ulong, 0400);
 MODULE_PARM_DESC(record_size,
@@ -40,6 +38,14 @@ module_param(dump_oops, int, 0600);
 MODULE_PARM_DESC(dump_oops,
 		"set to 1 to dump oopses, 0 to only dump panics (default 1)");
 
+#define MTDOOPS_KERNMSG_MAGIC 0x5d005e00
+
+struct mtdoops_hdr {
+	u32 seq;
+	u32 magic;
+	ktime_t timestamp;
+} __packed;
+
 static struct mtdoops_context {
 	struct kmsg_dumper dump;
 
@@ -178,16 +184,18 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
-	u32 *hdr;
+	struct mtdoops_hdr *hdr;
 	int ret;
+	ktime_t ktime = ktime_get_real();
 
 	if (test_and_set_bit(0, &cxt->oops_buf_busy))
 		return;
 
 	/* Add mtdoops header to the buffer */
-	hdr = cxt->oops_buf;
-	hdr[0] = cxt->nextcount;
-	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
+	hdr = (struct mtdoops_hdr *)cxt->oops_buf;
+	hdr->seq = cxt->nextcount;
+	hdr->magic = MTDOOPS_KERNMSG_MAGIC;
+	hdr->timestamp = ktime_get_real();
 
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
@@ -222,8 +230,9 @@ static void mtdoops_workfunc_write(struct work_struct *work)
 static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
+	struct mtdoops_hdr hdr;
 	int ret, page, maxpos = 0;
-	u32 count[2], maxcount = 0xffffffff;
+	u32 maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
@@ -231,32 +240,31 @@ static void find_next_position(struct mtdoops_context *cxt)
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
@@ -287,8 +295,9 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 
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
2.35.1.1021.g381101b075-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
