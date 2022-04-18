Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49291C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 10:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=96Mxov05IljxEz1LCJAODteOUtafOYwaImWC2x7hgSE=; b=CDWuQDWCZvn3gS
	kqz41okazvuNH8DNiREWdduJEqpZG87y3SeMoomlLVHomafEmtG44dGqatrEIn2aOW0wxoKdB0xdl
	PYjmwHfZahiSDh+Hc0+JyZP4mmy9caeleeA5PHuva0axzwNCzQFQSKtqUw6ZtmRL/4kzOTIaZBTNc
	Wu5HrVl7QSGiYYDpNyIkrCXkhxM/llxaKxJgSV4R3vq51o9aoRUm08upb4D7Go7zORbEkkUS0+yQD
	ztjbj4OqjlNhM7Ut4Rs9Elp8Ta0TSsG7LdMIfiauOsGQauUQFfm+CJsOZ+pYBMWyUbHw8KJrDiolv
	CnBiNmTzDdPC5654W8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP32-00GOU5-CA; Mon, 18 Apr 2022 10:56:00 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP2z-00GORq-BI
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 10:55:58 +0000
Received: by mail-qt1-x830.google.com with SMTP id t2so9753138qtw.9
 for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2022 03:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04JNQ4bNSWDf9nai4sAo8uNf8YU45zdAqbc+gwJY/Os=;
 b=L8QgQHgaLGvKMHF5Cn0gPx8KthUCv7F5DASuU0w83wfC4qP1QWP5tnjqNJ/PL0IW+s
 qwxtvzrSE8oMw24QsmvtNkh1flxQNxzT44tOV8LtU/Ch0Do1KPbQ1IHzVVgy279vv/Gc
 BmTWjXqltOCRGhFjwMe4q0P6Q2wuro597uPlXhjBAzvpQTRc1wdvZ312A5zHF3iA7i0a
 W1qnDSqEheJnoc7P+U51c5+h4Wg/7TdDltSOO31YR5DHhbVJXMuYmbwzPg7R0P/kgQ+J
 77zdLt3Cpk5US/tnSdytC2TB4GteNhxdD90NA4lZYHwMJknFv5cNBUA9g5ysHTejwTZB
 V5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04JNQ4bNSWDf9nai4sAo8uNf8YU45zdAqbc+gwJY/Os=;
 b=lxOpyy7rlGDsfNf3OSd22Y231u9fihz3dKmwHUpMD6G1joSQG7CeaEl4M1idsDaZC2
 Sz4LCNxOHeIOezb3Uy3oDjKBm8PGX+xLBi4xvboJ0CNq6+iyiA+SIo6Trcs4oUzLUOBf
 BDC/L+LwNCmR80t982KKhLonxqupCkxHz7u6e/Xm8MNAf2IlROh5LFGl07C1McLkjayV
 m60672RGJyKXwYztemJquZThpP6mqljzcGSP+6T3Brku9Ms5UZw+YT+mSgLP+50hEKk2
 VDqNyuNs0+xt5LJ2zFb54FboGmbh5GIhnZUDVzPT1byR/z5Fm62OfH9x4oAdIbaw/84W
 dxSQ==
X-Gm-Message-State: AOAM530cvwI8Nm/QPjgAuFNGqVsb6LjktA8fXjoZZrRx+H+jtbmsacOs
 OZGV2owzzfst44EjCLL9WKP/kWNznDs=
X-Google-Smtp-Source: ABdhPJyIahOd8LheVs5dSWdbwkvdAFmtzyN6uLbgaP4/mPBCrW3brMLgzIUVShvTAGKnO2Vh6xzAsg==
X-Received: by 2002:ac8:7fcc:0:b0:2f2:5bf:6c with SMTP id
 b12-20020ac87fcc000000b002f205bf006cmr501496qtk.655.1650279355332; 
 Mon, 18 Apr 2022 03:55:55 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05620a405100b0069c45deb548sm6909392qko.130.2022.04.18.03.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:55:55 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: han.xu@nxp.com
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] mtd: nand: gpmi-nand: using pm_runtime_resume_and_get instead
 of pm_runtime_get_sync
Date: Mon, 18 Apr 2022 10:55:49 +0000
Message-Id: <20220418105549.2558765-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035557_405091_230E55A0 
X-CRM114-Status: GOOD (  11.90  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 44b14c9dc9a7..6e7477aef8a7 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -148,11 +148,9 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	struct resources *r = &this->resources;
 	int ret;
 
-	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
@@ -544,11 +542,9 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0) {
-		pm_runtime_put_autosuspend(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
@@ -2286,11 +2282,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	for (i = 0; i < GPMI_MAX_TRANSFERS; i++)
 		this->transfers[i].direction = DMA_NONE;
 
-	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * This driver currently supports only one NAND chip. Plus, dies share
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
