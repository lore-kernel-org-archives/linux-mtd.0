Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936DDC46CA7
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhsVAxspJnpoeYYbHFy9DlpxBGDNkf1SNodT7tWMFJs=; b=Y+QUj1rfmR2FAQ
	OxEC4eXViYZdUJy6ft1XCZ0zStZdLr+ykVQmZ3JxNEiSw12nUY6Z5y4pU/wulj1iG3N8wGyU9Zw8u
	RPgCKrk3hdzfg2bqDeZp3a5F6qpJyAKsIXL2W5+zLSNufzrEqtppow1yiD1c1iQo6QgrG5mNQiUY5
	3991Zxj1iR7wQeRuNu8e/eDeMFEXHZollEvm+2e9En+kqfKkGCVDUzKpDpFHkx6itFF7XmjLcC5u4
	yifXNvp/CBEpjwq46JgblMRTH8foN0SG8AAv97gwvluVc6y2L2xPqJ9CEzO5Dw/8RKf95zq+5Wt+z
	4J29fUN3WlE7VWJTHwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZp-00AEWZ-21;
	Thu, 30 Nov 2023 08:39:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZk-00AESH-0d
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 08:39:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cdd584591eso692361b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 00:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701333549; x=1701938349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7EQrS0NRCQ0ONglNsAAgM/GE2mdcSW8vl/ECGXjYAs=;
        b=CZA6HFNnJNpDKB5uCUM/m8ovQm97OkdRLgnijdWn/XfrZKgSGeMKOpXYdfRKtk/m2v
         XZ20mRaA+bPktNRDQXMa2rVVPebhVa0fT8gUlTnFaV2PdVawlwcxfechIYbD0LerX8p/
         7wqa3n1ZubzpaFVUk/nG0kbY0uQ8VX+O6GDQD80N2FhDfu8M5Dc0d2+ctY6bkuM4/i6R
         c99LdlGC4thrSSGpJAoPbi3FuypPIFnPIAezGW3XhHwgkmWKk20uX1yT0RekzL17avgR
         tc2zGxvgkbRrp6a/jmr3n0hq7NPsFhuekx6uH2K7InzM7WQARJtiGeokyQHQvdnLGVWK
         VE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333549; x=1701938349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7EQrS0NRCQ0ONglNsAAgM/GE2mdcSW8vl/ECGXjYAs=;
        b=HmRtwuWLJ8IYW7xv91yTI3GQ7DI7P8Qlz2tol5ENlVPtyJufBhoulmZEQp8Sgi6J6o
         2nx+YaQMcnXzcw4f0eJ/87qV0wqcbC9Vni+6e29bxncU1B+A5M2Ir3jvwMt0ruL/Jtda
         VLiB1zOUkQd3g6LZixRByrqsGFbc7eu8ZD0Y8eZTyxtHgHNf8k0NGO5fD4gjEpV8cbXh
         qPMSsYFa6Uf2eNCn0DWJ6MfYJAMuDdj/T/uksJso9BS1LqM2dghtFC3wpp2nijkMYIt+
         YbsYnk45dkv6lZBQ5H8Ieu48LKnOEa1rDvbDXd85RR9otWsximy58F+zSRZ+UE01pKq/
         Rq7g==
X-Gm-Message-State: AOJu0Yx2rnRX+CoWvs4ochR9JY137KyvJ4q0kmlYg43FGBxSfNmuvEog
	AxUtwAKnIdUIthKHn8gv/ZY=
X-Google-Smtp-Source: AGHT+IEM7dVfs9f/ErOZjIsIuxVvCbgACKkLNLIi3ltnMuBRfxOPXSFrTgBEXmVRLXwYfhqqwM888w==
X-Received: by 2002:a05:6a20:438a:b0:18a:e176:5283 with SMTP id i10-20020a056a20438a00b0018ae1765283mr21025969pzl.39.1701333549265;
        Thu, 30 Nov 2023 00:39:09 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id t7-20020a62d147000000b006cb60b188bdsm698069pfl.196.2023.11.30.00.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:39:08 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id D1FC18050C;
	Thu, 30 Nov 2023 16:38:46 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
Date: Thu, 30 Nov 2023 16:38:52 +0800
Message-Id: <20231130083854.55221-6-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_003912_262387_2F454937 
X-CRM114-Status: GOOD (  10.63  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Some SPI-NOR flash swap the bytes on a 16-bit boundary when
configured in Octal DTR mode. It means data format D0 D1 D2 D3
would be swapped to D1 D0 D3 D2. So that whether controller
support swapping bytes should be checked before enable Octal
DTR mode. Add swap byte support on a 16-bit boundary when
configured in Octal DTR mode for Macronix xSPI host controller
dirver.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 60c9f3048ac9..085c9037d6f5 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -572,6 +572,7 @@ static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
+	.dtr_swab16 = true,
 	.ecc = true,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
