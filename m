Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E6C56201
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 03:11:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F228207BC
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 03:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGCCbzuV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oa02Fst9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F228207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RqdiatN/YI2Qg4KE2H+FcqYLAZJI0uqwZyvMfBnV8NU=; b=cGCCbzuV/M7vZb6Klb62snOlEB
	QaLhd8sluBbK65kAaPPYGHnidWnQuxZuIx/C7Hyr2pq7oeU5ivwIKFOvmUGh4OFQCQgOw+vgL2IK6
	6KfOrhq8GuWcOr26Nx6vL5Fw17clYygqs4r6maKjzi5AtwCEN/0F2JqN3tsy/z28MQYmcxQ98zdm6
	GS5LBglMxWdbEzRjDGmVCJ24/648g8+26C1D8SZowOnLUYNsGt5i261ve0SHTd3Gig/EecyGwn0OI
	eNSkAqUMvHXLjFsJZmrVJx4mAQPvclYZ3R9H4R9s/1scR+WPSDRiIhmthv9xIQMYX1CtVF4SHzB10
	m0bZ3xPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki7ff-0007aW-E4; Thu, 26 Nov 2020 03:10:11 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki7fU-0007Zl-P2
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 03:10:01 +0000
Received: by mail-qk1-x742.google.com with SMTP id q5so454665qkc.12
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2020 19:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3GBhEk/Rn9Pal6nIB7uYwIFAcz4qSrpHZEZGtqOOP1w=;
 b=oa02Fst9S0BxUwCOHTHCxyjD+slPcGy3qWEUU0ezDQO96HBKxs4sYVN7YcMJqVZLyN
 3qAbdzs24gnGpZo45Q2cTrIhI37gImKzdkky97VWqTIiygYZG426B/RCWuvVIj155Y16
 8oVWWcD67Fwhhq0zi8kDy/+if4OnW5aRnL4wvwwBQkNbxPbTHqYn/RQ3bBhbBqLR20W+
 wlG/3PLm4jCwGsXVaqXjqrO5hqEbXPYcNdwzKVNfaVBJiyrXRYMFKXfog0NQ3h/8M1Q2
 q8CNY1mVuDckU+IcF/xRyG6hHnCfbM2atk1kv6FYK79KEoBICY5De6SL8mX8NQG6yTA6
 xGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3GBhEk/Rn9Pal6nIB7uYwIFAcz4qSrpHZEZGtqOOP1w=;
 b=M/BMBd7r+rp3mJGFEjWiZWMqeFRDETP0nfBNJa3d9Z9zK0DPrjl6+/UBtS24CBiFhZ
 J0fM2Pkh6uwxg3YlCJYN5KU+/uo/kufcmhFtlN9KdyuocU1DXYqS9/R4MCj27lHqVXBl
 9/IgUehwCxn3nsAmr+ky/0CrYc88qU4ltbVPxQSPzXMihFZYtuUJqZCvc/WXPWsqLk5U
 R+z77RIBPYPlcosWv4BY74xJc2IYChf+OccbPFGdi2invbskgnqw7Hqyjhstyu6j8Gy0
 kfIT7WATQY6ZUO7o3w2wYG08zWEadXOlKd9wRe3djUOagvbGFCY9tW7Vqi3O1qEKqwFg
 gqxg==
X-Gm-Message-State: AOAM530azxciCpad4ojnPcD3JDnuemVp4Ypya8IzDwM+CdVmNfNAG9Qt
 2uJ9xxLZ6kxVNVvZW+s6mM8=
X-Google-Smtp-Source: ABdhPJzrJfLy1MHvnM5+Uw7RM/1ASirVCSJ0Iq0+9+MoK4disN3qdr2OnNqitWyruPzW/FIE7heIdA==
X-Received: by 2002:a05:620a:1196:: with SMTP id
 b22mr1221220qkk.31.1606360197759; 
 Wed, 25 Nov 2020 19:09:57 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:c91:9ce8:56e7:5368:ece8])
 by smtp.gmail.com with ESMTPSA id
 z133sm1487194qka.20.2020.11.25.19.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 19:09:57 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH] mtd: rawnand: gpmi: Use of_device_get_match_data()
Date: Thu, 26 Nov 2020 00:09:46 -0300
Message-Id: <20201126030946.2058-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_221000_845692_CDA17244 
X-CRM114-Status: GOOD (  13.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index b5f46f214a58..0d30f3fbb045 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2487,21 +2487,13 @@ MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
-	const struct of_device_id *of_id;
 	int ret;
 
 	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
 	if (!this)
 		return -ENOMEM;
 
-	of_id = of_match_device(gpmi_nand_id_table, &pdev->dev);
-	if (of_id) {
-		this->devdata = of_id->data;
-	} else {
-		dev_err(&pdev->dev, "Failed to find the right device id.\n");
-		return -ENODEV;
-	}
-
+	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
 	this->pdev  = pdev;
 	this->dev   = &pdev->dev;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
