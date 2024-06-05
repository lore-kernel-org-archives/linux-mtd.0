Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C278C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVYYBitEjM9ipeK/WcVyfmam5/eCSOgBPOIYhVaeYIw=; b=Yg8+EoaSrf/7wo
	OsHAi5pMWgHp7F4xcKRbEqShWbvv6qsjQq2S9K8sP6+7IX3NaPSUR1WWxgrfFaEx9WQ92ffB1ckRr
	fl1zNakMKgZlc6VsLKYtqauE0z7LVZofaMj2QE6vdal6NJ5CZmxqM8fEA62GNEatHI6/LwbJ0k4h6
	5XzVJYtYroo4QpGt1g0/fQIpGVNsJA72dv1Lq7oixH0gEef/Z+R8LWMpuxVfuVpKqFjNBmylPDdaM
	8jwVyT+E548uCR9b4Tv2pimTEheNH/KZzvzhbDRDKw97SGBlw7dozxLFUC1V5e3aOwoEqAlmwVSHP
	+g6M6ayEQKmMWsoF+yZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEjXG-00000004hoW-00ZX;
	Wed, 05 Jun 2024 05:50:10 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEjXD-00000004hnG-2xWX
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 05:50:08 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-374a6b5c504so10993935ab.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2024 22:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717566605; x=1718171405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXXx+G8S3LAOXSoSSC7Exyjxb+cKriQft0ZkCAiNSTo=;
        b=EYpuqr5dTr4dkaBC+bg8ufRwlFS3Ug+HNUf/EHjYUmc7+gAYBzOlPtoRpsPIAA7Qtt
         pSJuohxohDmiSp8EtO2krcw5yiln/PhbgPuMQ6jOUPoTcnB9eQZAkAnhhi4mV17MMkMo
         /J+Lc4pSzOuAoSOp7YZQvWZvx7i6PiF7nvizo6WuqvNoXAmORNC8N/PLT9Sn3+tdp9np
         s+sWMfnY27a1Cfg+tMQJq6XBHBpdrrPfTY1tVdeU/EI6YydaLJObtGH9LnafSDyonVyW
         Ux2Y2BQI3T9u1eX/2PtcUoOVdUOW7BWHBGDFiGkOHesNXyvihEsvP0V7Fx0inTWdhhm0
         9E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717566605; x=1718171405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXXx+G8S3LAOXSoSSC7Exyjxb+cKriQft0ZkCAiNSTo=;
        b=fCo/j2WzO6otDLS92rRyQDBnVyyw1AqfWVjepVuL3PQuRxTamTvu7tEqvI0B7xfpnx
         SR4KFS5gqk4pyKQEU6UUOFBI93du55xezNsBYBqzRFOxvEVzuFGZfLYlT0edz7mONMu5
         My56433ULXgaQMowj2f7CiIART6Q8KNZR2JljN8QmDucvYm+9CTy3+bDmVM3z7YnsljP
         UnEAReKdeRZsHYYW7hhkdZSFSNlhuYD8inegSW5X2xrBBeC4Fl4vLh4Qz4qoueqfd9rl
         Ix22anVsWO3ZavkkPKVKLLqVkqpNAgDhjWuKyiuHviXBYSAtotybW5uBd97VXPWaeF5j
         zWsA==
X-Forwarded-Encrypted: i=1; AJvYcCW34y3Vwf2h5VRmVq5P3g2612ORUPDRyl5u9TO/cxS5Zm0vmpVwBMYT40jICC0Yufp1zLJHmLNoqj4r1A9YkjWK7vZ2W1kgTHJ0fm5Jhw==
X-Gm-Message-State: AOJu0Ywt6U8mSJLFC4Tp/NX/RVO7+BEOol4TbevmWAL8Dt1n3hSpUkcH
	R0KiCMeTniESKaxo+/20WC71xkMCWOYfJLGnHSrk2FEoaMK21+YR
X-Google-Smtp-Source: AGHT+IG38HU/vMh5r37/64xeKQTWdknfeAX9UDHPB1tG+qQoA83kVSKVnVC84EjBIYaGa+AdYwOc5w==
X-Received: by 2002:a05:6e02:1d05:b0:374:9af0:5f38 with SMTP id e9e14a558f8ab-374b1f55db6mr14629265ab.32.1717566605527;
        Tue, 04 Jun 2024 22:50:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c3598487d9sm7845318a12.70.2024.06.04.22.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 22:50:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 3FBDD80587;
	Wed,  5 Jun 2024 13:52:59 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	dwmw2@infradead.org,
	computersforpeace@gmail.com,
	marek.vasut@gmail.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: spinand: macronix: Add support for serial NAND flash
Date: Wed,  5 Jun 2024 13:48:58 +0800
Message-Id: <20240605054858.37560-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_225007_769230_4BF61D1B 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit c374839f9b4475173e536d1eaddff45cb481dbdf upstream.

MX35UF{1,2,4}GE4AD and MX35UF{1,2}GE4AC have been
merged into Linux kernel mainline through upstream commit.

For SPI-NAND flash support on Linux kernel LTS v5.4.y,
add SPI-NAND flash MX35UF{1,2,4}GE4AD and MX35UF{1,2}GE4AC in id tables.

Those five flashes have been validated on Xilinx zynq-picozed board and
Linux kernel LTS v5.4.y.

Cc: stable@vger.kernel.org # 5.4.y
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index f18c6cfe8ff5..e1446798bfb3 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -132,6 +132,51 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35UF4GE4AD", 0xb7,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2GE4AD", 0xa6,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2GE4AC", 0xa2,
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1GE4AD", 0x96,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1GE4AC", 0x92,
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 };
 
 static int macronix_spinand_detect(struct spinand_device *spinand)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
