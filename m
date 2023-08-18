Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5E2C001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qcE7NSPKFbnjjHwxrc8UZtDiLKi3z8KCy9NTw0KCm8Q=; b=HHeZrkEerV3rL2
	3CpMz2zNwgbSYPrhXCaZkmzwFf1gqkx3T9XXlhhaT8UGnDB0A/Ipn9YP4cyHQOL+4K0crQYwqYh1U
	0Rhn6MDPxXaFh2Qan/r1lEV2cQiEvmrLdi4s7QstwNj2Bc6yKKnJGGyed4ovGzBCm7LqNW29plZ5V
	L4RENy78Bs6oO/DuxR2rXGc/DIrC0wjDo3J54Q9J9ikOxANN2HZqnAsBzkhQbx7N5rBQcl+DYoKKj
	ERCYsrlvCWcBKywfIxalH+wT3yDzDO+11yme4hiHksEELhNf5bVnwZ+qqae1RSrW0BL5PCJK0gmXO
	4tDNT2kc+Yp8G90V9CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWtEw-007oty-1H;
	Fri, 18 Aug 2023 06:45:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWtEs-007osZ-2B
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 06:45:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68866e64bceso463441b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2023 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692341140; x=1692945940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/AW6OVix64uYufO+n3YwaFOFJRrri1APYCHLgST4Pk=;
        b=TNqQvI55sOwODQkNAVTwk8p0iWMdf6tVvcuHNCnhnkf4o/mjFFSaf1Jxii3XaZnoM8
         YGyxPkiRf4esm4ZkLOBLSvxLU6XgTLeoGMbE0adARB/s/Xte7nfpBRtjZhxjlBVOUYpw
         q9meADO04eNsS2mtM8x1gYmZpWibL2R9gAKIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692341140; x=1692945940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/AW6OVix64uYufO+n3YwaFOFJRrri1APYCHLgST4Pk=;
        b=JMXj40W8E2QYCcfaSL6xmbuxwkMuamN5EG4PMpWTkmkyhWZXs/g0S9YtS8JJwOVnCd
         D3uI45LKkkjjdKAPgq9355bx9P9LR4Oe2ZvgP6CW6GFhyaF0mCcFXOQ56eoNMSBEygic
         vd7LDbBMJURRu0HnANQtwPCkjpt5V5PcUqXgf/dqRLDlOPKyFmoNzz37EALwUNgf5KIK
         nMvQUnzsuHFMcalPc1fSgeq2+O497rLqxf0amMOcF5F5vCFJYklQNtVURpGWYbUB4mOV
         Z9+npddqUL3gb5uJ6AmON0GgEYh3PWfrP3CuLB2mAWpdTaS5dTKcrFw1chQifT+Igvpd
         uQJw==
X-Gm-Message-State: AOJu0Yz2W4TYoi/UdPfs5FdBC+tq8ejPWdYxs7JHjYCx9qnEph5rDUGn
	biXKQBym/clG119fsneQM2xHzQ==
X-Google-Smtp-Source: AGHT+IG5PS5tClmOeIQGf6BXI3cuGq8es0FpY3r5qTOCvHFz289bKpQRYo5qHOU1Zjv0jwFi9n8lUA==
X-Received: by 2002:a05:6a00:b8d:b0:689:efec:fc76 with SMTP id g13-20020a056a000b8d00b00689efecfc76mr1995037pfj.18.1692341140635;
        Thu, 17 Aug 2023 23:45:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a45b:137a:a8b1:201e])
        by smtp.gmail.com with ESMTPSA id n9-20020aa79049000000b006870ed427b2sm833792pfo.94.2023.08.17.23.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 23:45:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: spi-nor: Check bus width while setting QE bit
Date: Fri, 18 Aug 2023 14:42:23 +0800
Message-ID: <20230818064524.1229100-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_234542_763594_1B62497A 
X-CRM114-Status: GOOD (  12.06  )
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

spi_nor_write_16bit_sr_and_check() should also check if bus width is
4 before setting QE bit.

Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
Suggested-by: Michael Walle <michael@walle.cc>
Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2: https://lore.kernel.org/lkml/20230816104245.2676965-1-hsinyi@chromium.org/
---
 drivers/mtd/spi-nor/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 614960c7d22cc..1328128dfe65c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -870,7 +870,9 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 		ret = spi_nor_read_cr(nor, &sr_cr[1]);
 		if (ret)
 			return ret;
-	} else if (nor->params->quad_enable) {
+	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
+		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
+		   nor->params->quad_enable) {
 		/*
 		 * If the Status Register 2 Read command (35h) is not
 		 * supported, we should at least be sure we don't
-- 
2.42.0.rc1.204.g551eb34607-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
