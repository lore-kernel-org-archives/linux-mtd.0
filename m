Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DA3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 21:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i+owa+RLMoVjEyt1mXdzEZ8rJW/gaeitl+75AxwAKrA=; b=rvl9ZKlNGgLFe1NbhHfffMq1JM
	RhEFRqEAvfj4wcn5yxvWDsjCLLuOtTSaptO5TCNanbPnCOvCGJidUfrG4neZyRq1aIgajbc8EcrOK
	bqwoG+DEyGKhGkox5t+Q3cukQAa6akK820+DGx21E9q2yZsON2e73YZCrSMw4SmyyEWdC9Yt9Nhmz
	foh3A6s2R5d6+9OWfYuo1DfA9WVRGIuQIFoe+/Y1gCWmZQlqhytDNJXHqcxTgK6JW/kqQhOydY02d
	5w4H6BGtuaJLyUy2bjPhkl7Czrcpq+c2sTKl4B7AWIjGUzVR37ZENpcpJ2+L0NfDrpeqJlTC9uSxm
	gMu8Kjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEy-00Ahnd-LM; Fri, 07 Oct 2022 21:50:44 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEt-00Ahm8-8c
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 21:50:40 +0000
Received: by mail-pg1-x549.google.com with SMTP id h2-20020a656382000000b0044b0f6c572fso3522100pgv.20
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YShywGeqIZDpcBEaSHQ5rYoxj4sM6AIZww6UQ+coyfI=;
        b=VufppTi/zTzcgJl8M5k3Qo0rrMpdXQ7MaXZNshLoY/sbxKgJxiBSNUo53okQsrIMQ8
         K8WepTsrKar3kAQdWZ8H2+JHQ6LSm6saglhTpf59oEbnR51yl4CoZtwJL4bT1YFQU5/I
         7Gp/hE5vdM1mU74x7fszg1vduNPvfFqOmEHSuA1cN78ZcZ/M+dF+XGCysrFPjz0aVSUZ
         37eJ6a8HPdiqPL/P7jlNDmQscPz+xtLja+RY3lwMCxmDxLGEtlHMM4E0FBgtJ3CbR0rO
         Ez5q7Q4qdYVxRmI2viYkYAceH2+d84IrHcTzknjj1SwnD/W74ZrfDPM0MmRslc5adzFo
         t92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YShywGeqIZDpcBEaSHQ5rYoxj4sM6AIZww6UQ+coyfI=;
        b=Prk1f9QEg1lJiPMZHVYxfVwnCy2JcvBxrPE2G5Q3V6LCbGrDQ4VJr5xJJg4D4ME8bI
         OtC+5f6uABJarx6GIKjVUJ+9kRvPciws7nT9itA9bMBXQDF+fjqcJjcAiuEbp4ARnmL+
         OiEpWRUt4ReGNN8vsSdnpbyZZYnf/WQAkA1KeELABShif4vJ4gICthfZ0gAQEOrvV8aE
         pn9BXfBfA3+JRJ2vQSgFD4aH4tO4byQeRWu2BaotXk33cRBSqwilO/HXJYrUuvRFUC3s
         rX1ltuB1MC5tzwiRpQcF/94vXrV8hq31yn14svzfPzg39atTsCrfLX+wrpTiOU8djSQZ
         vZVQ==
X-Gm-Message-State: ACrzQf0k7VyFTGwk84ke58rt0sqMZvZtIDt5U9TRcWCc+2tg/X3K1Xqt
	70J67545whzyGdPBnZWWO/raABnXqUC+
X-Google-Smtp-Source: AMsMyM610GlblJ5qz7nDt6pqrmJNd6MKkeco80561o7UBTOIC1K0FzFCcI8o7gb1qY1Vo5SrBLpr/FNI7KUo
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a05:6a00:8cc:b0:52c:7ab5:2ce7 with SMTP id
 s12-20020a056a0008cc00b0052c7ab52ce7mr7201971pfu.28.1665179437858; Fri, 07
 Oct 2022 14:50:37 -0700 (PDT)
Date: Fri,  7 Oct 2022 21:50:26 +0000
In-Reply-To: <20221007215027.918507-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221007215027.918507-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007215027.918507-3-sgzhang@google.com>
Subject: [PATCH v3 2/3] mtd: mtdoops: add mtdoops_erase function and move
 mtdoops_inc_counter to after it
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_145039_339782_654BB876 
X-CRM114-Status: GOOD (  13.05  )
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

Preparing for next patch with minimal code difference, add mtdoops_erase
function and move mtdoops_inc_counter to after it, with no functional
change.

Signed-off-by: Ray Zhang <sgzhang@google.com>
---
 drivers/mtd/mtdoops.c | 49 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 84b21be347f6..eca48dff9b53 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -106,29 +106,8 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 	return 0;
 }
 
-static void mtdoops_inc_counter(struct mtdoops_context *cxt)
-{
-	cxt->nextpage++;
-	if (cxt->nextpage >= cxt->oops_pages)
-		cxt->nextpage = 0;
-	cxt->nextcount++;
-	if (cxt->nextcount == 0xffffffff)
-		cxt->nextcount = 0;
-
-	if (page_is_used(cxt, cxt->nextpage)) {
-		schedule_work(&cxt->work_erase);
-		return;
-	}
-
-	pr_debug("mtdoops: ready %d, %d (no erase)\n",
-		 cxt->nextpage, cxt->nextcount);
-}
-
-/* Scheduled work - when we can't proceed without erasing a block */
-static void mtdoops_workfunc_erase(struct work_struct *work)
+static void mtdoops_erase(struct mtdoops_context *cxt)
 {
-	struct mtdoops_context *cxt =
-			container_of(work, struct mtdoops_context, work_erase);
 	struct mtd_info *mtd = cxt->mtd;
 	int i = 0, j, ret, mod;
 
@@ -181,6 +160,32 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	goto badblock;
 }
 
+/* Scheduled work - when we can't proceed without erasing a block */
+static void mtdoops_workfunc_erase(struct work_struct *work)
+{
+	struct mtdoops_context *cxt =
+			container_of(work, struct mtdoops_context, work_erase);
+	mtdoops_erase(cxt);
+}
+
+static void mtdoops_inc_counter(struct mtdoops_context *cxt)
+{
+	cxt->nextpage++;
+	if (cxt->nextpage >= cxt->oops_pages)
+		cxt->nextpage = 0;
+	cxt->nextcount++;
+	if (cxt->nextcount == 0xffffffff)
+		cxt->nextcount = 0;
+
+	if (page_is_used(cxt, cxt->nextpage)) {
+		schedule_work(&cxt->work_erase);
+		return;
+	}
+
+	pr_debug("mtdoops: ready %d, %d (no erase)\n",
+		 cxt->nextpage, cxt->nextcount);
+}
+
 static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
