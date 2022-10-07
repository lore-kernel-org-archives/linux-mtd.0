Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA804C43219
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MtvZUAQKMXxopvB7SZqBpNkHk54zTYph25pUMOK+nnA=; b=T2OUcKgJr6eZ9WhfRldGI7+bFp
	OPahOk+zS/6V3vBbxlwbprMeB2zHNqo4KKFLEe0+5OtHwQbTMlUZIZv91dhEzNwhbgmsFK46dh9Bl
	aZi84ja4Eai10J/4xv8o9/s057YEV/2WTqwKtKyD1i93xs5eolh27snEqOEd9AZLA+tVLgCsH+Y+f
	rVMOC5WR0kvgrB9rJm7ZP3oZY4E1HcyVg8x9qzCWqnogcEDWBFj0UAr6KcVHCZxCISco1hzv1aYzw
	wGOSElh7FYWPg6C1l+ro2SwF3qj5SwW6XGMzxCj2/wyneY7jXFZvou2Mh2a2NC8Y+05x1VDUmvYz8
	D//jtStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvF0-00Aho0-BP; Fri, 07 Oct 2022 21:50:46 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEw-00Ahmz-BM
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 21:50:43 +0000
Received: by mail-pf1-x449.google.com with SMTP id y15-20020aa78f2f000000b00562674456afso3419766pfr.9
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8RGq8MFx6yg4rvWL2LsrEdijzeVAuwua99jyz3WuY0=;
        b=Jm4fGwHaDYx7k9kxYT6mKkXoumBg51rFPtFVs1GUI0RDAED/uoDgT2YNed/lVzfR63
         h0TE9R+NpFZlX072/6JitNBwgwOCkwj7MWGEJ9gSHP7juK93M7454+wy1rhY7QCus+rq
         wETw9tMRCilnjfF4BoNjlvaT7PaGOETx1PmHdjQz/gZyRd/vatqaqevPArtVOBLVpt7D
         qtJj4KgMq7PvlziZGs6v15glFw3zQHU4ozOBFV0tWIsguGo/HUN1RbaBMF2gkCbsHk42
         I5W0wotcQX/ykvIoxcCSVRcdg3YeZdE/rgpy8N/In3caWqbczTRDU6ug4vJspOvW+iWe
         kC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8RGq8MFx6yg4rvWL2LsrEdijzeVAuwua99jyz3WuY0=;
        b=xFxXLH4l0hFWOXwLIRTbzUe9uaBJC2q/UZM5KRum/VkOOjQ2iBbw+IGrfgd+OtuBM8
         7SNgrBjFj4GlFJHqhd9o3ONGUG/uinhdwyQhQ6YjCyYPsEp7HovKo0AsM1+K2eMCgMJ/
         a7jhUSZZdgogPsD7gd9FVsb9F8lcGIDbczZVpqOzt02ykz8OhByfOoBuX/0bbTDyZdUH
         7vurgk88n2Nq5l0uuYwN845i+O2c8GRIyH2hDKYUwN8I8XubVLlvkouTYzUe+3eoU12X
         vyefaPrKq0Qf5p2UKbalLX8B+IVfs/JQfsA4M4XYAdgqWg7khU9fCLAouLrKslw0sND4
         w/QQ==
X-Gm-Message-State: ACrzQf1ANI6l2WmABIXgh/f41jzSeuTVL/9O+TwBuqTGWh13msD/kG2V
	flipfeXT0beDmG4Td/M+9eRF4b0ie+mq
X-Google-Smtp-Source: AMsMyM6u9ghCGBUvbM5APJ6uXbUZZysoD0yKXdfPswKlv7hHAgLwY/TTgHaNURF+8tLhijVM7Y0cjxypeMEW
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a62:1a8d:0:b0:544:1309:19f3 with SMTP id
 a135-20020a621a8d000000b00544130919f3mr7193381pfa.37.1665179440177; Fri, 07
 Oct 2022 14:50:40 -0700 (PDT)
Date: Fri,  7 Oct 2022 21:50:27 +0000
In-Reply-To: <20221007215027.918507-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221007215027.918507-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007215027.918507-4-sgzhang@google.com>
Subject: [PATCH v3 3/3] mtd: mtdoops: panic caused mtdoops to call
 mtdoops_erase function immediately
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_145042_415869_3290C081 
X-CRM114-Status: GOOD (  11.71  )
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
