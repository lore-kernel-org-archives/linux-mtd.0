Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC92BC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 04:49:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86CAE2086C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 04:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hiwC71Mz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl3XAJBY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86CAE2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QsmXYXC1rKp6IXNqqW4ZQ7LYQSMwjQSsJTgGj1bxnj8=; b=hiwC71MzRoPY/a
	etz9u8ah6WDEt2fMAtwv2rUJ0ZPMH1+hPpDSz3tDhVRKsdYK9VIOeanPqg65KU/+Cv34WU3DfL3kB
	KWK+9CxBBP9TboTi2EOzSvbTzwca80WEzPqEfOyf9lBRN1RZI6XG5uVPl0unEP66Zj17uecHAl6FR
	Ox/fDtmjI1p3sZEn08NwmJtJnH209i5K4G+ObarlRyARnQoncbZwLvmclCQDngha8AC3zYRw7onZE
	Mw8FCnLxKP/zHVz9Uvlvq0AX1WlpUbJpppyxLfUkZ99IeQ50nAELl6eftfFRp/j9FXJJd72NHn1A4
	kCmGb8gT1QJk+knNQHYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAotN-0003rZ-Ta; Mon, 01 Apr 2019 04:49:53 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAotK-0003qd-Qv
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 04:49:52 +0000
Received: by mail-pg1-x544.google.com with SMTP id u9so4090016pgo.7
 for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2019 21:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rk3Ae2iwNpo3lJh94VQoOUfBl1sapgxDeR3iigr8IFI=;
 b=kl3XAJBYCjf0iJDQydJiH/wnpxYJYmf/4h+qPjqt+Vf1xBRsvLKwRqRbHQYtU7uBoi
 YBRuR8VkBo7/HDqGrY9lBqR4+iPGFdm9ul1t2Y3r8u0hNaLSfrpNxXG7+cz3++q8n7z+
 jmFB5hC7H58SFPm8WkkBiv8yb+NyfJUP1R5zx/0dvpPgXNxziIXng+QX38MrN/+7XoIx
 6aHxd9JrYuOZpP3QW5On7FhFk7h40Payo6D65ZlIG92r70KagvAP6gMaWcJK28d9YS8j
 51WzBmtnc9IptlxbCj2DJYjQ6Qxop5E0+4o0/X3quFqFF1QG1roYosDaET9b7ka/eoe3
 rArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rk3Ae2iwNpo3lJh94VQoOUfBl1sapgxDeR3iigr8IFI=;
 b=MB89Y0JfBIf9DwitV2CIxC6kHOeWDaLyR1yOIpNQcrZkRZbz44iqaTy24n5zGmxRLb
 0gh1H4kbr5Y4ZKV8FRS7FTsF/yUO38Lka8vI8S+dYUSFnpsoGPjzeIT3MIp8VyfuT2ji
 PIK13Hq5SEeAvZxL+h2Jr2GuAaCc2xlIBpo39gq3apOcAkNb3IHUk/K75Bf6HbQha64C
 spqz8ZzlVgYchQW3XdM7hmjRKqUNmxoSr/5+K8mP1yMGadBw0W7nEqfR+mPW5bfPNuka
 99Y3j3llsCotBRw6RHaPUQCAl97xDluWcNmm4oAqkWwbW7we+PaPpivFCKXFgCW7B9xk
 9oZA==
X-Gm-Message-State: APjAAAXnC3TAVercMhf44b4pxIKxYBVXM4nybCBXNPORwbEnhRFvrfOr
 CJfF1TL6Qammzu9/qXtNrTaUUAe3
X-Google-Smtp-Source: APXvYqwCxcLKi1hn7lh62EKf97H9X5HzM++8mfnXaBl/H7zDkjPcSUaGSLhaO75HisOxb7/zG5H9PA==
X-Received: by 2002:a65:6148:: with SMTP id o8mr17857564pgv.153.1554094189465; 
 Sun, 31 Mar 2019 21:49:49 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id i31sm16256097pgi.36.2019.03.31.21.49.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 31 Mar 2019 21:49:48 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: devices: m25p80: Simplify m25p80_read()
Date: Sun, 31 Mar 2019 21:49:36 -0700
Message-Id: <20190401044938.31237-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_214950_898824_C0953E42 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Spi_nor_read() already has an appropriate loop around .read() callback
to handle the case when not all of the data requested was written in a
signle ->read() call. Drop extra code doing the same thing in
m25p80_read().

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/devices/m25p80.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 651bab6d4e31..114f8ccea85b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -125,7 +125,6 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
 				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
 				   SPI_MEM_OP_DATA_IN(len, buf, 1));
-	size_t remaining = len;
 	int ret;
 
 	/* get transfer protocols. */
@@ -137,22 +136,15 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	/* convert the dummy cycles to the number of bytes */
 	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
 
-	while (remaining) {
-		op.data.nbytes = remaining < UINT_MAX ? remaining : UINT_MAX;
-		ret = spi_mem_adjust_op_size(flash->spimem, &op);
-		if (ret)
-			return ret;
-
-		ret = spi_mem_exec_op(flash->spimem, &op);
-		if (ret)
-			return ret;
+	ret = spi_mem_adjust_op_size(flash->spimem, &op);
+	if (ret)
+		return ret;
 
-		op.addr.val += op.data.nbytes;
-		remaining -= op.data.nbytes;
-		op.data.buf.in += op.data.nbytes;
-	}
+	ret = spi_mem_exec_op(flash->spimem, &op);
+	if (ret)
+		return ret;
 
-	return len;
+	return op.data.nbytes;
 }
 
 /*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
