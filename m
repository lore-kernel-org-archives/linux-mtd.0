Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAD0D2AB1B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tI0f93lUlAFq59ye1zz+c8AMaZhD2COTfbvUVU/6zSM=; b=UPWBUqCMOaS0XA
	uoMndtsP/lWaWGagAcksw8h5QIJkt0KVGFp57RS5sX3gGTPWD27IMHjcNY82eVgCa/WEXx1ZiaRhk
	EOvz8soJmgwB0z54PU54svaE25RaW5jVSXvcA0OW5NDAXf7Do6by9lW6C61KiAwdM/0jn+vI+Jerk
	Ca3MJyZTZtXAr3vKTPvDjww+erW59lf6AgZ3uMs7Rn8cWLIyOxpSFQ1CQKsSgUPWzjzpHbwVlLdom
	7Pkd5OIIjGml8Yyp72AwSzMZW9D/1jTU9s066y+w41UGBXRz0x75LREg5vVewm7aKY3oIKVhGkooz
	5IgqeZQMO2yTUTvmifbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jcE-0000000E3uA-2LcM;
	Tue, 29 Oct 2024 10:38:22 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jN7-0000000E11i-41Tn
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 10:22:47 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so45143041fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730197364; x=1730802164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gevxWDiw1Joa8obRCekHXlX/q8pa3Bd8D6cgQBHwmVE=;
        b=cSpKe4NJlxVe1bo9V7eMKwm+qGksa7Agb0GA7BDoWXXRE0c8DpI6tiqmanyQzu8mQL
         a0FbDki1iXA+Q5+KR/OG+ZGf/WLPADLpTT/1T6s/p4S1PRuaB5KuPt1myBHJnGvrZ6Eb
         IJMkiMmwTQhyVvHHK4LF0ffdmofwFq+mPUM+qMtT1+n81So2+nXoIjrXxfjmhcF3nrP6
         aUxOq5b+KfzK+Vn4S7+fRi7xK1DKq6ktUlfaiw0vmfejOXxik9vMffK8zZNTqSKPGhBv
         3GLI+UA4eMb76eEtvEHl1nZNnTMb3VXBvbMwNmAOvHMvku8QIczjSnCTOSdX0OSV0lUM
         r/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197364; x=1730802164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gevxWDiw1Joa8obRCekHXlX/q8pa3Bd8D6cgQBHwmVE=;
        b=olyLmSHvGGh3SI+Y4e6UOb7C6O1sJl6kll5gIhSt2kJIBEnGDYwJHFS2gc7nDzClMb
         hkqEJzRakIvNc0hQGGVCuvVpmPkprT6xkrL5r+7m24JnyCgebxXbwmBYn2nX27PU24ez
         7X1sZPCdZBjThlYcy4H6enrCD93xfMkNMvrN9NhJd5k0dtoJz//drw4sVVKKz/sxKbHs
         PIbJaWPhIeOWWusOPndHqkNTQr6bAWdDK7JGDoJS0vSDuaYZ2rNn6rl49Agwcwol2CPR
         99m59g63JupIJvvNG8PFAul9y9RFIjL1He5u5VS0NcHDGrwJvK5+zu718GMCwz8Z+q2d
         Bzyg==
X-Forwarded-Encrypted: i=1; AJvYcCXsLAV8rOkru5wAG1gx/pPQtVwdYxUhrYjZbxL2RKMSg6Iz4+QOHwjuzsULOpgkhPplVyQaXLj74W4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqX88FQmuW2EWOqpWLogk4hkogycPucuR4LujOstD+7hw6A/jB
	jaFxprj+eKym9q/CHbXA5mn6bYKaBoj5xsWAgjfUcluqpX0aUIXiwyFhdNw+CW0=
X-Google-Smtp-Source: AGHT+IFpXeHjBYJ4bh6c/28VpHHP35QvCnNGUuPqWzvC/md0zxhyDDRH72iKNBCLUTiNRx10pm7VKw==
X-Received: by 2002:a05:651c:551:b0:2fa:e658:27a1 with SMTP id 38308e7fff4ca-2fcbdf68ff0mr50076231fa.5.1730197363921;
        Tue, 29 Oct 2024 03:22:43 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47a86sm12084498f8f.53.2024.10.29.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:22:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
Date: Tue, 29 Oct 2024 10:22:38 +0000
Message-ID: <20241029102238.44673-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241029102238.44673-1-tudor.ambarus@linaro.org>
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_032246_026213_FCB5A535 
X-CRM114-Status: GOOD (  14.01  )
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

From: Peng Fan <peng.fan@nxp.com>

SPI NOR flashes needs power supply to work properly. The power supply
maybe software controllable per board design. So add the support
for an vcc-supply regulator.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
[ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
variable to avoid dereferences.]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4:
- move devm_regulator_get_enable() to spi_nor_probe().
- add local dev variable to avoid dereferences.

 drivers/mtd/spi-nor/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b6f374ded390..29441f2bab5d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -3576,7 +3577,8 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
-	struct flash_platform_data *data = dev_get_platdata(&spi->dev);
+	struct device *dev = &spi->dev;
+	struct flash_platform_data *data = dev_get_platdata(dev);
 	struct spi_nor *nor;
 	/*
 	 * Enable all caps by default. The core will mask them after
@@ -3586,12 +3588,16 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
-	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
+	ret = devm_regulator_get_enable(dev, "vcc");
+	if (ret)
+		return ret;
+
+	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
-	nor->dev = &spi->dev;
+	nor->dev = dev;
 	spi_nor_set_flash_node(nor, spi->dev.of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
-- 
2.47.0.163.g1226f6d8fa-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
