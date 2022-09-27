Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78FEC6FA86
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K7FCOxhPoRVwg/s1sKuSm9WS6TzKrpGKcop0iPkjS1c=; b=DsHaLNjjXd3LRR1v9yhDAu1Vcn
	J1XceoT+ZMvqnf8B6IBPPi6z/ZwcM7B/7fBm6YIPJpYDN6wvLFYeaVlsJvoqSQbhBPX6X7fyDD6nG
	ZWkcyaZ26thLNmit3bn0jyC3pwKtf2hO0TSaLgjzKuYjI1PoxPubKCPkOsOufDPFF4UVqLZm2Gt18
	hzCyQayJfE1uYvpup5WxSDehha8noSHQ1MduLn+5ZJh3tnbqwn5yrVktLeNBOJIsCL3J46NMA7+NZ
	qAiEtlL5l8Ka/qlrnOU2OnuQ0HAZGEvBjNJh1+E7QN90ZmaL8m1ixsoaQmMIwR3zWTIdu7Op/laAj
	dn8hc3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odEYF-00BzPX-VY; Tue, 27 Sep 2022 17:39:24 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odEYD-00BzOA-9t
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 17:39:22 +0000
Received: by mail-pl1-x649.google.com with SMTP id n9-20020a170902d2c900b001782ad97c7aso6685244plc.8
        for <linux-mtd@lists.infradead.org>; Tue, 27 Sep 2022 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=LKa2EWOH75ZXoIQz8iJsf15zmXg+mcEaCfZdnIoCDl8=;
        b=GYnYXIqhIDBBrd9uswEbBLefhqiFuI3W4dE1JQ8t4ZePyjbWFuHxVP7oWd37h1++w/
         LWZj+xk6vpnHaWrC5ATggx6aUxoC5h14WSD1+EdoMuvrngQ0UsDTJi0CgvRY8nDZl6Mc
         tXHVm5d6SHnZI7Lu8Ubcxo9EHQQQF/oOkfTScfGuhiiJ+0DWO5NEcE3xxpkNakiF8mwt
         57xrFA9wH8XkgCGC1c1odivGOwxJ1WB6LrPtpewirWFQdlpq4T6In6tHiZC7jwUyQRaI
         cg8hRc7ikN4meIQ2bh2RY1aBvmJAGhw7apovwzddrcNunHn8VBf3EurZ509/3n+ciDfn
         DVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=LKa2EWOH75ZXoIQz8iJsf15zmXg+mcEaCfZdnIoCDl8=;
        b=5MVXpsUkjTinTMmlAjp1xcy0xMnD2KL2Om8xVBxG/EqP8oVAXFnYXk3wWbAEolqlgY
         tIRykbWKW09m7ZQ29J+1Hg8xiuUwRfYesfoAJdFz2t7KLuESkwDPVqAvNvT0EN/qyJ2E
         qfNm0j2iKoc3yoJ7mG1bcEtbK1XLeUamS3ZXhm9goIFI6tw3N7lEdbnUe08tzd0QACSV
         FC18s5lzikHAM99pTT1KQ64tFR0VqRqOrcLi68xZ299Z8ak1McAkcgW5P6V8bWgWz4LI
         Y6bG7XQVSR4Wdkki4ABp/x4808t4URYxaFaCzih1SLSEi0aHS6HO2EfPpAYlZKUV5tpJ
         pvoQ==
X-Gm-Message-State: ACrzQf3FcceDfsPNGWAHR2kpuFJawpJOeIN/xTTvMOni3bEHtcSTD27k
	oJtBwjuWDiVbBi/JbT6qcQcGIAFYu9Kq
X-Google-Smtp-Source: AMsMyM5J6i/YqOcI+hTNRY2P8XVevJYiVh4MV1n67GgcgyhzZsBzTNeLRFP9/gfvmoX+DNI1R3BjtZBhkXX+
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a17:90b:4a82:b0:200:a89e:6f1f with SMTP id
 lp2-20020a17090b4a8200b00200a89e6f1fmr5625770pjb.13.1664300359293; Tue, 27
 Sep 2022 10:39:19 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:38:45 +0000
