Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1834EC433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:37:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529B021D40
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ceZ4LqQ9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EH/bPsHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529B021D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iji9XUTGtK5h1Yc4HqBhZV5msJeEtmT+O5fumBR84gI=; b=ceZ4LqQ91QjSkmZtA1lBCd/yzA
	w8P2GUr88akfHbp1Nft6ph5UrET0bdbynjRe1UbzwVOlSghlNmhyK1RrMDCcoCnZ9MA/E1gkTCt8s
	KF/t8sQrDCqS34URbjhm0u/TFleFyzC72CcR42GYPnd8bZWKBBAMKyd8FKDh24TuqCkdA0EqxGD4L
	lAPNYNUGyEPKyFwx0M9BdPAd5k6BFPoAs89coiUSBX8kBCPp/N+yg8HNLZX0arcHGbuK4OJCTaYFz
	zjnFcvEFxxBYmADvVBoBSzyku35gPEXIAAn7oGaceX9OVGk1e8B07mkVPIYpZ1YUny35NrvE61kqb
	ma8P/+6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTXOm-0001Eo-LH; Fri, 16 Oct 2020 21:36:28 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTXOk-0001EN-Ch
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 21:36:27 +0000
Received: by mail-qk1-x742.google.com with SMTP id h140so3099967qke.7
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Xe+78kARC514seUIBP5wlnEVsel8D8M7QECJ3qMWygA=;
 b=EH/bPsHVz5xwOMSnUE283qOKKOF3rQAGlP02xdF79M0nDKbhaMdJnS49UFqaVCZEdz
 FS6mt1wJdNH6oqYKe5sazO2rrq2DQyz/CTqm5d3tMOpeNBkgi3FEFZ2xnM0hYZEkLKAf
 p4Pst2nhYMQxX+gLbrYXOAyFfw3Gam2KMqGozga6OgYNakezkhLUjuISp/Q9xzubC4Z3
 XZyBmHIakLNX3YOAlyCenT9nZY12/2F86zrdqfo0ybcX/dq/LyG8L3noXZWcNUgMDZbi
 hwYpF6g/Xgq++1lmlpy651fec7sk9kqCY5OEVwgJJWKODNCFLeyOSsX7nklkkyC7j9Rs
 9gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xe+78kARC514seUIBP5wlnEVsel8D8M7QECJ3qMWygA=;
 b=bw5+dkmx0cP4oZy9xYzjRa3abOv4Q8Qs7ymb/3Tj+wePO4zVHVP76JvsZe3dLo6LE9
 RwlfzAJ01V993b9ySfW8PdLmusbQnAn/ImF9wBOeoCHXCHJguR1e5Kp7isy+HzzrLZb5
 a0eCMP/v2VJhg1+X+rAL+gME3xGoCoMiEKmA/ocS2Mhy77J/FW7VsKCnlypOBxG5O4cX
 cQf27NNQle2OvhY53JABESXgfH1q7AD8O1gDxkCorC5Uql9fe70UhCdyKNVH9fTohexP
 Kwv/hjCwEfij9rOcht5ogCiNxKqKxWRcAOPg+e93JqW2CzI7fYj714NlmhlmLL1po1/i
 Q5BQ==
X-Gm-Message-State: AOAM533Xb/WMZse37A+SzvZ5ASkOUF5df76UIMIWNkZNhZOXH75KOdw0
 lX/zdcdWyGUGlyUtO5TtxDI=
X-Google-Smtp-Source: ABdhPJwxXv8oNOXmpySLLb9ITPgy/Tu7XxUod7iz/g/HB6uXz9EjrSuv5lWgehWKZLCmStjEo/WDAw==
X-Received: by 2002:a37:2c07:: with SMTP id s7mr5933283qkh.297.1602884184320; 
 Fri, 16 Oct 2020 14:36:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:997:41bf:f0db:3a2b:c1a6])
 by smtp.gmail.com with ESMTPSA id
 x91sm1496233qte.69.2020.10.16.14.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 14:36:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH v3] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
Date: Fri, 16 Oct 2020 18:36:13 -0300
Message-Id: <20201016213613.1450-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_173626_461792_7E87ADFC 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, han.xu@nxp.com,
 Fabio Estevam <festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

No ECC initialization should happen during the host controller probe.

In fact, we need the probe function to call nand_scan() in order to:

- identify the device, its capabilities and constraints (nand_scan_ident())
- configure the ECC engine accordingly (->attach_chip())
- scan its content and prepare the core (nand_scan_tail())

Moving these lines to mxcnd_attach_chip() fixes a regression caused by
a previous commit supposed to clarify these steps.

When moving the ECC initialization from probe() to attach(), get rid
of the pdata usage to determine the engine type and let the core decide
instead.

Tested on a imx27-pdk board.

Reported-by: Fabio Estevam <festevam@gmail.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Remove pdata check in attach() and let the core determine the engine type

 drivers/mtd/nand/raw/mxc_nand.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index d4200eb2ad32..684c51e5e60d 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1681,6 +1681,11 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
 	struct device *dev = mtd->dev.parent;
 
+	chip->ecc.bytes = host->devtype_data->eccbytes;
+	host->eccsize = host->devtype_data->eccsize;
+	chip->ecc.size = 512;
+	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
+
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		chip->ecc.read_page = mxc_nand_read_page;
@@ -1836,19 +1841,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (host->devtype_data->axi_offset)
 		host->regs_axi = host->base + host->devtype_data->axi_offset;
 
-	this->ecc.bytes = host->devtype_data->eccbytes;
-	host->eccsize = host->devtype_data->eccsize;
-
 	this->legacy.select_chip = host->devtype_data->select_chip;
-	this->ecc.size = 512;
-	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
-
-	if (host->pdata.hw_ecc) {
-		this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	} else {
-		this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-		this->ecc.algo = NAND_ECC_ALGO_HAMMING;
-	}
 
 	/* NAND bus width determines access functions used by upper layer */
 	if (host->pdata.width == 2)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
