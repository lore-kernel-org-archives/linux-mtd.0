Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB97C001B0
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UA/cp4K+0GK7BwKjq5Bcb9fX3DlsPaj5ryVK6ElyOlQ=; b=xNpM6OmskS8BIQ
	csshWEvoS2S7wqRCbFdYZ+Mek7A22kwzprVuK+R5xZih6GJgtzuVIbjNrwCcm69ZuNd4ifIqP4H6b
	sdmwSeALlhe5GxgxM6lmeVejHAtXAApATXRy1RTv39a1uBv1VQYwSolWBdfmI0y2FU2Rzk363sReT
	Nv5SNGlhdkn7kkjJi7niYwUtujljS59FChPdZsA31sTksMyxYvrY84qW+IH+PkAOpJoUdZ/Q65FqV
	sLEPGc7/COVY9wQK9e9GHUAaQEcu5rXdHgQeZK4cNShjKnwaKbgwnwz5cSeXtLIUjCvOYZYANxunD
	9gmubOFFF+x3kh2ibkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL311-00Byqe-0M;
	Sun, 16 Jul 2023 14:46:27 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30u-00ByhZ-0P;
	Sun, 16 Jul 2023 14:46:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 212A7C0006;
	Sun, 16 Jul 2023 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M69gSRMwhs7juKM2CPDpdCvuBk+TY4672h7kItD/70I=;
	b=NZN1B1s5FW0EGJG/tgGcAb2oIhdOTVLIVE/uyYuR8x3hJSfZ/fDYWnkOyD3QGn2h5IYKda
	+lXuR53rpPl6VpvYzKWqzoQDBam6LeEGwX14IeLNXPmbzTnLPhnfodfEjAyeNPdN01PX9Q
	B6n5U/oqV65FWcd6ACUISlTu3PpL5wzaODUwIBVLyQjRRmnq87nLQgV+aav4S8GoOaA5kS
	hDamBBryfAdZzC35QNysJPR00dFQlvG9OptIDw2vtm9p43qQlpjzeNAPLpMUAN/jmhGCjz
	QzebQoYQfA7Wz49OUrIl92VWcMloBmLZgqOkoQh6wGM/XfRHNqUZkO9gF+hjzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/8] mtd: rawnand: qcom: Use the BIT() macro
Date: Sun, 16 Jul 2023 16:46:05 +0200
Message-Id: <20230716144612.32132-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074620_416026_0DF85AB7 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Fix the following checkpatch warning:
    "CHECK: Prefer using the BIT macro"

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b1e69d634d4a..023c8b36426b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -123,8 +123,8 @@
 /* NAND_ERASED_CW_DETECT_CFG bits */
 #define	ERASED_CW_ECC_MASK		1
 #define	AUTO_DETECT_RES			0
-#define	MASK_ECC			(1 << ERASED_CW_ECC_MASK)
-#define	RESET_ERASED_DET		(1 << AUTO_DETECT_RES)
+#define	MASK_ECC			BIT(ERASED_CW_ECC_MASK)
+#define	RESET_ERASED_DET		BIT(AUTO_DETECT_RES)
 #define	ACTIVE_ERASED_DET		(0 << AUTO_DETECT_RES)
 #define	CLR_ERASED_PAGE_DET		(RESET_ERASED_DET | MASK_ECC)
 #define	SET_ERASED_PAGE_DET		(ACTIVE_ERASED_DET | MASK_ECC)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
