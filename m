Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E3C44507
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emPNlpLgKyN7Wrjvq88i3Jz9tv5vIZpRwsSSqXFH6HA=; b=DiWXnfmEPEHu2O
	d/Buj3x/PyiLjUAO8a5oVczqtsuzP0fe+TCFqqoqstaX72reExxRt+79gaeAwlx3Ll23R/+mcrXc4
	RXJAoQSV1E6n8xq2DReDtz+qS4KuIU2pIG8Y8smcqYVxcaUEmgKDyRhBPzttH6OeLEQv6snPjaELY
	TzoijXpLXZmXtK2M3xrZlJF2nzv7AlIU3yO0cE9ZDTeRinED1AWvLUs8NoBaACNfGZ4iAvQ7Q2K2I
	fGrG6Sv8G2QQvu0joQV6egJf5z5M5jOdrb10/EBDb1qMRiJ9V54VlMILEdWwNomnSb14GvRkVHWvE
	I+/1O4yF/12bQXKRnD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi8-00000008gH7-0dKz;
	Mon, 13 Jul 2026 09:12:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi6-00000008gFc-1IP3
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15BF043B82;
	Mon, 13 Jul 2026 09:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74DD1F000E9;
	Mon, 13 Jul 2026 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933942;
	bh=2tBIpzrA2mgPVackQiqt2YipbpdW03n68DVd0kQkAho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZeZarXJ9OiwuqRTiituQKBM585rpJfvW4mJfWBcyJwOxadZHejG9JTRmLpoN5czWp
	 FaLMTVD+a+gb6X6wFeEl8YdXzU/YE6uXAGmgZuvrCBYqV+K121Jl1PaI/+88xVgqd6
	 FuRbV+k+dKn1tpDbNq2t7+eKwSapjwLMvoA5IBz5FrQrSE+Zk6W2UdtKfvnXlEhzbj
	 p9XO01Oam9ZrgC5lrqRmUFxiyMHqraUcBtYDQSOpvp8vvBX03odKubhu8ulxLR8YA5
	 L54UHmbhDJZyvEXsgX++0BvksZU5eNJKgiKS7p2nSmpqxA6E3oovpw4YrjC+TXDW9R
	 GZ2ZaW+Vf2X6A==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
Date: Mon, 13 Jul 2026 11:11:40 +0200
Message-ID: <20260713091206.2414400-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
MIME-Version: 1.0
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

This was introduced in commit 548ed6847f530 ("mtd: spi-nor: Add the
SNOR_F_4B_OPCODES flag"). It looks like it was the rollback mechanism if
parsing the SFDP failed, but was setting that flag first. Nowadays, that
flag can only be set if spi_nor_parse_4bait() was successful. IOW, the
flags won't be left in an undefined state if parsing SFDP fails.

Remove the unneeded code to be able to rework spi_nor_init_params().

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4046e137531f..fbf8c2d9c6b5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3066,10 +3066,8 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
 
-	if (spi_nor_parse_sfdp(nor)) {
+	if (spi_nor_parse_sfdp(nor))
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->flags &= ~SNOR_F_4B_OPCODES;
-	}
 }
 
 /**
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
