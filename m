Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC29BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g1cl+crMK69ifLwX7tDYoZuN2T5+TT4JuhZEheZc5rY=; b=Li2b6nGcsEtTkoQx6ecWhH+4oj
	qtj66rZfwmS4lSxYPsfyiEUOr1HgiuFzR5TBrg2DHNPh4cF2DXEFStJVA+BPOXDgDS68wdYulwKvt
	hrFDUmMn75Ly+aSDesxhm/gT3ad6QaL55kQYo0r671x9qR2aBmua0Zje4Bg5k/ZXz1Ourj6wL11Ek
	ZGxC5lIltq+cg39cMNE5MBhnmyfQ+iZXWOR/Jat7Qm6tK7MKvENPwusQ6OHOBDrxAcu5wjkuzbn6Q
	HdehG6ZzuG/l+uVVqUp1Yhu3PoyddS2uMsSRv906+5Bq9nBCEEK8yeYuTNYZ19aoynUrO+p7QijTR
	ikrEF8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhgSj-00FOwv-Fw; Thu, 21 Apr 2022 23:43:49 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhgS8-00FOBH-0F
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 23:43:13 +0000
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2ebfdbe01f6so56677357b3.10
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 16:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=myMDMKdVsTUHxaypbD7172QTtUMmtXBxvBa5y/ti77g=;
 b=jgxWYzm+ZwZXhu/e4xL3THPRRXHCL60MAa6EjKdNJW9g2M6QMhILoqmVde/AMJG4p+
 Dg7zUTRVDVU88tSAWrthchL6pWc94LL7Ou/P6wESjwTNSevu5rcrZFu0Dz+v5nWkU5Jl
 hhbA9Eg7n4TYKxWKkK1dWmRhAhmNcSl6kgs7eu0yN0LNDzWhL3GnFd5itHnb+BlyOi39
 lxnR4Jb3ZrfO38ljCNtDyeRYD6yrTP9O6r+ZqLcbfGbjg3JfQBx/GJmPauMeFAfTM6ez
 syEoiI9cKQgzPLN75HjoAURjKhx5iTvgTg79rgtO5+ET0/ySFKNH2l1CadTCb/unGUDf
 zo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=myMDMKdVsTUHxaypbD7172QTtUMmtXBxvBa5y/ti77g=;
 b=NCMW8ucn3iwlA0epP6gru19BTQ2NRTTk8G23O3QhLwa3dhHfYfKgaq4Cesy7pY/Czk
 lTcD6KUW7NxZgGyb8pe6T5UfQooXTXfrAUn7bNUfoZPYJ/BlQ+imIS8ra9CULmNy0o9I
 X9rWrv1DxI+EI8qGZrYVieVH5h1VRZR+vK0ieNkn1obD0MOaa8sfuIZ9Pe60gWir/cn4
 OQ/GL7jDkTNYElqHIO9YE94siAXATirTCxcfJs5wKcX3RV9pS67F420UdwKe/E1+dmeX
 PMRepKNLkxFvYkRK6hPewd59kuEjAHmop28wRYuGTEByJjBcLD6P2OI2N7gyy/6edCMo
 Ubgg==
X-Gm-Message-State: AOAM533VRKvyWGmRrIoQ9BPYVRx/UCy61ndhUXelE4PiuIJsJEWTYmHe
 nSPyhOUycVXcNDKvmtT55m9LsflzfRML
X-Google-Smtp-Source: ABdhPJzbFwFAziteUUrfdOqYxPCEmwOQY3+aOZ9qVkVeLoYT0dOxtqHL92kTmgSiVYk6d3AmnK9RHd6ptq24
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:fcea:37a0:4467:e04f])
 (user=jmeurin job=sendgmr) by 2002:a05:6902:1505:b0:644:c443:8898 with SMTP
 id q5-20020a056902150500b00644c4438898mr2169810ybu.601.1650584589528; Thu, 21
 Apr 2022 16:43:09 -0700 (PDT)
Date: Thu, 21 Apr 2022 16:42:43 -0700
In-Reply-To: <20220421234244.2172003-1-jmeurin@google.com>
Message-Id: <20220421234244.2172003-3-jmeurin@google.com>
Mime-Version: 1.0
References: <20220415001321.252848-1-jmeurin@google.com>
 <20220421234244.2172003-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 2/3] mtd: mtdoops: Create a header structure for the saved
 mtdoops.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_164312_095180_76ACF8F4 
X-CRM114-Status: GOOD (  16.76  )
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
index 09a26747f490..186eeb01bee1 100644
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
+			printk(KERN_ERR "mtdoops: read failure at %ld (%zu of %zu read), err %d\n",
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
2.36.0.rc2.479.g8af0fa9b8e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
