Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA22C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rU7aCOBuJq7xl/S6VZtkC+nUhx2B+d3DY4q6R0xs7XE=; b=TgtRz3uRxnjQhW
	l+3H5X48L5QvziJ3oZtg+qsCsP9DQU8bzwDM2wXZSSQPq7HBiq8uetUW3a0spMigwleIfA30Yz9NA
	BBb4iU4VGZKXB0DBsMoBWPGAOWnrAralLrVHF/X7vDgsUXt1cFVPH1kLEp8q4dxW/C3X8H396X00+
	VrsV/iouNZSj8SJvHzCa4/F/3tWkro9J+0McSYyA7P9pth4WCxggkX9/sliPpDazhlKo/XeywV+nb
	MNQM99Ag/d8JfOEtPjC22/yZZXkZZn861kVF81CIq5hVKDUQkDaYiKws2TqoloiOnITMjuoM3iwSf
	FnHZMqQ1J07EXQCRvU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uHC-004wfB-Cy; Fri, 07 Jan 2022 18:47:46 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uG2-004w0I-EY
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so12824368pjf.3
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzfKG2mIRQGSvw1CkEuUtuMIqXtLzgCz1k6TZathavs=;
 b=CInyfj548yzLwHxEI83E7hFohiLMAPzKLWejyKPXDzSaD7tpYbc9PUXpig4sBdrQxO
 2sxyQ4gmcDpH1ENU5C5dnWGR7mf3DSQIrSDVZ4emKhwsaLspTV3toizlEivcZ2C9VoWh
 KjAIvBCGggAXhGAR3AYY4M9tVC72PaN0tg/ZqVgaT0HvXoBFsswa9LaM9D071xsbO5Ab
 3TuI/zMthgfEcJsgMM8mo2nfT4q5klGLZrqosewJlh9SKjOZQfBD6U2e02kMMa8wZlFJ
 fgj1FpFuA9yzStnreme6MuTPWAhIjH/ZelanavO716mv5e3lxRb7xQjVgrZ2otTeXS3B
 efww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzfKG2mIRQGSvw1CkEuUtuMIqXtLzgCz1k6TZathavs=;
 b=iHHMxTvAButEZPyTFNpJmVIQNT2VFpMuj0quMbLhS31ir8M1ue7Db/o1p9aH+7zQoD
 TvMLZf2JbwK2JzKFZpef9PF+fJBknyNRzumHHVkdc1ofSim2rcpg8LsCoUQrqHrwJVus
 yKin6QMUJJVCWfSa4w2eVvN3k5ncZzQb95+BUmOakJ3yYTLQvEzVGqLp9K9EUDBGjs3T
 FKCGeLnBVcpDzpqkk6o6HnYb7q4e/cbXGic+1LnlP2eN93/3WvIUfrQm7p63tNXlCqQx
 jVJOl7FYsQ6TrWl+E82Hx6KUY0AHW605uNI0qOM4hgDsihls2U4BZwxjziuf1hR3tu2e
 3EGQ==
X-Gm-Message-State: AOAM533zw462HwJG+CR1bK9mhnMnunJJXrXlg8An9TjbhFghpum4WtRP
 +ak9yd+G2ZGUGy9gudQkiwQrabUzeLc=
X-Google-Smtp-Source: ABdhPJzFd66kFUlYUPppIyIPnYlll0U9aC280oKZbQYgDzgsGghFduWTMEBghVVIdBu7Oe4TsT0TZQ==
X-Received: by 2002:a17:90b:4a11:: with SMTP id
 kk17mr17049568pjb.234.1641581192967; 
 Fri, 07 Jan 2022 10:46:32 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:32 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v3 4/9] mtd: rawnand: brcmnand: Move OF operations out of
 brcmnand_init_cs()
Date: Fri,  7 Jan 2022 10:46:09 -0800
Message-Id: <20220107184614.2670254-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104634_512079_F77AC4AD 
X-CRM114-Status: GOOD (  14.28  )
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

In order to initialize a given chip select object for use by the
brcmnand driver, move all of the Device Tree specific routines outside
of brcmnand_init_cs() in order to make it usable in a platform data
configuration which will be necessary for supporting BCMA chips.

No functional changes introduced.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index b7b15ddf326f..40818c881f08 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2768,7 +2768,7 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
 };
 
-static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
+static int brcmnand_init_cs(struct brcmnand_host *host)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct device *dev = ctrl->dev;
@@ -2777,16 +2777,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	int ret;
 	u16 cfg_offs;
 
-	ret = of_property_read_u32(dn, "reg", &host->cs);
-	if (ret) {
-		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
-	}
-
 	mtd = nand_to_mtd(&host->chip);
 	chip = &host->chip;
 
-	nand_set_flash_node(chip, dn);
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
@@ -3193,7 +3186,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			host->pdev = pdev;
 			host->ctrl = ctrl;
 
-			ret = brcmnand_init_cs(host, child);
+			ret = of_property_read_u32(child, "reg", &host->cs);
+			if (ret) {
+				dev_err(dev, "can't get chip-select\n");
+				devm_kfree(dev, host);
+				continue;
+			}
+
+			nand_set_flash_node(&host->chip, child);
+
+			ret = brcmnand_init_cs(host);
 			if (ret) {
 				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