In-Reply-To: <20220927173845.2293378-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20220927173845.2293378-1-sgzhang@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220927173845.2293378-3-sgzhang@google.com>
Subject: [PATCH v1 2/2] mtd: mtdoops: panic caused mtdoops to call mtd erase
 function immediately
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_103921_362326_C2D06ED1 
X-CRM114-Status: GOOD (  15.25  )
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

The panic function disables the local interrupts, preemption, and all
other processors. When the invoked mtdoops needs to erase a used page,
calling schedule_work() to do it will not work. Instead, just call mtd
erase function immediately.

Tested:
~# echo c > /proc/sysrq-trigger
[  171.654759] sysrq: Trigger a crash
[  171.658325] Kernel panic - not syncing: sysrq triggered crash
......
[  172.406423] mtdoops: not ready 34, 35 (erase immediately)
[  172.432285] mtdoops: ready 34, 35
[  172.435633] Rebooting in 10 seconds..

Signed-off-by: Ray Zhang <sgzhang@google.com>
---
 drivers/mtd/mtdoops.c | 66 ++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 84b21be347f6..73c6a55eb391 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -106,29 +106,8 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 	return 0;
 }
 
-static void mtdoops_inc_counter(struct mtdoops_context *cxt)
+static void mtdoops_erase(struct mtdoops_context *cxt)
 {
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
-{
-	struct mtdoops_context *cxt =
-			container_of(work, struct mtdoops_context, work_erase);
 	struct mtd_info *mtd = cxt->mtd;
 	int i = 0, j, ret, mod;
 
@@ -166,8 +145,8 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 		ret = mtdoops_erase_block(cxt, cxt->nextpage * record_size);
 
 	if (ret >= 0) {
-		pr_debug("mtdoops: ready %d, %d\n",
-			 cxt->nextpage, cxt->nextcount);
+		pr_notice("mtdoops: ready %d, %d\n",
+			  cxt->nextpage, cxt->nextcount);
 		return;
 	}
 
@@ -181,6 +160,41 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	goto badblock;
 }
 
+/* Scheduled work - when we can't proceed without erasing a block */
+static void mtdoops_workfunc_erase(struct work_struct *work)
+{
+	struct mtdoops_context *cxt =
+			container_of(work, struct mtdoops_context, work_erase);
+
+	mtdoops_erase(cxt);
+}
+
+static void mtdoops_inc_counter(struct mtdoops_context *cxt, int panic)
+{
+	cxt->nextpage++;
+	if (cxt->nextpage >= cxt->oops_pages)
+		cxt->nextpage = 0;
+	cxt->nextcount++;
+	if (cxt->nextcount == 0xffffffff)
+		cxt->nextcount = 0;
+
+	if (page_is_used(cxt, cxt->nextpage)) {
+		pr_notice("mtdoops: not ready %d, %d (erase %s)\n",
+			  cxt->nextpage, cxt->nextcount,
+			  panic ? "immediately" : "scheduled");
+		if (panic) {
+			/* In case of panic, erase immediately */
+			mtdoops_erase(cxt);
+		} else {
+			/* Otherwise, schedule work to erase it "nicely" */
+			schedule_work(&cxt->work_erase);
+		}
+	} else {
+		pr_notice("mtdoops: ready %d, %d (no erase)\n",
+			  cxt->nextpage, cxt->nextcount);
+	}
+}
+
 static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
@@ -214,7 +228,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	mark_page_used(cxt, cxt->nextpage);
 	memset(cxt->oops_buf, 0xff, record_size);
 
-	mtdoops_inc_counter(cxt);
+	mtdoops_inc_counter(cxt, panic);
 out:
 	clear_bit(0, &cxt->oops_buf_busy);
 }
@@ -279,7 +293,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 		cxt->nextcount = maxcount;
 	}
 
-	mtdoops_inc_counter(cxt);
+	mtdoops_inc_counter(cxt, 0);
 }
 
 static void mtdoops_do_dump(struct kmsg_dumper *dumper,
-- 
2.37.3.998.g577e59143f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
