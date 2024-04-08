Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833B0C67861
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KQsVOJ461goQbQk1AnHclgULgKNs2sCmKgCExprpa24=; b=sJjh6dpnjqXa9q
	fvI9lUO2xlkaWwXcyErXB/SNlL/TR5rs2Px6/phl5uOTjr0i9YM2G5hGcckN8fXC38bY1U9dR7lOo
	2q7rT9e30tuoyDPdpESORJbtzU1XylsiSKs5UOeOzyUP0d4HYbtJoykemDZQuyOB2AwSoiKt3J/rq
	D8pD2S/EUuZf0I29Muy6oJLicssc1NyJF8gSumqseMc6e4q3UpZsX3mdpdgZ9fq0nDjVVTCC+k7Aj
	bU0V9l1oMxpsGjBOrYRljkhMM9QsDvCyZlOrGFYQPdW6Tc9cSA/zMLtzqNkpjm/LfPKQrLm96ZwMm
	JxfEi/zY1tQ8mzhl0p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoLh-0000000FZ2y-1v0m;
	Mon, 08 Apr 2024 12:43:45 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoLd-0000000FZ11-15j2
	for linux-mtd@lists.infradead.org;
	Mon, 08 Apr 2024 12:43:43 +0000
Received: from hwang4-ThinkPad-T14s-Gen-2a.conference (unknown [114.249.187.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 703053F1C5;
	Mon,  8 Apr 2024 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1712580216;
	bh=+QBBdlD78Q+z6pqWZFWzeviFKOAXN8cd9LIb8Q/ScmY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kXhmf1oS8J+XH7JO4KmTahFqQRg7nyTzLA9EdHhpfjS9Mb0O3BhomVsgnOqqv2pjN
	 w+sIbL8+D+pQ5Uu+JsZtnr+jNvRTCyvTQpwvFNvx/JUCSSD4H9UkUzgatWLgk3xKE3
	 L1I8CynEKP605E6WmS3Cq8f93X9WZVnAlxolNWsAovJtVe81mTLvfxr9zV4jSbs+C3
	 5l0oBVogFH27I1+gPmvx7t2MeVILeoT/Eb502rF4rkWBNfBVGVD5N7bAZ5hfU6Rwt3
	 KWkK/mxE1vEHr2rOEzOMuBzfmRwkLhglm6TqDvRDmbgUePnKGZ/CrySCCN2rrVMk9X
	 FRV40mGoZn9fg==
From: Hui Wang <hui.wang@canonical.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org
Subject: [PATCH] mtd: spi-nor: spansion: Add support for infineon cy15v102qsn
Date: Mon,  8 Apr 2024 20:43:28 +0800
Message-Id: <20240408124328.777375-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_054341_574251_D410045B 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

It is 2Mbit F-RAM which is logically organized as 256K x 8.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/mtd/spi-nor/spansion.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6cc237c24e07..5dc94926b2cb 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -981,6 +981,12 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0x48, 0x51, 0x80, 0x06, 0x00, 0x00),
+		.name = "cy15v102qsn",
+		.size = SZ_256K,
+		.sector_size = SZ_256K,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x13),
 		.name = "s25fl004k",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
