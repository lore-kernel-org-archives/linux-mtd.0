Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D361C25B6B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U/XNxbl5ZuziVA46RlPMXdSB6VJ5bNDRrqWXiRCSpsg=; b=26QVg2oCKr0FAb
	1YcpesR12v63ry2MKtdpYqUFH9IfPK9EIiG7MXRJSU80Cq4j9rZvLqbHagKvgDzOMQJpiAze6INWu
	bI1Bu1U823VfDAG4Ret7r4NetIQJYmp4pCoSnecAHO0UI7OgZB2Zw1De05ZhC/cm4gqpqZeaDVkOj
	nEH0TwYGXNTWXUsXibUw8y91sNZlK5hTiVmBeFoRVcT1cQ++waZTvOgjmjsYjteEGOkRpRxaarj4U
	68FPVCfEaaIsYMly8Mzn9UTi/0n9nONUPXHpVkk0fElwbmUbXK8thzSGKb9b8aeUS9VHPDU3mBUs1
	1Mtj+hcCuPmGq+yHmWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvySe-00EMAH-0s;
	Thu, 26 Oct 2023 11:23:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvySb-00EM9R-17
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 11:23:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6bcdfcde944so177100b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 04:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698319410; x=1698924210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6o5bGZcHAJk2D2fMrg8jES9q9xPgXszsUaYOJbMjhzs=;
        b=lMKNz6/Hj0PJugu5YrlGAmyWwIst/ToWfWjVRwA8mbjPLDkG8kyZ95v8CpFYZB6M26
         uvBkKXZIcMgO98Y63Ptz1ftgBchWbx0k0WQQZPc+VSDEwHpAGZ2WNjfhY66CKF9L2sDG
         QGCB+pB2C3xNlnsX9eE2jnkfkA/V+wYMmD7jPoGieeXf2cSxGLgEZ5qiyCMJ7B3doALm
         gUESX7+KMcW1VtTyXtSklX3enlHAADC++087KD4CqFvExIc0LZWSb0QfuOnbYBb9Rdc3
         nGMukrxuIoEcdTOZdcDM36b4FaM4WTKpv03IIhwjW31JN3Baq4sBWIaaJPtPiZR4z4v8
         DaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319410; x=1698924210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o5bGZcHAJk2D2fMrg8jES9q9xPgXszsUaYOJbMjhzs=;
        b=WlZPoa0xonU+KLz/YZ7yeaHJPxkVTXGp3Vw4+UD+if7kGKl2QqdD0zZkRmrMNm9lzQ
         Fd3wdVGvu8Qylw3z/gPjvSizoXfM72VRP094JaLAK28wsbd5Cu/qCt7GBHXgAUCpkvzZ
         lddTAzaVHIz6ILJxwG87tDhdmJ1xMdbLPhpJJ4S/Qbgs9zCnTL7y/Ch09pCuk0wHV41x
         Y1acbMSKo15HegUbEmMo/CbKVmWN+Po+RtxMvpWbMHuVeOEfWQGHVeA5veADnlIfRrdy
         zAzVct1+Rfzwqig14C3SmvMkk350c0zHfNi2VCFnZzJzqVoSCLe4worqrdf0eu4qdDd6
         nnlQ==
X-Gm-Message-State: AOJu0YyVVOfTg8GXL4Mxed3vqrggORC0lRsSUFL31FDmjsgaq8xqHTcW
	XHnU2PTdXeCu1DBNUoOeiFg=
X-Google-Smtp-Source: AGHT+IEIwbNaB0eFWwo9NSCq18a7DnMUyLq/zLBkAAUIyN1JalMDoBiynmuyl5mZYfjNFay25JmfVg==
X-Received: by 2002:a05:6a20:54a0:b0:16c:b95c:6d38 with SMTP id i32-20020a056a2054a000b0016cb95c6d38mr23313360pzk.2.1698319410159;
        Thu, 26 Oct 2023 04:23:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4887:380:b001:41f4])
        by smtp.gmail.com with ESMTPSA id c19-20020a63d513000000b005acd5d7e11bsm2445690pgg.35.2023.10.26.04.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 04:23:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tudor.ambarus@linaro.org
Cc: michael@walle.cc,
	pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 1/2] mtd: spi-nor: Set the erase flag for multi-die
Date: Thu, 26 Oct 2023 08:23:11 -0300
Message-Id: <20231026112312.3217502-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_042333_383408_FB200B20 
X-CRM114-Status: GOOD (  12.21  )
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

From: Fabio Estevam <festevam@denx.de>

Instead of manually passing the .flags = NO_CHIP_ERASE in the case
of multi-die SPI NOR flash, retrieve the information about the number of
dies directly from SFDP and set the SNOR_F_NO_OP_CHIP_ERASE flag in the
multi-die case.

Suggested-by: Michael Walle  <michael@walle.cc>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Newly introduced.

 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..f85ea57534ba 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2850,7 +2850,7 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	if (flags & NO_CHIP_ERASE)
+	if (flags & NO_CHIP_ERASE || nor->params->n_dice > 1)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
 	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
