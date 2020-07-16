Return-Path: <SRS0=qv8i=A3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F5FC433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 21:18:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C42F20809
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 21:18:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqnEe5Ud";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="X+i4IyDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C42F20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsU5iczr9NhUwIJz2YVCePuikTm265HpcJ0so0bhSCg=; b=JqnEe5UdFnFzn6GqWVIJqRaCan
	ZG9Ij0rHfOOv46P6JWMU81vI4JPHBNh5L+4JxCIQaj+2RGSN30wcr5trgbUYrNatUcIDkYfBqb0QH
	tCbAg19jDx8RuZnBcwqBhuEBXm9yQiEl22kMJ1lnWdeGAIrjLlLfTO0X7XzD4fTrgP78eBUig25kL
	wyhx41iIKFGVn5TOVlN4h/C2FIEaG79cmMM/S38iGp2q3DraWwqskMODqiGScsWiqjZwLuCNq0EWG
	0en6Hxlg9wfiuuwTrqaBad4NHuC5VCQJlHWHKAOK71V9tfMtJ4Cs3b3+Xcon/CBP9rE6o2Hw+74gs
	RiJLmw6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwBG2-0005U8-DO; Thu, 16 Jul 2020 21:17:34 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwBG0-0005T6-8I
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2020 21:17:32 +0000
Received: by mail-pg1-x543.google.com with SMTP id s189so5477390pgc.13
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2020 14:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WG/vYciFbAKgrKbC8vAY2F6b1DTE1d2PjPwpYrPkCzM=;
 b=X+i4IyDf+EyJHgZJYvDa9ry6HY9b3ZTSlBWevnjyUSJWiT+JCBeiB5vy7Y83xD7ir7
 YOy3e41DImnw7Z9Lg8NDfnJTrQyDMq0P1SCaShhalx2YBdvnauWv3b6OY2r/bhQFcSNY
 YPBnh2AbcLN6hKBPuA6vcO2svtCg91kx5TFMUyfIBMcs+UTbaOQ7dbyFy/lRD0Fr67PU
 da88oI9UOBot/rrof+ktvFQ74ZpdlC6FvtT7RDc4yixQjBVbD9g584bEuRWLpg4wE6OR
 XKSYtxVHimPoOsAot6irpOPXe5YIKjoInwlVWuFGy5slqJjuGzKGaQj1TBfJubiGa8Ez
 isRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WG/vYciFbAKgrKbC8vAY2F6b1DTE1d2PjPwpYrPkCzM=;
 b=PrXM2bHZnA4QEFcWqK7avzUAD6H/lKDQgX7jW5WzxYqwLAxf578gSyIj8ERD3nBL30
 GqgBVn0i5Lwd8IiMHe16Yjs80oZeRChHoWHbH+o5ANju0BdDsxb/8Z+Esafij3gay8/O
 Vm6VkCqXkJE+TRQBFr9kJqPzwFvS1M2jbmmxwFVhHdmMp7cclaplDdsTol+K+xfd8ozZ
 ICqb/6P+JP36bEzh8twTEnfNUMYbW3xfPvPm1mpOUybmqLm5XmrC/RRPHoardkIxt7WF
 xUEiSctHuFUaKnma1g5DXoj2R3I9qeQmJHwiCBoDsci6dFw3c9sP1ggw2bqdTpY6Z32p
 2NUw==
X-Gm-Message-State: AOAM530bg8UvG+GZRnFz0I861HaFEGiKYim54V1/GDfVIKhDfgO4Teyf
 llcxj1OWlA+KelC4ZJqbfME7W8stuPU=
X-Google-Smtp-Source: ABdhPJz4ccmpZ4Ku13oIJk1YNh3crBRxrbo18ZwXnPMUcQsUs99vanijjy1t7SAgFb1pcpk0TIbqQQ==
X-Received: by 2002:a63:182:: with SMTP id 124mr5532562pgb.288.1594934249949; 
 Thu, 16 Jul 2020 14:17:29 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
 by smtp.gmail.com with ESMTPSA id s10sm832889pjl.41.2020.07.16.14.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:17:29 -0700 (PDT)
From: David Clear <dac2@pensando.io>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@microchip.com
Subject: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
Date: Thu, 16 Jul 2020 14:16:31 -0700
Message-Id: <20200716211631.38949-3-dac2@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716211631.38949-1-dac2@pensando.io>
References: <20200716211631.38949-1-dac2@pensando.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_171732_348218_6D70E96A 
X-CRM114-Status: GOOD (  11.88  )
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
