Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319B6C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Oct 2022 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=loIsj7nmVYYW1WMHsZpHowIZnz5XLjwz3zJNcSDoTx4=; b=qyjgdQ08CVSm2ksQin9nbhcrmk
	ADMwXGLJXIcquNgC72LZMXsmjqlwmRfmtmZwiH0+tFU6lRLbhSsblGsuHHV2DsTTzilqH4Ndq2iwi
	KI6vyCzNbCQBqH/WAMZnw6SgzM+XKG2kzVmVU/IawYWooKDrI5DqN5NCmvfrl5UNhD5lnayUDBYuK
	HMTp/uz9X/GOGHII3iBKvgBhClNE6jeBz/tFdArF4RgDld9TalIq8l0eR/gO3sCJZ8zdpRETUXp3+
	jix1aipkhHeUxpbDfO/j2T4MSg13mOEwGLqHB6zDx9Jgjdjxl9WXLnK/benm2AqjKKRE7yxFA9lQQ
	Ah42qIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpg-00H1lc-9i; Mon, 10 Oct 2022 04:56:04 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpd-00H1jv-KH
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2022 04:56:02 +0000
Received: by mail-pf1-x449.google.com with SMTP id k19-20020a056a00135300b0054096343fc6so5332568pfu.10
        for <linux-mtd@lists.infradead.org>; Sun, 09 Oct 2022 21:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n5rEc7KuSG8cmN4lQmoVLJoG9j0x/2DEKJaMbcZ2CU0=;
        b=KDpmZ7bo0zPf/eZT5qUzqYTXLyoYn9UO8veMeCOP+GKD5bNCFsHkzSkn0fAad0b5eA
         4Dya3H+lLn4iThtp4uLKnWB91BdmG+kiqYpiDn+baNHRee7/vOQNyOx4waQPdYDCGs1X
         txyyGL7YLeI3OO9KSOm7Z81K9tb0GBJd3JUgkFLb/PyGcY7l9et9aIMkfvuuthbIFP14
         PLenG6sCH9pQtufa1pmbd/fZPJfwX88bDVCo8FdCrAhDcbLlzGZA2J3OPAS/l+qQO4+b
         PE482p8VqUNPhseZ5eb8vF69d0+yl4GYTNsZkrSOmyQHAkbNOHyt/xJWsMSxozgV42ok
         b4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5rEc7KuSG8cmN4lQmoVLJoG9j0x/2DEKJaMbcZ2CU0=;
        b=OJIm9KKPZif3Yo9edYnyGsaLt39IfELL6ZgzFU0bOrLjjXwPqU3b/8DmKC5E5exvaB
         u2Rv2gHwW8/Yv5N+ArFRgGQPyiZiztnu2TqAWZRLyfHP19mMAwh44VCDOa7RMajQ13aZ
         OK8FoWrTMV+qWem9i0LrT6kGZfMPl7mwz0MN9wNvtTBOP7HiZj0Z2Dap02U2Bv6Slp4M
         63Gou9cEfaPaRrxD2LH2d63qfMYxliNu/gnZwWEPyPEaxMql90eHBXS403Is4vXF3H8l
         ydUKQV0HkIfPbNX9ZXMcquqKMnImIfA9sUGK1Aq8qdGw95oehl+PiWKTwvja+fyK+rGp
         NAOw==
X-Gm-Message-State: ACrzQf268ZoALjTzUcXfsM8wnbhUzQsMhHv6nsIFCFvoOPPlcF80GY04
	pJMOzqxfH/6afQynL7Lm7DGDvu8aOLTw
X-Google-Smtp-Source: AMsMyM5kMBxQ1/A4s0m7jJM202Q9cOw+L/nl5EWStZu/gB/QC2QJJRSuMVENxK9wo9rCobrjnJ8Q1q78ditE
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a17:903:22cc:b0:178:18a1:d16c with SMTP id
 y12-20020a17090322cc00b0017818a1d16cmr17345818plg.155.1665377759761; Sun, 09
 Oct 2022 21:55:59 -0700 (PDT)
Date: Mon, 10 Oct 2022 04:55:48 +0000
In-Reply-To: <20221010045549.2221965-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221010045549.2221965-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221010045549.2221965-3-sgzhang@google.com>
Subject: [PATCH v4 2/3] mtd: mtdoops: add mtdoops_erase function and move
 mtdoops_inc_counter to after it
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_215601_690925_694894AD 
X-CRM114-Status: GOOD (  13.12  )
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
index 6b70331da3b6..0226b9e9ea8f 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -108,29 +108,8 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
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
-	pr_debug("ready %d, %d (no erase)\n",
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
 
@@ -183,6 +162,32 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
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
+	pr_debug("ready %d, %d (no erase)\n",
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
