Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C7BC4743C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A78176102A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A78176102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9vAJ4SaDAPO0E9plBhBlT/Uz2AyJV28AVNKg+UFpLY=; b=2RhPN0huc6d7pM
	5EMmFLjzLUwErr194i4/ocwdTL+5gPMm9iMXQnonkjOO0kAXQ1Z2FB/SHV4zu21UfBy3GIUOnrE1N
	oiVYwKmWTwDdTUVkf37Dzq/DoOjTnw24S2qkGOpZpjdgH5YSucMKJ4EwTJm/hwzZTG1JlAmz9yXZ6
	BUQj8uGHpD04JNBruqERIYLguDHMBhi23CtzKsuO6gQhSMwzwfuOcVwq/qYjiu9DSt8Xal1l9kR7q
	1X4xu1O+Phtz1p57pLKjiEirBqGzYoG1yLNR99gtr2s8M1b4o0PMcx+Ibp2czT8HsVbJnGMtaXGPU
	m2dp962leZIaa3mfgBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLmS-003u5m-MT; Mon, 21 Jun 2021 15:24:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLlw-003txf-3V
 for linux-mtd@lists.infradead.org; Mon, 21 Jun 2021 15:23:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id g20so29528030ejt.0
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jun 2021 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9oYLvuc0V/S18yIQqWdLV5JLc1q9E1OswQM3F6JOKZ0=;
 b=UqsNIBwvMkUjmMMyqiqLP/LM0W9He4hmM1FkQIFZ8BOoTeCguIay3GYpQmu+q9Q7Ri
 AUhZPBuul3kzzu/h69CbfV2YeeDl2gMvUbRI2cLn2Oir4/MduckfZUXcPNRgjltG6D51
 oULuTXtFlLr+JsLvRsFVnSHq/FTcMbdTYKnDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9oYLvuc0V/S18yIQqWdLV5JLc1q9E1OswQM3F6JOKZ0=;
 b=C1MDe3+yRk8GOjfv1QQHTShU+rkRkUlcHnwYkP125ligoFM/kNnbCw8Vxi7qpL8ctG
 ds4ByS6iiDuuIZBORBXN5Dnf3D0/FkMorD+Iw+E1e/QNnT/mJTTNqf9vAXmDll5nbEPb
 CVjArg7JeRhNxNDr83+HE2xJDhEviOVZ4CoZdUaQWoYrFQ4kfT9He4yw6ikMOL1wXJx3
 bQ0xLibVdU5LAu6ONzMh3n3th863NMR0zqFjZE75YqvZeZXnum+IUzEjOlmMKoMe/BBb
 EszuERA47AZOg0FTK9K46HcxVYQXOCfw3lpv5+l4nvzE1bIdpFYzEi8iqU7H0Fgfk/hY
 wx5w==
X-Gm-Message-State: AOAM531Lq2jsjnUH4WkeLsZWXgALNtcHmK4RXe09Ta7waiGNGnb7IJQe
 hOXmJ5Rb9WlQu4MSS66Ca5slFvc7aA+vbA==
X-Google-Smtp-Source: ABdhPJxxBfJTPLWxmXhGqokZJ1ETiQC3lDNJcxZUnyLmDD1MBtbba0rW5okm+/gZm1m5FXjEOJZz3A==
X-Received: by 2002:a17:906:914a:: with SMTP id
 y10mr9073079ejw.235.1624289014431; 
 Mon, 21 Jun 2021 08:23:34 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id q20sm5021079ejb.71.2021.06.21.08.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:23:34 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-mtd@lists.infradead.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 3/3] mtd: spi-nor: macronix: add entry for mx25l3233f
Date: Mon, 21 Jun 2021 17:23:20 +0200
Message-Id: <20210621152320.3811194-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_082336_163195_8CE8AC93 
X-CRM114-Status: GOOD (  11.27  )
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

This has the same JEDEC id as mx25l3205d, so people will have to
provide a correct compatible string in DT in order to distinguish
this from the mx25l3205d. It cannot be done at run-time by parsing
SFDP tables because mx25l3205d does not support SFDP.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 42c2cf31702e..8afbdb7c21b4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -40,6 +40,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "mx25l3233f",  INFO(0xc22016, 0, 64 * 1024,  64,
+			      SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ ) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
