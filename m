Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096DCCA9EAF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 16:46:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26BA206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 16:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qWuJER4q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqLxwUJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26BA206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eD8S6MWsA3y/ml4eeCSRGpYSzWWXphE6AWm/8i8YYOc=; b=qWu
	JER4qO5ieWp9+DsQUFATCu7w6luzCaUxz8PNMIpqBRg1aqQ1X1cYWPf8gQBtSZrYky0EbUzjCJ1zI
	LsUBLiAfa3/AhjBgw24o+rjFjeTKqB/lkyFC5F51/KigAlQ3jZMBRH+FGHGyPO76V9hCpEJirTPya
	JOp1Hc5YctroaDId+yPEex+4g4YU/XDC0Vf5zgghb6UNTWlOmzIaXvUFoEU0Bxq/4i5gPN9l/y699
	6a8Ci6O23Ac2/PgBl0yT6HTxBJsK7IZxWpFeGle2U1Ik1mOau04dSRHe7ivMBzYGBe3TwVXbb95b2
	4zcu8OJz6wHE4+vgon3apcRmtmEDYiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMap2-00033Y-GH; Mon, 21 Oct 2019 16:46:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMaos-0002ut-UX; Mon, 21 Oct 2019 16:46:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id f22so13500757wmc.2;
 Mon, 21 Oct 2019 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eFEl28Vsq9lpGG0tWVSoyc2R2rajJ8eE9XSI+a0Gbrg=;
 b=QqLxwUJGYaKcPWLKeSxpAN6+o30jzM7ZO17CH8H2x7rhjBdYoE5e8Kn1krRcF7FfBS
 s9c6j9gUfHPvThKy9JaUcm/ZvPL0bxmsMGWvbcl3jBWpiuUBCCXeJLnqWCTRZAjmC67u
 3mIp1vyR1GEL/ztXZ7HxZuH6oEziVOMbC8cJXRC92ICD5AZonsV0BLVJLYhq+LWPRdjY
 71G/Wm6pb6/4tElBxCmFaobxo3jwNmb2r+dy5dnJnuFmke07CYRpUsDFbBTecyLnPA08
 IqqZvSgQ6XG+LWODwFTiifHYsSOKyvktVEuwdCiPxpPYLUOefJouj3I0eL1n8o08k/pL
 kOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eFEl28Vsq9lpGG0tWVSoyc2R2rajJ8eE9XSI+a0Gbrg=;
 b=WK9rM7V5LwJQZ0xk+k0s/OhX8gx9Y5UuBuXVZ6hSdOdSkuMrqNVXuL5SpEW4/qCMWa
 5JRDPKfsfQHUkYEg4pPhWYry8pgKvSjN9MTedMK+VEVZLV0zlPSpU/62jUTJZ6OSwhVy
 mrGMrm43h7INGGyGeuLCKAoK432qUXnxTyqDBcrxRalyQWJiKli+DRvwTK7SdqoSjsqg
 6jXYeZJLo+kuSDnrtrHJeOG4o3dj1ArG3mEBn1iU9BF7bsgL8AS66WStWASZOciSkDM+
 tuvndmLvo3CaXL93Vd3DBvjLoztF6t52LDZGXJmnPCpTa7Tvc7dnU32Fyb/4QPviwyis
 qkEw==
X-Gm-Message-State: APjAAAXdB2jN6EtETM/C5xLXmSJFy/6acG3LLENihyODNAubGJlDFKxG
 ABbdS2eOdWqpp+eof69BYbe9D96S
X-Google-Smtp-Source: APXvYqwO/ZxNe6wlvGMpLPz78adJYcNEatmv3ktbpu3T4PyUN6GNSk4e4jCA53/yC6PGls1UUVIeAA==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr2897648wmh.118.1571676369073; 
 Mon, 21 Oct 2019 09:46:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 26sm13693867wmf.20.2019.10.21.09.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 09:46:08 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] mtd: rawnand: brcmnand: Fix NULL pointer assignment
Date: Mon, 21 Oct 2019 09:45:54 -0700
Message-Id: <20191021164555.5330-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_094610_981007_75CF6E92 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "open list:BROADCOM STB NAND FLASH DRIVER" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sparse complained about the following:

drivers/mtd/nand/raw/brcmnand/brcmnand.c:921:40: warning: Using plain integer as NULL pointer

fix this issue by assigning the pointer to NULL.

Fixes: c1ac2dc34b51 ("mtd: rawnand: brcmnand: When oops in progress use pio and interrupt polling")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 15ef30b368a5..6a7f0211f5a5 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -918,7 +918,7 @@ static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
 		return;
 
 	if (has_flash_dma(ctrl)) {
-		ctrl->flash_dma_base = 0;
+		ctrl->flash_dma_base = NULL;
 		disable_irq(ctrl->dma_irq);
 	}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
