Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6099C56201
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCba6JFxzxKb4URxV5vKtOMErL+BIsid3oOkZkVtV5w=; b=ZO1BqpX5PY1ArO
	t8cPb4j3LE7z8FuMqkRvx4z/rjf568oH6meB8xCMcUU78j8PT/oNSJwkzKorIGxoF2r9wgLpW/k1G
	PvzbpC2pk1At10XN4qXSGjAvozaZXnlPUlvltilQq7yhHVkzvW6ib55rcXMlUC5gEqLKsoEl+HLyQ
	ajeRpGxBsiLjxQ+o3l58YFd11g4mIZfSVWnNB4MUuaMtXZodpxr1zia6MiYkvbibcFLWjz9SNk7/U
	pb8+SS1mJR69AyRRfp6VC1zljyo3j+8gxXtL3XZXPSVFCHhKxaOv/0uGQz/BUHCu/PbxLG1t5o7ge
	P4ldPyDfwoy/ZJyxwvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWax-00000003T4f-2CEB;
	Wed, 05 Aug 2026 08:03:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWav-00000003T1Q-3KM0
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Aug 2026 08:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E5QPse2lkWC/wOtvK0UJ5oLsVwxAuCt35ua4zancMaA=; b=lU0Wf860GD02N0FpdoEdamX2s5
	ydeCbOf+DZdpQctqJsHFfFncXNjWqYmh25ncFZjuKigKWK8eJDK6df4gM1tTGBRmYFpiDF26/fkVM
	v0WKkzYleNUnb067OgmMAh5/u37gTQA8W1a9+iPs/hhbqsONJ3L+wuZzf+Vc04+qOEodnR+7XkqL1
	Wf6kNApsu3xtLbIxlf5QOXg3sAs80+VsMMgdQiiwlfbj8l1ZzgdH10KvJ4yj83kWIH5d+hmeyGVMD
	B7SULLBVnkAUZGt0dSclWr0qJFbNf/qfsQSMCCl5HnZdlvKy2VF4uHhGifsilFiS0k16TLAxOsiyB
	fkNsFdUg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrWaq-0000000AYoc-4BYH
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A8EB64E410F1;
	Wed,  5 Aug 2026 08:03:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E372602AB;
	Wed,  5 Aug 2026 08:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DAD511C3436A;
	Wed,  5 Aug 2026 10:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E5QPse2lkWC/wOtvK0UJ5oLsVwxAuCt35ua4zancMaA=;
	b=wKuMdi5rBDdIZ0WyXkXu/TApYLU/VVVZgmV1wHdk4ClOjRybZ+CPnAk3EdXJvgj0q7uKw8
	lUuOtaEZ9JZD3F2AGdPoh0rblY7RPn1dwqbOVUcBaJPKqA1KPthuTXPS451IblNLyh1DnD
	tRcor7L3eE2Tl0cSP2yF1HiQWahfoo6SKuhFOEbAEeGrnNatGM8ojv6RoVBWWY2jWCOEMa
	CRwThmQl3Zqk5kCP9FLhbE665jmzcPfAFIxvO/NHT/izqY0xsfD7Vj1NvBm8DLGAaFUDw5
	EUhph4QrOfKQeOa9MdI60p4nigqBGCpLBBProJiJDkJug1jQE/bWojy3Jf2fxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:40 +0200
Subject: [PATCH v5 15/28] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-15-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090317_302744_C9CEA667 
X-CRM114-Status: GOOD (  12.41  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs, add the flag manually:

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 553 KiB/s
page write speed is 548 KiB/s
2 page write speed is 550 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 1628 KiB/s
page write speed is 1600 KiB/s
2 page write speed is 1612 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 41c9b620f26b..2cdb4acd9ecf 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -321,8 +321,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
