Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A4EC636CB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Nov 2023 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrvkRoyE6plOTCZothQjI+H3hzr59EyoNYKQfEhigXY=; b=ZYHlkl+paSDHFE
	egj6AuptrkdknZgdo0OgBttqx7lUOrj3wadn3dOK4ZgluyJOPwbiGmNK4Lyk28UbQJwhC0bD+lUmg
	bmcSNxufa+8bvOYiIT6Quj23RQd9HF3EhDoE278w2ziiYHMaaxr9uXSa5YABRNNNBgSe0GYMRlMVj
	lAjwqKZx9pMvuCvoundC19VEIEoo4C8KCL1Ag50qNHOWgoFr/I98bdWXp1U2M/ZRqqGwwTbmzXIiM
	QklJxYlYMitcMd6uE4bPoYEFcEtauJrXrrrOwTjbBtTsw8Yt+QcxbpFmfxAHzcChyVhGwX+fjXl84
	0G30/bzobHYr/IzYYEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CEr-005FiB-2B;
	Thu, 23 Nov 2023 16:07:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CEp-005FgG-1e
	for linux-mtd@lists.infradead.org;
	Thu, 23 Nov 2023 16:07:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a00c200782dso145842566b.1
        for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2023 08:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700755651; x=1701360451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoI3lRlk1siP5XEqEA8VbXVQlXNyy2eE79v15BctaEA=;
        b=ewM26b/hM0E+yj6oXZF0JDId/vn6/DNbjbbbNpCD0NfKFqxKmPzfuG+kr39yF0xGtg
         fgXOTnnjSTYo4UZsn97z3RMpfwwkNgGLHbKMRvWETrBc1CJT0BMPp2x7/oFIfjKYgqAl
         9MW7+zkWTPz4o/Pq+CqVLo+3fc1cxNW3gfXonFEzYaHdzSF1ChiUUdECDslvTdAlCxix
         +BZv20yIGlTsK1kW2q5vgYL8sC+BOy6UYhOWPCbST/ousZ5epSLga+QtmNdsJI7h/jL9
         A2/YZKyVX0Ft4jRuZIP+DxDudZ1XdoxV9NWM5ZK8U7uLNvGq1TfseXdcQfNIeuBFvqTB
         g6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755651; x=1701360451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoI3lRlk1siP5XEqEA8VbXVQlXNyy2eE79v15BctaEA=;
        b=ofhwoEp2KLniOdIBb3zEx/fNgtbsSJl39mx+gyXBqIDLFVoVKd4zfxzhEty5ms4VjO
         16Cd18vgUP/i3PXaa8w20h8c8GmQvxMpmP7mYOF/Bg+eTwmhIXoBCkXr5ik6LpamyJ3I
         wXmg+xReA5g5hXzHoIy/Gut33j7vhecn5oBfV3ysW3FvLrc2WZlS0vGAUhY4zx6tnAFs
         mm4DkNlmtoJIhYo2HPvBJD48JPwtGXIhv7E/AsowCuEI0MVOMcN6r6hVGwmIer63uYOL
         lGPA03KuqlVSUV7AuOrEWgUfD1trnwQevESES5LgUUXrPsIuAhlYRRQJ0Z2u7G4CQ64e
         Bz5Q==
X-Gm-Message-State: AOJu0YzRXGswn8uh2RuD9tkY3ztD8B9PT2ksQnshkb1/9XJILSUw6KZG
	SuE+5nFcB4kki8r/jlxTiQHeMA==
X-Google-Smtp-Source: AGHT+IGHrjV7KWZCoEyhk3LUDeDpJK+b8DsMP8V/SftnXg8kdd6A2uqtPufVt+RamQUhVxFmLniHLA==
X-Received: by 2002:a17:907:d38a:b0:9e2:af56:c380 with SMTP id vh10-20020a170907d38a00b009e2af56c380mr5454059ejc.6.1700755651692;
        Thu, 23 Nov 2023 08:07:31 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709070b1500b00a0180de2797sm941490ejl.74.2023.11.23.08.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:07:30 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/2] docs: mtd: spi-nor: drop obsolete info
