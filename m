Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF4BC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Oct 2022 04:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AdgdOTg2m78PYyVdYFdlBSvpsEFzi1IL6FZcA424iPc=; b=Ot/ciimUlEYCz4Pz5BUykPqQTO
	obVQYpa6GxvL5mEdg/RNH7rDTOfoiMFxGn3Gcigy6nqRMRtiWcJGGS4DdtXH0HMptYHGebSORpaKk
	FtVzbWm+Ty+FqYygZ8LXMFcwEOT9RK/Rsbs+aY2TnqZAINaO1WTmuVfUzQOGz9IH6HmC3/YbbF4lN
	AFhCaDUFoWLAGe5E/yVs48aKPC3X24NBgrkg5Qco1M6JbEnqteGSIPDVMq7MUPrWPBRel8v6z2fA8
	Zi5OHjhcCTZgsTtSdTLPXqU4Qjo5ccggLJDf3uFYSpQuoAerZ/rRbTCFb/SntTMUrCVBCvcjByfow
	mNi0W5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpk-00H1n9-2C; Mon, 10 Oct 2022 04:56:08 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpg-00H1lM-MT
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2022 04:56:06 +0000
Received: by mail-pg1-x54a.google.com with SMTP id p24-20020a63f458000000b0043cd718c49dso5887827pgk.15
        for <linux-mtd@lists.infradead.org>; Sun, 09 Oct 2022 21:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxsdOmr/5R6O83izb+Qz14RQm/ox4oRe3Ga9GwIcpbE=;
        b=FkFgzyPbZsQ7hNEXjbL2xdIOWZkuMKYfOCsz8o7Aqg0eNxiBSOaNoOrR3Qf9uL60wM
         VTj6P7p0CFzx5wLDB3obZQ+zs+nrxxyBmcvR4DRDn00o63HqdvGDddgCThc2ABO6jHpw
         cm9uUOYCeB4KowxD+kNC8NY9xxoq25Ui7uTvS4Age3Yh6hkvwWal5xlAgOLCxDVcI4Id
         h9ltXeJuibrk4rUk6alMBIUx5VxBnrZ6OKB0LXzOyCqqd4IusJvjjf93Z8l+66nNTSjz
         PHYdAhYsKdcSUKvRSJx0N22y0DlAlXUJT/57ISO/kCHshWkQIpcznUevOsUJJS4GJR+9
         I6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxsdOmr/5R6O83izb+Qz14RQm/ox4oRe3Ga9GwIcpbE=;
        b=0z6vXf7tHZi158DsJ2UoBucmDooCV173PM/4i5n/cdbwcG+ICO6RxXafXbtLVPReuD
         hqHBjkfQSLD8jyFATJ5Qx81M+ZanPQuXcjbN51f9JpTc0fWrBhWf7ky4dyhdt+ckNjnw
         MrRU8vTxVTFlIQBoddpAFmoJUmgCKyBT7y1s7dMiIA5xmCi2UNXhHS22WcF3tPj17KMx
         jbEGnNdqxc1YfDPrqCqQTf1k4JnuislR+zQqXwXkK8L4VNnudGfp2lwVqR7kbFwETP7s
         3zFn9gF+FYVlccCm64cv/m0S1gGMaNoAeDY46wO/HCXpI2JNVdm6qv7hr8VslfldtZDY
         UKjg==
X-Gm-Message-State: ACrzQf3q3JCG3ZJlCmGa6TOY/Iwh4RLEbBijLDoV5yTFrpWeSuZ/Aa3k
	iSvyznyy0RuzU3VgAfIOL5AeykBO/MMR
X-Google-Smtp-Source: AMsMyM7IS1QJd/ZymReZAITcO7D6DJHSctw2xXHR0bqcwB2i2Av+jyamUKWzh6rkAS6jB/SEyZwKBlS8xhj8
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a17:90a:cd06:b0:203:ae0e:6a21 with SMTP id
 d6-20020a17090acd0600b00203ae0e6a21mr1584146pju.0.1665377762552; Sun, 09 Oct
 2022 21:56:02 -0700 (PDT)
Date: Mon, 10 Oct 2022 04:55:49 +0000
In-Reply-To: <20221010045549.2221965-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221010045549.2221965-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221010045549.2221965-4-sgzhang@google.com>
Subject: [PATCH v4 3/3] mtd: mtdoops: panic caused mtdoops to call
 mtdoops_erase function immediately
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_215604_762215_D6139286 
X-CRM114-Status: GOOD (  11.60  )
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
index 0226b9e9ea8f..2f11585b5613 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -170,7 +170,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	mtdoops_erase(cxt);
 }
 
-static void mtdoops_inc_counter(struct mtdoops_context *cxt)
+static void mtdoops_inc_counter(struct mtdoops_context *cxt, int panic)
 {
 	cxt->nextpage++;
 	if (cxt->nextpage >= cxt->oops_pages)
@@ -180,12 +180,20 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 		cxt->nextcount = 0;
 
 	if (page_is_used(cxt, cxt->nextpage)) {
-		schedule_work(&cxt->work_erase);
-		return;
+		pr_debug("not ready %d, %d (erase %s)\n",
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
+		pr_debug("ready %d, %d (no erase)\n",
+			 cxt->nextpage, cxt->nextcount);
 	}
-
-	pr_debug("ready %d, %d (no erase)\n",
-		 cxt->nextpage, cxt->nextcount);
 }
 
 static void mtdoops_write(struct mtdoops_context *cxt, int panic)
@@ -221,7 +229,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	mark_page_used(cxt, cxt->nextpage);
 	memset(cxt->oops_buf, 0xff, record_size);
 
-	mtdoops_inc_counter(cxt);
+	mtdoops_inc_counter(cxt, panic);
 out:
 	clear_bit(0, &cxt->oops_buf_busy);
 }
@@ -286,7 +294,7 @@ static void find_next_position(struct mtdoops_context *cxt)
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
