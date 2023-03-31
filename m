Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7551C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WQbGPEkQhFVibXQrMiixxMedlfG9WvR4B0Uuzdowtk=; b=3RcTZyzn1gt9By
	MX9+gKyK8iApM5c3L4AqeAVXfntCsdO0Su67MmvXd8oFiU/hgyB3lFaYlAdTRoSIXKriFvFPYQYeh
	tt//NBlO5gCJM9zFIyPHSGO8mF9o58J5VC+qn1OfO4Jl7tu7VVC3I47hyDxv7c/HvH5PaGsXA+QOH
	SF0lnIMR8WLIsVt0r/BbzJn7kbW5i/UISs7VnKwKJKWlcXP3rtJtsB/lAJRVtrwQ+7IwofEE0m+2/
	1ojqNF8Vx0temkTiiHwkUxOyyxSdZH6/foc8EJuw1jkZwJBvn38jwqFyMc2/SXW97/rOVAJ6ADLz/
	m0AwC3xd5OJSFfkqoodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAdE-006YVa-1P;
	Fri, 31 Mar 2023 09:01:12 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sl-006Cu7-2U
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:21 +0000
Received: by mail-lj1-x231.google.com with SMTP id s20so1830050ljp.7
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7NTWdMiStTh7vkRgScnjQ7EbMR0iuczOZLyK0JYbPQ=;
        b=ZzrZyDZBZ1t0pXXxbwNRoDoE5Wox+GfU6DC9vGhIspumjRbyQ3pimGPHzXGWbzejig
         HgYXv4RV4Yn3HaMO/KrjknoYMNhnnIjQz86P6E5FvpjmobP1U0TZLNgVU6d/G8LsH7qF
         o6cuwxQ5NcCAvkElGJXIYh06JLKiGjcVEVHP1FbXnbz7VEXEe4yzU3rGXO5zI/3Bp35j
         zyM7+DhEV8aR+OhpnwkTyCzr3SWsRaAQ15+1EAZB0RvYIlr//XbxrySwzlqhixMtmXa+
         tQkc9a+kvzIu+xcSAVHc+KKfPDcXe+B1RzatxceQfGRtlPwBWoW7Kgaj8WlX/xesldVi
         IyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7NTWdMiStTh7vkRgScnjQ7EbMR0iuczOZLyK0JYbPQ=;
        b=kkgcjpj4h5upjyOhtUjBRr+MRaAiQ7queOAuRWdhfIvWs6of5lJqKtkZzfEWBo04Xc
         qdrBGy7NKlD/Yqu3/lxmt6FshEpGkT0XT4h9QC4Qohs7dbFt7GTHVlfZ0glqJqdzuA9y
         gqM0oc56JH+iHSweYC9CxZiwM4/Ss2sjJSZ3a3w6zNpn+wkmsGFB1cCODxBv7foOpALF
         +8cgB4j1nb1TrGvKDJRrhzeQukl8YYhHyD7hYc2xnX5R880YG8xaYsVwwCL+vMfAQ6uj
         qPIGYZLqNnnAxBA5+5KDsgFhOhVyHW+8WiWHf34/1L7VsISbz14hhUhNQ5IVBNGG6UVh
         BNRw==
X-Gm-Message-State: AAQBX9f9Wh9R//GmqVAfteVig1b+BQXcupvXCybms9GRlgMp68GM6HW6
	ByP7IQ7grV7HLtMkZ2xkg8Q09Q==
X-Google-Smtp-Source: AKy350b7Rp9xYw4Le0T0/Q/T8sfqMkHE7nRnYiZQqUEzTRpsyzDyIr9arnAwVh1Txj4yztxzNHgtIA==
X-Received: by 2002:a2e:9d4d:0:b0:2a0:202c:93b3 with SMTP id y13-20020a2e9d4d000000b002a0202c93b3mr7078739ljj.49.1680248778304;
        Fri, 31 Mar 2023 00:46:18 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 07/10] mtd: spi-nor: Stop exporting spi_nor_restore()
Date: Fri, 31 Mar 2023 07:46:03 +0000
Message-Id: <20230331074606.3559258-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004619_858744_65A7E731 
X-CRM114-Status: GOOD (  14.21  )
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

Some SPI NOR controllers that used this method were moved to
drivers/spi/. We don't accept new support for the existing SPI NOR
controllers drivers under drivers/mtd/spi-nor/controllers/ and we
encourage their owners to move the drivers under drivers/spi/.
Make spi_nor_restore() private as we're going to use it just in core.c.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/driver-api/mtd/spi-nor.rst | 3 ---
 drivers/mtd/spi-nor/core.c               | 3 +--
 include/linux/mtd/spi-nor.h              | 6 ------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 4a3adca417fd..c22f8c0f7950 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -63,6 +63,3 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
 initialize the necessary fields for spi_nor{}. Please see
 drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
 when you want to write a new driver for a SPI NOR controller.
-Another API is spi_nor_restore(), this is used to restore the status of SPI
-flash chip such as addressing mode. Call it whenever detach the driver from
-device or reboot the system.
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 50297be98d1b..0517a61975e4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3290,7 +3290,7 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 	module_put(dev->driver->owner);
 }
 
-void spi_nor_restore(struct spi_nor *nor)
+static void spi_nor_restore(struct spi_nor *nor)
 {
 	int ret;
 
@@ -3310,7 +3310,6 @@ void spi_nor_restore(struct spi_nor *nor)
 	if (nor->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
 }
-EXPORT_SYMBOL_GPL(spi_nor_restore);
 
 static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
 						   const char *name)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 82547b4b3708..cdcfe0fd2e7d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -450,10 +450,4 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps);
 
-/**
- * spi_nor_restore_addr_mode() - restore the status of SPI NOR
- * @nor:	the spi_nor structure
- */
-void spi_nor_restore(struct spi_nor *nor);
-
 #endif
-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
