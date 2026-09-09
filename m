Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4548FC79FB7
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 22:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VJnRBB9sGCtuKjFwbBj5bWc5RF2nknU0xaVGqAnmG0U=; b=dDHCXhIqgqiQzS
	DCpf8Deq1EcTwJa3ItnE71hf784WecrboX0/CpY9lxnVJwwPjlL7GhxucutogyNQW4YfAg1+FlHYI
	yagRpgDJKmmY6+ShFH56PAkUrs/yBmrsIKC1DEs5Dw+ZdTNTnbu6qnQvREinVBKRJbsLFg9B0G8m/
	Pw5sYDYws8YfzmhmU1ujtGaecZMQE4IHvQZYMJH8eFlKDfTvYXWQa8YWA02byQAK7SXl30Aa+5LVi
	nfWiMY9gs3OVwdkVrSqlw0JVFWToTiXmn3RzMOZ3jOrfEB1toiZIKvmV2GVh1zfmCun5U7WcB3nds
	Dt1p0Buz0yX+vlPfQDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qvr-0000000D1xX-1Xru;
	Wed, 09 Sep 2026 22:38:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qvo-0000000D1x4-45Zc
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 22:38:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2db858d60e0so23715695ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 15:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993496; x=1789598296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0TDN1ENNBP5/KFE2zuUcIYLjDMC8n7M/eAXUlfMDRo=;
        b=GwDnikKTJ9128kFQselA4WNb9J8K0fmqsC/TRyilFTLInmHhy84HdzfsSaHMZ2J4o5
         7P/EPE8XsfQSJJ84nKxoHxTgfMeA3aIUp81qkE9NVD0Dx+H1dG5xxpmO7Yhdh/cd3ru0
         y5MnAh6dEz0pceWS5GQyC3KC80kdh+xBPmnqdHRspuNW6SySAhGPfURzasPR/EWlE0Cu
         X8o7gZpopCz25ZuI4P8S9n2Tjb5NaC51YUzAcnObfQN5OKMCdCg3YfcNrPFcPERiAgiD
         yLOAHq3X8qOoDOv/1vTYAp3bRbxGJwbti7GmRBUir3FPSvK6f/LrEttClr7hYoavc3J9
         etOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993496; x=1789598296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0TDN1ENNBP5/KFE2zuUcIYLjDMC8n7M/eAXUlfMDRo=;
        b=Xmzh6bPv8OrX+Yc4K1pZp6xnYqBJiGMeqXgD+Uf/nCBLMo7DmqQzrPvojvB+yL0Qbr
         lfkAUFnB/8PyAs1QW/JvoyYqCHG9yQuE4jcjxiU9C07saub3euKjghWSMTOEs2NyeR7w
         QRLO+YxjAJ//wwnXv7Ymcii6bxOuK9A3+YrA9ikUIe+UAiKn7KNQNSuhgtdTdHMJAvPj
         t4XvDFv9uBqIyO2+sz7FtDFVt1AEh2hCLLOQOrc2+bgnxj2DdKAMOhByFZXaLNS6Ad6l
         PzHpeuLFBL5u6MbYprnHF9oodAel/lhwiwz7o+q6ykkRHAXabKxFNHQ0IFMwZRDunKlC
         vRCw==
X-Gm-Message-State: AFuF++kEkZodC/sRxq9sHVrd/+UrMB0iSOj+WtEv8sxwJAyiSA0dpfoG
	eRKuLYq9qrDCzYiUwoQs/AC75/XePra94f5uy3Hzu/rU3wOHVNdPqrhw8yJKQQ==
X-Gm-Gg: AYBFou0JG8WP7yj0ypNbBJPR1WGMRFY/9Y8TumRkp+ZnLlXxaIj1Tby2NFZSmlpkL6H
	QGniKNvmUF8X5wUaei5rP22aiA4MnSFdrgAQoPiayZGIt7fBncaZkijo+BTI3bY33YdvSftLVBa
	sRzTm8aAgtODSfjtF7HtHts5POJBeMKUfbvppfFJumWX4OxtCQ0VeXik36NOexWsElIGIfU5qDZ
	8/Ek+xM/DakibMDO+NmmwpI4Xjg1CNAVUmT8xwqXzwjfPbuhy9T83ax0qU4bJhIPoUqTY5jMfVm
	YQMkCNTcveOW2im2jcvgMlIo+tji2B1rm/IKWIvFGXlPsK2byGVLPsI+SKrA73lvoj8e6A/GJ7B
	PgCiTako91Egz6R+4atgVA7r397cNsnAzfdRlh0XJTVrJABKvuxDHKuD1dBi/Qb4HNHeHyNm8OX
	J1BdnVLSV4I2FKaPJG9iX8caNAuzc9DXl6GlO5lm7PXZd07nxrLvV8I3ppI3w+Z4p99DCK2/kol
	SYdyxzTdyoL92N5vSVK7eg1imO3NzKktheiUEsIx35fryEl2MigdNShZXY9tpjPSjvCmUkTN31r
	VnBxjOpSqZ4lh+n4w/fcmrZhG20SYPD+1P60wxlxNPKVwd2IRQuDsXGz/4E=
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr54469922a91.14.1788993495918;
        Wed, 09 Sep 2026 15:38:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e82fa21sm266638a91.9.2026.09.09.15.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:38:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
Date: Wed,  9 Sep 2026 15:38:13 -0700
Message-ID: <20260909223813.69028-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_153817_014944_3077B40D 
X-CRM114-Status: GOOD (  12.15  )
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

Replace the manual kasprintf() in probe with devm_kasprintf() so the
name is freed automatically on driver removal, and drop the now
unnecessary kfree() in fsl_ifc_chip_remove() and its leftover mtd
local.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 469b233db73e..cc75b6a67e07 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -963,10 +963,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 {
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
-
-	kfree(mtd->name);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -1061,7 +1057,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
 	mtd = nand_to_mtd(&priv->chip);
-	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start);
+	mtd->name = devm_kasprintf(priv->dev, GFP_KERNEL, "%llx.flash", (u64)res->start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
