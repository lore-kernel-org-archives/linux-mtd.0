Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8BFC47DB7
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfAjXO9UvNd7Lrb3fvwCJjTuM+tSdVAZL0tX6TY80r0=; b=LPkPY/XlMk7gfw
	vmAUJiglJaxiNLtZUAb/QuKoxah8UNAJDNRvK9rMzgAsdejUG7tW5UTvX6ydi1VQHMYVrn3RusF70
	YgBfo7Ez0qNV0PsizJ0sU1rAxQTBbt66MD/3KTjY1ehl9eRDK7I+3fcq1YGcR6R5y/7tZSA9A+Yy2
	v6qV0rP6jJXNx8AmXp5X488LwKkaNjyMMiJrz6VTqY265rZ0acmOeO3I6QP7nkIipBbf9x8dw0r5O
	9t+Hu2AZ4174IUeCtwEkO9+kE5MQ76OLDM8c0bZMeDDUOa+kgcGu1MBuKemppBLotFuGDwsXEZvM2
	zz7i/ObmCqHnz+oaHRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTZ-003gb0-2V;
	Thu, 18 Jan 2024 19:54:57 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTC-003gKP-2S
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 19:54:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2901ceb0d33so841262a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 11:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705607674; x=1706212474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+ZNuMLiQVEBIU4qP2AxAyGfcGqRo4EmDBOaCTelFQA=;
        b=f1jlSpsEO5dPxELXhYJaaHc4vRucETdQm8Wnxu31ySPQ989GM9Y06I61jlfwGkNpke
         2OJt6YoUW5OJvRcjmgI970JlIp01ogw3yddg70AW+GWOxhQ29QSOSED/0YupJpguA+6w
         K9OOHqwj8ZI2wXEhUtU+gCOW3JiFwY1+uYw+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607674; x=1706212474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+ZNuMLiQVEBIU4qP2AxAyGfcGqRo4EmDBOaCTelFQA=;
        b=YD+s0FLwsMnr7Krgzuba9pbE8n9xKeFMp/M94gttAMC6JMOhzGrKqQA2WOIiwR6A57
         0PVLRc67vB4Nuhr9C4OCG4T56KYPtivlfVGcUt+PUdnALMiO/n6S3pfi/8Vl3FbhH5hF
         V9fMOsRz7ZPbkPuRBLSgyiZ4XzT+vKy2a6JaJlEBNEwH1vID9cZPnvV7EkdweyC/yeTp
         b83YA/CU8JcZEDivJapBHMja0v3Fd433YNFJM01eZDozhiFxXXxyYyLI3W6nQat8cm0K
         M5onpYzEiCAXwuxlIspRp+6WpWpRJ/3rjkiISvoLmI+WYIN87fmbMrt2tQulhN7Wq1CS
         u6Xg==
X-Gm-Message-State: AOJu0YxX898nrOlzI0PwE50NI76ZnQ4mhPKtLa2aZoNXAakSsc+aXEeq
	1AUkkvYVoFTByXfLAdSKsiF/saOjSlHNzTWXGOAXBjJtlk5ZBZGv3vb3ISwbzg==
X-Google-Smtp-Source: AGHT+IEJ3qIWczlfChoU8rtUAqv8+jLQdgG90HPXrESS4HZTszddZNh5owLB7/ayia0byi0ZhWT++w==
X-Received: by 2002:a17:90a:241:b0:28f:f249:3c4a with SMTP id t1-20020a17090a024100b0028ff2493c4amr3931395pje.19.1705607674171;
        Thu, 18 Jan 2024 11:54:34 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm2263805pjb.38.2024.01.18.11.54.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:54:33 -0800 (PST)
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
Subject: [PATCH v2 07/10] mtd: rawnand: brcmnand: Support write protection setting from dts
Date: Thu, 18 Jan 2024 11:53:53 -0800
Message-Id: <20240118195356.133391-8-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240118195356.133391-1-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115434_857004_48010A8C 
X-CRM114-Status: GOOD (  14.47  )
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

From: William Zhang <william.zhang@broadcom.com>

The write protection feature is controlled by the module parameter wp_on
with default set to enabled. But not all the board use this feature
especially in BCMBCA broadband board. And module parameter is not
sufficient as different board can have different option.  Add a device
tree property and allow this feature to be configured through the board
dts on per board basis.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>
---
Changes in v2: None
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 869ea64e9189..9a904c7c6dad 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3081,7 +3081,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	struct brcmnand_controller *ctrl;
 	struct brcmnand_host *host;
 	struct resource *res;
-	int ret;
+	int ret, wp_dt;
 
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
@@ -3218,6 +3218,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	/* Disable XOR addressing */
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
 
+	/* Not all boards support write protect (WP), check DT property */
+	if (of_property_read_u32(dn, "brcm,nand-use-wp", &wp_dt) == 0) {
+		if (wp_dt >= 0 && wp_dt <= 2)
+			wp_on = wp_dt;
+	}
+
 	if (ctrl->features & BRCMNAND_HAS_WP) {
 		/* Permanently disable write protection */
 		if (wp_on == 2)
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
