Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65163606C218
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2M0mtmAX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ee2kLskl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f4f6r9VhNYuIRmTLKB7cGmQJy5bA1LYdkqg3Y+8B5ME=; b=2M0mtmAXWtYribKgUQYM5w+rIy
	WRS0/7bdQ7CwIWRWngTnU7IsaFtGPGHJuTTDQjTHMYpUKPmghbLdcS4GeJCHvWhqri1ZNH4B3yESJ
	eTP97JEL4Uw8666zHZH2jimX4P2HcxRV1SUS3lcnEFX9g2Pb7QdMDUg/rrE2ga36YV4nEVziDFBZB
	9Nb3TUnOypbr/PwddR09y32rYujLYbV6f2D3178iZuY4HdT7e44v2RnQNBRbzq2SA/jYJB9/4VLjy
	R9zQfA5sAd63zEVC+SlBWh5IkC8/JecKq5pU//ycaRE7LfXLTXi5rJWe3uDMubdqpn1/79pXpF5r4
	tpUqm6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEh-00000001G3G-3ycf;
	Mon, 16 Nov 2026 06:30:39 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEM-00000001FTl-1wMh
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:22 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-71aed54d4c5so464499eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810617; x=1795415417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=ee2kLsklnuGwhmrtOmql7ORcJHCbfBF2LWwSchDU462D9lDEC05F4+9jZXAY+P3o6c
         0ZkYxXHaEVzLgweeRBp2Y1MKH0eXttsU6GUI8YaQS23GeDE82Lnwzsy/TCro3b3owbqc
         c+f8hW6PK4M26TPIcyThtGh52samTelcOx9yR++9QakaOlXfIu5sdKKTsUZLEspz2skd
         sn+0QtP9AlUoJ9q3cGYLHxrgdFf/agk/k5clvfiOQ+R11eVZPDhvT7emtGf6Sjuy/+n0
         r1avIrFjx1NQrXZDtQkffZLQvBhPpnxZnaLYHZGhwi4AT5wOJjXHNTfI5GAijMkUW3/m
         CqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810617; x=1795415417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=agvXKMcIMgE+ETZyHzj5o2WnAo+Nq1QJ78A3HBZz0EsUxauqHxefr3uJSRL0hbjUAM
         vtbQhfB4lmqUwZM3B3PwKrYeo4+t6MiqDKlielbUjvOq10zpioe5XgPfx4SjCEVmP5xK
         MH5VwHUhglmW710fe5P9QJdZMF5kySf0nR7KqUBix2zGfYgWtml7CBCSnV/L0ZCtPbKc
         Z5axbfHrjxMSXPt91wTO/B4eia3j3E1cuOP95dIQ/yXmKQ/1iOZ097wVy9Gt2sMWrhQ7
         f0n35PkKYeSgQ+ChHVsOMER1tz4SqOBIp50n9W5PR5iTXyi5+Rr8pOOakolaPlguR0Q1
         fDzw==
X-Gm-Message-State: APuU4Z/3HQh0kUsfhc2wV4BX7+GsMCo1u66EoMyxp8oaOJ+1htsc7v2k
	ppoZ5UeN2Whi4hT94MdHY6fiQMstvcIJSc7LnjZXp739RVXLEFV21nFI
X-Gm-Gg: AYBFou2u+b+zTJ7RoWEgu0+8Zz2ofRBj4cg3KPcu6hgb99yzR49eYe33KDhK+DX7EUM
	Jh9hQ3bYRafHVh4Hq/cKfShM9UlHQBeOJl3RqEOY7Mmtdd1bPEnqgYPR5WxjKN0yHDImcHRrreb
	aVnpikuVn/mzpdT3OYCHmQCCoejZ8rF0PjB1NzYtR2wNj4jkkTfFTKpOA36teMTTt4+x1ZquqCy
	4AXTh+6pOcOIPNsiTb3iV9iTD/RjmyOxI533DFD/VFp/4ZYdN+RKL6e6LIvwMsIL4wWzWo+yRjD
	KwhlHP1QgZ9CtpFwYc5wq6lpS218/CSRBlp38nbsWy0FKxAwbvaNxNrx3w48waHymgCbjxVvHAF
	VfJ62rNRfvEnUaIiGCiMq15v5lslo/qKSbZQXwmFAiCeJWxcdwqmdJLF2XAhsCDo9Sk3bUfrRoL
	PEaaowO8PmQDHQz9+pfV+oEWXWDXVNmfFZfnOiM1yyWNngrJZBmFIcCVign2p8sftZ71fXm1dmu
	jnhOvt6ngPYXa3XL7utwnxC9cY/IdaLCt/gui7pI5LmYOBZfaUbJ+20c5y6gseLMFeaOjV0CKYw
	tyiBOD/DXzb5Tp5e4bPYYhyHnCDaE3/QZMmdvGWCFzwbHQh61bvYisG/DCnr4FLeY877vDO0ZE+
	aesWnUIdjWNf8Xm39L4BTSDnhcNHpqIqGGBjRDQtWwgyuf7oa47bsG4VpYzv34MbRBoDs081/JR
	37AAM0StPvxcO5WZphZs7Zjr0opYXoCvGnBZq8gcEvtyHCmCHxiYc=
X-Received: by 2002:a05:6820:a508:10b0:716:e9e0:5440 with SMTP id 006d021491bc7-71ab50dec00mr4383132eaf.63.1794810617417;
        Sun, 15 Nov 2026 22:30:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:40 -0700
Subject: [PATCH v5 25/58] mtd: rawnand: hisi504: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-25-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223018_534411_1025850D 
X-CRM114-Status: GOOD (  12.61  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the host through its embedded legacy controller.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index ccc21d21c3e0..a9e6ed2d4c4b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -740,9 +740,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, host);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +793,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +817,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
