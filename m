Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3D3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lccKLgz5PMaFQ3QrQz8OjFpYFZpGDv9GbLNwHNDfcg=; b=Y0vi1YsbChArkP
	sHNf3x3ZRvivr94xTLsZcW48FN5GoaO/+VFrzvQCk7hiAA41vMS5xb3WIOFb7FdKCe3C4YWbv9BaS
	KscWUHN/mP9I03iNQfVK0WVk6iLkygg/Tm5N3GDYQOiRnanW8HeF8t6bptGdEP8X5P4WQz/gYfyZ3
	oBGv4NfMnIF0hJ0immEHnUkQlutWdImEEki9CZBP7t6cYPrCaAiCipuGzyKcqOHuGdAwRZ1x6iN2a
	oVXY9tsI8lxY4d2BBJOkfhvPyNoOdtj8FGFsKq7Zss9loHnXOib1HUYZVPOlGZTb1WoEBIghwkIdm
	/DD5YN0oYIrlwT5UGE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0BtV-00BY0M-VE; Thu, 23 Dec 2021 00:23:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0BsV-00BXg5-LP
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id m24so3018401pls.10
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2NATCUWUg4iwnRGoqM+mgzKzp/1tXDebp9cGfC5HfA=;
 b=OkvKBUsGESkn9oq3lyl1KbJ8FGgqluSGLkS7IDTN0WsZiBYkxuPVNKZbs1RYS5T6u4
 x0wbqRMPulF/zKWIdAba3clMX3vnNJrtwqGl3PAHPziIUbQVwUnrVR4WRXjkS7Q3s5eI
 3xAc+ImwQLgy/q6vQ7Dvuzt5w21haF7mia58Fl2M16RadovRJC4ozxvnD5lcy1aabKic
 uJJnDYOfCjlcfVUJQyLkVyGYEYDcFmmsfSBgoCHlVJ5C2EPg/hVscwHp7VQ96M+6sdEY
 sq9SFghUcWesgJ96cWs5VNx5ism+i64xPGERCJ2uZ1ZPYVTK+dACkvGodDyeqvRsf1sV
 4lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2NATCUWUg4iwnRGoqM+mgzKzp/1tXDebp9cGfC5HfA=;
 b=CreFVSUCEq4o6kZOuihi3wN0T6xPhslC0+peJ0l5AE+kszkTPOGPkFhpBTGGRpWqfV
 84PjedpugwNRPl8lhM2XpfkA24Mjh9CEVnrgzHeFwAk6D6ceX3nF2ZQ/ZuhZgjiTNvvl
 MydN0wYj4BFpkpF0i64U6SLByRGT5GjM8TVgVOoG2Rz7qHZxYwrTzSijNePavzoTm/j6
 zY4t6r0Entmn+aeUSmhKATEzmhRv70wkNgq+9mh93rQTFz/199gMvcJr+jwtLN4732Vq
 IJxkNgYDA+mqX9mWV5uxj6iCREwf6DmUsO5xkS9rpdebGM+3HT3gZFZ7Z5Cq/PAV4ewL
 /OVA==
X-Gm-Message-State: AOAM533dEzNPc2KSvdZtSGmfqFAgRIrWK27RaDvt+kns7kzcFWMAAtlS
 SQf/dRijaxcwrcx6SLUch933Dk54B6c=
X-Google-Smtp-Source: ABdhPJwjNO0Ihj3L5T0ypAgnFYpoTOdk2YWaXKlYWeEVPK/HEnwmcop3KmKEUFbkY0u8nZRvReO5mw==
X-Received: by 2002:a17:90b:4a09:: with SMTP id kk9mr45266pjb.53.1640218958532; 
 Wed, 22 Dec 2021 16:22:38 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:38 -0800 (PST)
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
Subject: [PATCH 4/9] mtd: rawnand: brcmnand: Move OF operations out of
 brcmnand_init_cs()
Date: Wed, 22 Dec 2021 16:22:20 -0800
Message-Id: <20211223002225.3738385-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162239_727388_EACFB41A 
X-CRM114-Status: GOOD (  14.57  )
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

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 35f8d8e02d4a..60a7f375df83 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2760,7 +2760,7 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
 };
 
-static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
+static int brcmnand_init_cs(struct brcmnand_host *host)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct device *dev = ctrl->dev;
@@ -2769,16 +2769,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
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
@@ -3179,7 +3172,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			host->pdev = pdev;
 			host->ctrl = ctrl;
 
-			ret = brcmnand_init_cs(host, child);
+			ret = of_property_read_u32(dn, "reg", &host->cs);
+			if (ret) {
+				dev_err(dev, "can't get chip-select\n");
+				devm_kfree(dev, host);
+				continue;
+			}
+
+			nand_set_flash_node(&host->chip, dn);
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
