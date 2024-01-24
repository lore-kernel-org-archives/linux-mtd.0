Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9615C47DDB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nYkkobhXPMf+oZT7QKlW0Rl3QuA6niAxf19BFEhS50=; b=rNI5qLeT9CBvHd
	ItUOep8fgfyLWSVyH85t2jy9i08vkTfFwVUSIsbmdFqPjGv2azyDBsFnAUvAQIcaK+V3nJeCsX2zo
	WxXW/+93EDoqWo0xXn+AbuVfUK3OkhWXn7OX+9E9wTgyYhBlA5XNWk99Xpe5ojAP6LPAi0rLaYHKo
	LhChTHrMahqR26Tt0+ZerZe/fm53DbFVFSiHrolxyr/HNzYJcwG02W3UsSIJhp+upFg2Q8DAJUK8J
	m1VGKIGLc/A/pcTNOX4mIs2GyLKGj7f0t7lIA8pnkrxY7N8agAzGbT8v3M4otsyCTkeXrhLxGpNw6
	ECxlq1nCzltobF8NF/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbd-001Fzk-19;
	Wed, 24 Jan 2024 03:07:13 +0000
Received: from mail-ot1-f98.google.com ([209.85.210.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb8-001Fdk-2P
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:44 +0000
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-6ddef319fabso3310513a34.1
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065542; x=1706670342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T27qW4zzYD2KNCPRIh3CSpIvD6wIUQ7nz6JSAMgdquY=;
        b=dVlT0yD9GGp9WH2p7PbvKZ61WBfi54hIZoDKO2d5OTPyojq/sGjwiH12MYtfhJcGgP
         MlayblA/4ZLE+q0HfwSuA9V28xAMX96VSNbyDDGY0UW03CshY8hr7TEEm6BLHHyLoJza
         rMXd9xsI5oEAgPIkxu4WM78kYw/0pWZLqClDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065542; x=1706670342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T27qW4zzYD2KNCPRIh3CSpIvD6wIUQ7nz6JSAMgdquY=;
        b=BQOkVv+bAeGyEgQ+j2z4YXs/P26TLErPra4QKtBSgLiFK3rYdMmoXeUku95w5kWTNK
         K4Z6n+MMNROaAmxHq0P0i9cfKKdZTzENJfFuYakxKjK6UKBDkJTZJ+8ukCDOImIJXJ+6
         CfqG9IEPbFK5JIW0Pz8TonlfuoRJwx2KWKHd9IHHs2GdX0Od+sXibA+QfT3IpdXS35vz
         dNjoMxggtlw3uh29Q9+qDX1vmFGGYFHCSp1mfzE3Rk397AAypQcq74HrHdqUVJDGTFfR
         iXzoTkl4WHepj6I4w0Q52O2+Grockaf9lKB7DMfKU2fL4NA191BN3zGo8CruNYc9jTaI
         vXkQ==
X-Gm-Message-State: AOJu0YxxcHW69NF5EKKDRr5c+coeRkq0jQmPQrhAAQjnL5/qNMMklPT0
	YDpMvycnF5ZS7Zv/BRMwc6aXeXBYW/Q10q7pQJYBRc/8lMHkl/k6dOzPfiR4neXgJlyGuAliF6N
	BzX0CdS4lIHe4tTdh4hJkTMx0D6Gotw==
X-Google-Smtp-Source: AGHT+IGIA6CSGHXai6wCUvWT+JTuolGf8dL4LUaj4MqP2aGMcA51O74ZV5BcrivqiVpljg8gEORZQAU1vCtL
X-Received: by 2002:a9d:6ad5:0:b0:6dd:ef0b:4f62 with SMTP id m21-20020a9d6ad5000000b006ddef0b4f62mr879830otq.77.1706065542092;
        Tue, 23 Jan 2024 19:05:42 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:42 -0800 (PST)
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
Subject: [PATCH v3 07/10] mtd: rawnand: brcmnand: Support write protection setting from dts
Date: Tue, 23 Jan 2024 19:04:55 -0800
Message-Id: <20240124030458.98408-8-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190642_792522_3DA387EC 
X-CRM114-Status: GOOD (  15.10  )
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
Changes in v3: None
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
