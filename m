Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D739C8303A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NifJp+hLKKtsKYSKeJYJXe0CTTgCvqCmgzQGDjH73b8=; b=4FvgpxmhpDh8lS
	J8zR7ErrI4Dfmxf5tyeqCXgV2hfBmNkPiBuxOAM5/IZDwUbAlnA+Lcx0SYYRfvhlJ4f6cAiNg3cu9
	6zwzlyNQ8nofdQRG1AAuLuUiBN1XMTaGUrTt28B9gjAaw/kC+RgDiIIGWcSs3YchjjgruncWX/tYl
	OtT9nqVWXzi70ihmMnR/c6sW9DKuYv+3VdjKksmXslk8XMdwzprEnw3mrpDEgIjKmB4xb/YMl6OMD
	Dhxk70vjmkqypkV0axzf2yJ9hKdwYBt2+i0/ILMXvnF2d95LD5jT1eQK0Z61GJSUtjg55BNjMm/ym
	kMwjLxH0xsFWyoqv8ZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSu-00000004ufz-332I;
	Tue, 01 Jul 2025 11:47:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZQb-00000004uDo-17Ik;
	Tue, 01 Jul 2025 11:45:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a6f24ef3acso591690f8f.3;
        Tue, 01 Jul 2025 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751370331; x=1751975131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqV2cSc9JcT72sZ3WvX374nk7Y11QAirdR7fnD3P+JI=;
        b=Yh9M/BNuL34YhmkEwaTc/bIef7Djbec3sNmrVU9mI57B0pY76ziKPNsis9N/c+8m+f
         TeVg5hK5mESRl3vp0wuMuMV/4WoH9pQwM+ia6rkklFwhSdrNLa5vvOekzaJHdx6t5qvi
         DJkg/HvDq6Q1HEyu5FQs0rEs+8Ri+y+L4ARhOIczGamf89AdgyLTsYZ64gdlPylMZ5Rf
         f1G6px2AJxmx8ACLLN3UL3uwNWg30ESKpby6CLl4/JXAe3bDD6iDt1Lpo+pky6ODVUHj
         2SpdyIhGxp2UssQel7UtQALoI+bz/KD6giKFusvegS6Hvh+2u2dX7Ppa71d9N8Wq6eFI
         /X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370331; x=1751975131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqV2cSc9JcT72sZ3WvX374nk7Y11QAirdR7fnD3P+JI=;
        b=ppDPxhIG1UdOmrWNAWBQRq/52+rgFzxgnQSeNd9I8oKj9GhBDYFAezV+zVMC/gZJAR
         MKZQyg52eT1BnaWjZA5lHvDzUJa/9hBMN5EUmQ6GEUironYs7+8J1RDD3UGkETFwzy/8
         mEJjda7hS4E8vJU3PgkEW658sTGu9DE96izW9oh2TdXxtPo3iSURE2MP6MUIyWKLjGy6
         OpwCRYZ+seTE92DnS074XEZXwacuLUoceLjmdp8l4LaLVhqCNZj11WBQXaNDt5ac4tVO
         sYjKOrGrLvdMGOJnKWaLiyQcdVuiAe8XSJB45gCsj07BneQvkfHTRMZya0ivan2JoO2H
         IqNw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmtBxkm7dN2FJTbtZvlDjqv9g9s+BNmLb+CILIyX+csLHaNE/MGr+LKBdCvkhSdd6UpeRowZPOxAe@lists.infradead.org, AJvYcCXvCDoj+Ks7OKULnfZvQ6/WAfRjCs1w94yGCrsMBNx94DV7Y3tBlELIcEC27o6kFm+52LtYxUcDJCUxL64czRYt@lists.infradead.org
X-Gm-Message-State: AOJu0YxSPA9cTR534ZO8crFVk/+DHlvov+QZaj8VIf6dXjrDgGfvO40r
	C2l/GOk95qlJsGf9zx7mfglGyp+nA6688WK2lpkVoOqejXWM5+iWHkJe
X-Gm-Gg: ASbGncu48tnlBkwzQvQmUkpgpGpE40Z5qPcq/yAulNkZtYPXoTSAemBSb1OMJ87eht3
	Ru0ngUjgsQtwMsx0k+bxHH/XLcawzeMFRX6Ikd3Gr7p1lsDkzPq+BTDAds0A8OdDMk0IAK2kFA2
	0S/O3fCLNUkgnMG8TM8jnjAVperr0vrMI2sgXrNsouCkYwn603tQGPLCQ84e7MAjalvw2kzwtpN
	42J63J2fZxAPshuPUcxOuREINRwixWMhZxuSmiTBFSGWmeP7Zn5y3mfSR1uoWkGLSrBB/7uGKke
	rP0u5CvgeGSQu1ucOn8bc/3dAAPEM80r3jgcL0rxQ0pQEMOhdcT0rbO07CnMDqa79FgqMFscjLi
	MKVk7HbRZNMb/ShY=
X-Google-Smtp-Source: AGHT+IE0MARjLwFpVKy3XcqNu0YHZaj2TRqPNQZA5Vxs8cyk8AFUVhx3QiWGdqMXOzIEmt1ArxrW6A==
X-Received: by 2002:a05:6000:440f:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3af246671cbmr642564f8f.6.1751370331232;
        Tue, 01 Jul 2025 04:45:31 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:a723:4386:e2f6:bd22])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823b6e9esm197218935e9.28.2025.07.01.04.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:45:30 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Alexander Dahl <ada@thorsis.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: Fix dma_mapping_error() address
Date: Tue,  1 Jul 2025 13:44:23 +0200
Message-ID: <20250701114427.24910-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044533_313622_461AEF52 
X-CRM114-Status: GOOD (  13.85  )
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

It seems like what was intended is to test if the dma_map of the
previous line failed but the wrong dma address was passed.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index dedcca87defc..84ab4a83cbd6 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -373,7 +373,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 	dma_cookie_t cookie;
 
 	buf_dma = dma_map_single(nc->dev, buf, len, dir);
-	if (dma_mapping_error(nc->dev, dev_dma)) {
+	if (dma_mapping_error(nc->dev, buf_dma)) {
 		dev_err(nc->dev,
 			"Failed to prepare a buffer for DMA access\n");
 		goto err;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
