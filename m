Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9347EC47DB7
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEmaOhuYO34IZUnbPnYYEkzXdUKVWujSXsKDP1WEUAA=; b=qx4V9DeJHbWcpg
	XGCOBT+05dYgWHL5sPNrODjLSutCIXmJIpOLrYjlVeeGRIykSvI3cXE3jAR3kBMyOJ8ibMI/jYQXz
	nU3a7Vk4BFEkGz2mdzq0PKqchizkK6l2sFPNqJ8LO+mfMUTMXqNNBCD+Z/Jja6/2vMGE0RRHdlKUD
	6TCbe7eFVrzYSnSGv62jT/06xw2SUnOI8mVd7oezGpgbKnIthELhMAg7TQzGB4XHl4Q1+Xo4ntal9
	l7i3KpBUu/LgD6WgPylXzobz4FIDl7NQRnh5pdcfp030kAEmeDwY7865a5EiPdQ/+oJuIv9USE8pP
	weB4dxQfx71ZSYX9jNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYU9-003h7z-0O;
	Thu, 18 Jan 2024 19:55:33 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTJ-003gNc-1c
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 19:54:43 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53fa455cd94so18601a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 11:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705607679; x=1706212479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeH1TIJtMu9dNiviTF/nkxwiev6sYu4cBkxn5iUmNwA=;
        b=NYxhS921R9ha0UaTeRIakdj7z+jD+TuUScesLJla7lCS93CRvp3c6D9vNRE9PYEWYI
         Z9QCiCzG4CCJHeoGykl97VyxIlJW4nyWOBTKEOGG999ucSpbeL7CADfWKyyGLshCoXai
         CrS10N+o39RwZRIEiyA1dx0tyaKcuXPTGDT8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607679; x=1706212479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeH1TIJtMu9dNiviTF/nkxwiev6sYu4cBkxn5iUmNwA=;
        b=KGMihk4g0PnbGle9pk3XRwXo2bu9jDu4j2sgTbFaUugDNpZcT/58xtqY6XlenSJXte
         xEKQ+x/AZbtghZTnSiWg0hdQbfRhv9D1rMHFhKfYptS6BSQ/9Cc/pssniJv5Wr7HxMC4
         gECL30F404N+kvnRlPMGkp8Fg+UEJYJdJpRddhfRu5dL9DHbj+D8fkSXMKwIebOQOEDB
         zVeQAoozQ+5nAfr0137YgODhW7cNUhLII5RAVvBEpcYvhv0MBTMyfZcpu1gI9aiXu/j9
         ZrA6bZ7gSriCjrA3lPLTLv+ovnsUHckfD7Yu/TUTRJLSW6XJCldoL9zkiWI2RR5bKsU8
         8JMQ==
X-Gm-Message-State: AOJu0Ywx/tqC/X5onZefYn3T9DFU8DBsoAyl1AAtCkGrGSicBeuqtVZi
	waeTfxbO2DjOpCnEZnVD/wTPlOdykBo5EPx5nfmzqZJoFIwuNpbv70xlUzZmKw==
X-Google-Smtp-Source: AGHT+IHACuKl4Ub94+Xnxo/jnjCOYBw1yW1Eo6Y2FDr3CuoZ6RFhJZAwMW6S4Z0cAarZk55E4E+D7g==
X-Received: by 2002:a17:90b:2349:b0:290:1d33:cc66 with SMTP id ms9-20020a17090b234900b002901d33cc66mr1276623pjb.91.1705607679035;
        Thu, 18 Jan 2024 11:54:39 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm2263805pjb.38.2024.01.18.11.54.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:54:38 -0800 (PST)
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
Subject: [PATCH v2 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
Date: Thu, 18 Jan 2024 11:53:56 -0800
Message-Id: <20240118195356.133391-11-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240118195356.133391-1-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115441_540412_D48499B1 
X-CRM114-Status: GOOD (  10.98  )
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

Allow settings for on-die ecc such that if on-die ECC is selected
don't error out but require ECC strap setting of zero

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
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
