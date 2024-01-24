Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B20AC47258
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdElMX7gLUvCLB8u/iDKSdazRlYnQIe44exL+meDbmQ=; b=qnkc5j2uF/oZQL
	TvSx8wYjYyQomKmuCs6rObBxz9aPoqJdLdKByqFnatNGBqmor4RFql/UDo5yM2pD7xaoh2MDvGZh6
	X/zwiG8T7o1k3MaHJbyHcUYk4kr3btwE8DWgWbrrJqsWKoFDBKyAQm69aztFPQuYEb1G0Z+YIeQ0f
	QGwBDvEd3m3B4xyjLV3MECpgLcAC4jvh8YAzpHGtaHPcn85WKoCaNxY4wyRJk0w+jaxbG8bSwajWT
	kihHWUInPHtQdBKBq7qAM+JVt2bX4honL6R61DosAZlwLiXCAJH5ub/uBbMcX8k+8+gTVUdZhk75Z
	kR/xf7SaziiXtJNNds9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbe-001G1Y-3A;
	Wed, 24 Jan 2024 03:07:14 +0000
Received: from mail-ot1-f100.google.com ([209.85.210.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbA-001Feg-0Y
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:45 +0000
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-6dc83674972so2749300a34.1
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065543; x=1706670343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1sI7nRj6Sb3+vzY3tBFzwAr+P5ADn9TFjJ984wNlHs=;
        b=g0r1yBEPXY3E3XTUmht85WPfzMCx2mHx6fBZSZ0INxTI+6kAcZeCt4BXwlBKR8R4GP
         KN6iMJN0YUGgxvnwkJ8eIyX4C0IIZIUtp+W1398kaUgNKegW+Vww7Rmnnm51krpy0JH3
         chPGbDBCvfdX03UsqP5jvFeqBxOL2gc7JyXiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065543; x=1706670343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1sI7nRj6Sb3+vzY3tBFzwAr+P5ADn9TFjJ984wNlHs=;
        b=FfUzl2CqadfvDNvpqNapSDwsKUs5ZjEefALIEThiaa2YLDGn7D6CM9ls5IM3FHJOZj
         m7iHnfxcbTwdn8LGS7Xb4gXchOoc9U6Kb/kIRR5OpAHgPgF33oFKD3WWSfqzmkkXhQDV
         /FIHcdfL6NRbs8JB8arsYuGrtIKIB4+SrCG6aALpHyF+Nu/xxtqwFp7OE3IKF+WOq+96
         xzH8qZLUu0vNp7ghcuJCRgfczxP4IHsY6HjrDmI9qp1wLjAJY0/97wf8VuCqGH4m9THs
         styQxS5UQsp2KxzjoRbnORG70jmLs/KbHAfNkIRgHLG4LgCBlg5SLtezGXBPRJLgqlG/
         0knw==
X-Gm-Message-State: AOJu0YzfwBZgE2Of6mAWwSEC5OEr43CjW4NxEFSCck3jF5AfEdnqOwF3
	38BT982MikH4LkpbsIkWfuyCujUaZe9A7n7Xrhrfh6C8GuGYaU78kAzEZplqIU54IFD0SqYSilX
	E040RRp8pFH/4nkLB9/LM7hRoPVpfHw==
X-Google-Smtp-Source: AGHT+IE6/QlqXprWei1rIePUFWUKuwHJE0/o+ALcxQ84BQGJO6Em+rTO6MQXs78sdkGu/UVrkZ0YG02crven
X-Received: by 2002:a05:6830:94:b0:6dd:e9ee:2568 with SMTP id a20-20020a056830009400b006dde9ee2568mr811597oto.22.1706065543726;
        Tue, 23 Jan 2024 19:05:43 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: dregan@broadcom.com,
	dregan@mail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	computersforpeace@gmail.com,
	kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com,
	baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: [PATCH v3 08/10] mtd: rawnand: brcmnand: exec_op helper functions return type fixes
Date: Tue, 23 Jan 2024 19:04:56 -0800
Message-Id: <20240124030458.98408-9-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190644_219072_BFE8EF53 
X-CRM114-Status: GOOD (  13.58  )
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

fix return type for exec_op reset and status detect helper functions

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
Fixes: 3cc4718fa644 ("mtd: rawnand: brcmnand: exec_op implementation")
Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
Changes in v3: None
---
Changes in v2:
- Added to patch series
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 9a904c7c6dad..6b5d76eff0ec 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -625,7 +625,7 @@ enum {
 /* Only for v7.2 */
 #define	ACC_CONTROL_ECC_EXT_SHIFT		13
 
-static u8 brcmnand_status(struct brcmnand_host *host);
+static int brcmnand_status(struct brcmnand_host *host);
 
 static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
 {
@@ -1749,7 +1749,7 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 				 INTFC_FLASH_STATUS;
 }
 
-static u8 brcmnand_status(struct brcmnand_host *host)
+static int brcmnand_status(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1760,7 +1760,7 @@ static u8 brcmnand_status(struct brcmnand_host *host)
 	return brcmnand_waitfunc(chip);
 }
 
-static u8 brcmnand_reset(struct brcmnand_host *host)
+static int brcmnand_reset(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 
@@ -2492,11 +2492,14 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 
 	if (brcmnand_op_is_status(op)) {
 		status = op->instrs[1].ctx.data.buf.in;
-		*status = brcmnand_status(host);
+		ret = brcmnand_status(host);
+		if (ret < 0)
+			return ret;
+
+		*status = ret & 0xFF;
 
 		return 0;
-	}
-	else if (brcmnand_op_is_reset(op)) {
+	} else if (brcmnand_op_is_reset(op)) {
 		ret = brcmnand_reset(host);
 		if (ret < 0)
 			return ret;
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
