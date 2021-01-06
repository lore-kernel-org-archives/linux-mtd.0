Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCE9C433E6
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:10:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600B42311B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600B42311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHGQ6sSvUamaC3TdkZJIKzSpMmSb5np9oZpQDeA+NwU=; b=YHgEUVTddyR6TXDMCo8M1atDGn
	tmrtCA2R1UDwVZjIS09IHQY34+5T0WV2OaWyE/cfVKtx3HsLwcJ+HPUBrK4qaKNkBs0nl0AfmJRW8
	m3HiP3ijchnx0YefZTsEChCgQgKzQaMkR0sLd4gg0Hd7rKUQUUIiZcLBW3EdskC1EhJreM+WvPapc
	kWWXs1rdWWu96tMuBOjPtZaPOF517pkw/IuKhb2xh7JRYlm1v+cs69z2dzZP0q+t3KRPpkYrUnDTa
	+ARS8I1C55cgV8xF6/JX3Q03DEp5lGzLtr0/ejoCNHgCFWjd2d2bSpu7v1UhPc1SjkIHgaq5PLufz
	ab34lyPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx9VZ-0004QT-Cx; Wed, 06 Jan 2021 14:09:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx9VW-0004Q2-Vt
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 14:09:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id i24so4472970edj.8
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2021 06:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=As8f8sygbZBfueY7JO/Eyp1IFwhU/oja0yGtvjK51KU=;
 b=CDHZCksfoNuidqgwe4TD90l7FF+e1hblPngHRFgZSkPVlkfJrxcN5pItLVlyci+Yne
 AkxOXiwSNfHl0MTuwSP+DHOGMaWJr1+8TAic8+diBZenifsHHolK3sonpMn3kh6K6fOL
 axTiQ2yjkbr+4/vKRjFzmqwMb9kI87e7ubnC9MX/QySg1/mPVUQ/JyqyN6sPF2mafQ2T
 7ZXIS6INdZ6PgevODnG5nYrBiYMIvW4aTD17ufFYU+AKh6ui5MtmfdYsz/ZTFHAXFK0n
 4yiUNLfZL7GLwn/becV/5HEhmPNmNQ5YZKx/4FeSsMPm5gdxKp/qs7A15CNcb14bD7dO
 a++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=As8f8sygbZBfueY7JO/Eyp1IFwhU/oja0yGtvjK51KU=;
 b=ahEmzoAkX0tH0Cw/oyfYLpKa/ZNJkaxA6xQ0Bvp5rNbKfChR9fTGBzuYi1+nFNyW5A
 xM4IZe2iGc2Yy0FkbTkz4j8cSGIVScESWt/tdW0z80XYixf1rXuEfltHuOUAHSL/TI6P
 gQYNdgezUuyxpZYqLb1GdHATXQUmRDOPzAjluXCB5wG38QUoym7GU5poj5iVNdgHJdIl
 G2jEdwXZC1xe0w5l5D57G/GbIjFzhaeF7uHV7hvdclIW3Dd+7OSHaEAN4zwF51gdNR+W
 kciLONl6BFgKAodaDrXNSXFA8T2a7eLjrtlRG2nwuY4ZUzhFoMWVpX74UBDQBsntj1nl
 nMHQ==
X-Gm-Message-State: AOAM532c5NRS0CUCGACZITO32MTPB8OQjELa3fGAtFKCpqNcrSVd3dF2
 FcaQKH1XLUxqcSdcpGKDbVA=
X-Google-Smtp-Source: ABdhPJx0hWjzJguOO3vUzQ24g06XvMFqE521N02FoeeaGSep5w+g2Zw37XhKEcAgszUIpagvNWf89A==
X-Received: by 2002:a05:6402:41:: with SMTP id
 f1mr4028853edu.286.1609942189329; 
 Wed, 06 Jan 2021 06:09:49 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f17sm1495952edu.25.2021.01.06.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 06:09:48 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: vadivel.muruganx.ramuthevar@linux.intel.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: rawnand: intel: check the mtd name only after setting
 the variable
Date: Wed,  6 Jan 2021 15:09:43 +0100
Message-Id: <20210106140943.98072-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_090951_052620_6CF45F5D 
X-CRM114-Status: GOOD (  14.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move the check for mtd->name after the mtd variable has actually been
initialized.

While here, also drop the NULL assignment to the mtd variable as it's
overwritten later on anyways and the NULL value is never read.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes since v1:
- don't drop the check but actually move it after the mtd variable has
  been initialized as suggested by Miquel Raynal


 drivers/mtd/nand/raw/intel-nand-controller.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index fdb112e8a90d..a304fda5d1fa 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -579,7 +579,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ebu_nand_controller *ebu_host;
 	struct nand_chip *nand;
-	struct mtd_info *mtd = NULL;
+	struct mtd_info *mtd;
 	struct resource *res;
 	char *resname;
 	int ret;
@@ -647,12 +647,13 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	       ebu_host->ebu + EBU_ADDR_SEL(cs));
 
 	nand_set_flash_node(&ebu_host->chip, dev->of_node);
+
+	mtd = nand_to_mtd(&ebu_host->chip);
 	if (!mtd->name) {
 		dev_err(ebu_host->dev, "NAND label property is mandatory\n");
 		return -EINVAL;
 	}
 
-	mtd = nand_to_mtd(&ebu_host->chip);
 	mtd->dev.parent = dev;
 	ebu_host->dev = dev;
 
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
