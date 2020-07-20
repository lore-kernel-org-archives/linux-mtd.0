Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F988C433F4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:38:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D1C022CBE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y++7Ec3R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="z6Jxw5Yt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D1C022CBE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB8e7RlZFgBuAyv6h6/xx3S8kx1aKOxL4FfLNfc7T1w=; b=Y++7Ec3RLYtkQtzHd6NGA4WMqY
	gSA3/kJ/+R3Yt9huNCcHELiZwx6SyN8r9zoFpa3YCK6OIjyAQ3VT0c//Utwcb9tn8l4it446YqaMN
	Wbza6uIrrwdITmWePnSvd1fCh2F/x/gNcV+QyrauhXlvWbonkAsEhytyGibIdInZTrKO7izVvLGGj
	GMVJbEa/BnauUUV/WVRnY0FScG70v15dpVxHG7vTUNvjraSXkfISiU/w01iWfBVgNPKV/JALmPzzE
	rnjPNOExxjDjzSBlvkk4/mSk6ERs1ybbbt1GK3e7rn6AKW8DRwN1ikNiD48J2Om1BD9dcqR4exyh7
	6L37I9tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYn3-00051J-02; Mon, 20 Jul 2020 16:37:21 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYmz-0004zy-Q0
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 16:37:18 +0000
Received: by mail-pj1-x1042.google.com with SMTP id o22so77480pjw.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KCI3+RDetWEx+s/cPhHvvqI88PUTdljEQSGALBxHz6E=;
 b=z6Jxw5YtnMzutZA5yWF8StehyY2jilAE3aM6P5/hRK8rvvioZ7+wahuDy7DVkyfUO/
 wordk5LmtuEwK81BHoEu4n36ghhc4O6Q6nOx9Xm8x4MMg7W1UL52egDMXwXASWXW6l8I
 4T4ZjELUJJhPGznseTg6wgyechZsgX01Bn0GwVqHGIm95nHxa00ajeMoBa8v3FBgpAuU
 t/qXRnssC228WOeWjhgyyaStYywtJy/ZLO08yHKSICeVhdCpxkCj4lLcahRpDx6cSZuq
 BWOru3A5utKdlThAl/S0poMYSVLKhsFga9au8IQnRuqS1EVIu9z9CTp4DMMiTuLoZnWt
 g0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KCI3+RDetWEx+s/cPhHvvqI88PUTdljEQSGALBxHz6E=;
 b=SJfbzRzAQZGkdoQQjQQGxinjfEBH4/0t0HXnmTjOOAkCXCVFPwnh3iH4fohz/gosvo
 yCnrVKjRzsm2PQABMbjLHkPmbzdQ/ZgcfNhuk0LHKnMJWzwV/LnJZ8IeCX+7tjYWNeep
 GL8SoOjH6E72G5e/8klvmlZqgcdIuHG9iCNUxZIlwbA7wN7mK0FCxhh7jLqBMCBG49Uf
 jbKVfPvEB93CWgSvQCyXiOGftnG5fPZISyUlqzx5krn9gl9orGCFvsi0QvxVao1+Q02Y
 x6MlzqOnIVz6/xGN911uzChxhAbWHWCf/ylbaFnHo6qDKjNaJOgNH0Gpbgzj/iSHwPfN
 Y84g==
X-Gm-Message-State: AOAM530ecdmmhD1WBXeFhfPLXP/3q0Zb05WNNZ4UDy04rOjdsWe2wt4M
 p/WkskEhyyYNRoYeSCHBPALnz7fhGTg=
X-Google-Smtp-Source: ABdhPJxWTYGZl2YwC8y0DmVl3GvM/GalVHlhslDnjDpB7TnblmE7Sxa+oxzdJeTVdnJNvSwf5qFlCA==
X-Received: by 2002:a17:90b:1b4e:: with SMTP id
 nv14mr295792pjb.30.1595263035993; 
 Mon, 20 Jul 2020 09:37:15 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
 by smtp.gmail.com with ESMTPSA id z25sm17342472pfg.140.2020.07.20.09.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 09:37:15 -0700 (PDT)
From: David Clear <dac2@pensando.io>
To: tudor.ambarus@microchip.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
Date: Mon, 20 Jul 2020 09:36:56 -0700
Message-Id: <20200720163656.38006-3-dac2@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720163656.38006-1-dac2@pensando.io>
References: <20200720163656.38006-1-dac2@pensando.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_123717_904432_A720F84B 
X-CRM114-Status: GOOD (  13.13  )
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

The Micron mt25qu02g supports both x2 and x4 transactions.  Add the
SPI_NOR_DUAL_READ to its spi_nor_ids[] table entry.

Tested on Pensando SoC hardware with a cadence quadspi controller
via drivers/spi/spi-cadence-quadspi.c, in x2 mode at 50MHz.
  - random data write, erase, read   - verified erase operations
  - random data write, read/compare  - verified write/read operations

Signed-off-by: David Clear <dac2@pensando.io>
Acked-by: Shannon Nelson <snelson@pensando.io>
---
 drivers/mtd/spi-nor/micron-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3dca5b9af3b6..ef3695080710 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -71,8 +71,8 @@ static const struct flash_info st_parts[] = {
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      NO_CHIP_ERASE) },
+			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
 	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
