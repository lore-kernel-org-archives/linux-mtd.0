Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9DAC43217
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 06:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MtvZUAQKMXxopvB7SZqBpNkHk54zTYph25pUMOK+nnA=; b=qL1F9Y4hsFxIyl9ByHtph8dNnG
	kw95Nir4Znzi2qg46JBqaJBnvPUMiT9PQUx0CbfsxT8dDD6fAyPflYpdmbqYQmUmW9pWsC/OFs0ob
	ijOu/+0ZHJnq8Zwhf98OMZtQXdTBRMM+lkvFM28xxJaYBqvB9+Pg8Rk6guisTzGDmL+KHsWxsCFcw
	QBsHjkfxpmPbxLBfJTpLgzp+YeAH7SLeh15idG00Td79+QCQ7NpBJfW+yO4gPwWO+P8kAQoticavj
	4gsGvUj51VIIJ6w5wbJ9FVGDAHeZd7YiGFJ5tSpvdTSes8UCslgUKhanLwU6fCCQlvEc7PboLx9aI
	tv7uGFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghCL-007iOK-7b; Fri, 07 Oct 2022 06:51:05 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghCI-007iLv-L7
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 06:51:03 +0000
Received: by mail-pj1-x1049.google.com with SMTP id kk6-20020a17090b4a0600b0020af381d1c4so3835551pjb.8
        for <linux-mtd@lists.infradead.org>; Thu, 06 Oct 2022 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8RGq8MFx6yg4rvWL2LsrEdijzeVAuwua99jyz3WuY0=;
        b=F6dW5mLyZy3KMwXGdnG0uw0vgxq5BEd+oBP42as46H5qvUK9UUtnPoEFvqRjcLp2it
         3rrZO+tOIKDyRV9cO0K8eFfD5qE0aq8/pOQ1qMjNT2kuDlzCxmiyNiNu8smEUUxWgXir
         qvanrdH44yXvkeRzWz2qggoyZsuAiESRGspyhTjmq550BG4iXCYue3thQoCeKJtWKbIn
         dnbBOuqYHUOo6fDvehxnSRx67QyOOhZO1IO0evxROS53XAX9T5qFE5eBmA1HILs/WX54
         xB6v9SfRbaoumFZK56o7t8VI47GxqtaTq9n1KZwEY5Ykc/WSe0t3090uQjFbndtU1jh/
         0d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8RGq8MFx6yg4rvWL2LsrEdijzeVAuwua99jyz3WuY0=;
        b=7RnKXmAJ9flqFEny+4OXjzmSlou2dV6PFSQTTG7Bl2Th//e6ecL/+eI8C0GyBCwV8g
         VFqDs/Sxx1ccF1SLw1yHzwO0wslXJciXHj+ODMBE5Db2GmXxbxeg9RxLuKQykNbt0W7z
         9LCbKasyvp/4UwJ2xKUrBY7q+9TSAYjhstGliyh7mktJJ+Ap1CiH6WK5rGW+jQKEn4lm
         6I0RFy/M+HNqImTMMmD9L8o3/UymjfW8EZKSsvATSpRIIy6hAWiRml/0UTvKcANH9930
         gb5HZ2JMSf7ppLYNz7+4KSptC4K4SEKkOSJF5LnwimUVfCkHDfa4d58QdYqululfCS91
         WVgA==
X-Gm-Message-State: ACrzQf1juPU9/S227lHm5qi+Hp7OswfL2BpLp+sc/frUdIsLXM/IzuGg
	60O9Fe5bKhYY//n3BKQ+nHB9UnGM88Dg
X-Google-Smtp-Source: AMsMyM6SBWhzRurstP/chVETSQSz8yWa44PhYa3t6INGan3rp4//jh+O5/UVex4A60beBfyt1HRxiZPKB3n9
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a05:6a00:134d:b0:545:4d30:eebf with SMTP
 id k13-20020a056a00134d00b005454d30eebfmr3430107pfu.32.1665125459940; Thu, 06
 Oct 2022 23:50:59 -0700 (PDT)
Date: Fri,  7 Oct 2022 06:50:42 +0000
In-Reply-To: <20221007065042.700761-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221007065042.700761-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007065042.700761-4-sgzhang@google.com>
Subject: [PATCH v2 3/3] mtd: mtdoops: panic caused mtdoops to call
 mtdoops_erase function immediately
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_235102_710079_4F53B440 
X-CRM114-Status: GOOD (  11.77  )
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
calling schedule_work() to do it will not work. Instead, just call
mtdoops_erase function immediately.

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
 drivers/mtd/mtdoops.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index eca48dff9b53..eccb7dea892f 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -168,7 +168,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	mtdoops_erase(cxt);
 }
 
-static void mtdoops_inc_counter(struct mtdoops_context *cxt)
+static void mtdoops_inc_counter(struct mtdoops_context *cxt, int panic)
 {
 	cxt->nextpage++;
 	if (cxt->nextpage >= cxt->oops_pages)
@@ -178,12 +178,20 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 		cxt->nextcount = 0;
 
 	if (page_is_used(cxt, cxt->nextpage)) {
-		schedule_work(&cxt->work_erase);
-		return;
+		pr_debug("mtdoops: not ready %d, %d (erase %s)\n",
+			 cxt->nextpage, cxt->nextcount,
+			 panic ? "immediately" : "scheduled");
+		if (panic) {
+			/* In case of panic, erase immediately */
+			mtdoops_erase(cxt);
+		} else {
+			/* Otherwise, schedule work to erase it "nicely" */
+			schedule_work(&cxt->work_erase);
+		}
+	} else {
+		pr_debug("mtdoops: ready %d, %d (no erase)\n",
+			 cxt->nextpage, cxt->nextcount);
 	}
-
-	pr_debug("mtdoops: ready %d, %d (no erase)\n",
-		 cxt->nextpage, cxt->nextcount);
 }
 
 static void mtdoops_write(struct mtdoops_context *cxt, int panic)
@@ -219,7 +227,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	mark_page_used(cxt, cxt->nextpage);
 	memset(cxt->oops_buf, 0xff, record_size);
 
-	mtdoops_inc_counter(cxt);
+	mtdoops_inc_counter(cxt, panic);
 out:
 	clear_bit(0, &cxt->oops_buf_busy);
 }
@@ -284,7 +292,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 		cxt->nextcount = maxcount;
 	}
 
-	mtdoops_inc_counter(cxt);
+	mtdoops_inc_counter(cxt, 0);
 }
 
 static void mtdoops_do_dump(struct kmsg_dumper *dumper,
-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
