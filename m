Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5645BEE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OR8fQuXVJ94D8LTIYz5JjCWtPFK8pZDgyt6bLa7KQQ=; b=ZgBrCMQh9rohom
	PPNzJdxq+KJ0cyvmW8yrtUBF4rwhajMTdC4/SSK37PPuqTs4+KxNHxPe5Q9NFDpnnzMrmfG4T517K
	Ek3HsRyGwpauI23Ov7Ial3H8G6d62tSQ248BKMeL6QT3NMmN+hzfdfsEyAwk6s2rrk+7m318jVm1j
	dpe+YDxGr34RXNH0AN32cLirLdrvkDKJNGFYhQV4ZHSWtrccDYBc8kmfzqIFcLNUaf1GRyBWv/dm8
	lxqU2UHt5lcBpNqOBPwxKI7/BM8cUbobLeQvvqSNNZfZHhO5obqTRejqgN8eK3VwDGfrhPMAwALfI
	dtTYAhFX8hCwAUidnAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYaG-00DV9c-1s;
	Fri, 08 Sep 2023 10:19:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYt-00DU6H-11
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=biHzJpd/0KU5jc0wWCEurqA9hkss16jeCqnoKtcdA34=; b=pP+Ozd5njPjkWcFbS4AJ56QvNR
	C76N/xPfp/rzhk0GwhQQqyshEJgcusKpkveQt73MLmsOuTt9WQyR4PgWdZu9R/F8r2ccxzUk1VrbS
	rFh8YkSfqLIPoXwdA1KEItEqtQrQblyoz+fW+O91PqufoK+fVEFJDC7Gb+f173HLxhnyvzR24Jx0C
	nV/yaQYosJ9d3LvUQDaN4ES2EwJL+gMxeJ2YwF71yYeRFqw2kuj+OU4pXV9q3WI+Ci7LTb/DwibuI
	g7AuRnyVmyHosxGTpYqSgyXtQSpm1emtbfUn/KgFyRxavr2HwHaYBq6/pHcbpfbhxG7KZgK3TYveM
	JFMoLEdQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYl-002R4F-0J
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3C206136C;
	Fri,  8 Sep 2023 10:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F29C433BD;
	Fri,  8 Sep 2023 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168274;
	bh=4j+TSHZz8J89KqW87Ge8U9T1z6cX77wZsqqm1rpBNGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gCrrcjBtCHPcW0MqwcCQSyqJCCr/IM2WK9noO9v7+Ffg+8ZytdElTVATRNCabPVZf
	 prjvbWxn3jQp/DH5uir5V8GSkncC0ixgn/r/Fen7u79HN1EUqdpdu8b9bnVByJZ09F
	 +S028TnBhioz+6Ceu/QOFIu2aANAofBQKNeVsSnf7PwavJ6Cfux6jWGcC+JpxPpJuD
	 b39QNGR6PvH0CgOK99z1UWUJyaiKbT1KTvS82CVg6K1r1Ozyh6CnTR60ZHeQLb8Azn
	 KcOnfS7/Tu+Xgq748ZUS8wCk7JnHFnT3bSLrFCkIr2Mm7IcOT5woM29xJnGbKRShrW
	 YF02VSA0Wngaw==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:58 +0200
Subject: [PATCH v3 40/41] mtd: spi-nor: atmel: drop duplicate entry
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-40-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111757_052246_34A6E195 
X-CRM114-Status: GOOD (  10.53  )
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

The Atmel AT26DF321 and AT25DF321 have the same ID. Both were just
discovered by reading their IDs, that is, there is no probing by name.
Thus only the first one (the AT25DF321) in the list was ever probed.
Luckily, the AT25DF is also the newer series. Drop the AT26DF321.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3:
 - double checked that at26df321 was last in the list
---
 drivers/mtd/spi-nor/atmel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 18e904962d0e..95f0e139284e 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -206,13 +206,6 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
-	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x00),
-		.name = "at26df321",
-		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x47, 0x01),
 		.name = "at25df321a",

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
