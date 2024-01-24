Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97940C47DDB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhKyMX2tMVmudb+4cXg15cg/fjXChlAZdydWObuU1Mg=; b=jg2rXfKn+buJo3
	eqU6/bd2CX+jzW79VIVXFZvVyB4EDtKw3dphtmWd9bA9BqbwsN2nueFcZBNgYEuWTeNsY9LUNFKCe
	L91T+h+v0PJe8fswPhc8kbQbJzAhJQDr7PvrMcvtx1kZbRQE0zmn/DGP1P5mgNCkZy4MSivQ56V8Z
	bewoP3u2bUGkcOWTyWZYepuv8PILIKlGRhN+HgdFcsea+P3aBS6tXxXsRebGmpklrVAlWtj4xpG2A
	8wB6pnWPHQwRIcSe+a2RDVr+Ofvk1I/tI7hM2ebUcycQ+IdNSPT5agBe154sQUhGIrWLSZ748i7jE
	deG0J70e0JIoScUDroGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbs-001GDY-2R;
	Wed, 24 Jan 2024 03:07:28 +0000
Received: from mail-oa1-f97.google.com ([209.85.160.97])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbE-001Fgg-0O
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:49 +0000
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-2142c746270so2201363fac.2
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065547; x=1706670347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWrjbDqCG/a53iknaUN5XiQX6sRbzWT8kV4u/Nqcod0=;
        b=PU9XGzlLCN0NZ2CxS0+xwlMM6RkhFT7EwaQ5l2xvrqisMYp+ltVIX4KbaXrrCr/Ti7
         3ldzJMXa7Y0Swaj1Xice0ODITKeKqc7ZSmQgBBazEci/Gi2ddVIyIaJovNpdO8hzE6ZH
         c3vXK8FJpRHQnAP+ipjUc4JEl2axdz8GOjoOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065547; x=1706670347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWrjbDqCG/a53iknaUN5XiQX6sRbzWT8kV4u/Nqcod0=;
        b=YhXxqZhpPmh6hhRIg/IfCAxhu27WUpDEty4B/Hn4XwC8usD3ZUcBLuw5/MlFMoMI4D
         Y7r8Rg37abFWxNvh8FKFFoEZ1Nqzl3XiCikp3qQ32lRIL+00qxmylJ+C+0IH9XMTswQ6
         sJXlQhbDlCoGrmsU3HMJggBmQU6kzFeDr8BMttNypY1yBd8O28lIuRe9XlY+jdQQXT/8
         5/oIp6/X6M7e1W2Gg4Tn3SSgonmuRf5v7KQy8nCvoXYdFkqPdQoRkSAor+MGqJY5q03k
         rdG2x9QnEvvP7DlsK1sqwT3kJJOD97O1/+etEt1DsPPb+MIXLrJqtjihbDFQlMciQXKP
         vwOA==
X-Gm-Message-State: AOJu0Yw1iWib99SET7yOAhK2GTatVkifhme5+4g95Dee2ShqNThh3c/T
	/6GcvyJYB7ZtW3XO17epl4hlGb6d/GbBg8aimM0xj8/U1uC15GQH+xenWVgGvI1lNPO9Yc80mpM
	VEcNQeRcWaaHdDxNoscwo8BYbJZ2Mww==
X-Google-Smtp-Source: AGHT+IE2vHfCyYBih52W5M0f3AGmJiw1Z9U9eEUslAe6KVnFMwBp5+AcLPHZaEhOIqYfPDx3p0JRjIIhi8Zi
X-Received: by 2002:a05:6871:2887:b0:210:9047:1e47 with SMTP id bq7-20020a056871288700b0021090471e47mr2612080oac.60.1706065547131;
        Tue, 23 Jan 2024 19:05:47 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:47 -0800 (PST)
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
Subject: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
Date: Tue, 23 Jan 2024 19:04:58 -0800
Message-Id: <20240124030458.98408-11-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190648_156188_5AC62092 
X-CRM114-Status: GOOD (  11.11  )
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

Allow settings for on-die ecc such that if on-die ECC is selected
don't error out but require ECC strap setting of zero

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
Changes in v3: None
---
Changes in v2:
- Added to patch series
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index a4e311b6798c..42526f3250c9 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2727,9 +2727,11 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	cfg->blk_adr_bytes = get_blk_adr_bytes(mtd->size, mtd->writesize);
 
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST) {
-		dev_err(ctrl->dev, "only HW ECC supported; selected: %d\n",
-			chip->ecc.engine_type);
-		return -EINVAL;
+		if (chip->ecc.strength) {
+			dev_err(ctrl->dev, "ERROR!!! HW ECC must be set to zero for non-hardware ECC; selected: %d\n",
+				chip->ecc.strength);
+			return -EINVAL;
+		}
 	}
 
 	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN) {
@@ -2797,7 +2799,11 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	if (ret)
 		return ret;
 
-	brcmnand_set_ecc_enabled(host, 1);
+	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE) {
+		dev_dbg(ctrl->dev, "Disable HW ECC for on-die ECC\n");
+		brcmnand_set_ecc_enabled(host, 0);
+	} else
+		brcmnand_set_ecc_enabled(host, 1);
 
 	brcmnand_print_cfg(host, msg, cfg);
 	dev_info(ctrl->dev, "detected %s\n", msg);
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