Date: Thu, 23 Nov 2023 18:07:21 +0200
Message-Id: <20231123160721.64561-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123160721.64561-1-tudor.ambarus@linaro.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053; i=tudor.ambarus@linaro.org; h=from:subject; bh=25OPubX9uzUyfM/XTP0zGdZT9n+Quh1N4wccoUHj8ic=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlX3i5QFJr2OKH8EvKa+v/4w+Lmao2JCr0Mw7oV /lLZU7/wzqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZV94uQAKCRBLVU9HpY0U 6QCbCAC4SngJRGZ0qeFbmpZ6hInfmNRUbhAEQHkQxqBDDtkD+zPfaHPtRDnzLTVp4wl9ZW+pv50 Uov8OIk5qS4gbc4Z4bJEqhsWZmOSpEV6Vlb7Se2LnRTeY7q0MPjA+Q4XkScUAnFB0EszN0POp5w 3gfs2paYIdVQbg3Nie3Dxomp8hpxgIjDEsjtP91bvES+Taajqgx4JQvOFebwksgWbrOp7r9iMrX s2wMu7w8QDSh9bODQfv8sDI1E3Ou+DKbos9OBejAD7lFPfLLpRsvZ1bKQSAMA5H/PVXrwOBXlmz CZt0aHdVmp+6qwMi1p03b9uGe7yE2Y3dTr2W9ZurmmhwLp22
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_080735_548649_BFC65918 
X-CRM114-Status: GOOD (  15.43  )
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

The architecture description is obsolete, it no longer applies to
the current SPI NOR framework state, remove it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/driver-api/mtd/spi-nor.rst | 62 ------------------------
 1 file changed, 62 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index cc8e81e09544..7a8737fe181d 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -2,68 +2,6 @@
 SPI NOR framework
 =================
 
-Part I - Why do we need this framework?
----------------------------------------
-
-SPI bus controllers (drivers/spi/) only deal with streams of bytes; the bus
-controller operates agnostic of the specific device attached. However, some
-controllers (such as Freescale's QuadSPI controller) cannot easily handle
-arbitrary streams of bytes, but rather are designed specifically for SPI NOR.
-
-In particular, Freescale's QuadSPI controller must know the NOR commands to
-find the right LUT sequence. Unfortunately, the SPI subsystem has no notion of
-opcodes, addresses, or data payloads; a SPI controller simply knows to send or
-receive bytes (Tx and Rx). Therefore, we must define a new layering scheme under
-which the controller driver is aware of the opcodes, addressing, and other
-details of the SPI NOR protocol.
-
-Part II - How does the framework work?
---------------------------------------
-
-This framework just adds a new layer between the MTD and the SPI bus driver.
-With this new layer, the SPI NOR controller driver does not depend on the
-m25p80 code anymore.
-
-Before this framework, the layer is like::
-
-                   MTD
-         ------------------------
-                  m25p80
-         ------------------------
-	       SPI bus driver
-         ------------------------
-	        SPI NOR chip
-
-After this framework, the layer is like::
-
-                   MTD
-         ------------------------
-              SPI NOR framework
-         ------------------------
-                  m25p80
-         ------------------------
-	       SPI bus driver
-         ------------------------
-	       SPI NOR chip
-
-With the SPI NOR controller driver (Freescale QuadSPI), it looks like::
-
-                   MTD
-         ------------------------
-              SPI NOR framework
-         ------------------------
-                fsl-quadSPI
-         ------------------------
-	       SPI NOR chip
-
-Part III - How can drivers use the framework?
----------------------------------------------
-
-The main API is spi_nor_scan(). Before you call the hook, a driver should
-initialize the necessary fields for spi_nor{}. Please see
-drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
-when you want to write a new driver for a SPI NOR controller.
-
 How to propose a new flash addition
 -----------------------------------
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
