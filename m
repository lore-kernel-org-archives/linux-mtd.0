Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5E606B52E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PK5IJnaY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoDpqQyb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zy6PQOgpM4P7T63rRvLiQT3Onp8743+RJYmaL0CNF5Q=; b=PK5IJnaYX7gr/w+ulnOoQnd4rR
	dnr+Bamu7oQdjG+fycMW0V/GQrTq1t91DyWV9Zl1Kf0QTVswAXCfWKB8W4qKlnEZuTV8+YThqSwuJ
	xEs/0SkkVVlgNS4Qh6vYZ7jSGTgSaw5eVegAc7dJ9Cl0UMyqb1oPzmdfgXxeYP3nTP6DXU7yKmchm
	Hk2m0BlMqL3x28EVUJxRAu6j7lPaDrHji9fIGPJqTBuduk5hgM/qcizvFGCDPpOJNH9r9GTN7bM3c
	bK8DMJBrw8bvzO2DvMBaoA/IQa+LIkedWauyIrjTPSF8G5NMvDC3pPuvEvl9lNtMlwsdw/pFq6OYA
	PGNn81og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoN-0000000Dr2P-223G;
	Fri, 13 Nov 2026 18:15:43 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoB-0000000Dqhb-2Fy7
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:37 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-833e671ee9fso2374816a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593730; x=1795198530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=NoDpqQyb1yWedi6bgTI22H93Lamciu91EEko+oPh03LliceGVKS7sr/k2ySDfV9gCK
         LxFXn/tQY3rPJl7ogRV3eSVAcGAAHFEXxPnrmgs1HLYrfZvyTdirtu8nbeA8IrOVco0z
         gXzOpTmsJdaf4kvA3iDG+PPuOnHXIz/N3yZB8rYjw+l0iV32cAEhtBMKxiSH7kIztgPB
         JHTEgzdDhPuVT0uhEUkEchcsp68sJUBt804KmZZEwOk87HEoMqD2x0xGk9Aap14eyjP2
         SIoz6q0X2IYON962TPeIGORv6TZs5aWcapcN0/ANLF33oDn2FWbQhLPzgVdz27p/cjdi
         oJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593730; x=1795198530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=LZgxnVT0HTkZOTIVZB+OC72LLyboVuYHUIv+ww4ucesbswyrUIPdJ8DDV5ZfkI9V42
         XzsQzEdwlcRVxXOE7DaGQHKylGUoxc9XQuy/YGxx0dx7eKqmkyb1OdFi4N+iPZjfSKYp
         t02WyB2ngbEI+Uvx5Ezj92PJ7QqtAFx78F6AsG3QVvNmNdfJsrCa/I+jBvm+6XsiJNtz
         4IK+mQ4Ew/8XA6k+NZlt4VfkI45TnW6goCpqHkQrAPj/MBHBIebm5GM5yEdnVOBlJ28Y
         PIKSOSuVCJ3fII95I1VtjfSxVrr9Z8f9Iq3usTMUeeU0kyDu9vaAhgqsEkIU40bOs9tz
         1XHQ==
X-Gm-Message-State: APuU4Z9uV7vmh/Wnqaxfiy+RD+I1pMbBZVqGYal6Q866T5FoVNgIe0TS
	rRbgjEwbAqpIee5rLEJFcfRJi7AMbTjFQEHnhgZdyCL1CpibXEUoDMAuPeF3y3Xe
X-Gm-Gg: AYBFou0+QZDcx6hS5iJty0vwQ51mPJMRUHkfCEQjnDJ8repcUhy0V67ZYWpMFfApirt
	rTI9YLWsRQCDLRbcsaI+0pfznfPipWGs7+PdUaQ7bi41Res2HBy2Su705r1ZGOF02goXiznDaqh
	jOs3mV/FjV3rAQcQMZ32aAysYvj/hR7cT88+qIOLMkPClb6cy8hmW5gF6/JcHGMqqy6riNo2MCC
	ZlZdQiM6DQgXGlIpbW6hjm6iT57DXSj80/NPhtK1bLl/ZuZqvb5I1smfueC5+8+sR4sdKKb/kwg
	PYVLGLLdp9sSV1rkFqfxQKQKBhjTyelB68c5avHF5HStFsaIdcIO+ftcwA1/yy1kA+t0s2mzRzz
	NvfH4sDifRm8SX/kBi3vI19behsblP4lCTDG+4kjXlUJLQyB4j4NSdsrIZWNyZg5whO47Msj3Y1
	td70ETChgOyb/Bglgu3+b1j4r0U9LGdQYMgtqC6MEkD/eCb/hUJmOU0nWOLAGJGN6iTyuh+ecnq
	VPxkGUfxpGqKAgj5XMrmEmNNPrFdIr3NcuB6oZnRGtt1fPgxUY23bASPxfTl89LDJ4PFRxJXpkz
	OdYmxazT3isGEYTlLZmoHRIwUym9SnCs80ZC9pDCAlnUNWTSpnFdysAU0fhnJOPoHp+tPPTt4fI
	2EYYzmJrpz5Y0XmUXl3x6WU/8p0jBm7neAQN5ilv+3YH+kXjYlXaRX1adSVTJygIja5ITMKu3fV
	7yJSw5U3DUKw6M50EZ8VVjfnI/XNrcLq/He/JM+d8OP9NMxOny+0AVqWQ4Qrvs/Rx/4E3jTqUM
X-Received: by 2002:a05:6830:2b28:b0:862:544d:b8b5 with SMTP id 46e09a7af769-8628991ea97mr2748255a34.27.1794593730542;
        Fri, 13 Nov 2026 10:15:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:28 -0700
Subject: [PATCH v4 12/58] mtd: rawnand: arasan: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-12-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101531_601229_2E3EF715 
X-CRM114-Status: GOOD (  15.62  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage until the last MTD reference
is released. Release BCH state during disconnection. Unregister and
disconnect the chips before releasing chip-select GPIOs, so notifier I/O
and active NAND operations finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 47 ++++++++++++++++++---------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 839aef6c460b..a28daae30330 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1276,7 +1276,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1284,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1327,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, to_anand(chip));
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1368,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1436,12 +1452,14 @@ static int anfc_probe(struct platform_device *pdev)
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1499,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
