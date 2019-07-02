Return-Path: <SRS0=szGg=U7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDABC06510
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 18:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA4D2184B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 18:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aensXpHg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kP2+RMyS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA4D2184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S8q0b9La4OrdBBrKQ1GcE12zSbHneMM9Kb2qIoeX6fs=; b=aensXpHgVNZA6ctrVQzxs6tuJP
	oWl8K0hLzIXQfAAJQk5AsfYYLxnPrt+LiokXNRwf5kio5W+WmuCLKvMk0GIujsKZAvnd5FIJNnKHX
	8I5y8k6SNb55M5LDD+ZSiyw+nPRc7SeBbku3H5wQzeBb4lv5XLkWm2dNw5HYp0Qo4VZqRH54Gm/oF
	pg0od0qpY7W5Psg2V9OA3kuDPC49zdYy/5y3kyIaRoIwdaHM3IsnQYMkVPZ+EiUZ3nYSpcy0hKQBO
	2PfV9+rjEs/bjVn18y2EXzF6MV3/xgETN4nEZy/P14WrmVBfUapqB7jXzhTR8wli0Ai821yXB9EPk
	b3eAJTqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiNhZ-0003vr-5L; Tue, 02 Jul 2019 18:40:25 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiNhP-0003g8-9X
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2019 18:40:17 +0000
Received: by mail-pf1-x441.google.com with SMTP id 19so8706411pfa.4
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2019 11:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y+CmxvfTHNmkdcHZerrxb2wPdBc38Gq6FdKZioHxbqE=;
 b=kP2+RMySSYi0s9bLP+JPIjdlGB7GP0IyPMEzIP3Nw8BtM33CdAP+p6Xn577lTaKdlp
 V+w3kPeb5i+UGKJakJaQOQVeum5kY/mqq6YHOduVMyUHDmWPutdGc233cDaOEIVLqvfP
 7rqMmNJlpWAzrndk+vQFCzTnq/8RJ1BWWLOR6qdg5VOAK7H//4nxXEYWAzm8ya9l2TxX
 HC2zk1EAPyr93XGjNK/kAyFGXQYgubDB5b6TZ5Z3U1fXC/ygMrr6LgOA0DoIrxaw0NmS
 eU9yK8CmXKmxzJ26PaclixrkwaWWf8W0UdGbk3wJXKRICVUR2zQqDB2OwmCXDVkGQ/ip
 XvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y+CmxvfTHNmkdcHZerrxb2wPdBc38Gq6FdKZioHxbqE=;
 b=Ng6DKzuURIeIkKd7AwyHx2GIlqIyMS7MXFuOkbWHYaxQ0TFQ/+etCBUP0e27UQUz37
 bvEgLvxz6peXYHV8DOW0tX14+Df5MDuXXcZTQuQT52zgTtLHINokwZOxi0QzbwjaNJKk
 YBbdY3P3T4lgM9jiF7ZSNI9YX8pt/bDjF0tajs3l4ao1p4MWhfv+wzEeLozBhzyiqtWO
 HPYFSmQLzHyv9psPRpSrfYKjwxBI9oPCBUORVjj+xXVDxLCqCDxZMxmp9l0h8Yz5msj0
 mXrRkGSJvHsIS0epVlqvzj/aItq5IIUjwWsl2eFslx4xIcB2XhX5M3cw2uJ5eZOlVAej
 CO0A==
X-Gm-Message-State: APjAAAXI23PYzIAL5kAUEA3HHWb0k7xbGRsmQcyKyVJH/NSag44NHnPO
 zIdvyj7rJ5cJApF+o+W68yKPN2cfePU=
X-Google-Smtp-Source: APXvYqwGMFL+2bJhWMoeLMIUPikC9EIj+4FMNu3+vEguV2Ru2oTeOyZJqNVCOTuD3VLHeGb+B2sKMg==
X-Received: by 2002:a63:dc50:: with SMTP id f16mr32511540pgj.447.1562092811827; 
 Tue, 02 Jul 2019 11:40:11 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 e10sm15065327pfi.173.2019.07.02.11.40.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 02 Jul 2019 11:40:11 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v7 1/4] mtd: spi-nor: add support for is25wp256
Date: Wed,  3 Jul 2019 00:09:02 +0530
Message-Id: <1562092745-11541-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
References: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_114015_440827_79D07577 
X-CRM114-Status: GOOD (  12.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update spi_nor_id table for is25wp256 (32MB) device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Set method to enable quad mode for ISSI device in flash parameters
table.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 9 ++++++++-
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e3a28c0..971f0f3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1857,7 +1857,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
@@ -3687,6 +3690,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		default:
 			/* Kept only for backward compatibility purpose. */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b..b0e42b3 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -21,6 +21,7 @@
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
+#define SNOR_MFR_ISSI		0x9d		/* ISSI */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
 #define SNOR_MFR_SPANSION	CFI_MFR_AMD
 #define SNOR_MFR_SST		CFI_MFR_SST
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
