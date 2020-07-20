Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81647C433F2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3F622D02
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6tM1GDS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="SGZxtn7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3F622D02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngX8346kgwIsRawOVEcfWxKXLCk+n7BkJuLXVoqVQXg=; b=d6tM1GDSMXnBjCaB4PKVKrIt85
	t9eFPerqlhDvFItHR3sLrHHXsgxzCmYzxuKMxYBtK/dkgNFoyWJxs9NeZL47DOlOdrN4QkAWtQb7H
	aTDImZq1CJO5Z2uCQT0bOFazYHTlTT+gDvbMqsYtqBADp6zx0F6Oy0I2/wYORSdmAHEVWZbAgzOD/
	nk7xllWIzh+Ru01TNo5aQU/CUMjnLm2k2aK14+bsqhc0f2cgk1Nr9ITVIy3FEqdzNJCKWt2tB2/kK
	ZsfJw7lGNn7dzxsgWV51zmjypYSnem3T2nOt6qChJeJjRC2gDrsNf6OJlJBkMynnGKOtf8sALFAoj
	OHnuRelA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYn4-00051V-BZ; Mon, 20 Jul 2020 16:37:22 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYmz-0004zx-Ro
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 16:37:18 +0000
Received: by mail-pf1-x443.google.com with SMTP id u185so9305839pfu.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t/wsqitDH/IKupF1Pg0APNb3W7481blDQ8OyAChCDMc=;
 b=SGZxtn7d1Wn3Q/KK9UcWDgL9grg7/deGrmwwOJICQUBsg+r8gFYsf3AmL0LUfOX+o/
 IyLcnERkBS7S8ykTRdGz79fJH7loqEjNY9N2u3CmaO6ofAIYqOsyl5SwSYuqJ5OIRIVA
 VNX0ohzkHpKm5VEPDoh5301goyvcknT3RcvWBnhNXZ9lQD+r7+YgvDYMU/26OLzJesLy
 GIG3+/gOaj+HU+RatiGrX0pRfp0ODf47TeRWOSCR5SUb71qypjNmsDAOsHP8hkjJB8m5
 8zwbMGtIrAeDZrtITDQS0Xgl8uu5oFE1pNK5AeolzIyb2uzQ4iFpzvW2aBnedpvwRxQ/
 /Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t/wsqitDH/IKupF1Pg0APNb3W7481blDQ8OyAChCDMc=;
 b=ew09fR0zCLNg78A//zkbNr6Y10m42dfdUzG7o0ZZhIuXY9+2VwSX1HxcwLCfP1qn3A
 Vbtc4smW9NWka9VCLpKpe2o0Tm1L2ddF+NURtorN+9cgXeuNKPm0nc8zHhTJOw0y7Do4
 Ea5F6enDnC0q+ny26n5zWmNR6QFsITXYXRedIRc4cnOYlnNMeVBlF4mLG5GijNm8GJpv
 9P8j0KpRj/QCxcy/HQrQNaAYOr2V/C5Zuj6ekLXjoRT+5br294fldkGd6WmqxSZJwNeB
 sehKv23iaR+ROBRUr7BfX4nU1suicIuvjAFtoMRapysEawrgOJnCGaibsGCj6hfJvAlK
 Urzg==
X-Gm-Message-State: AOAM53105OEVHve3M9w2e1QXebVggR5zi8WhOAh9hMA3AKCmlU3XRJZS
 JQkO4cLBX6ViMSYcSQCfJox7AA==
X-Google-Smtp-Source: ABdhPJy2xKpoASkAe/PXF/9R7MXJhnt6H/ngvFvfOid68NDWkPY4LWa0DLfrUVjRCRpP7DtPJBDT3Q==
X-Received: by 2002:a63:d44e:: with SMTP id i14mr19546620pgj.280.1595263034947; 
 Mon, 20 Jul 2020 09:37:14 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
 by smtp.gmail.com with ESMTPSA id z25sm17342472pfg.140.2020.07.20.09.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 09:37:14 -0700 (PDT)
From: David Clear <dac2@pensando.io>
To: tudor.ambarus@microchip.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: spi-nor: Add support for Macronix mx66u2g45g.
Date: Mon, 20 Jul 2020 09:36:55 -0700
Message-Id: <20200720163656.38006-2-dac2@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720163656.38006-1-dac2@pensando.io>
References: <20200720163656.38006-1-dac2@pensando.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_123717_949534_D441AA39 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: snelson@pensando.io, David Clear <dac2@pensando.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Macronix mx66u2g45g is a 1.8V, 2Gbit (256MB) device that
supports x1, x2, or x4 operation.

Tested on Pensando SoC hardware with a cadence quadspi controller
via drivers/spi/spi-cadence-quadspi.c, in x2 mode at 50MHz.
  - random data write, erase, read   - verified erase operations
  - random data write, read/compare  - verified write/read operations

Signed-off-by: David Clear <dac2@pensando.io>
Acked-by: Shannon Nelson <snelson@pensando.io>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 0ae0815a3633..f97f3d127575 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -87,6 +87,9 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
 			      SPI_NOR_QUAD_READ) },
+	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
+			      SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
