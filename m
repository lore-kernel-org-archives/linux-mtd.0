Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3F4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 23:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dFzOUF6a/TFXka80nZbTTO2QegRQlZhrX/6/5mOseSU=; b=MtNSdphh3L7rca
	JAL9xRSzMpOZIB0yUv4Es/LCljrtMwij+M3Go/fH2KsX1evcSGM7a+xadcWMtx0gKJ2YKWSnGq26C
	KIozuYGz5itxkMxWzin4Kqf7XCMguvCsB3JhHrgAutM8L9eBaFpNw3SgbPFHUKNZ8dzrwObuwWUMb
	Ff0ygGoVz9SWUOq/ZOXnU9QUAGzOIma36sv9wApc2BPVMN1T3d3EdUxH+Xp74a3Jc7JMq/eJgG+8R
	soupgPInFBkR19vycK01VXfOk5R6djCAEYSQuNLGHTsXSQQ4alWUqHi+XYnNYDlv9rMlo6AQWjm08
	o8X/utJvaOGhXqKqtgKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMU5-001uRW-PN; Mon, 07 Mar 2022 23:09:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMU2-001uPo-Mr
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 23:09:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so352630wms.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2022 15:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Irknw6RQZUFdI9aXxc+3L26hKyaP/zkHhWNuLVXeO0o=;
 b=dfbKY+mnDGP4mJ8Za885HhOBk9DHTkBTNOFC/iNhyD8vE9thA6b2Mw/2+K5Pw5Bn4i
 qyaFa02sE9zEqane//Kv7zLPm3r5D50IUnPtc9BaBPKTT8nn1a5wlJaAuljWmZHGBBlR
 4wIPjzPRcKY3USfEdPZbtbkeFjmHmY13aSLPP8xOOl72d2XaWk4D+YU7co/9214pyqBg
 VYZ/XwyKJlGuPrYpyaGFXuJQ0rKd/SXI9ILBjHZUQfKCsqLCGBms/OHKOPH+jWuHSMgb
 WmwQWkIhwO2/NzY5fRpucmVGOdZV+2cndyJVfVJAZqNOn52a0lT6sDvzEhNOT7C59s6G
 /VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Irknw6RQZUFdI9aXxc+3L26hKyaP/zkHhWNuLVXeO0o=;
 b=if5LGTyvvCCe4AcSA9LSVWXkAYVoiTn592NcJmx2bHVvI/6s/djRaE7TEpwtYplCL6
 2yiZextTa1HlPJMOKtCsZC0NsAD558Zf3NqXP9I5ZBDErHypTT1vIIphodp3jU0D5+ZL
 cqNzvBWUKNIOE0OvGVR3kOPqH7RZalbZgeDbS80raxZN9ld2zmDFkC7h89A3sr4g7/LQ
 6VeGSs6eKEMPThLoGXh3Vps8eQGdTotwSTm73hVpk50be1MjC7yN0OjuwZhFw3BJw5jO
 LYup0ecjLPuveo6fTEa8udavlLC1cyah0wQjb3FCftb7k+JuTr22thpujzY20BXEx7Na
 Glyg==
X-Gm-Message-State: AOAM531tJlUq7wjps7SFlB50APsv1HT49MGTgwqfn9nr4m+/1WkTOvrR
 WkmYa+y3tKspDUOer3lbHLo=
X-Google-Smtp-Source: ABdhPJyUVoSvxkCc+Dedh2m8q/S7kd59ABqP8cYxYRUUL2GD9oC3GwI2gz1/0P2Mqn1+Cwj2/nC1+Q==
X-Received: by 2002:a1c:35c9:0:b0:37b:edec:4d88 with SMTP id
 c192-20020a1c35c9000000b0037bedec4d88mr1015533wma.159.1646694581283; 
 Mon, 07 Mar 2022 15:09:41 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 a14-20020a05600c348e00b00389ab74c033sm566569wmq.4.2022.03.07.15.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:09:40 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: nand: mxic-ecc: make two read-only arrays static
 const
Date: Mon,  7 Mar 2022 23:09:40 +0000
Message-Id: <20220307230940.169235-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_150942_798239_FDEB2A44 
X-CRM114-Status: GOOD (  11.50  )
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

Don't populate the read-only arrays possible_strength and
spare_size on the stack but instead make them static
const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/nand/ecc-mxic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index c122139255e5..8afdca731b87 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -224,8 +224,8 @@ static int mxic_ecc_init_ctx(struct nand_device *nand, struct device *dev)
 	struct nand_ecc_props *user = &nand->ecc.user_conf;
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	int step_size = 0, strength = 0, desired_correction = 0, steps, idx;
-	int possible_strength[] = {4, 8, 40, 48};
-	int spare_size[] = {32, 32, 96, 96};
+	static const int possible_strength[] = {4, 8, 40, 48};
+	static const int spare_size[] = {32, 32, 96, 96};
 	struct mxic_ecc_ctx *ctx;
 	u32 spare_reg;
 	int ret;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
