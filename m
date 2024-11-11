Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B14D2E9DC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 11:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95iOmmemynm+NrUeXkdxEfvhQW/zJKfO8UpeI87j5YI=; b=rz8umGIhhavabB
	oGxFdOu8ZdqQWBoyWKCvW7g5ffHVi2BrehuUMzBCWN7S7WEOApkqG6fBtmkGwqp0O6wicSEtSssIJ
	v01B1gY0gp1AT6YLl0wxiLcUbPRwQaYpjf2Fg0TTs2afu5mSx5eJodY0tsl2sgTqkb3su0KI5gZbN
	X4s6kwu70tQwkCa3iCimsAL5LeWWGRT4A6ec2fT3Du5bHTvIHjGS/L1/OFqtKBWRCmVpRUkYESMZA
	TYxYyud5FJshxrtnEqavSsTRZ69DmPQuvMIqrAe1CtynRVmIDHvRDxjOZG7mcynkAfQpaE9obwgbC
	f7f1m40MkwJb7BZ9XDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASWE-0000000HRDI-1lqk;
	Mon, 11 Nov 2024 11:23:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSa-0000000HQDP-0fpB
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 11:19:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9e8522c10bso683279966b.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323993; x=1731928793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=;
        b=dgt8+RRYADxPTW0uQV2pTwQUHG42vPi31ug2j0OKWRXQVOwo9L49pBECsDvPYYWMes
         iFfeaZBkqkdMq6EyTwE2Uknr0rhtKQTJJ9zwBHdt8fnVPUYaf0JEv8bIcwEEosA5vXwf
         WGFs7kKSjYg0DCOaaPxmZytrFnj2VbIPNx90+SICAEc40YrdLSTJrie8RTYeU744tcTx
         6kjducdCJtNo7XK/LBwCprfIsurgmz0BvxtuxbTxbEZ9bb8ALjzCmUyxh3OF7k4B+vkX
         gS6662UWsJa5gcq08VEOOi9vgNNeFIHiAJVQDUlqRuqHM7R6pn+xXMLl94qb2AWm1uZ5
         creA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323993; x=1731928793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=;
        b=L0CnAN000jRlB/fGWDVWL3hNX/yp6Iy85e9xBBbZeJLoIuLc9SRHETB6P3vneXU1Xe
         SGnbwt9jKFG46Eg5OL3AeJf6kWhOFZknc1ATyFMet5ELh+6SFLqjMnfPo5ln7XrSDlnd
         0fXfjg1W4B9V6pcxJwoRPugAYTiIu/BM2ORxx6OpVq6A8xxqoCB/z4ub1eoxAKHkraqQ
         kfaoaOPS5Apx4D6O6zrrxWwGaJbj1Jfc2OcNbfUGhZA2wplaViRsDirVVbasVJHBSDV7
         pup0UPd4rFBNzc3U2oJnH0QtVDk7tmEnH0tOtjGh85d8UbR564VpoN4sThIGJAbxCBJd
         ldLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHE4Z2dS8kYk43lhQee6F1Ki/9UjtBsc9DVXbrAXro4ZOV+ho0JpgBEbv1v1lteNEwZ8rIvLThMxU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz5LOsTKZ/inKg2k4wXvVWHM3BnXWrxTx5pSAfutZHOd0DOUPE
	xOqiNph32L+OKgkolcyTDmUCIjMb/nw/ahtfTSxgm1/BK3uDaaWJGm62rWmOhw0=
X-Google-Smtp-Source: AGHT+IGuK2Mqhh/4a1qh5q0NmwjtNgZX29PbWEQEw3KvEot2jIrlM7uXsL6sEyoljZjEBiZjnawbgg==
X-Received: by 2002:a17:907:96aa:b0:a9e:b5d0:4714 with SMTP id a640c23a62f3a-a9eeff934b8mr1161128666b.21.1731323993471;
        Mon, 11 Nov 2024 03:19:53 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
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
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 2/3] mtd: spi-nor: use local variable for struct device
Date: Mon, 11 Nov 2024 13:19:45 +0200
Message-Id: <20241111111946.9048-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org>
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=tudor.ambarus@linaro.org; h=from:subject; bh=xXAvRj8AmLSKWPBTJCUUr8yNr91DS97PKpc1oBmJELU=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehS9ebdJFKcsy5atBuVMxdS3C7109r1J/woe qFiYPTIviuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6ZjVB/0WO+cX4vsaTdpLFXuKZKYDOuInLaBWEUgEPPZ/8cU4SDjiZKvr8yqh0UtViU1djsAGxrU lbbkvJAMmNKkIx66H4M55b1h6KMzypC7Gh2btvdMNc0kajfHClQULdOw/bmIgmUvlEGyMUaesei wMP4FzWZrVtgS990dISZi7Pb49XLFqGXQ+Ljbjhjh52HD0NDBRYPAY0GoVz2WfswymhIVH58lLn qM4IX/9b2evCs9iyAkAnuO6ihfSpfUSuoisuuY3nW3tEB9ewWucFstc9YWOmEQD/QN9wZiBRnk3 kFup7CWm/XBWyReXdRdjHbbjrhiBuF8zQinlnQoUIb61MhR1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_031956_346970_D09964B6 
X-CRM114-Status: GOOD (  11.42  )
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

Use a local variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v5: new patch

 drivers/mtd/spi-nor/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b6f374ded390..2a329084505c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3576,7 +3576,8 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
-	struct flash_platform_data *data = dev_get_platdata(&spi->dev);
+	struct device *dev = &spi->dev;
+	struct flash_platform_data *data = dev_get_platdata(dev);
 	struct spi_nor *nor;
 	/*
 	 * Enable all caps by default. The core will mask them after
@@ -3586,13 +3587,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
-	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
+	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
-	nor->dev = &spi->dev;
-	spi_nor_set_flash_node(nor, spi->dev.of_node);
+	nor->dev = dev;
+	spi_nor_set_flash_node(nor, dev->of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
 
@@ -3628,9 +3629,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 */
 	if (nor->params->page_size > PAGE_SIZE) {
 		nor->bouncebuf_size = nor->params->page_size;
-		devm_kfree(nor->dev, nor->bouncebuf);
-		nor->bouncebuf = devm_kmalloc(nor->dev,
-					      nor->bouncebuf_size,
+		devm_kfree(dev, nor->bouncebuf);
+		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
 					      GFP_KERNEL);
 		if (!nor->bouncebuf)
 			return -ENOMEM;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
