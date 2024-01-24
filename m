Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DABDC47DDB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkgW3L6I9rjjPIN1joGBnUYIPVo/tqUkVFJO18hSyGM=; b=rzpxT8xdpjYy4A
	+/bIqUwi4YG8SKGIUjsxXUsxfD1eDmPyU1s4rfQKlJ9RdhuGHZrJxr2FJMiUtDh3RQU0oOHcMwyfa
	8JU+GO9b8c4T57VsN21x38TucmG1SP2Y6mzn/TgO8RdfKu+XZFuiqKfnWVhfA85mUaLK3AbdWk+Hq
	pJl/ud1m3Oe3uRsQyTg8F4T3VQm8+tEZAU37FwHViz8xyMa8XEWwM5bSRq92F8FS5OhEODao+Z3Yw
	p4wur8xdyOacZ03O2KP/O8/oMcWzxve+dVlfiowHzCaUbJlPfdHXUuc4RV1p93rBtsLnD5wJs+4fb
	TcPPDeFLwgHa3PLoqNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbh-001G3s-0p;
	Wed, 24 Jan 2024 03:07:17 +0000
Received: from mail-ot1-f99.google.com ([209.85.210.99])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbB-001Ffh-35
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:47 +0000
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-6e0eb1cf1f5so1471184a34.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065545; x=1706670345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFcgSd1V+HgKBuaL7L8NE1SRwQaKowsXm4oxPTjKU9s=;
        b=Zq8pmR6cKLPdNstJ2TA+42ZzdrAy4z76wlyj/3dwklElb5vbn1y8eBs2wdeVxA8VPw
         r0cHvzmXCZZRRf4EElp251lrQPZAkapuWi69/+z+dxNJgm84KUJsPvrni+7F1dUiu0XP
         o/EVZwpsoyjZl54PKRno7fWIJlqW7I3hh9QvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065545; x=1706670345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFcgSd1V+HgKBuaL7L8NE1SRwQaKowsXm4oxPTjKU9s=;
        b=nss+4UvXPPdluFts56HMIJRqtdr9Z0MY+kr0NxElnfp4Gy6lFGubksSwbAFayHD1de
         z6uUKhI5TZZxpfHP/syhlQWMKhsnPC/5KiOud24Fpxu1JAGAufBiCvaNWsp5QQFL87Px
         CdmQbG31zQOLczT86SWDIulr94oMsT9QLptUrO0te+kLXpvNJ+mFEndXK6qlF/sK9hNf
         61mvc7WTrAHsiuBPgMDJpU44Wcg51nDlqD/kV0I1MHvnYmbi9CmaaQsjQRCU4PG5QrSq
         GJu9FM7rqnw9jsBe1i0GX4oZC3TkDH60pH2dwF+osqVwyzJ/zpPnK+RFEN/9k4UQemlp
         mx0g==
X-Gm-Message-State: AOJu0Yzhizzu0ouunpsScjJXh9nnrDcXlbno/yK7TkO3MXZpW7vLEdae
	OUBKVNxN4aGb6FO6RAMpIP1m7ChHUAop7IvheADqXAGJRBr6fQ+3ihBcq4f1jtPFdYKa35AZt5L
	Ji29lX7LUCGWe9OL0reiTDLd/z6AxAQ==
X-Google-Smtp-Source: AGHT+IFUczeGsTMucdCz87Q+XuPWNyli22xHQyTTbN3tL8x5ItmmZiArLg9wfVebnUPSv4u1XyEUy/6CxWC9
X-Received: by 2002:a05:6830:144a:b0:6dd:ee32:2843 with SMTP id w10-20020a056830144a00b006ddee322843mr937842otp.42.1706065545326;
        Tue, 23 Jan 2024 19:05:45 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:45 -0800 (PST)
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
Subject: [PATCH v3 09/10] mtd: rawnand: brcmnand: update log level messages
Date: Tue, 23 Jan 2024 19:04:57 -0800
Message-Id: <20240124030458.98408-10-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190646_019270_E743C402 
X-CRM114-Status: GOOD (  11.09  )
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

Update log level messages so that more critical messages
can be seen.

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
Changes in v3: None
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
