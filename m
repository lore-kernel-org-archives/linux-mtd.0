Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB72D12D53
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2024 20:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3X5YXn8oi80RuNQLjUa6uHbOxTVk22SVVYp8zqonqk0=; b=WAhwsyPNEtCD0t
	9emUrpWmMr9X98miGyj3tNLGixwsl6fIIzN+WpuPvU/3j+WUs/BZer7y6rMzXJ66O7rUe+8hcPkuh
	9AnEiq482g48D4afUH0JBtKy0t9gDtAPTAqkEbU7eBJaLPwHz9hGAY/9dabMSoYTaluQDDmfZVe4V
	Dz+IWi8Te1/32Xunb437eRShnKK7+zLHjIu8WY81q5YxXpWyvRS6d31ugcFMed80xGrwD6H3Jamb8
	sfTMkj3Fiz+uxiTGrPlrQrkkueJLHfVVPe0U4N8bYlJt4TcYzx45Qa1A6EDG+6d5/Kw6robcaDH1L
	zffixb9p5I8FC7p5SbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAEtg-0000000FZJI-1qkn;
	Sun, 10 Nov 2024 20:51:00 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAEtc-0000000FZIR-1FKX
	for linux-mtd@lists.infradead.org;
	Sun, 10 Nov 2024 20:50:58 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so4737362a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2024 12:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731271854; x=1731876654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQvwoWucpk9OxilYFxI4xQ/zPw71rC1deeGQHgd2Vls=;
        b=hsP6hjp+88b8/V95nXgv6HO93pSWTG2z5Amw3ESRo/oHSvv4p7w8TRafNY8RA1sVyt
         U6EW8/bmaPy7Np1pfaD6lqpaFCS7X4fduD5CNt7hNv2ia0pvKy/UJpJ0NbOFj1q3ehH1
         nyxr/mZbpTtpJXtId82xLnkURpL7dJNI4cYX9sFo6A6dsCJs/Zi8irSNuWbOaWAJBSRB
         ge5Uwh7ILD3VnoOHwGSCz+0dvPyG5hqtc/AxXoAo4t149fqDwYzTHywMkkEzxaTGlvOF
         R07kU+o0/dnd3ehpKw2uiGMfh4MBrWo14yXd/6qembjt2W1/ZIaGmhijPGvzspp29NxU
         jYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731271854; x=1731876654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQvwoWucpk9OxilYFxI4xQ/zPw71rC1deeGQHgd2Vls=;
        b=uX12jzZEgMzV4o6LB0yHPocUswVkQsa8e/yayH0TZqFyIWeedA3IMt6/JLcjpf7lOg
         aJ0eGey4MXJxb5Ox9Z4NkdwCIPRun8YcmgxMJWxH2oqvemcPq00UzSQKGFnQnAWUbauj
         ondwYbP1KD5eLVqSEjF6rEE9/IgUYe377K9Nimj7hdED/n3QcoNX99ytF6ertmqaa17g
         zoGfFhhpqNy1U2YYA3eipnK33hM4Q2UsoO5z5D0hP8LhimAikLv8WWspn75l3Ige82pj
         GtBf+Hr0kk51xOj1gBAz2pKzHwdDMvTRjD5+zBmiNxrunEJ/JjHMdE4wZeutXPedx0Nb
         sqFA==
X-Forwarded-Encrypted: i=1; AJvYcCXxWhOUKWdSS2851WOJWUY0EVKZPxW3jAuvHij8JUkEkPM6K9WyJ7bGugGspxko+och8jKTHuRCk5Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgdyuB6CS3cswdJ70HEd5sPzlkO+49yfUoI8zVSg4B9NrUPiXQ
	HHN696d4MdTi77ljt7SodPbK86fNT+FmsBn9NxHgG46LtPj1Ce6Qy2cZoVyn
X-Google-Smtp-Source: AGHT+IHuzXjkaETWOavLmRFnSQA+YWENaxM84Z+PqbgnAtjZoXxVGujY+q/lcF58GcWjaQvwlweO2g==
X-Received: by 2002:a17:907:e93:b0:a99:d308:926 with SMTP id a640c23a62f3a-a9ef0009df1mr1002240666b.57.1731271853615;
        Sun, 10 Nov 2024 12:50:53 -0800 (PST)
Received: from Bogdan-PC.lan ([2a01:d0:9759::4cbb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e8a3sm511227066b.190.2024.11.10.12.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 12:50:53 -0800 (PST)
From: Bohdan Chubuk <chbgdn@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Bohdan Chubuk <chbgdn@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: add support for FORESEE F35SQA001G
Date: Sun, 10 Nov 2024 22:50:47 +0200
Message-ID: <20241110205048.1751377-1-chbgdn@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_125056_362794_F5F7754F 
X-CRM114-Status: UNSURE (   9.18  )
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

Add support for FORESEE F35SQA001G SPI NAND.

Similar to F35SQA002G, but differs in capacity.
Datasheet:
  -  https://cdn.ozdisan.com/ETicaret_Dosya/704795_871495.pdf

Tested on Xiaomi AX3000T flashed with OpenWRT.

Signed-off-by: Bohdan Chubuk <chbgdn@gmail.com>
---
 drivers/mtd/nand/spi/foresee.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
index e0d2d9257..8a01582c0 100644
--- a/drivers/mtd/nand/spi/foresee.c
+++ b/drivers/mtd/nand/spi/foresee.c
@@ -81,6 +81,16 @@ static const struct spinand_info foresee_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&f35sqa002g_ooblayout,
 				     f35sqa002g_ecc_get_status)),
+	SPINAND_INFO("F35SQA001G",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x71, 0x71),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&f35sqa002g_ooblayout,
+				     f35sqa002g_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops foresee_spinand_manuf_ops = {
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
