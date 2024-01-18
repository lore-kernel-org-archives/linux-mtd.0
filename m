Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11094C47DB7
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU384gKiIb796EDzsCMh5qR3JLmq+zt5yd+xm1ss3eg=; b=wgruOoAHgg8VJB
	o2+WcnlpIc2oM2JNLZ24RusKuWLnEkVd4V+DjVJPp5MS0gG6ZzNu6sI1IQ/bUayL5skZ05weC01wq
	RCU8J9OfF1468eZEUytxAoJBvWm8me3rRndfQ7g8FdNzlDkDzlHdvXM4p/3e/9biZ3W22G+kr6ENX
	Y3b6UWi02bdWIvjresIjdxYc9qbpVjkMeiX2QL8LMqxakJYBxPUUwiLCMZs9WkeiCyjkq91Jl+R0x
	xi6NanB9tMkjny2vJMb7KL+1aSjUWJfqBXeZ2JuShvkcQR37Ae/NDJAmGsfsQ7o/kEs4RZv8uvSsE
	IE0fmT7mAIf4C7Ox9uKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTm-003gls-2X;
	Thu, 18 Jan 2024 19:55:10 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTF-003gLf-2g
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 19:54:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5cd8667c59eso28429a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 11:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705607676; x=1706212476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ0KMT7YinNWTDLRkt/ik0/tsSQLLOEO8iME5kKq+rI=;
        b=el8ecWTY92YnGdTiaypfXC8Ni98SzVq1O04YE8V485GX6tN24wfK3Ed/5nO6K4r4Bq
         eNG4/3TjIlgPXhvERESjixhcNMBejhRRz8CWN3dXKyvs4OLed5MRP4JPNCPl9eTsC79g
         vDQozoXjXODYRUgx56IKVewpGhnEpuuWj8u4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607676; x=1706212476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ0KMT7YinNWTDLRkt/ik0/tsSQLLOEO8iME5kKq+rI=;
        b=bj2X6O5Qk9u0ICZi/PeUjb5Kq+ojdTrCuJSUyYhxfHLPFr9vo7WRTzpeN1w9Ye2JSc
         AJ7TWKlKB1xhyRNY/SaTHxPJF31Vm3Nw7J1fKySXYkqoeyWK0BNCS6kNVI5tiIOOGlhe
         oHv1BupyK7LUhMqWJHuBBEda9SX4+R8vQKotOtAVbisHI+JqYkwaTpqWP0Biqc8isVGh
         LHC2Y7FuFn/Px8xw+GmlzVLX3QwSEyfOZPqj0VmGe7Z5OgauH3hjpxLEqkxmEVBuk+fU
         2Fp8zTV6tkKlt1vKiCTbyeueqMg+CB4CyZcm6AEX9TaFzFxrHunXhJPDn5hT9H87rNkw
         2fwA==
X-Gm-Message-State: AOJu0YxWcRSJnZSVJHxmU/99m5bDo0HqvGsd755hHBTI4Td2c9dIPm4s
	atR0tZHivCfbzLeSf4tjRnqfkej1WE0lfEN20xPMZ1dGShqKNrUzOI1HeJlNfQ==
X-Google-Smtp-Source: AGHT+IGJ5PSS/zL5LeT8Z2TjlL7IRE7vXLwG16dkY25ybhY9hLXWwD/0TI/ZkCDk1mnTsOWnNsSZLw==
X-Received: by 2002:a17:90a:740f:b0:290:4168:e0f3 with SMTP id a15-20020a17090a740f00b002904168e0f3mr415735pjg.99.1705607675755;
        Thu, 18 Jan 2024 11:54:35 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm2263805pjb.38.2024.01.18.11.54.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:54:35 -0800 (PST)
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
Subject: [PATCH v2 08/10] mtd: rawnand: brcmnand: exec_op helper functions return type fixes
Date: Thu, 18 Jan 2024 11:53:54 -0800
Message-Id: <20240118195356.133391-9-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240118195356.133391-1-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115437_897434_1378CD78 
X-CRM114-Status: GOOD (  13.60  )
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

fix return type for exec_op reset and status detect helper functions

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
Fixes: 3cc4718fa644 ("mtd: rawnand: brcmnand: exec_op implementation")
Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
Changes in v2:
- Added to patch series
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 9a904c7c6dad..6b5d76eff0ec 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -625,7 +625,7 @@ enum {
 /* Only for v7.2 */
 #define	ACC_CONTROL_ECC_EXT_SHIFT		13
 
-static u8 brcmnand_status(struct brcmnand_host *host);
+static int brcmnand_status(struct brcmnand_host *host);
 
 static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
 {
@@ -1749,7 +1749,7 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 				 INTFC_FLASH_STATUS;
 }
 
-static u8 brcmnand_status(struct brcmnand_host *host)
+static int brcmnand_status(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1760,7 +1760,7 @@ static u8 brcmnand_status(struct brcmnand_host *host)
 	return brcmnand_waitfunc(chip);
 }
 
-static u8 brcmnand_reset(struct brcmnand_host *host)
+static int brcmnand_reset(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 
@@ -2492,11 +2492,14 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 
 	if (brcmnand_op_is_status(op)) {
 		status = op->instrs[1].ctx.data.buf.in;
-		*status = brcmnand_status(host);
+		ret = brcmnand_status(host);
+		if (ret < 0)
+			return ret;
+
+		*status = ret & 0xFF;
 
 		return 0;
-	}
-	else if (brcmnand_op_is_reset(op)) {
+	} else if (brcmnand_op_is_reset(op)) {
 		ret = brcmnand_reset(host);
 		if (ret < 0)
 			return ret;
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
