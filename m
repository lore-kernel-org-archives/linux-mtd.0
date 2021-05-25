Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46567C47084
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 03:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1923661415
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 03:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1923661415
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cKu03Sh7c9+UQnx+CkgimBh2moE+B9iN6zJNhstnU9I=; b=yzXOcQmTDZH6SF
	n2bMZVY4WFUUUg5flzCJsj2Ig2hN+MBnQoTYtRcK0lW4XNSgzaWTdW2+5sDb5hH5cVse0Ea97mt3Y
	W/m++ByT/7XwVnQBtpJyMeHSy5ua+Sx8wwtd0klnpJIzGBav6iGncTDqabkMr/9LgCGYeimpCrUDj
	bnCEf4WKVNXCigrCBd7GQ7KogIh5+cVOnVonCjPDgqaLwGlW69R9m5dStxh9XTIoPq1yS1R5cJg5o
	sVTJbM+Cy6rRw32KarwrMnvLkHLXsbQVnMaEKqwqOmENiSk9F10q/7y3n3ewTo9bpF98InLOk7NXV
	IrT+eZj4drrZpmWByoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llNL7-00335g-VO; Tue, 25 May 2021 03:02:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llKiu-002UzR-Pk
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 00:15:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id et19so37401668ejc.4
 for <linux-mtd@lists.infradead.org>; Mon, 24 May 2021 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsmlRIkgq2zV5frevaV4WTTbksGQGcj6H85aoJ0Ejt8=;
 b=q7Ocqmkns5l1r5KzX/QKurVUeFmPQH9c1DhFDzd87dFqvC5j4v+cO6y6Y3ndzRX0u5
 Cl97L0mD2Zp9T7moehtSRy65RmpLbjEM1IgYR0/EfQFTFGtMDOv3WWjDk4QcdMB/oTWe
 dWl6cnN0quBvaYbBwQGoHSMVOfUg32Il2vtpbBX3kMJAuoM4PLwNFJsqCSIKmM9kutoO
 UPzSxqi1//NfbTQFS9lsOI8GHdiH0L5FS3fmrYoaNLrpGpAN3VlcC3WV2cTljlKsRzWB
 Tq2o0Qx/AMkRPMcsI+dALFfDnOfWHeHPYBpZWA+9wKNJcaEyPGXJSUOPVlQ4E7HUHIDI
 NxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsmlRIkgq2zV5frevaV4WTTbksGQGcj6H85aoJ0Ejt8=;
 b=M6EcezGVPrW7PO4yIShbtqdtOSB0N/EwNCxdhIb/X/dluiHLFKuEtMbZDKHh5eM/Fp
 Ah1fPqRZACCJmOU3h+wF/dP9nEXy/VacYbP5BrIZKzzBnHGMNR8+EYBV0gkKUdlQPaT7
 2/EnRTjW3p9KVHezkvlcdU4dzm9h168zdC6knE4yJdsb135c0fdaGQEUHlQEtRtFEknD
 D9d0zRc/p7ig1OhMWFwWG43/Ig+NflRgYF1ITcAwiKiCxzDR63f5Ukx0USiwjtAj5Vb2
 RGb2T/ODCN44FTyh9UX+OmnXM5XwAEcuLLlBIJKd39SbuTje2flxpXQq4Re8zrESOb9+
 w2XA==
X-Gm-Message-State: AOAM533yWKt+fuiQq3aUp69uhe3j0r/u6JN4TGak2BDI/SISDly1Mr2q
 liSCl90tsW1pfohHhWR2oU8=
X-Google-Smtp-Source: ABdhPJxLpRdzFVmTZm9zlKW4qOFdgQStppgfa8WmFcOlQhXn2XulruJIuoMAi/X73ZXZ6n0OJlVMgA==
X-Received: by 2002:a17:907:d1a:: with SMTP id
 gn26mr23234142ejc.42.1621901702156; 
 Mon, 24 May 2021 17:15:02 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id yr15sm8448017ejb.16.2021.05.24.17.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:15:01 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: parsers: qcom: Fix leaking of partition name
Date: Tue, 25 May 2021 02:14:49 +0200
Message-Id: <20210525001449.10386-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_171504_880984_89FF1A9A 
X-CRM114-Status: GOOD (  13.25  )
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

Partition name are already allocated and defined by the ptable struct.
Skip reallocation of name variable and directly lowercase the name in
the ptable struct. The name variable was duplicated but never freed.
The leak was found using kmemleak.

Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d9083308f6ba..3d083f0815f8 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -62,8 +62,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	struct smem_flash_ptable *ptable;
 	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
 	struct mtd_partition *parts;
-	int ret, i, numparts;
-	char *name, *c;
+	int i, numparts;
+	char *c;
 
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
 			&& mtd->type == MTD_NORFLASH) {
@@ -125,17 +125,11 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 		if (pentry->name[0] == '\0')
 			continue;
 
-		name = kstrdup(pentry->name, GFP_KERNEL);
-		if (!name) {
-			ret = -ENOMEM;
-			goto out_free_parts;
-		}
-
 		/* Convert name to lower case */
-		for (c = name; *c != '\0'; c++)
+		for (c = pentry->name; *c != '\0'; c++)
 			*c = tolower(*c);
 
-		parts[i].name = name;
+		parts[i].name = pentry->name;
 		parts[i].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
 		parts[i].mask_flags = pentry->attr;
 		parts[i].size = le32_to_cpu(pentry->length) * mtd->erasesize;
@@ -149,14 +143,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	*pparts = parts;
 
 	return numparts;
-
-out_free_parts:
-	while (--i >= 0)
-		kfree(parts[i].name);
-	kfree(parts);
-	*pparts = NULL;
-
-	return ret;
 }
 
 static const struct of_device_id qcomsmem_of_match_table[] = {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
