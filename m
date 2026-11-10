Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D22606D2AA
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ualaynuK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiz7MSZe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mVvF33Pbg7LwQTG4rixL43uDtkF1B/rE7RmRHZFwrlM=; b=ualaynuK+4RHCpnQnZbUqEvN+P
	tMROmKTimEU9LPEHD3HaL7qdGS7VjONmoRTMS7vzcLo4Fq9yKi4q1z+HOcTxu1EU+M4xb1LSXck8k
	wOa9GRZ4vtZnf10R0cGqbbmccbVOkWEJ5frgF3wCKwUZCXo0O6rinZeV4BLikF1P8oUoFO5mqIBbh
	PatxDCe4/oanWvSKx4DwWJ4zqdhCfkFkBB4JAaGSv6OHJ35zZ27KUGqSQ56b1wHJKD8NqabauV7sw
	VCrZ0WJJI5WVpuEb7g35YOixrhDMMm8IAFWBX4mBqGYWOGBWT5iJGQadST6tbY0/I0avXcZSR26Ro
	7s9MC+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXH-00000002wiW-42di;
	Tue, 10 Nov 2026 07:44:55 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX5-00000002wH0-0XmC
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:53 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6f74f6b46abso681955eaf.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296682; x=1794901482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYcNZCkRPtVfRqMJzvhmikC22qG2Rhi28NS8s3/0dd8=;
        b=tiz7MSZeHQ2Fsrnrp90nV4cqhVXT7qmNVqvHxOYJTQGtXolrq7eGReMY+aS7RryiUS
         aYQbmriqBbsElCuiJPuj+3wzv5QIxxdD/Q2GqkiGNuxcNuAcyNxh+OATonpYR+8dfJSJ
         BqmHYW3bS8cXAqhhx/FdZHLRo/SZLP+AFHPmKU8E+hzuDQtCJtKYApPC/5HQjGWYoMHg
         E+1gLSP2obOQw+KQhAx7cLeZlyxZXPosVjWexceCQOeRVtM7meS4UbUAILc1C/j05ZVC
         BafCPSshczsBvrWcJ+ps8QYyGtvGRt2BOFwQGMxXuJnY24FzGbpTJUQuuD6kxlnZl5gM
         JULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296682; x=1794901482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYcNZCkRPtVfRqMJzvhmikC22qG2Rhi28NS8s3/0dd8=;
        b=XMJs3is/nNT3cV9/h79NogAXWTC4s7jhHEG7JSbwRy/D+sU4OrEFP5NUiSl/F5UU/e
         t+Y6TH9uuRxEAW5AM3YtcKeq7jffZcBz2W4I/Drm5YdmtLU1/i5QtrFGbNEuvNeop0zj
         XDlwFpYPYEprqOu7e8TvWwy+7eo1///D7s11O0CyhI9nbdPDC7YFbYxbqKCmo3XS/xHS
         HSzLvxmwh8uh/a+Oax81qgzY4CZgkIAHxrK3CxAQmJVNm70Joml292TelT96mPhqNkrC
         dnG5X2ZA7ycIP0Lc+awfDCgTsNtAsM9ugTYBn5ofqgZoEyQNB1DRiEZhH8gCTyo94kqk
         Ktcg==
X-Gm-Message-State: APuU4Z92O49ZRBeBxpHrD27ZNwhHmSRjcarftCJ0MhcQsQvOoGkZPKMn
	aC1vrS/nRqmOacs/EAnMIa9dwa6veR4ds1DtmNg7rLdChe5CgY5ynfleNMKymolm
X-Gm-Gg: AYBFou2qoTUryQgRQO1OakVy+KIRpoysyoiPq1duF3Bgn8DEigizk0Lp/74skOk0rlc
	XTNiYD6FwLYk0oPZPzm8H+VEboF7gL6uvW5dhrYWhHDJzvmI68/+xSKETTNtMyNP3MFzD80nGmW
	1vao/r9/QBdfPNFE94xJZ6XEC/57URRNqPJi7/57SvnlD/aov/r570lsBUqaYrqGMfpr4Ga9RCg
	J0dkcu9FvPwoMZ6svJrQJJ8C/juNosYOBDnVvcWx97djYECk/DbYUGIVrlZBGnJcC16tVdITbHn
	kyQf/nrRM7MdhUK1buXRj2aUKXyahYs+JnV+J17429Ix2mXufzx270dX6nxeDMi2L+RevPsATDT
	O2cJLb9sIxCwM4gdOlRS82Gb9Te7tuJadqehJP3g1I5JHVgxTHPxOIk80nU7kzGD8WT2SmCtTTn
	yDCy2BtqfvX/574cJ5cwx/5+f+Muk+Eyj9FPnrDQva3VhwCn13yxR3qKb0d3k2bgGwmCeu9Nb49
	CYblVbxg5SqhVEmIBfbegbFt4Vvqpb9g9jsMU5xzlmvqN33/QlzZiXfz69Hwak/MQ51gVue+AaV
	klxXHLjUKNmeNeqDR2syf3FrZxCW0xwrnjC70mWsP+f1paw2EuzQXCtbyOuGfOItFgRyfL4FKTi
	H6n86m2mWrecWPCGtm+aKrWDybdrWn9wlETPomodXVCREUzhRswJIKaRuC7XaLt1330Oezhi5zP
	CyJ3fYIky5xXxWAUDZ6whhCAyxOa7MD3YHuiHhdtLA9UjtOxGQ6xiL
X-Received: by 2002:a05:6808:680a:b0:4a3:fefb:899b with SMTP id 5614622812f47-5683c8acbecmr1566196b6e.7.1794296681650;
        Mon, 09 Nov 2026 23:44:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:22 -0700
Subject: [PATCH v2 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-19-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234443_445778_40DCE056 
X-CRM114-Status: GOOD (  14.61  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded chip and its copied name through the shared
allocation.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
