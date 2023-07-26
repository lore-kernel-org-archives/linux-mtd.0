Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A26C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYVmyD4IVVOYVvtAOesYrhrzUAWwQC4qw4xWne9RbXM=; b=qqJ0sh/E1XPv52
	wPFWW4Hs9fLN1q751x+koo/oANGklsP4KdKlb4t3gykYIVCJUjzO9VqtgZnELNB6GGFstIIb+34v5
	gsDId/qye4uK7xyz7Rg+1tTACpNB+TTd6/yakFNqAvInDvrUFR4vLqsNyjPQU93yFlZ6bKwamlHr7
	NIJVsjXIw5yJOd0wt7HaFsgMCvS6xfANaVhy9LoE6ngzqREA2GDKkxqknfm+kpQmkePV3kUBPCQAS
	8UeRExRtum4yPgCrZ8o/3y9sxS6b1wIwfOMGIr3bD19lJ8P+B/wjaTi51dXbN5nd9FcgxgAxMGgxd
	xkv9HjDU2lAmE+Sgiw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKp-009V7q-0G;
	Wed, 26 Jul 2023 07:53:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKh-009Uzh-2q
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so55516565e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357996; x=1690962796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cU2izS7ltcfKojKR/fjnJHc55e+84FS6l+Y7MexOBa4=;
        b=tc3ftSFSYfLDFqyNY3lha83ooX0LEVhGmAmfhijWboXT7OL8NEWQo0CgIGiy0Xwbjp
         R2p2tgbN1InIHYLx1Ks6LLWjZ7vqGk8j60STJvMP4qpdD0nSUR0qly7PncnmmNneXBTB
         kgTo1LRl0yrJgRFJEYwsZAhcBZm4i2KhMHSAHvB8EBn6yb3PHASy/2uwZZTvdSMyr/1B
         WjlZ2VP2JPh2+66dgd1RCicPUPkLBa/yRZYetx0KVdJat7xrrxbuzdPLemA8Jx+82ER/
         eGXL6GxQKfMTDkF+shdtaUDkPq+D0yOb75mY4330ba5kRoXKLfkNRukgrMkPO+ZaVo3N
         k+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357996; x=1690962796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cU2izS7ltcfKojKR/fjnJHc55e+84FS6l+Y7MexOBa4=;
        b=AlAs9bVx/fGc61j9fEU2R0fqX0cuP9+JDtPz+EFmBjU7JBmihb5ls7erSvnlBJszaL
         gpC+uKb+0YLtlEnMDYOyZZ5Y+oZyFbC5M6PAa0X4UpH3WJzr39OdPKP1xWsU+KM7JbvY
         h9ib5NO4JqharPaTo9CR8VxQJDyWbThw/woKK5qcitDD265G1mkOWCKqwcnr3cv0ucsI
         R8xySkr7nxfmYaFU1uifD/QW9ltNg1R2/1VoWVTgN82dwHb7vU9/J6VgZ7Zq5AkIVEYE
         znLxtZW6UDMTKkucySl/AS8ciw1Rv/XBb7d2xBvzQ5X6+vY2QK2A3g6UHd8wjdXb+QLE
         f3Fw==
X-Gm-Message-State: ABy/qLZblqoKM44ptq80q5YMLwxMQxcY9ijdRl45rvDCLI8qWJGN5FEb
	ByR9UlbDPgj8zXa9JhAbpmMQ1Q==
X-Google-Smtp-Source: APBJJlGGKJUPX9zKGu3j7bheBiAy9QpBMFUNiQ56otABz73VtyPfm8rT9IqTE+uw3ImyQfldicdnPg==
X-Received: by 2002:a7b:c319:0:b0:3fc:8ab:762a with SMTP id k25-20020a7bc319000000b003fc08ab762amr790146wmj.18.1690357996247;
        Wed, 26 Jul 2023 00:53:16 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 09/11] mtd: spi-nor: spansion: let SFDP determine the flash and sector size
Date: Wed, 26 Jul 2023 10:52:55 +0300
Message-Id: <20230726075257.12985-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=tudor.ambarus@linaro.org; h=from:subject; bh=NWgsTDYFKhLtFe1K3wQNDGm5Jii1w6YuOY2WYJMPxYk=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYxqAXwIx9um/ULZdRtFO/54oPjAlOZo3WV 4xeGJRr5K+JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6fDXCACmE/+X59ggt+KG1kP7Do7JSnTBG9Yl+9ZLzTJ60ZG18uQ5N7K62ujAyuU2wGAyoPEpCDJ 6wC9Ec2XzCrD1xCn54hJZ9/KTSQi0EENoBPkvgnQ/ZkF75GungoqAxvvBTaGzT3xwyWziJr4tQN dL/4l46b23943U7VeMjVPPXpISWZeXi9znDvnEy5uw4W1GltVT6rHQ7aYkVGP+9zQAaW2ywWWas xEqPzjfSzC2pN3JagClyNmPlHKDBecOf6jGWpcOasqACbMdCgrmrdX7+53hk5wkKqy2wkEmIUFp c+P07MetPKJt7pckkYdJwOuMTZtECX0QFhpbt3UWETIsxFQP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005319_917050_EA2EB667 
X-CRM114-Status: GOOD (  12.03  )
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

sector_size is used to determine the flash size and the erase size in
case of uniform erase. n_sectors is used to determine the flash_size.
But the flash size and the erase sizes are determined when parsing SFDP,
let SFDP determine them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1c5671a3751a..30a3ffbfa381 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -873,11 +873,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25fs256t_fixups },
-	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
@@ -886,11 +886,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
@@ -901,22 +901,22 @@ static const struct flash_info spansion_nor_parts[] = {
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
-	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
+	{ "s28hl512t",   INFO(0x345a1a,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
+	{ "s28hl01gt",   INFO(0x345a1b,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
+	{ "s28hs512t",   INFO(0x345b1a,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
+	{ "s28hs01gt",   INFO(0x345b1b,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
