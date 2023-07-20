Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16356C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JKEWCI3Jz5zoBZ2iW2pTn1wCILuxIFM5Q13eiTzEOg=; b=k08YJ/2lfAtpcj
	JZ9DeF/OAdw8wrhFL8Xo2sQ09hMy+XvYpFNJeRe5tBDiJD+kUo74KQSVT0McwvhzWhXEsiGET6pIm
	xwjz33A0rDYS4iRbJeMdGWRpi38LR7mNQU1eg/c5nliwTncN0r+KZvW/hWxpamqGTbyiuc7RJtpdL
	3zMalziqkfCyA6eoR36j5Wq9VtkCvk694/MnS1ujCm2dtVCxbfMJvE6+q6FOagI5jC9/yYIj47Rhi
	H0ZzMJpJk4VuKoZaR2OnfzHA9kL2+kwY210Pd6u6s/+l+5AuBsBMW/yCjswIy1UwOkWiOyZ/Q/OKK
	YrWdadiEXVsjl7p2+4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNo7-00A4Yr-32;
	Thu, 20 Jul 2023 07:10:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNo2-00A4V8-2J
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bb2468257fso2523725ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837034; x=1690441834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Byo7YbjNt6CJiMVTDrfqn+OsLwNiuvAwsVMEPT9OHJY=;
        b=enZ0zCsRaeB0jI8jwdD2rukYxL72nUKR4lk5Jej17a0T6k12DiU8BKigbBKlAsKhUh
         mTeWfDqd4M5txZNUcmXjmOKyNDVQwfvSS+qQHVHVbkLxFdke0bUbSpjmYKZD9UM1LWX+
         C4rLerBgl+sctFbvAA3F4o5XcixKWsV++6tQPWMdxMEhm0bmv9HKhNpw0xWT+EjVhPTX
         JPcB7w7e7FUA++0cr4/jnN15tG613UaOWqpr0LysfFqtxiOQdZG8f3vg36xjzw5uZ1YE
         q3A2ojhphJEV1K/TTLJfc+m0OoRUuZmOCmP+8VvzoGmCC3ik1AAUjsqzZHG/nnpotSuY
         VlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837034; x=1690441834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Byo7YbjNt6CJiMVTDrfqn+OsLwNiuvAwsVMEPT9OHJY=;
        b=BK5yS+uSI8JXMi0JgIIjv723j4nk+DupQu28DzBtO3uJ39gwwpeg5Gz1soUuOJj13d
         7TMrQGkJYJXWBGmCgwe+J0HSk/Jw3oHLTgiWatJWAphDcNPSIWYEiv4uyEMDXG1a6NLQ
         o9GZrHll38ZhfZSKjD3U82YclpSXDPJCpg+dbdhBhXIpvb73+Sdt5cCXxCRdGUC3Olg8
         vfmFxVe/LPQzdGkX6f24gJMvq3TW33Wfgg77hHwKIS9TSn4LscEsPobOU5/Os77yalAa
         VFO0LorZT3okKx+Mcu3r0dbRvQjMN9j8amsJX7Nmf0V6b+A0PzSpzhhrwYC0haVeHw+y
         HL0w==
X-Gm-Message-State: ABy/qLab1CeVBLlGY6S8M0ZlCHm0o3Z61Ytdaq//0NJbtkDgOf8DmugE
	86TfNy4WE6HoXHpmv8DqkCgpKSPafJM=
X-Google-Smtp-Source: APBJJlHDsThCIYQLDmZELopAQaDjK/mo2gbVDvBnN8cYUuOv9Nl3B2pX4kxfvlu0AqES0VJk8YPAyg==
X-Received: by 2002:a17:902:c406:b0:1b8:9ecd:8b86 with SMTP id k6-20020a170902c40600b001b89ecd8b86mr22476218plk.5.1689837034156;
        Thu, 20 Jul 2023 00:10:34 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:33 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 4/8] mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
Date: Thu, 20 Jul 2023 16:09:59 +0900
Message-Id: <5c2fbc72d94c4f88bb4599c00c45fbaaf714b909.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001034_757698_F85BF516 
X-CRM114-Status: GOOD (  14.04  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

All the Infineon flashes that currently support octal DTR mode
define the optional SCCR SFDP table, thus all retrieve vreg_offset.
Switch all the available octal DTR Infineon flashes to use the
volatile register offset to set the configuration registers. The goal
is to have a single pair of methods for both single/multi-chip package
devices.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b99ed088b377..9150840e748a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/mtd/spi-nor.h>
 
 #include "core.h"
@@ -202,14 +203,18 @@ static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
+	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
+	u64 addr;
 	int ret;
 
-	ret = cypress_nor_set_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
+	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
+	ret = cypress_nor_set_memlat(nor, addr);
 	if (ret)
 		return ret;
 
-	ret = cypress_nor_set_octal_dtr_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
+	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
+	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
 	if (ret)
 		return ret;
 
@@ -247,9 +252,11 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
 	u8 *buf = nor->bouncebuf;
+	u64 addr;
 	int ret;
 
-	ret = cypress_nor_set_single_spi_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
+	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
+	ret = cypress_nor_set_single_spi_bits(nor, addr);
 	if (ret)
 		return ret;
 
@@ -671,6 +678,11 @@ static struct spi_nor_fixups s25hx_t_fixups = {
  */
 static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
+	if (!nor->params->vreg_offset) {
+		dev_err(nor->dev, "Can not set octal DTR. The volatile register offset could not be retrieved from SFDP\n");
+		return -EOPNOTSUPP;
+	}
+
 	return enable ? cypress_nor_octal_dtr_en(nor) :
 			cypress_nor_octal_dtr_dis(nor);
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
