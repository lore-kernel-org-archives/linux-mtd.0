Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05277C2BBCA
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2024 07:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XyNf3YWkh7bLq8pFyRWwqOIZ0Gtk5BioTWLGMlye9aw=; b=MrlhZwqZ9r3RMI
	UHWbZ1c0dwodluuJ3yHUWM566NAgE90VJJSv9Y1mB54CNu1Wb9MURih33qCW7sMOaGZhDR9enjWFS
	KdbDa5Noz16AOl/Cb7Ypu3UGqZMvvUrgY936bdqXNxxmsCooTv1fx+8TsDPZRmVcWnFMYbsn6ZJg9
	sL8s/BL6vXF2AQvUVlHSs676GvXmfhLWJKh7BVU7JB+EyxkYLT39KyMmxdvzg+tp7WtLRPXDS65H0
	7oKqqexJApFF7vBaoMzBrK21OcYlOpa95cmcDo/txfqxmqQv+CjcFOSqW89eb5t+IdG/d9gxhj9uD
	DkvhdRFdreW4XjlbowPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0CC-00000001s5W-2jfa;
	Tue, 25 Jun 2024 07:02:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0C8-00000001s34-3kHU
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jun 2024 07:02:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7066f68e22cso1830135b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2024 00:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719298944; x=1719903744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvA5mzE/+nHLQ/xPEP+Y/yB74SbWB8VJOLGQGw2nUCg=;
        b=km4kAzYmMPlNga5n2bRXpdV0gwJ0H1tySOndTZfJq9jgpo26yEVlaaHHmcv1hLelpX
         mFLQY8OqJ5/gIYWoU1un0PJdk6LO4sgOxFjyMUZLnSTxlkGvI3X49mehAaHMlWsZnA9r
         U7UlP5a6pMjkGoM3IsGIaOpt+njhUZ4t/WKv/Fkkm19ETgjgg+rktgLjQsOQiBUhP/9h
         bnmd2E43Tvg7HZTIZAYtLgnm9OQxISGbyAeN3tKL5QKoVhwWvuQ5wnvXpsTMSI96XI2K
         4d9G5jFkWFN8ZITQDE2+YmBddQhKG8T3Ms+a1uZtqLP25El4cWdSgD44eT+nvbJQFAqs
         Jx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719298944; x=1719903744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvA5mzE/+nHLQ/xPEP+Y/yB74SbWB8VJOLGQGw2nUCg=;
        b=dOLq8icjKf8PcKkbWzHHgdnQ+LMsxdA8eq3Vy63xixsetqq7AK/NSBxOIhGhC6SayY
         dB0Y/t6LxqDMvcwYRGbTJee+EGUSPY5I5MBoosBR/H6ioeLTiQMJe7sU5WHnfjNSfhkC
         aYsi/1qPYspk/784BistMfOciANckfBQcC+s8G4pLtJlnzJfXsjj6wDyC1T18x8bMJiR
         JMX6gMfWZYdoy4b+47g5SPf0uKeJGS1B4RfzeK/9Rvp2zBhOdSCEkErTk0K7hcaaJFkK
         tTpYXC+jF9u4VH4erR1dn+2dtz4cGkSxVDJJoi0NSvJMk+m0u1QBci8QU4HbQhqhxw2O
         cu1g==
X-Forwarded-Encrypted: i=1; AJvYcCW5WPt0tnWcr2ndkssnAI24TknoCItM9yciypfL3NSbcr0bXiQ2dLSxg9bogADUAifpvmawb/qegrTFaJ1ga4PEl4ExgqV17jjYSy2lrA==
X-Gm-Message-State: AOJu0Ywrag2Eb65dwEFVVI0ESqRhX8AHpC6tCZAhsLT/9pJ3WXp9cx7/
	KWpL/6JH6PAcp5VSVGgxppFT08VRJLLevYOfC17VxtpJI7E8BjS8
X-Google-Smtp-Source: AGHT+IHyXqn+MHBdaLTe/TgEpMINUt8YDQTQlDh9NmxJoiVz8r0KZYhpo1Sq3pmY2xVwKalIv08U+Q==
X-Received: by 2002:a05:6a00:2b8:b0:6ec:da6c:fc2d with SMTP id d2e1a72fcca58-70670fd4341mr5360419b3a.23.1719298943562;
        Tue, 25 Jun 2024 00:02:23 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068a63c8bfsm2551976b3a.27.2024.06.25.00.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:02:23 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 46A2B800F4;
	Tue, 25 Jun 2024 15:04:44 +0800 (CST)
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
	stable@vger.kernel.org,
	Jaime Liao <jaimeliao@mxic.com.tw>
Subject: [PATCH v5.4.y v3] mtd: spinand: macronix: Add support for serial NAND flash
Date: Tue, 25 Jun 2024 15:01:42 +0800
Message-Id: <20240625070142.61782-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_000224_979331_8E9BACEC 
X-CRM114-Status: UNSURE (   8.63  )
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

Macronix NAND Flash devices are available in different configurations
and densities.

MX"35" means SPI NAND
MX35"LF"/"UF" , LF means 3V and UF meands 1.8V
MX35LF"2G" , 2G means 2Gbits
MX35LF2G"E4"/"24"/"14",
E4 means internal ECC and Quad I/O(x4)
24 means 8-bit ecc requirement and Quad I/O(x4)
14 means 4-bit ecc requirement and Quad I/O(x4)

MX35LF2G14AC is 3V 2Gbit serial NAND flash device
(without on-die ECC)
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7926/MX35LF2G14AC,%203V,%202Gb,%20v1.1.pdf

MX35UF4G24AD/MX35UF2G24AD/MX35UF1G24AD is 1.8V 4Gbit serial NAND flash device
(without on-die ECC)
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7980/MX35UF4G24AD,%201.8V,%204Gb,%20v0.00.pdf

MX35UF4GE4AD/MX35UF2GE4AD/MX35UF1GE4AD are 1.8V 4G/2Gbit serial
NAND flash device with 8-bit on-die ECC
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7983/MX35UF4GE4AD,%201.8V,%204Gb,%20v0.00.pdf

MX35UF2GE4AC/MX35UF1GE4AC are 1.8V 2G/1Gbit serial
NAND flash device with 8-bit on-die ECC
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7974/MX35UF2GE4AC,%201.8V,%202Gb,%20v1.0.pdf

MX35UF2G14AC/MX35UF1G14AC are 1.8V 2G/1Gbit serial
NAND flash device (without on-die ECC)
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7931/MX35UF2G14AC,%201.8V,%202Gb,%20v1.1.pdf

Validated via normal(default) and QUAD mode by read, erase, read back,
on Xilinx Zynq PicoZed FPGA board which included Macronix
SPI Host(drivers/spi/spi-mxic.c).

Cc: stable@vger.kernel.org # 5.4.y
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Signed-off-by: Jaime Liao <jaimeliao@mxic.com.tw>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/1621475108-22523-1-git-send-email-jaimeliao@mxic.com.tw
---
 drivers/mtd/nand/spi/macronix.c | 99 +++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index f18c6cfe8ff5..a38d0de5f765 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -132,6 +132,105 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35LF2G14AC", 0x20,
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF4G24AD", 0xb5,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF4GE4AD", 0xb7,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2G14AC", 0xa0,
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2G24AD", 0xa4,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
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
+	SPINAND_INFO("MX35UF1G14AC", 0x90,
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1G24AD", 0x94,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
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
