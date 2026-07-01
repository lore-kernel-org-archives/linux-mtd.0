Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E493BC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oo+fysxwVp2CYMotiCxgtt7J9gBMtcXx5sPeemUPe6Q=; b=XSuM6HCcV1ICGJ
	tP7SRow/Ey1WyZY5JzNJzT9rJZZM4yrfXnv3bWIl1cCfS+9dbX2WCMvjg9X0AUBRP63m71G6CG9ws
	JWld9qJ+NTrtx/jjkb3BXERIiXnAcWLx4remVx2s5qYx4ZDlRjVM3/KbKgYYlAUnoevXI4DD50zlo
	SmJTDElrvawdxGaUMMNry+BXYGtXQ7qjdq80fENRgb/JStnHDy3Te/+StLe2xoZh3EEHEzYw4aWOK
	wUSxKhocvfgzAgEA+20wxDjCgvpJApeSvCuSOie8XdnP2Aosp/le2uY4Rm7jJ835s5WjSaWnidQ6+
	B2msOw6NZl5TnLBsMgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekrm-00000000XDA-2NHf;
	Wed, 01 Jul 2026 02:39:58 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekrk-00000000XCW-2v4q
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 02:39:58 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9a20f70263so35187a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 19:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782873596; x=1783478396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzkYV94Uqg4TuiFvMHYE6jMkVnd53YqhWYM0y0VZBIA=;
        b=Jk/F9XGvtqrglubkXreTQTLT4E7YAIrWdgT0W2dS1cWbH0YhbzGbxXcL1lUBLsjPjR
         vW74+VEtUNo5+dc2RXxyK8e5H0nzd+yo9QjRH+zmGtthypaSCXlOfVOntLDzuUrfNCp7
         Qy79TsOju/KOyFvCcUwpNB5V3Pwt0SfPpLUtDBfvW1vWvkmTVMA4eAAEQFMCcni4pslT
         U4uQrfYnjp6inv/z4T4ImznCDMxgtTbjGrN687IygeEApizUfnTL3FW76+VzG4oHtwTi
         PmNyCYgcmwoKF4RejS21Rv8GIbKaWsyti9VH4ip4gznkeJGRR25y++r50sxrc84gABQr
         Lk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782873596; x=1783478396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzkYV94Uqg4TuiFvMHYE6jMkVnd53YqhWYM0y0VZBIA=;
        b=nQMqH0/KbdOrvsqzt9MtxmPH9LF9rQ22BADtvmbnretIQKVrwupq+FkGh/M+jt3lpz
         lRxqQAcFLqZDaOO3qLQXQJksBumtvRk8LEnyFV985/jHoQNdyINvxjIFDPCHLmlApllj
         g52Xh1k37TIyGusCgn49D0BC79fWGmklsQEcLsvtvT4Let9cPWkIY3xVwHo54/YE/EMD
         3byNRsRclT3Tig9lngRk0L9A7TjNYp/uNB6I7KYgSHG0MD5kWi7qL6HcgXchm4zYkvGu
         amtLF8A9bSQbCKcU+jwgayKyGN2CKmXIZB8veREllsTluX+ccaKAZC+N3hJT99z7v+Ak
         R1YA==
X-Forwarded-Encrypted: i=1; AFNElJ96FaWRjZF+vQzZmbFZRAhBhEcqS9L7nNilgp204KvXhn2laDHjSV9XwuFkIg17EkAVklr7HvgMjao=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBDHNGUUTDRnbt99TY2owPUDQLy/YPIE6OHUBjMto/s6J6320Y
	G4DG5w+Wg/GVfpJyeLOXSiqjf8SMMZzhE8Gk+3ZTZN8RpXhR+IPvITKp
X-Gm-Gg: AfdE7clI+Ssgqn0ffaez2egUEckC9gI9tPXbYC4yRqyz/jqOCiNc7iG2FjZ0i2s86CQ
	14Dly/l1tpW904CFdEcbL07MhheoR4tIO6s6Ucedo34f7NYL2VlGjeVGs1qKBlaNsZHSSzDlOIj
	5CtaNeWap7QkcfbWX4TEyeDgfmYTYm6+WHp/zZVq3Rqv4w54tzHM+wLJ8udcibxux4BiD9Dzc2j
	NrbXKGvSnn6+Mj94a/oH2NZ7tnEA1+QOlJkKUq/wt3yq47qp4wXGMaVP1yox6Hnk8yGqKOb9MH9
	qaIE12tQ9jL2uIJ6Iyy3LLhwCFUA04AmvpBNq0p0KQJzSd17miQubknjhTv7wwOZyunowFvfVUc
	2xWUYd0HggFOEfABjGH6ZWu/4VzKx4KZnkaqRqFplrH7fs/H4vbDn6OYAD3stReCHTnP8eJ8ha6
	DdcEY3bPT+KdGdc36Icf0V20qVI9j45stOItU=
X-Received: by 2002:aa7:8891:0:b0:847:9301:48e9 with SMTP id d2e1a72fcca58-847a81f41f8mr3385986b3a.15.1782873595657;
        Tue, 30 Jun 2026 19:39:55 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm2988752b3a.33.2026.06.30.19.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:39:55 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7110E416A065;
	Wed,  1 Jul 2026 10:39:53 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: stable@vger.kernel.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 6.6.y] mtd: spi-nor: macronix: add support for mx66{l2, u1}g45g
Date: Wed,  1 Jul 2026 10:36:19 +0800
Message-Id: <20260701023619.2730136-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701023619.2730136-1-linchengming884@gmail.com>
References: <20260701023619.2730136-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_193956_899084_7846EA1A 
X-CRM114-Status: GOOD (  11.20  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit 797bbaa7531f75985b199e484451fa3f954382b3 upstream.

Due to incorrect values in the 4-BAIT table for these two flash IDs,
it is necessary to add these two flash IDs with fixups.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Link: https://lore.kernel.org/r/20250211063028.382169-3-linchengming884@gmail.com
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b676a71822a3..b3ba7ad94711 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -116,10 +116,16 @@ static const struct flash_info macronix_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &macronix_qpp4b_fixups },
+	/* MX66U1G45G */
+	{ INFO(0xc2253b, 0, 0, 0)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ)
 		.fixups = &macronix_qpp4b_fixups },
+	/* MX66L2G45G */
+	{ INFO(0xc2201c, 0, 0, 0)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
