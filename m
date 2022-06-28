Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E09C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgUUwOt59VL0BXT/EdhwVSeWfDQrkocVthSOjnSQy2g=; b=CvNw8Qp4CEbaiD
	tahBxfQerLW6RQ24GQvUWSF9FTTyivhVaG6xB4vOxEtArTVgDd8qued2gSSMTPCZbAFCL/8PUnUt1
	MGuIImc5EbT1K4ZFXizLHWRnUW4+3Zf93ioVCU7VLwz8tEPKjc4VdsJs0BRRA0Or1Nxr/k6RQA/H/
	yDG2Oi4rkOlCfRN2y/oDAE7J1jfTwvy0+iG5PT83qCV3t7Od4MUDA7Qrx2+36q5VE1SR3CFhRi77m
	kQLn3VpFq71BOg6fUh120RKMJ93bQeldS21UFhpwgIrxEqSbE0bNGbPRepUTyjXLG2Ao20FDZkNDK
	Z9IlbFm5zCY70dkMMK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OJ-005vB4-L3; Tue, 28 Jun 2022 11:28:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OD-005v4e-EH
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id o9so17074108edt.12
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/aCGOJhN5hhaa/wf3udZzref7WmmFge/G1kcYg31ZE=;
        b=CbVDEz1YIhN/CZwz7Po586XwhR1tDqMnUEZiyAz09iRURJR1bDxDRt7GkakaoBMvQV
         FUKWaFOIETEp7V9O5XgdKEJA7NWf0anlbK2XF9IqbXY517vNSaPnGajPw8WWH79aWnnX
         Yo1w8ea+6diWxwLYIVivAE/vLlBVoF0SZx3B1avkEBg7d9QO8fDyZ8Zi+70erfT+lKNz
         Bi+Yy7E3VEodPI3JUG8C94mNeymMndsANF/8MYmTzaIyU7hHK3O0DfHuGsmAs9nxM+xU
         UhPCe3/LVi3DPW2K3QvEGQUOJV5uPlI9uEmA8bb6T2ZeckMY8mVoQzR9aKbpQayk89iy
         pPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/aCGOJhN5hhaa/wf3udZzref7WmmFge/G1kcYg31ZE=;
        b=51yk0mRMNaZkBaeJVb3WzKN8e+KlZjSVpgy3zIHtNFEsdoUTbCUHsEqPajeag7Z048
         H2Ip+5N3+JXLPA4K2QmbuDe3bQyNKyElAvFYnhHOCVDQGNHJ4MG8qq20Uq3ybtNRrYNt
         YkpArnUvEGDKRVSgJ5RRQLnWoTrebzqLBqN3vEt3FAGV+/wtym0kvYvsLX4BeFeQ4zkQ
         IOEw/hn5CDeqAOjAy13b2/cGFk8XEUGM38bBijnVsdyyUEMXcqhkoYI8jabtYAs4PWBA
         +Xy8Xy6r0ApK09JBPm6yKsNUt4TojQEFtiXACFTQSmLxMwmR08hKCVbMdQgE9KhIQ7OS
         MCRg==
X-Gm-Message-State: AJIora+1K9w+K4ZUMhRnkmjHapk45g3ITPd++qz1sonHWgMwC8jaLeqL
	FpQQKW1HADDNQNFwgGeEjZY7HrjGy7M=
X-Google-Smtp-Source: AGRyM1ty2755DziH+VQSppOQlJavQFFOcOu1ZHriPAA4F7jhidLeXeluQ2PnRW4xmThrhoABTwVnTw==
X-Received: by 2002:a05:6402:1c09:b0:435:6562:e70d with SMTP id ck9-20020a0564021c0900b004356562e70dmr22237136edb.203.1656415694067;
        Tue, 28 Jun 2022 04:28:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:13 -0700 (PDT)
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
Subject: [PATCH RFC v1 4/8] mtd: rawnand: intel: Remove undocumented compatible string
Date: Tue, 28 Jun 2022 13:27:27 +0200
Message-Id: <20220628112731.2041976-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042817_494256_F2EF3190 
X-CRM114-Status: GOOD (  14.22  )
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
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
