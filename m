Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F7C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ZOSJZ5P8rM2IlRc72loahSDaJUI3NX/2K5Ax+dzBsE=; b=jCovuSTTHoi5Y4
	KH/Xs2rsQWTvKWOzK4AVe6BjL3IRsvcPI/bT4EYoZj4FckZ29+StAixfdqoSFP6rFi7QLFDGYyr/L
	CdkbmRIu7Jbzz1aJHfaJ9ZqFvfBoE57FXUnGpnxXjUhXvCcvxvW7WqRXJk0DbVdhzV920gvzbBo6a
	cWVmTw4KPWw4RG1DbgR1/s1ZH15B156pH5VIoTcw5/iRjYfo77znXfcnTjhChvHI4tE+R1/zOkZgj
	6Jk3F/DtDcqNiweJbBYm9HarGXFcp+oVzbLd2zt2W2bsiKpHPk4wxNx3ATJyUiX1BTSaDXj2yLnxT
	l528oz2ObOXKevYmi/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd5W-0000000946N-33A7;
	Fri, 21 Jun 2024 12:09:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd5T-0000000945U-3al0
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 12:09:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20C37CE2D5D;
	Fri, 21 Jun 2024 12:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA15C2BBFC;
	Fri, 21 Jun 2024 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718971788;
	bh=wMuaz9BDxJLFVN7qWbG997fw4//1Q5akSsaDTLrpVEw=;
	h=From:To:Cc:Subject:Date:From;
	b=HNOtTTRF0I3LzUwqWoj28stx4qfPA0jX2uJmg4YHPUAv33N4dlDV1OgBbCj17qx0r
	 5WOtcuf1XKAveAWM1GMbbQgLwRjg1nXowscH4zcYo3kn1Veh59gsLyeuTBJh3bfysf
	 uSnp3Ex7PZ4PHGaWYi6K46/6KClB70nGfVxA0om0Qr/W8Llylyt3K3ZVBNbMI5wGse
	 /ey8LpfEZ5rExS0YKwEmAyDPZDH/M5KchMAkGu4rIeZhgtKCvQPQEmzc32wYiAOcaS
	 21ioY6QOVhZYoY/UMSHOI7XHlTnUIh3/PEI+VnOw6KjdaGH4B1aQjpRKZJXvu/Ak+U
	 y0u6xcEjwATlQ==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Esben Haabendal <esben@geanix.com>,
	Hartmut Birr <e9hack@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: winbond: fix w25q128 regression
Date: Fri, 21 Jun 2024 14:09:29 +0200
Message-Id: <20240621120929.2670185-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_050952_101626_83F59B1A 
X-CRM114-Status: GOOD (  11.86  )
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

Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
removed the flags for non-SFDP devices. It was assumed that it wasn't in
use anymore. This wasn't true. Add the no_sfdp_flags as well as the size
again.

We add the additional flags for dual and quad read because they have
been reported to work properly by Hartmut using both older and newer
versions of this flash, the similar flashes with 64Mbit and 256Mbit
already have these flags and because it will (luckily) trigger our
legacy SFDP parsing, so newer versions with SFDP support will still get
the parameters from the SFDP tables.

Reported-by: Hartmut Birr <e9hack@gmail.com>
Closes: https://lore.kernel.org/r/CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com/
Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
As mentioned this is for fixing the regression and a proper fix will
make use of the TRY_SFDP (or whatever it will be named) mechanism.
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ca67bf2c46c3..6b6dec6f8faf 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x18),
 		.name = "w25q128",
+		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
