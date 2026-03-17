Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B3BF33803
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+S/lJAk6lk7a89UK7ZgnSNDpx/87g4gdF+ZpOhtXGoo=; b=MK7+LRtARSue4L
	uoCEoxQj+3rsH3WjOhCCmJ1yuUHrnrO5q+0VR2YGdHJaIxBhK+YRSCg6vc1s+93pyU920O2/Zf479
	5WMZ7EMBPc0YKh2th65QANg4fzGqDD2pnRtcynp5j+Hh2Ahsf1uVp15IJwmLF4ACPewj7Hs9kPoru
	wk48+W//oQZkniKo8x/JJUpfErjHAQ/9kyVZsqZ4bkis83eJkCYx7BLft+iAiElsW9gmNFiYUki4W
	tBMkKgTc4wtddtLEXAaEtC8mgTJOx+oAzuD+vjjTdfPw356MJ8ZW++lyAcRO/ihxBIMsk/TYYV4MW
	B62pkZKZzRMxZaU/XF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VM4-00000006ZvH-0yQU;
	Tue, 17 Mar 2026 14:25:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VM0-00000006ZoZ-2L9S
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 14:25:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D86BAC55070;
	Tue, 17 Mar 2026 14:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8FFE5FC9A;
	Tue, 17 Mar 2026 14:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E11D7104505FB;
	Tue, 17 Mar 2026 15:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757491; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1fl+dYL251xXhtusEZ7b8g0kjCughX2VCuIW1qgsL2Q=;
	b=WseylebrZ8OgCzJNFztlPs25EauF7UnbXMoCwCAXTdAhRWD/i1MJTbLQrPV1tdXufR8tVW
	oyA06yE0NnU4U62RqsGMuFf0HsLf4MXSsRT7sxBYhGQXz9Gxouode6wEQtIXvgEFPb+xvg
	AdpNlYJqv6Qa7cDnYiSv6+jhj8k7tl9l7XPPEXdoWhh3VjgjG56kJSEBkwOYCk47LrsHzX
	T83aV+1B//hI98Fjyvx1Fc/sCT1aVkmpMt0nQe9PS4v4zqrpc6QswdeD7Zd6Iuc0lStGjl
	DviFp9sCciEyNy7tL5X+TFoptfWVmUATqhsOhB3oCqM+BTASnKLuPk+k96goPQ==
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
Subject: [PATCH v3 1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
Date: Tue, 17 Mar 2026 15:24:29 +0100
Message-ID: <20260317142437.580204-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072504_741156_764A2FBA 
X-CRM114-Status: GOOD (  13.49  )
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
