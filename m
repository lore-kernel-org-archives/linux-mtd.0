Return-Path: <SRS0=qv8i=A3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE34C433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 21:18:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DAD92082F
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 21:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MDi+qG70";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="h0gKdxQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DAD92082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+3w77y0lLAuh6nlnlGWJ/kjRhRgRNzy0clT03DEyRs=; b=MDi+qG70bTu4jaKANm4QAND7Pl
	vUAhOY2NP1So4jJ+xGQWFViE+81QoZY130NwGtLMBML3bXeFhzCiSAPRSwwhQKaP1XNIt3dgv+Ptc
	SuIaMZ5epMJ6cet39BJJs3kluc0kjQ4Xp92neNzXH34u/plTjW8GaktWMfQ2x7f+CF8A5gAmCihy7
	4LL7Qsiiy2DGILs81wT10lbfAImOoNv0B3+wqg9s+iYmuIbsrdTIllK4iWYdf8S7jOKfRvtsT5gXx
	Ml/TLRmzH1KI1d7nQw1UePWrmjNhHdny9RWIdS3j1krT/LGVms0p1/MQ5gB5d7IojlLU3IaoH110t
	8KTCWvkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwBFy-0005Ss-9E; Thu, 16 Jul 2020 21:17:30 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwBFv-0005SB-No
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2020 21:17:28 +0000
Received: by mail-pg1-x541.google.com with SMTP id z5so5495798pgb.6
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2020 14:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UomwBPd1DBKSN3AEE/rPb8Vp5csjv6qXk20G7sgY86Q=;
 b=h0gKdxQJnOPFALRw1G54agvYodLKp/aC+2+kFi5v8TBx9A9x/5scwHcCDJAJamelkl
 GVocIQhGv+cjBIJ6CseeG+F4ie2hcyyZfaGt7RpYLCMsSUmiQjVcvvlM2JluBmdtyQ+/
 +RKTzdFcfflQkqznIC876EEb/S2pxgfVYWZCz1242ckJVO7ukzhC/qxVOnZmgqeZcij7
 gP9SKhKhdfzdVYzWqKk+Ib4XAavT37mCqpmvS7DrQn0d7mLHTdIeomSuqLQCGuQzZyZM
 v95+5y8s7bcKfmcb/MZ88XowWuPUl0nRjGHg8b87r2CbfgdkpKyP3cJwbSrKUzg9auXp
 3fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UomwBPd1DBKSN3AEE/rPb8Vp5csjv6qXk20G7sgY86Q=;
 b=J9X4X3WBBwbJ6EVkAvZZ8waDjscSJ2+hxBlSR98B7Z0G7uyGyvk0n1Dnkz5ytrzW0H
 uybUxOVgQ23Pt2x/CzY/9qyV+VHcD+EhpBuT/sqCwLXyGBNAflWEMtz+cz0TI+/DUWm/
 oO/UR2ZQnr836pHlWmEdIZxPcUEkGeyAgzjP4PgVhiJ0/kRc0fcA2bi3n9aQQNuCpKh7
 f6DgZR/InV0YDpMWLwbO3h2a5lYrBCPToTaFXSQs98KlxwLdt6lvH6fmDdTcx9pnc/5E
 CKFibhJSfIVLY3GjDsq7gMcJuOoXW/ARuAtlkdO/Uc2ShHaUKb6RsnrojgjLLqtGB44S
 CQbw==
X-Gm-Message-State: AOAM533/Jh6WlXBU4kDdDdU6GK7wLvaWjBqrzD7ODPxfve/TsKruxjje
 fW2iv5oDSe/GsGzYAitn0e/ROZyAso8=
X-Google-Smtp-Source: ABdhPJxZzLxrTppee6HUPQrq78FFdG8mQCx/6kUbTY7P3mBQRzm4wnctOd4fOll3NNyN6QV1nuY5cg==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id
 w14mr5407420pfu.121.1594934245452; 
 Thu, 16 Jul 2020 14:17:25 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
 by smtp.gmail.com with ESMTPSA id s10sm832889pjl.41.2020.07.16.14.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:17:24 -0700 (PDT)
From: David Clear <dac2@pensando.io>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@microchip.com
Subject: [PATCH 1/2] mtd: spi-nor: Add support for Macronix mx66u2g45g.
Date: Thu, 16 Jul 2020 14:16:30 -0700
Message-Id: <20200716211631.38949-2-dac2@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716211631.38949-1-dac2@pensando.io>
References: <20200716211631.38949-1-dac2@pensando.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_171727_787766_7A9A81D8 
X-CRM114-Status: GOOD (  11.46  )
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

The Macronix mx66u2g45g is a 1.8V, 2Gbit (256MB) device which
supports x1, x2, or x4 operation.

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
