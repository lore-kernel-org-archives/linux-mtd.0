Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F17C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM2q2bbImJO+RgU0XOdImBQsTCrjPk1ZQe3nXko+TFQ=; b=yuCj8qFLoztEKI
	cj9sEI/w4/NUlr8bF82GYEkvOhDITKCONaeGZ4xwitIykpUTc+I3k9QTZkZJQ16xvyACifLavccRX
	MT8dA0R0ZOFWnmAz62H8AbFOTAOsTkZDd/Riy4AclaiZN70QxnJpNgRa/B2oB8DdFxAuqUjNVTsxy
	bf0h80lopTMkFv2n//lu+w7/gbK4jxIwgyG4ump+wCls58Lo1mL3T/daMI9ypAXSBHBsfH8fS/i0h
	hCCGvy2VM0zusIdmUGHwHwJj4WiQDaTkrbw3qkQtRdvf/a/qT260RTFc4Okmb8FAR/xvF8BhKewUx
	L5DIEynIF27P6awYUD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVY-00BmvZ-Oi; Thu, 21 Apr 2022 06:41:40 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVP-00BmqH-G2
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so4323135pjf.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2A+1DEfCchk9zvWcRwhnR8b183L6jYdN5Jr/HZUvMnk=;
 b=K8jV/Ep9y7ECvTdXneUCvuSG9z968BJvmY0QtXk7baOnViu2esHZ8kMWAYlPxt3QTa
 V915AzOoQNU0/3vNCjBhOXnPVoeDh2oWITchImWUKr6pu9H5WeTNJgRXdEb2b9GB1G7p
 F0OGu7H4Go1Prwbfpa6eaUXQga5dTRfmNpnfrXsyIMfBU+vcHQ5ZfRyjeXrbIDC6os7u
 oG4pko5USGGSUN07vN6w0zGfCjdg2iHtkj52BV8eRK2kcgFYYtTw+1OMBpPmvRk0s6eg
 MQpVfDy6O9GR7lmIhhB8znO9t7Grk3eSV9fHqn7FNiLkJ+VQ/mUHHWhRBjf+dC/vl6AW
 /OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2A+1DEfCchk9zvWcRwhnR8b183L6jYdN5Jr/HZUvMnk=;
 b=eacFw5MKWTmKYEiwDvqwBEDrXx6hzKTjfDhkQNBKtKyCpAStKGRq27CtL5QLf8WkXq
 zvCQHH/AMzxV8+vG6n4t7ROdFRKa1T7w6h9xVZUjgS1ue+h28gs5uvWITeoznxeveOJY
 MVpf8LxUgWAHxIsmaQrYq6trDdrqUQhNqypwMnNoSgRf1ALfU4rbtQKlYxOPpbDylNFd
 VXyOvYVFfBGN0k2OjMFXlUTHC2jVMxiLQ95U2S4TAq6lphAFmkKTEtZXI9ZWNQ3u/wXO
 awwQxRKFxhwDDszqDIMJgMNF4y3/OumC5/5DqvepxnNFXLwoznmjo0uHVBCcv0A74K/k
 EZpA==
X-Gm-Message-State: AOAM530k9JhqTxSj6cHrfhhUnIFboSVE5BpgR7Zm/B16m9Hm7vsYy56g
 ib1y65EquTjA3Doz0ZZZPOsmjWO9/mw=
X-Google-Smtp-Source: ABdhPJxnXOVHf99FsI6buJg1whvrUsYPshPZIZRh34TeFNZ8uNp+blFUmo6OCnSHrihLcwBZTKy3Zw==
X-Received: by 2002:a17:903:1105:b0:154:c850:860b with SMTP id
 n5-20020a170903110500b00154c850860bmr24079132plh.12.1650523288552; 
 Wed, 20 Apr 2022 23:41:28 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:28 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 2/6] mtd: spi-nor: core: Call set_4byte_addr_mode() before
 spi_nor_quad_enalbe()
Date: Thu, 21 Apr 2022 15:40:52 +0900
Message-Id: <ef57dc6cc0b8b4dbd39cf1bdd2fd64203f08d15b.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234131_584420_427670BE 
X-CRM114-Status: GOOD (  14.06  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The part specific quad_enable method for s25hl-t and s25hs-t relies on
address mode. Flash's address mode needs to be set before
spi_nor_quad_enable() call.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 87603a99938f..748b77eb7841 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2665,6 +2665,21 @@ static int spi_nor_init(struct spi_nor *nor)
 		return err;
 	}
 
+	if (nor->addr_width == 4 &&
+	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
+	    !(nor->flags & SNOR_F_4B_OPCODES)) {
+		/*
+		 * If the RESET# pin isn't hooked up properly, or the system
+		 * otherwise doesn't perform a reset command in the boot
+		 * sequence, it's impossible to 100% protect against unexpected
+		 * reboots (e.g., crashes). Warn the user (or hopefully, system
+		 * designer) that this is bad.
+		 */
+		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+			  "enabling reset hack; may not recover from unexpected reboots\n");
+		nor->params->set_4byte_addr_mode(nor, true);
+	}
+
 	err = spi_nor_quad_enable(nor);
 	if (err) {
 		dev_dbg(nor->dev, "quad mode not supported\n");
@@ -2686,21 +2701,6 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_width == 4 &&
-	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES)) {
-		/*
-		 * If the RESET# pin isn't hooked up properly, or the system
-		 * otherwise doesn't perform a reset command in the boot
-		 * sequence, it's impossible to 100% protect against unexpected
-		 * reboots (e.g., crashes). Warn the user (or hopefully, system
-		 * designer) that this is bad.
-		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
-			  "enabling reset hack; may not recover from unexpected reboots\n");
-		nor->params->set_4byte_addr_mode(nor, true);
-	}
-
 	return 0;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
