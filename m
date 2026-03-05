Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ACEF3092A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+S/lJAk6lk7a89UK7ZgnSNDpx/87g4gdF+ZpOhtXGoo=; b=egVtRyuKXmmg87
	xUYLdMRwUWp18/63wiAtcN5atQ5EfUgnuDJ1Bbc2FpLP6tWOtVpSzDNWXLUin0hxM9cj4j8WfXW/C
	ES46MbCfix5wOTr5UedagqtNGEGcNr1Ia/J/1EYlycYKCq+GvidmnBG16CgRXrcrshBLC4bgvTvKY
	PUVN3emURU9wWRcf4EgJZnbYDODGPb8/5XwiNtAjZTTo63nQVpTlI/hsSzf3txIIlIh2W14LIt85k
	nwdqH+PsDneimY3Z37HFBlVNKFPCfAWQFmrlU7AjS+YVx2aq9tVzoc6yCTlTKxQSAHVPqkEekOwn4
	OrSEhxSt78niXKIbG/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X5-00000001UPW-0eV6;
	Thu, 05 Mar 2026 10:02:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X3-00000001UM5-0zPl
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1fl+dYL251xXhtusEZ7b8g0kjCughX2VCuIW1qgsL2Q=; b=GDwYhJ6oZttyTQXl2OsYBgFbam
	sJnh4IVFqcB99ohmnnW1m1Y5GzsAKgBZGtJk4qXK2RxJaSFDg+ebZXIT4oBucaGBCcpCjb6MIgxSe
	JD6bm3ql5VgWK2eY2u9IiuHs1fZydSY0xh8ShCTYM2WFQ51QsEgz3z5MRZhIt7p/9QQmY4RCrK7Dl
	Fr+wPvTcx8MG72ubxbFBmg0LPtNfDuesFwFWm3Nyz86725jwtYheSMvYR6TrbgWsRhjSFsbxI9Lwr
	AlO547TgpMO8QRxhlML4GVCWCc69NAw+T+N4x5zB0WvPyOp0A+Q9fDKuaqZ1SmuQwme8u94ZCdYBT
	JWiVBUIA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X0-0000000EnTV-1qAh
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC80D4E4256C;
	Thu,  5 Mar 2026 10:02:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 821595FDEB;
	Thu,  5 Mar 2026 10:02:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C67410369782;
	Thu,  5 Mar 2026 11:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704924; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1fl+dYL251xXhtusEZ7b8g0kjCughX2VCuIW1qgsL2Q=;
	b=Zghiv2yoEfOauiKl+7OTiaMkunISYRUhHzMXxmuaIzAGpGxApG7CiDMXvPQ5zHnHZ0rom4
	8eqbL/QkYOOvaoUtnF4N1Fr/sJHS7nKFaIUVvfCqfOD1dbOigohz9hABMKrYbU9L3kvL0k
	Id31ptliJ7YLUKThNetmyQxFWFGz+BL5geqUHPrFgRlOwQFeyROwr1gpFXdFPuP7pwqhxI
	/d0e9cEYiVySQzWnyNhiyM4mJEx1PDdZnGbmufZ7N9psPVpm3oRqegxMRXb/YoxxrRsWrt
	88TMVNqFuWcgnU5/x+8nZ0UUMzwGTWotg9Q3SVvDHhviKRZTcqs6NMExh1Mjpg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 1/6] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
Date: Thu,  5 Mar 2026 11:01:32 +0100
Message-ID: <20260305100137.2558423-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305100137.2558423-1-richard.genoud@bootlin.com>
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100210_510667_A532D6B4 
X-CRM114-Status: GOOD (  13.66  )
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

The available length is really USER_DATA_LEN - 2 instead of just 2 (the
user data length minus the BBM length)
USER_DATA_LEN being 4, that doesn't change anything now, but if
USER_DATA_LEN changes, it will.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e66adfcca7cd..915f1240546f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1755,12 +1755,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
-	 * only have 2 bytes available in the first user data
+	 * only have USER_DATA_SZ - 2 bytes available in the first user data
 	 * section.
 	 */
 	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
 		oobregion->offset = 2;
-		oobregion->length = 2;
+		oobregion->length = USER_DATA_SZ - 2;
 
 		return 0;
 	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
