Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165CDC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yF+7KVnR6O4WisX79qphAp3GNeNkOikPPZIhz1eQKw8=; b=A55e+vJR4O2tXB
	PJsZSmeQxmkwRKJ8sh2o3FMeH5v/d1UOSOuLC3uksR2Prq+LJKNXTkIEgg1QTi0WRGZuLQKQurIDC
	YjBj4wI4xjFYOWx11nb00TiKFva1u1cCPxTtQXzLaWZUI4pGrn02m0bkhgYMYeKU10yBtSqZiYiZ0
	a7kVwZkyYlW10nxOzfe11RVfSuQZCQnsOk8n1WjQtwN733Vnd/yrvsx4ncuneKWeG3KstGJi+yb0P
	WOjT1YTxCNvyxaXTd+QsjtjG+OCzzQ1lO0zEj70RCWK3RLUeaN+PpWqRWcYrJ1lrFwsuDqxx3ujR8
	PLyKCaNWBxB4FPaio2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUJV-00EUHV-CN; Thu, 20 Oct 2022 12:06:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olTLY-00DtE5-0X
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2022 11:04:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id y14so46442935ejd.9
        for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2022 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6qV1aCaOqyH9zNYxeqx1WUBGtUePLGq2jJvaNsp2pg=;
        b=PAWT0JFyLcobroXQ/XDxb24/eTq+G4I/xpc1vK6IvXCduh8WDhzsZuXUAfVkaA8JMK
         oyG+UeRzLRdavzwXlFGSl+4gHz5YKiSD67fvUAzIDuwR45XyH7VP8dbzTvwn5Df9GwWH
         VVGJErlzQM7ABLIl4B7nnK3b7uKxIIgC6YxzuGmtjpQVo33zw34xD06gjqniPo63pFHO
         EjNKDgTfM2a77wWFZ2llVvXLBrKlvRcxSPCjAQN43V2kBGhvpPV68Fi5C38OZvQ0lG06
         TM/tYjtYRheO0mxvFpBrj9OfjGiFhN7SgvM6KwvEdlFH+50UfrlYRfLgQ5OYCQ6UDGLd
         yALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6qV1aCaOqyH9zNYxeqx1WUBGtUePLGq2jJvaNsp2pg=;
        b=nMqRMCfbuN84irQz3xw1xCQJY4800U1BLCiu2vN8zYpUmdNyaMHNA8ovlNzVz3toWV
         dGWaAC4GMNOVCXJn0gudHPwDhXTXYMTVzcRjkwoqxmoUmcxLLuFZrTj4UlyN2b7qjp62
         GvjBGBo7EqMvxjkxmXkbvr17vJHuWzjfnd5IfAWqHulkNsFDbnl32a7VIHr4c+sSLDjQ
         rkToi+mpDMxx7tTPLfDmyLL3BE923IA4VHdUXuKGUKHlg9IATySq0uwa76aRf8moPrAg
         1YK5+N0k6nhJlCSDH7zAJMT/VHpgHPClB8DVpam47UaPMEpSGTCn3Xc/mabW00ZcX2Px
         kQIA==
X-Gm-Message-State: ACrzQf1RiaL3sukVmvR0STSEtQRqeiTCaXzbj7eOOFnrZgor/7vObUek
	QVOZ6Rap4tOPDhT9a2tz+KfoDXfmD8Alrw==
X-Google-Smtp-Source: AMsMyM7PvMEtjzhXECl9LeBti2nkl04jFe7c95ugVbhsfDxKlGW4icHsTfVM24BkIRw6qKV2qqfakQ==
X-Received: by 2002:a17:907:7b86:b0:78d:cb21:da0c with SMTP id ne6-20020a1709077b8600b0078dcb21da0cmr10819181ejc.24.1666263856488;
        Thu, 20 Oct 2022 04:04:16 -0700 (PDT)
Received: from penguin.lxd (ipbcc2d39a.dynamic.kabel-deutschland.de. [188.194.211.154])
        by smtp.gmail.com with ESMTPSA id kw8-20020a170907770800b007821f4bc328sm10352748ejc.178.2022.10.20.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 04:04:16 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tokunori Ikegami <ikegami.t@gmail.com>,
	Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Andreas Oetken <ennoerlangen@gmail.com>
Subject: [PATCH v2] mtd: cfi: add fixup to support MT28FW02GBBA1HPC
Date: Thu, 20 Oct 2022 13:03:44 +0200
Message-Id: <20221020110344.16607-1-ennoerlangen@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_040420_123567_717F21DC 
X-CRM114-Status: GOOD (  14.25  )
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

The cfi flash device MT28FW02GBBA1HPC is a stacked device with two 1Gb
dies. Yet it is recognized as one device. Added early fixup to adjust
devsize and erase region info appropriately. The same issue was addressed
for the S70GL02GS in
Commit 0fe3ede7941d ("mtd: cfi: Add early fixup for S70GL02GS").

Signed-off-by: Andreas Oetken <ennoerlangen@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index cf426956454c..102c1ffb9aad 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -186,9 +186,22 @@ static void fixup_s70gl02gs_chips(struct cfi_private *cfi)
 	pr_warn("Bad S70GL02GS CFI data; adjust to detect 2 chips\n");
 }
 
+
+static void fixup_mt28fw02gbba1hpc_chips(struct cfi_private *cfi)
+{
+	/*
+	 * MT28FW02GBBA1HPC flash reports a single 256 MiB chip, but is really made up
+	 * of two 128 MiB chips with 1024 sectors each.
+	 */
+	cfi->cfiq->DevSize = 27;
+	cfi->cfiq->EraseRegionInfo[0] = 0x20003ff;
+	pr_warn("Bad MT28FW02GBBA1HPC CFI data; adjust to detect 2 chips\n");
+}
+
 static const struct cfi_early_fixup cfi_early_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x4801, fixup_s70gl02gs_chips },
-	{ },
+	{ CFI_MFR_INTEL, 0x227e, fixup_mt28fw02gbba1hpc_chips},
+	{ }
 };
 
 static int __xipram cfi_chip_setup(struct map_info *map,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
