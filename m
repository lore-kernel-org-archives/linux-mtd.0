Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2437BC3814E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2024 02:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+lytH2kk/6r9V/QzfIn/lVTtMkyKpGXoRPevfEzx1w=; b=F1eNpTTNxafBB5
	cBKeWQEykb6QnEV9jqg0Yal5MOAo/xI6Tpmp98Mc2Z3jbTRx6i6w0UynDimjkgDdz1+037X0rwhuZ
	leGaa7Oj+lcIE/DcqRrNA2cFGtfNMW++G1+AVS5+ogRHEC4170PwnURNpLHy+ruO8oXUGzkaekD4A
	G4v0FzTD1xI9UZoyAoc2P48MGJ0wFJCkb2oGNk3fgjlnchhjOW2pU/LoRsVgehz2l7KGmocogJOpf
	OlMYTSIGlxSKkXvpUkzEGzEeLeyZt+Dlb8XFHDQO8cpQb4NdIoLqTHDkgZF/07pxwnR0vuH7oJEBf
	86d8x79qFNWKH6E+nlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCXL-0000000BxiX-0acl;
	Thu, 04 Jul 2024 02:49:31 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCXI-0000000Bxi0-35kb
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jul 2024 02:49:30 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-70df213542bso81667a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 19:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720061368; x=1720666168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAfpWwRhq5J4/h2Gbmc5RAglmxrPuD2qlVHxEogwceo=;
        b=aGbV3xr/Or8I8XJAhI4xQpF+vvgltJf2Iydwyy4ywaoAmbETJlcBR7X9dL+7ARy9wl
         vxcYcz35gb09WgRs+6MXZvu+qm2wpigp8KeKC1ZSKq6uozVWJnhUhmJ0ea3pH1lrKQ5a
         u2cTJPgl1gO5ilg49+yrFuIinVXek4kviCQEQo26hL/O5cdYTz6HiHaiS6af40XOczrI
         FycMEqC1A57uAuURsD5QHtJtFCxnECtbVd0DSeId85Bu6aAt0H67Wu08gB7KyVOCt2aa
         NUa6t58xLdlXKn0VIruAO9j9AqeT/eRVyfG8NgApBuC98jIDy5bp+Bm2gWcGqx9bA2Vs
         d0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720061368; x=1720666168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAfpWwRhq5J4/h2Gbmc5RAglmxrPuD2qlVHxEogwceo=;
        b=rMuCa519jQvYAB55/yv1V2JExRdjNtnMHez7vmI3Si91oU6CrEP8HxT1WOjFJ+h5Vq
         oBiNeGGA1NHKmfV88cTfImZFzQuGDweXvrb7f/AA5x/OD+8cZPqd3zTB8PhpZc699zgm
         ILylmjEC/feYL1plUUKA85FZJOqHDbYTUdMqwDGR0m4GV2WYs6s9ZWNIAlSbwZgl3mhX
         e4TtTquDedzxk3/ezfzztwhRETPqXD/TuWRwxpBVditGJhUVnSQVPoE9gDxv59q7yfH8
         0kU9yaFhwaoOpr/6rHS2Bcsyq7/s58Jlf5JfUWpMA+dj+7AIh+JyTxQ14AEGbVEw/jhb
         32Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWAdC1xeB/saMXZTEG2HaNj9BKJZdjQEovXg6KBMdgY819hn/vkDZC+19AXhxhNVlEQDbU+LOO6mexeEyLPysaM9OtKdRpeoR24/GCCbg==
X-Gm-Message-State: AOJu0YyaAavPQIazAOs+kLUSCowrM0Ijrjp7CEAjU3LXcpSre2LEn+Uq
	sFV0IfR0Rj49Z5gPXNYNFlNY3q+b/+Wi4lpOitV/R8c9KAu62QiItBtGPg==
X-Google-Smtp-Source: AGHT+IGRsrTFtYRo7lgWs47AcFAYlAptZJbVJGJcUMQntJmF8LEQXiSTkioAe0gDIfB4Qyx/v7rQ1Q==
X-Received: by 2002:a05:6a20:258f:b0:1be:f783:3d68 with SMTP id adf61e73a8af0-1c0cc75dca4mr260574637.30.1720061367655;
        Wed, 03 Jul 2024 19:49:27 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad0662e77sm102554605ad.229.2024.07.03.19.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 19:49:27 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id CB24780152;
	Thu,  4 Jul 2024 10:51:32 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 2/2] mtd: spinand: macronix: Add support for serial NAND flash
Date: Thu,  4 Jul 2024 10:48:39 +0800
Message-Id: <20240704024839.241101-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704024839.241101-1-linchengming884@gmail.com>
References: <20240704024839.241101-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_194928_803920_B179DE34 
X-CRM114-Status: UNSURE (   9.89  )
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

MX35{U,L}F{2,4}G24AD-Z4I8 are Macronix serial NAND flashes.

Their main difference from MX35{U,L}F{2,4}G24AD lies in
the plane number. The plane number for those with the
postfix Z4I8 is 1.

These flashes have been validated on Xilinx zynq-picozed
board which include Macronix SPI Host.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index aaf610f5d4a1..3f9e9c572854 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -158,6 +158,15 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35LF2G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -167,6 +176,15 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35LF4G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -208,6 +226,16 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF4G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -238,6 +266,16 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
