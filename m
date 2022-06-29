Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F99EC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPAjG9485Pu+0On0ncfvB1HIiFddheryMVl9Vyi9jNc=; b=XMrY0icYbUnSub
	oauavd60rRlVGoptwkbb+m6KO3JH98dTqIkAZV//HYXmeZI+IS7VIZupy2aYuEE0aRaIBt97bLt8q
	0IGZnHNt/wvZc9iridvqzyH8vAG7YCtxuYmp9p4vFsv7YaQNn2rgT0IkbYENajVh/GzXVvDNePQZ1
	H3kpNXsh7SkTJVII+sZIfnRcSBLB3XjOnEA+itCHLzGdIYsnPxgGw0z1YpxTtqhF0yYgBAppulvoM
	4apONcttNuFWTgZgLU1DPjXKoghj870hxKLPSFhP26iyr9WkhUrPSy4RWA/Vz+V/csUlnJfZvvwV0
	OLixfAVMaE3EEEZdb2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLa-00E8V1-SX; Wed, 29 Jun 2022 21:35:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLR-00E8NX-Ki
	for linux-mtd@bombadil.infradead.org; Wed, 29 Jun 2022 21:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DTaZ/9+DRnLhDSj0DOV2C+IIhpHfbKqhWacVmkOB7BY=; b=lcgkgOlkUBoS6PqJxG8+49Cs1O
	mF3rzdlzvSkxQQurmrUWPnIRl/FXJRg+pwMfc+CTlSoTR3DdCrINx3e7mnl/I7ON38gAEu2si1AVR
	DuUGa3hRCkcAZsEAWfuFxgKZ7JIERQHLQrLbBrXXvbhUf3oNjrJ3nmjY+a6em5SJou9qnS4ak13uO
	ViBSq4ZIoqGTTWcMtr7c91KBjCWudw7KZ5peE/GVukDrQXRg/b6szChKvEwUVkeZm5rK/jaceGfP3
	xz6s6HCEkL1Gg4AeFD9eL+WVlSYWQQudrrkpyLFb/hSXD01/u5GRTm7r/HeVl4jofR4lirBhvUSNT
	SMFEUucw==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLJ-00EsQm-DL
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id r18so16132069edb.9
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DTaZ/9+DRnLhDSj0DOV2C+IIhpHfbKqhWacVmkOB7BY=;
        b=OG9wXeWMbA9jmZ71InLLxD32/gseAKb5oVYBc+PJOAqRdmpfUkjp4fckT0vXOJ8pTi
         ZjyqHyfQb8ee4bgJO6CbxkPrH29191krcCqsTASWl8vZFjriLcJyiF5r37q7cT9xaCMs
         IrqSuKnt1scDz3vaaj/HDPXxtcyi93QjUVUL5FsiWd2EmKjO90IpiMQig2F9AG4QZVCQ
         +CSBnoN9T7ic2o4qbqRGkHg/6DDaFT6m3HAaQ7nnPY+zQTDR2e5KeobRgNQm7Ppy/KAN
         J9UqVrvSVe7LkYrvxhe5RqVi+sDvuN8wJJk34rvhXVLiaJGhutxX0Bl6FgpMErnnmvq1
         vRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DTaZ/9+DRnLhDSj0DOV2C+IIhpHfbKqhWacVmkOB7BY=;
        b=G6sMOAuChVYCBZdBcThUJeb2nqyVobAcEP3JCc6egD18Gyuugxp/nu1spMLub615VB
         mzz446Y3BNdar2UbH5iN9xUCfGE9Zxkk8jnj1bVIqu+uJkCZDnCAZEn1KDdmiV9kwIzB
         JyABy2kXSWKWR855MbSbmryEB52wLpTPMmeSyG8gJkpyKCbkoFcFjWzJ66BFpt9ylCeZ
         ZSHNas5ZmyLedxKk22WmIKjd3kP+oGe7UDKkoErIeE3LJtaVzOwc2oIP+nVyhCMQ4q+B
         /PVfESu68uw6sxdh2khdpahO3/NTn1e2MIab3w6M2eQpkCuVklnpLU8/kVEkaajn+Uad
         cLzQ==
X-Gm-Message-State: AJIora9A2xGWEpKGZBuQN6F8DFQTY5t6y8ul/SI8C49MXPLeDdKaUqDa
	f/ilYnpRit7qfQItOkImjFx48YnLDBc=
X-Google-Smtp-Source: AGRyM1tlSXdF9Iut3FvpE4lFtKgNKps/XSbVGJYdKdrc7jFSNhpFqDmGWLQdYO8tT0vzY1fQ2P7P3A==
X-Received: by 2002:aa7:d5c9:0:b0:435:8099:30e6 with SMTP id d9-20020aa7d5c9000000b00435809930e6mr7084462eds.384.1656538523086;
        Wed, 29 Jun 2022 14:35:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/8] mtd: rawnand: intel: Remove undocumented compatible string
Date: Wed, 29 Jun 2022 23:35:04 +0200
Message-Id: <20220629213508.1989600-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_223527_006168_07F4F03C 
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

The "intel,nand-controller" compatible string is not part of the
dt-bindings. Remove it from the driver as it's not supposed to be used
without any documentation for it.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 3df3f32423f9..056835fd4562 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -723,7 +723,6 @@ static int ebu_nand_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ebu_nand_match[] = {
-	{ .compatible = "intel,nand-controller" },
 	{ .compatible = "intel,lgm-ebunand" },
 	{}
 };
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
