Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65640C636BD
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EApjZG8xdS/t/x9HO0YFYj2isha2h3Ve2FIqqEY3wG4=; b=IQsCbJ3l1gWDaj
	tOBC+IgjY6tMVzSIxgEqsQt21wixEK+bPn2dGMrbxqVtD5tT9BCefuMx7T4a+b2842dHcwCW3+30E
	TFAIheWKbyglYD3eyNYTR9i/oqh8TzFJ/Mpg8SqBDQjYfQSidQqqaZA/RGfMWM1FnjhSw08is399W
	+wiibQ3I+Pc+/Uv0HwiNKarhPVT9k7TBqOn6+JBpsVZLCMFKcxKVY2Bl3Qn9bXuQyEXgfFl2tXztA
	puaD5gqNhNHjPOhaELG4L00YC5pmq3L+Ayn0I6/4EgOx2tkSX2CrqhZuykHAy7eW2YzF/gK7PNm1s
	+aBQ9J2WLs9MV1Cel1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bEs-007tym-1F;
	Fri, 24 Nov 2023 18:49:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bEp-007txL-19
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 18:49:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54a945861c6so3169607a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 10:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700851753; x=1701456553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiSRWT9NVEVchvdLGPLG5ZFEZReZtLSoIFrvmw6+vsw=;
        b=mTVEYWmjnEN1VXYox4uhPr2RERqNwkb5wEAB4EF2A91Mn7ry8h1sQ4gakD7VS8L/hC
         ITU9Zb6hZmJdkEP14ex09eUhxMjSvWOXElgOQj48u1zCQgfYkfE2nS+KFFApsD737nSk
         p70gRaIzYq05b1Q6SFuSspU7Mw9Si2l9XFJwH5PfZaGxlYVjK2sImh36Y2DTy/utgAwp
         oY9aTYoa7HX2rXz1/URJwG/8fjM4GEC3IAoiWO/hi7jlumfz6fMpDkKy7d0iyXlAb7oB
         t+qPD38+gyxy3Jh3tTShvD6htp/ePHfZ894hKIBz4h1lA+5W5a4SRso1EQi1pqmVJKfF
         n9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700851753; x=1701456553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiSRWT9NVEVchvdLGPLG5ZFEZReZtLSoIFrvmw6+vsw=;
        b=XrQNPVcOeTO44pvcAcjZqsjbIkGHEltvDCrpdpwdjLnyIoaLvt9ceYorbw9oQafu42
         a85Qj+Gy8GBI2uRY7XIoA6bUihdpM/8KYEFKVNBhiTlQ80sC4Ug19YyrbjydqC3kPl/6
         bTl9e+lA0q7T6m8wvYqo0Xvs64e5TOUI+rn97Ekc7HwI7LdslIurPssnYaRQXUdPipMG
         lE+ia2MHOBmAefMFCY+75zbPjPPARz8cQMryg2sBtaP3uWGBmyuowISAq/iAW3SLGqtz
         IUclKCk/VoSZj07h0uea0nsmm6dC1itIcFBfsZgX2seVKdChPWDsBefSWJ8NcEp7BJix
         g/Iw==
X-Gm-Message-State: AOJu0YwMxCHja6/NwST3DLA8P1aYNhJM9MSWS7D4F0hC9o04biYgLNpi
	WYymWzYCgQUwEkXvXty3WrNXgA==
X-Google-Smtp-Source: AGHT+IH/7VhrrVnbxV8VXRJ9x7d9t9tc+2zqsdI8xTo7/pgmhJa5TYoNStBNrMvPPUJooSzLq/R8+g==
X-Received: by 2002:a17:906:c9d8:b0:9fb:8ce2:251f with SMTP id hk24-20020a170906c9d800b009fb8ce2251fmr3056500ejb.47.1700851753377;
        Fri, 24 Nov 2023 10:49:13 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lb16-20020a170907785000b009fda665860csm2376405ejc.22.2023.11.24.10.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:49:13 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	bagasdotme@gmail.com
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 2/2] docs: mtd: spi-nor: drop obsolete info
Date: Fri, 24 Nov 2023 20:49:02 +0200
Message-Id: <20231124184902.1194235-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
References: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3151; i=tudor.ambarus@linaro.org; h=from:subject; bh=itMGyyH1T9w7U818zcDk6jPfMPBSALBUakBUrmbmYcM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYPAe3c37W5bT8Y+dDdeVYNeWXCQMGnHVXEfUK x4XHME5yfWJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWDwHgAKCRBLVU9HpY0U 6Q/FB/95avdMdbTJ5vj8H47/ju59+qdJiBZGM6rkE0htbS+XCVnm4UWM1Sq42d2WBZI+cC+MGc6 +5RHNmttVVEP7mmjbwRpwrLKCCOKj0VN5LC5DJYxsCITZ84QGYhJktlblILo+okgC5wei8duBiK gK5uSS7gV0fD+vWjECAlPSUGIhvzwvMRv5F41IQ1r3svuRZLtv8A2uDLLJf1/N4s4Is5LG5NFlS rqMhgF746rDuKi5/V+1NUk+bqO2tRdk27C9CrdCAxraT8CNoxkVqSObn85AZGg/Odfwk9Afav52 gacTikzqYooSaBS3LO/TDHdb9cawWDvjM3Avmx2zb4bjoniz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_104915_398847_A7E91BE7 
X-CRM114-Status: GOOD (  15.11  )
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
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 Documentation/driver-api/mtd/spi-nor.rst | 62 ------------------------
 1 file changed, 62 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 3b2e1a6a88bf..e28c8d226608 100644
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
