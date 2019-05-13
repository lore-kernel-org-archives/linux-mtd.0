Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB53FC04AB1
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 03:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A33E20862
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 03:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQtqm52A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRT3IpcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A33E20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pfc3mDj9mY0H3DB3fbQgyexO7ZpXvGvP0u6xMt9pQ7w=; b=bQtqm52A1Dwchn
	qB9RmzqK+4BOk7N+0iZ5HupftJzLDEu0s/9lz7dVM15HPWPyx98nhrF9AMAIWaQofOV+xM/6l5khG
	O+ZrKF4Nmbf23B8HMEa5qktebLw6PAzHv4crt2YKAIFetDIgeuqeEubKoeU0wckvkM1RSNwfVRI1z
	jcdKykZjQsD05GQfKAL2OW9JwH8MPLIIlR/H31Hi+zuqOpploVAZ7QxcMnD9FJhkaZ4yw1WdikgPT
	ec5lhvEpoXdlQs4gImcWPj6W2DWB/ozc6Y8CSeLBcpTXHsxjNXuy8Q1g+rM4u6oVhen6U3Hm4N8GF
	/UNavjMcPtESId0zwUMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ1il-00038k-84; Mon, 13 May 2019 03:33:47 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ1ii-00038S-6M
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 03:33:45 +0000
Received: by mail-pf1-x442.google.com with SMTP id u17so6395235pfn.7
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2019 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ssvJqTtxKhAvLQPzQtpUqE8pWc5Fl+uFeyG3o3mGIG4=;
 b=hRT3IpcPm+r4T4Tp/gntF0uo4Co799yVXIYapcJ32vTkYN7nrUdCVlLGOJXKF4nwOy
 z9hUNBFPaCwgWjm2OfTCFA9Xh2KkdlAMmItYq0IJituQcXTbeJEBaqeKg6KGrWqgF8mg
 24tIG+UNvYOv6Ge9Pq4AsvvrhN4llYMZJbNBO23Amb+7Lw0MZoJuRAemsbHy+gM62KDK
 PJiZ3Iy/DlyAxOeMfxyWgjlbt7CM5sdJL/gXOhdIpBvOKRK6UCm8kBaCwEpWU6SMuTSn
 LOplrvoPtTcLuPVaDR7UlOy12GznY3tuYaQkA02iGHkf35ppQ6MQFElSX5NTA5nmIdFi
 Acpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ssvJqTtxKhAvLQPzQtpUqE8pWc5Fl+uFeyG3o3mGIG4=;
 b=UgOkPVZd5j7kF71igoJEhTl5sAwqA2tDxMrKsS6XQaCDUfeKNI8vejpdrj9Px+dWpI
 trpepe1mj0HJ1YcOCe005CEPIIJLpiM9tCY2z4Ytiq/W+/96CqKrqF6NneL21p4va8wN
 0Z8ZvUtxR/PUB2jgln7PlGqhjrjN62BHD+lA9iFijEZGIb0xR+VQsjO1dNIGlBBoHUIg
 fzUTFeVotHGaH6bf3Dw1IgdKcESJr3mg7XNNFy7mmDRKJzH02stC6r2eE3rQ++FON1hI
 8PT3Z9b5n9WoffI19DfjSSJ+A1T1omJ8S7SALq6cEZQlFStEC4ZsABmKOKOgNDbd+LVf
 KpFw==
X-Gm-Message-State: APjAAAU22IBNpCiG893sQiRxXGzgLoxAGKPh91IP9AwZ8uNFYPUVePg0
 5JoGu8oJb3RDcWPFelQzXuW5V8tmFDM=
X-Google-Smtp-Source: APXvYqz0YNkp3r1oW/cR5CLyk4nKsq08dG0CjUW/rr7bPspvFvqYqKgC38adXFG3pYZvhMR60rFrgQ==
X-Received: by 2002:a63:8149:: with SMTP id t70mr28919889pgd.134.1557718422627; 
 Sun, 12 May 2019 20:33:42 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id k6sm10883791pfi.86.2019.05.12.20.33.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 12 May 2019 20:33:41 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Add Micron MT25QL02 support
Date: Sun, 12 May 2019 20:33:26 -0700
Message-Id: <20190513033326.20352-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_203344_260830_9A1CBBC4 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Cory Tusar <cory.tusar@pid1solutions.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add an entry for Micron MT25QL02 which is a 3V variant of already
supported MT25QU02.

Testing was done on a ZII VF610 Dev Board (rev. B).

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Previous verion of the patch: https://lore.kernel.org/patchwork/patch/577372/

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae147452aff..2a644f01254c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1881,6 +1881,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 
 	/* Micron */
 	{
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
