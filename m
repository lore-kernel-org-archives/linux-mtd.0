Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C4C47DAF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saRiS8bQTwXyKy21RfVJ2PUIqgT3ljoCZ/RGeSpO2/E=; b=0TC02tPIfqSGC+
	iIKgPZ/Evz38XbPB/rC+ACnglgnA5DHb2TWWvS/RaGvMcg76aVnW/pksEyJFSBWFgPUTJwtyobX69
	SG9IAnhvpMzA9FuDBO4RzXZ18CTRA0ZW3YDXTRNV61LOODODcDHZ/Mm8wxfjlZDqSjP1ZtYKcoRnn
	8F8pHfadHGpVXrGclSY3QKb3Ud9at/h+jmU/V7B5fY9zr5MBAwGnUKDUK7EmHui7Il3vz4hW7r+Pp
	oit+eMRTrw4vOH6tZeA7RbfWqHFaq2HbpBZrSGo4bbB0ql6a3n4U1hDjCd6tN6qwAr4phPasTgh1g
	6eQ/7gtMJOBTMO4f00Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYU1-003gyT-30;
	Thu, 18 Jan 2024 19:55:26 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTI-003gMf-1e
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 19:54:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2902264d2edso76905a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 11:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705607677; x=1706212477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CghvPoNxLJl4lLRdVw4tb22f1/3nanFbn4ZhOjlHkeo=;
        b=g66j1zFobNMMrViK4vRLBkbC9wTVqMVx/OqAAESNgTZqlS3tE5ga2R6LhA+sSl17JF
         cv/A1iFCtymsl9qp+JXQDXyqzfYv+VlMOFVU3Dk/S8wUJ3136QRPJ+1EE5FMjMy7/Bx1
         z+bn6KB1A0PSOyfdYOJH9ssKpFrtlxAjfd93c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607677; x=1706212477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CghvPoNxLJl4lLRdVw4tb22f1/3nanFbn4ZhOjlHkeo=;
        b=m3AMLSkXbeJ6K76oc6mpfOLVc57ozh3fdQaFm8Xq5i0DtZdcvdJOG7qaiIUWjyEzG1
         HbcJf/h2nBmvr6o66Igd3Tf5dP8fQR4KutBUmaEMY3SJxvq7sS4nOQEeQwoOCl1CS3C5
         0r3tcooM7XoMTErx7VM7vQLZlOej7cQUALA7JtoCdBgouH5c502E6ahmirOtFjsk2g1N
         zC1xPw51ney16STEkasHqW3RSSX3oeMKvTujUb44rwTBopy9V4hKNVpQRH1L4vHUS5W0
         j7UOYArdorYndN+fBktR2YaZiixlTLqkf1/39+LG4A5KZhXrFdYDJ4xzpV3SO5GukXiO
         rAug==
X-Gm-Message-State: AOJu0Yyzr0oZ4rRhLY9UfMyPr16IbGjNVMlTAYiDCOBn3vgiqLnoBIT1
	aNHnBc32z8wNPcWGKisAoJRN0zdwgHUcYCMIvus0zwOP/dfJHIwHYJ0hjNsJHQ==
X-Google-Smtp-Source: AGHT+IGpduvvbCU9h++TkrPZzn6xG8chMBt4/0ohm/34e0CnY9xnW4nf7DjMx4QEdaOxW+UnTH2Dog==
X-Received: by 2002:a17:90a:1347:b0:290:3e62:92ab with SMTP id y7-20020a17090a134700b002903e6292abmr571455pjf.29.1705607677448;
        Thu, 18 Jan 2024 11:54:37 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm2263805pjb.38.2024.01.18.11.54.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:54:37 -0800 (PST)
From: dregan@broadcom.com
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
Subject: [PATCH v2 09/10] mtd: rawnand: brcmnand: update log level messages
Date: Thu, 18 Jan 2024 11:53:55 -0800
Message-Id: <20240118195356.133391-10-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240118195356.133391-1-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115440_604684_75AD8A48 
X-CRM114-Status: GOOD (  10.91  )
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

From: David Regan <dregan@broadcom.com>

Update log level messages so that more critical messages
can be seen.

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
Changes in v2:
- Added to patch series
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 6b5d76eff0ec..a4e311b6798c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1143,7 +1143,7 @@ static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,
 	if ((val & mask) == expected_val)
 		return 0;
 
-	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
+	dev_err(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
 		 expected_val, val & mask);
 
 	return -ETIMEDOUT;
@@ -2196,7 +2196,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 				return err;
 		}
 
-		dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
+		dev_err(ctrl->dev, "uncorrectable error at 0x%llx\n",
 			(unsigned long long)err_addr);
 		mtd->ecc_stats.failed++;
 		/* NAND layer expects zero on ECC errors */
@@ -2211,7 +2211,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
 						   oob, &err_addr);
 
-		dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
+		dev_info(ctrl->dev, "corrected error at 0x%llx\n",
 			(unsigned long long)err_addr);
 		mtd->ecc_stats.corrected += corrected;
 		/* Always exceed the software-imposed threshold */
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
