Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A72C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 06:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i+owa+RLMoVjEyt1mXdzEZ8rJW/gaeitl+75AxwAKrA=; b=kppMp8tFkng7PoSjyOfPOF3s2R
	+q7HKRo1cMP3hDLChE2QWtQzmKbtrVwsiwI4zqbLLE+5KDjaqHuIE/xBHAXu0bV1aw407P8X/Rric
	ELOowmmzMFVSMIiltsJvT6yc++shxpjZwWuKlxJi4oVDVoYt5wpdILeVKxP49vDGtCdB0xFuj5FTt
	VcAo08PY/L5fd9sxvf5PVuyV+h5oGU7X9LbpMmic1Lt3cFXk4QRVlMWH0QsSBk0vzX/4R+rRwx5CL
	X+cEhdOLu2tO0fZNddApNWGUMlybwnEvaXqGAYJhzjLMCtQSmztRlKEUmnRueHQDRdaq8xbClB043
	B06VEqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghCJ-007iNj-DU; Fri, 07 Oct 2022 06:51:03 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghCG-007iLD-DS
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 06:51:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-352e29ff8c2so38591417b3.21
        for <linux-mtd@lists.infradead.org>; Thu, 06 Oct 2022 23:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YShywGeqIZDpcBEaSHQ5rYoxj4sM6AIZww6UQ+coyfI=;
        b=NVl8BmpUMOw/A1G0cyJiZmnVpArIC5Pr6feGlbuFl5GAERbU3SfKIPOuzwU93ca7YX
         o2nDHDgZ5Ce66+0hVn11ujpHD5ao8wq0YQpIQjZVVzSJXNUv5r4HluF5P7Fx2UYcd0qU
         ix3fiLS75nyCVZBiDPsaey5whGmnyfGnxGOVIVpS+2QM+ebDldRI26GKrmoEkoQDrqDw
         hwFX0PtxPizrhtgdloHLvMGcSxKDT+RQrAwq/EADlJP4xt6+6t4fKmfjOPobcHhTVJs7
         jSTl7MLqhLAnyT7jqv6+vOrMx+laOTq/qVWujC1JgXJCnTE3aK+Mx3NJiutXwGKe1FjE
         Ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YShywGeqIZDpcBEaSHQ5rYoxj4sM6AIZww6UQ+coyfI=;
        b=IiOcZiJwbuZwIxEsSqyqmgjCSmOsMSUAJI11qysB0YIgQ86zbgEkKuVpMQhY3+0+wc
         J0b1TOcE4nf4wpeQn7wrBPIA86yfvaJ34/cYbPiBfQTI5zTiRVTKzjIlYBKe27GMZ8Uq
         CLIzxM/sfP4aSY3WmFOid42+eqQhDcqnpN49oFpkL2b9v86j0pjsi81DcGL5tiutRnpd
         LP5WkP8SaXhWBZ+xCUR+ZbRuYc2JJH9B2rCvQtSjU1JIwybE5l83lQ8ACN0vHGjypfk0
         Q4Kug2I2Gn6Le8u/u7pAbUQB+2AEGqi7NCHb7k3Mfmfd0kNMQPI662znFRA0Wue6yzkT
         LoOw==
X-Gm-Message-State: ACrzQf2tYBrthbBpOi6IN4xxAt8SVMYF/xGdRqjF2vCsHvdjcGBH33W+
	uRWSzAFo12xd2YMs/24al5b4+sMtBY/A
X-Google-Smtp-Source: AMsMyM6cNDQNaZMU03HNe/9QS6jTwDRBFkooH0PAZ/5Aq9cH5UQ27ALHUr4mGbrsMjzz8BwoPo2couSFuy4z
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a25:3790:0:b0:6be:7476:e7c5 with SMTP id
 e138-20020a253790000000b006be7476e7c5mr3031715yba.389.1665125457291; Thu, 06
 Oct 2022 23:50:57 -0700 (PDT)
Date: Fri,  7 Oct 2022 06:50:41 +0000
In-Reply-To: <20221007065042.700761-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221007065042.700761-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007065042.700761-3-sgzhang@google.com>
Subject: [PATCH v2 2/3] mtd: mtdoops: add mtdoops_erase function and move
 mtdoops_inc_counter to after it
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_235100_468279_ADC72980 
X-CRM114-Status: GOOD (  13.10  )
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
