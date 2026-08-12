Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF7C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BY4He03OxBFATGnGWNgidoZSPhS4LfYkO34wSQ3xiMY=; b=f9BiFcxOTLDmTI
	NRNWZMHQE8OjEjjaGcRsX1zYoGB81wENpgUwWAX8UHNzXxgG8Zp3XHtFfoguJsTwD08EL/Aa/r9NL
	iL85oGB6jfTpaXHMc7xMffhwPxnswwxCEBjPgGDaKM05sdC1KhNCCYSW1WIPiXJ50dykA9gZ4o0XP
	+GicxKiqMBHdNyv2Wnsi1Mal7HsfL2kavTxkYYUAwY+yo5DHpaXVNZeC/jMcjOQT/k/uiACJ0VsSs
	bTXuoqdP5iKHj/bhmiOv54CfSxwAiAONCdx6RvL+MfU8k1vSL1xXLuxw58outojUlNDGsS/bs+wtD
	5Clc/ASNIUceAnfrVE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6LI-0000000FulM-2L6b;
	Wed, 12 Aug 2026 10:37:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6LG-0000000Fuko-2b8W
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 10:37:51 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84867f07d63so940287b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786531070; x=1787135870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7WJbujA+QfvQ6NybddNsgaWGU7u0y1rN46OxpRUl4Q=;
        b=GhjkiByuN7W/heDTnFfNiNcF2ZgXiG7Sej67o5JPduaginaGKOks/e7b1UfVdS2iUT
         AMclfyDGYz9Qexn459Lp+8MI//a209vpLNzEg0sAJipJhUQH83c7ozatsph4KQw5sdIC
         Rikz81irB3b7Q98q3p/nTIGUfuFGqyqcu1aigUDDG2zaba09JEUOODiVzjQYZ3IgBMBl
         Y40tQ14utHWSlefZYgdELu/DsoNZJKL/cq9OhRvwaJG1VTmJtWuBcSTcFUiVa952US4j
         L0kTZq1tlQU347NesFhtNM95vwPZkcpkd8281dYXBAZYy8/Fob6Q+PZaSDYwhVB3Fzpy
         RoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531070; x=1787135870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7WJbujA+QfvQ6NybddNsgaWGU7u0y1rN46OxpRUl4Q=;
        b=fy29v5g9oHg4u+9Dm9wwvvNlli3/arDn6rjP2qrZOUoo1PKeBduAzjMq3RDJjuFU3e
         fGadAUHnrU11Cob+LkdxExNnSvTp1oxDjeKRsiiSP4oFcLxArIydb3xUQUvgvLBfxA2x
         m+2qdIDXL80QW6ahrHxeoJ9akayijyk2E+155PEUKxvCYGxbucmDbJJwULK737nrmBg6
         ErwIK5Mi0T6n46cKvp+fUl3UOsfEl7LjR0uQMiqCqK5sumy086SDkn6UY3qgsDf6nE+B
         5q0rysV62DiY4doFEVST2vmi3KTzWjH9kW4nMzuRrISBxWRzqDnfT7jYVemCmGI4dadL
         11Qg==
X-Forwarded-Encrypted: i=1; AHgh+RpUVv7pHIdGZK/o3SuFDDFMQ1k37a9RQKB+WLMApF3QQY3gsnj9rvCpS01nbNJvjhHBh2HAlZPJ1Ro=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOgwj8XUzZ4j5qCqdOkQhngXoJy4TmDbSUIzeJYTn4UceXi5Z/
	rppx5S6BLVD5Oz/F35oD58rjUhgpnJl35IOOQ8JtJZOY9sebInkTOku7
X-Gm-Gg: AR+sD11ck7y7xygAi3rMs20HPwrpmmAvVrxGEF+v081wRgoq+n6WdEAqjS5XDd0JYr1
	InDq67Fv1yJSjmT9JtzteD3ZZQj49Y99i/XCz7IPUkUYl2T7E4lW5Uvukf3z5vsXY6471xfsFpy
	Pe6XK133POZPnHEAxVVQVH/YcIKt3cvTX9LgoDfgqkoMmGxWY1dLh09J78QFgVYaesLPpcf5R6G
	jGq6tBZb19WDNlCQDErAsQkmQJMXpNDF7EKOUxVZgnHhYifXw+hDguvDfmsFlo51vH5KSPVAmr2
	JIC9acpJ95C9RrZbFLazCoxX+YPm1gdo6Ns4uFGKymS+ZItjWzj1kVOw9fVooOzkAcEKd4cTmzm
	jE2cKAoQ9bv/S/30C9+JmwpwMo3gKzcDWctcm6tVE898qPHt3+eRPnFXyNbQ77hfFL2WXQKP2sG
	gIVqQ2S3/JgWdbLITMUz0VilHAG6p8qJX2We92EpNXy4sglKaKngBUwTFEIKSPeLHLSQqXGkJIX
	VBkMx89Pati9ZnIBA12CALrYsyN6GqYq2q2CuC67gQs7mn3ShlOl44U9NAk70QYbamki5Vafo7F
	82Z5
X-Received: by 2002:aa7:8887:0:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84fb54f846fmr4155243b3a.24.1786531069634;
        Wed, 12 Aug 2026 03:37:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1ee8140sm807381b3a.34.2026.08.12.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:37:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] mtd: rawnand: brcmnand: Propagate errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 17:37:28 +0700
Message-ID: <20260812103728.39291-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_033750_664966_B53FBAAF 
X-CRM114-Status: GOOD (  11.90  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, in which case the driver falls back
to using the ctlrdy IRQ. Other errors should be propagated so that the
caller can handle them appropriately.

Treat -ENXIO as the only case where the driver falls back to the ctlrdy
IRQ, and propagate all other errors returned by
platform_get_irq_optional().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 5b9dadd5405e..4a1f5e736a1c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3272,6 +3272,8 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 
 		ctrl->edu_irq = platform_get_irq_optional(pdev, 1);
 		if (ctrl->edu_irq < 0) {
+			if (ctrl->edu_irq != -ENXIO)
+				return ctrl->edu_irq;
 			dev_warn(dev,
 				 "FLASH EDU enabled, using ctlrdy irq\n");
 		} else {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
