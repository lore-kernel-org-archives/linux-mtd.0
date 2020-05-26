Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6EEC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7014F2145D
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dy3SzPH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7014F2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2Fbixg2KtEn+1zhehTA+tKx515N31TeT5vyPj/w3s8=; b=dy3SzPH5rICveJ
	C9EPCFCxsOJxt/EyhnZYHzNpQ+jpJKw28yxkG/TD7xIj468YIhG6MSDW3RSN8AX/EvCSvoXGwS5Y+
	n0vaMvqPlL1/c2a2v3+pBJ2Ga0U5rU5CWbL75BnI8FdkDnszWpDqrvA7duXrpvqRmsqDoD8jUy3lY
	nNmmJxDGAfx5JXwGQ/C6h5b5RSTD609g850abRlsVN1FgLKDT6TpR8fo9Ojt/jnLuRBm3ElnRNlHI
	/iVVps+4LUik+Q3wTleAGgGg8uCEN+sBDOFJ8d+sDwVOkcr0u6Tiayz+Ea4TY+nppKdmp8cGgsaGb
	Ph01qCXfuyPSwco2qIWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdf98-0007VQ-Lu; Tue, 26 May 2020 19:21:54 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf5E-0001W9-0D
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:17:53 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 17CC4240006;
 Tue, 26 May 2020 19:17:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 14/28] mtd: rawnand: timings: Add a helper to find the
 closest ONFI mode
Date: Tue, 26 May 2020 21:17:11 +0200
Message-Id: <20200526191725.7591-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121752_412445_79B6E36A 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Vendors are allowed to provide their own set of timings. In this case,
we provide a way to derive the "closest" timing mode so that, if the
NAND controller does not support tweaking these parameters, it will be
able to configure itself anyway.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h    |  2 ++
 drivers/mtd/nand/raw/nand_timings.c | 49 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index dc84e3b55d48..c7357ae86eeb 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -88,6 +88,8 @@ int onfi_fill_data_interface(struct nand_chip *chip,
 			     struct nand_data_interface *iface,
 			     enum nand_data_interface_type type,
 			     int timing_mode);
+unsigned int
+onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index ce6bb87db2e8..3c44c4b90536 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -273,6 +273,55 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	},
 };
 
+/**
+ * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
+ *                              set of timings
+ * @spec_timings: the timings to challenge
+ */
+unsigned int
+onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
+{
+	const struct nand_sdr_timings *onfi_timings;
+	int mode;
+
+	for (mode = ARRAY_SIZE(onfi_sdr_timings) - 1; mode > 0; mode--) {
+		onfi_timings = &onfi_sdr_timings[mode].timings.sdr;
+
+		if (spec_timings->tCCS_min > onfi_timings->tCCS_min ||
+		    spec_timings->tADL_min > onfi_timings->tADL_min ||
+		    spec_timings->tALH_min > onfi_timings->tALH_min ||
+		    spec_timings->tALS_min > onfi_timings->tALS_min ||
+		    spec_timings->tAR_min > onfi_timings->tAR_min ||
+		    spec_timings->tCEH_min > onfi_timings->tCEH_min ||
+		    spec_timings->tCH_min > onfi_timings->tCH_min ||
+		    spec_timings->tCLH_min > onfi_timings->tCLH_min ||
+		    spec_timings->tCLR_min > onfi_timings->tCLR_min ||
+		    spec_timings->tCLS_min > onfi_timings->tCLS_min ||
+		    spec_timings->tCOH_min > onfi_timings->tCOH_min ||
+		    spec_timings->tCS_min > onfi_timings->tCS_min ||
+		    spec_timings->tDH_min > onfi_timings->tDH_min ||
+		    spec_timings->tDS_min > onfi_timings->tDS_min ||
+		    spec_timings->tIR_min > onfi_timings->tIR_min ||
+		    spec_timings->tRC_min > onfi_timings->tRC_min ||
+		    spec_timings->tREH_min > onfi_timings->tREH_min ||
+		    spec_timings->tRHOH_min > onfi_timings->tRHOH_min ||
+		    spec_timings->tRHW_min > onfi_timings->tRHW_min ||
+		    spec_timings->tRLOH_min > onfi_timings->tRLOH_min ||
+		    spec_timings->tRP_min > onfi_timings->tRP_min ||
+		    spec_timings->tRR_min > onfi_timings->tRR_min ||
+		    spec_timings->tWC_min > onfi_timings->tWC_min ||
+		    spec_timings->tWH_min > onfi_timings->tWH_min ||
+		    spec_timings->tWHR_min > onfi_timings->tWHR_min ||
+		    spec_timings->tWP_min > onfi_timings->tWP_min ||
+		    spec_timings->tWW_min > onfi_timings->tWW_min)
+			continue;
+
+		return mode;
+	}
+
+	return 0;
+}
+
 /**
  * onfi_fill_data_interface - Initialize a data interface from a given ONFI mode
  * @chip: The NAND chip
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
