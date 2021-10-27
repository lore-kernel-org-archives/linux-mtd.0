Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E388C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08E4B61052
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08E4B61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GN2SnDBQdTeLOS5hF4+Tr0a5Ik6bxmvCtKYj5tgpvI=; b=kys89Dh9XY68co
	dfL5isXF3O8raI9OBUkdSHSKAfmKWzw4MokyfSIa4OvjK7XJe+0JuJrEFWwmnxhULUZ2EBpSmCjz5
	MGt8t/q8vXa2Ys3lIVIy6uYgFnZLA8Pgh1BR/MbHSPGnO1O4goziIt9v2lpK+RyKKe4ZwVZERIGaS
	ifPMtfpggeCOxA5bahFaq+RXnnUvLXc4BQdHwRofpAv913cGGZLjTERQzN5O2eO6iDjQ4pqIHkAmC
	pXNZTYKLiiv+6UwBCoFShywTDOumoWHnsyUDBrZm58Zplu9h88X4SSF+Gu53H+94ONxnKPHouQPCO
	KHqdJqVpTK2aOuDf7eNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfgHF-004Zuq-Lk; Wed, 27 Oct 2021 10:35:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfgG7-004ZYS-13
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 10:34:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so1945856wmd.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kShnARuTRPPZFlSFMm7BHRQXFKxgp6JyYFpoqdwp25M=;
 b=PO9lUskA+t3618cesdXDDaP60c8lid93P7uNqkqhtagUj0L2esD3J0EhRiBrWoMYeR
 77xWx+tnkvC2ASo5nxNkfh1Q8CHd67YgzfaENGE1Y7Ya8CJnh18KzyBgROmqQV+eC0Rm
 glhUTRAuKPBMjY4yWG/+cLtpnvOKo2yRXE8Fqw15/sfRVkpTnQkIh/YEWVswem24zYas
 eklk5OM5QaDW+YT699vv4/tXDF8Q5QT0U4Q1uYeLNbOFnwo0KEgtJJeyGhyWYT+GzW60
 uxsR79H/7zbXgw5TYItuEjXcBb4Dj7VB08n5tqPe9/2VjpGzkIOM8AHiOGQhIdQ31w4b
 W5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kShnARuTRPPZFlSFMm7BHRQXFKxgp6JyYFpoqdwp25M=;
 b=2zUDZgZ9ott4CD4z2OfCxlZ+6FWYJS3RNXoIecsqRPWKMrkojIaWvjJOLRL7ThlfmV
 ApuSTC1HzwRQLSLHo4ZzFd+rqTqnGzZ2BG7rBjuQ6O+a5hi0unoh8Wxnwm2EnszKs1WT
 wuJHeROJb3xx95ScjMyoVXX8G8qbnIvxalcXB0gSsxDl2U/9Tt9qIbK+6abf1PJN6MPS
 5NB7mClORK5RKSiKTQvj/BNP2ktiBmgvc6IZI4twgVTDwS/3essoKVPFBRe1S9Eqk641
 +6QzmuG/tMiX/ih+y+/xgbEorinI58PREY7wqpOmewd1eeergYNpsc5pD9Ic5F6cM6P2
 8/1A==
X-Gm-Message-State: AOAM532loEc/UB1woqrV4OaiBAqK+6JeVDJ32njcJF8GeSDNSG/T6h8U
 Erk2nUdH0kkkcZ2y6Je/7U+EpA0lt6pe3A==
X-Google-Smtp-Source: ABdhPJydBpbQVtRJStGXv54bTK9hMCpVvtAZ+RicKvbIWCFFtJ2igeaj2ZTHmERrN9jbpPREOxPqVw==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr4746048wmi.116.1635330853509; 
 Wed, 27 Oct 2021 03:34:13 -0700 (PDT)
Received: from authentaworks.lxd (ip5f5be9ad.dynamic.kabel-deutschland.de.
 [95.91.233.173])
 by smtp.gmail.com with ESMTPSA id j10sm7140198wrx.94.2021.10.27.03.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 03:34:13 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Subject: [PATCH 4/4] mtd: spi-nor: micron-st: add mt25qu128abb and mt25ql128abb
Date: Wed, 27 Oct 2021 10:33:52 +0000
Message-Id: <20211027103352.8879-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211027103352.8879-1-sshivamurthy@micron.com>
References: <20211027103352.8879-1-sshivamurthy@micron.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_033415_102225_FCC8D3C0 
X-CRM114-Status: GOOD (  10.86  )
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

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Added new Micron SPI NOR flashes to structure flash_info, which supports
advanced protection and security features.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/spi-nor/micron-st.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index b5d82e85fb92..2bebd76b091a 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -158,10 +158,17 @@ static const struct flash_info st_parts[] = {
 			      SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128,
 			      SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "mt25qu128abb", INFO6(0x20bb18, 0x12008c, 64 * 1024,  256,
+				SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+				SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+				SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
+	{ "mt25ql128abb", INFO6(0x20ba18, 0x12008c, 64 * 1024,  256,
+				SECT_4K | USE_FSR | SPI_NOR_HAS_LOCK |
+				SPI_NOR_QUAD_READ) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
