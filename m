Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88B1C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 06:07:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CDFA20809
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 06:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h8zKTN8A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mybmCirx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CDFA20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1qnXP0EhsTzi8Au7ycP54WfR7oEKRGZb4g5G/u4p1+Q=; b=h8zKTN8AiGk2kee2/1O2FzF4B2
	o4Ycdr/6lQ/YiBJJTsQHHpyTVD4HIx2vmITnrmSAaCG5N7Jm/peq1JmovkxjaxZ5l/MzFWKM5IDee
	zt1lKsjXZD9if28p7uVUGlo0zpvF1tvuLp3OU2lMHIUOVcJWdNJWlfdGzTktDyiXXdbVh0HAYS57T
	kCcoi5u3ftZCkdligftR8yn8/b0kWYky5xL+saXnUFATVpLdJZv3KpbgYixv8pU+fuIG4uEC2nWBB
	ry3fOmDWu/VcE6FQPHkdSg/D4CSSWkODAAltOEBhX3wB3XLkQxtoHhG5cP8iAIZ9dxaKODFApwMC+
	r6WTJs8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMmJ9-00007W-QA; Mon, 28 Sep 2020 06:06:43 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMmJ6-00006v-VZ
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 06:06:41 +0000
Received: by mail-pf1-x443.google.com with SMTP id l126so8390758pfd.5
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2020 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHJjusODSL5KLL1weep7z/YaDVJ91HtbgB4OW9jv2/8=;
 b=mybmCirxvUPgvcZsFPVfJz+tQvfkoNdnBxQ5MPul8JfkV1UE4PLmHWTXBppoYyCyv/
 nP4x2flAM9/D33leQdjy9lT8hwBJEnfuyh6yaTPYANO1T7imIgKSKVl0saQet3/TcJiF
 e2nJotE7q8UgFbCpBB6iDcnYB97xj0c/hniZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHJjusODSL5KLL1weep7z/YaDVJ91HtbgB4OW9jv2/8=;
 b=mwCY+ji9J4LFNQzxF7yPhjAi5Vh1Ep9oiUnFJ3fGDNPrJrwSKf3gsdfMDM3gzv+NfR
 kiLhcUW7S3EI4wI5rMYe+ZWNF6NdOBWYO59JHtt3+1jxzntbx0FKgNZwvMWwaaieOAwn
 /6xqdgGL0/PJzu6rPfdP+oIBmHWnNj82/DpJPBs4uhKSpX8Imhyr0BLnwOoM25oc7Ca+
 8Dh3SQjyMsqZxjz98kqmqsD9/ZY3LGcfsxRdqaSWnJzjFGKm6ZY5wNzAfdMQybjPhaW+
 tpaLJHTtxpWj8TpkbErRfDUpFWEQ39jdUcvL/2FNAxfWfI2K3bYGRKxc3ZgRF8MM7SKd
 urlQ==
X-Gm-Message-State: AOAM531W8wjs9ZlSm9qPud9ppzSzs64XL1pJVuJVX/E11o1AkxGzQtUC
 fCw25l1hD0LkBBqXnzLgoE76NRV9ltBDHM4u
X-Google-Smtp-Source: ABdhPJys0fcAQCikN4bA7YkLZiDDMVxPgjOg08J6Xzpi8IGQ3V0rpHGTaHALqVKPRNBBeyN7puEbnQ==
X-Received: by 2002:a63:524a:: with SMTP id s10mr75810pgl.40.1601273196923;
 Sun, 27 Sep 2020 23:06:36 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id ml20sm5754895pjb.20.2020.09.27.23.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:06:36 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH v4] mtd: spi-nor: winbond: Add support for w25q64jwm
Date: Mon, 28 Sep 2020 14:06:31 +0800
Message-Id: <20200928060631.2090541-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_020641_053509_EB10A803 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 ST Lin <stlin2@winbond.com>, Xingyu Wu <wuxy@bitland.corp-partner.google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ikjoon Jang <ikjn@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support Winbond w25q{64,128,256}jwm which are identical to existing
w25q32jwm except for their sizes.

This was tested with w25q64jwm, basic erase/write/readback and
lock/unlock both lower/upper blocks were okay.

Signed-off-by: ikjn@chromium.org <ikjn@chromium.org>
Signed-off-by: Xingyu Wu <wuxy@bitland.corp-partner.google.com>
Signed-off-by: ST Lin <stlin2@winbond.com>
Tested-by: Nicolas Boichat <drinkcat@chromium.org>

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

Changes in v4:
- drops package type code from name

Changes in v3:
- fix commit message formats

Changes in v2:
- remove duplicated flash ID (w25q32jwm)

 drivers/mtd/spi-nor/winbond.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6dcde15fb1aa..e5dfa786f190 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -63,6 +63,15 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
