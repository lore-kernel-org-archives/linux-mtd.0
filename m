Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF01C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68gXzO7fM5pAJdYO0XeQzduH555vhqN3B4liR6fOukk=; b=YQnIUwPGMVTo3S
	XKTXRtbdefLpcXO70IULw0ZZFUBSTwkzIEyWilhsLmF9Z5cNqoQzSPkONiecIXtFmOjnWcKb+4dlA
	j+DpVVaGGjHBfgTHyFuwG/k9g5p2uaEMjlLhw8ur+pfmNCN/KJRi0POCTj6gT/DQeCgSa9KV0JOTc
	jUDKsCAh6fN3C3uj39y+eCKHPR+z1SVPlStT1lZ7Sme+V/NZFrCXVqmsWzKO5BWuQW/tntU0rBkN8
	GZxVTSLezY7RfF4dVpmTBMlz6fP3GkQpwTRox2fmyfzmSAoV8+qnANupNXHkKFvRja6KV3X+nQRzP
	G/9asunHh3zF5T63ePSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHbS-00000007cE3-18LV;
	Fri, 07 Aug 2026 10:15:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHbO-00000007c6I-1111
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Aug 2026 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YWnz58YfuThg2Y1pxrGRLMdb8YcgIGotzUnz6k9q4no=; b=a1YEp/wKrLjTejx/SbpAGnfYkd
	OSU0Z7tj83xLD/fr9d7iL5i/BzLVh4PkT4vmFKq/Y9X+sDoiFju3ek6JfucLUuPByEusetO2cq9L7
	8n26NlGeA2ugjwsL6UY4Q9eTYd+Q2wlIy//zRwHGFkv0I76mS4F5GnxisDzW9jVo+4Aaz07MZLP7+
	2UBA8GEW15sUQCV9RAhp3i6VbcMNpkTmMLJBJPuKZ3crqR3kP5XnUi21qKFERq9qjMN9qtRMxuQkf
	+UjpLGYPjI+QxgKE1GDd6Otl2fD0ZxuPArXhfOQXi9SKvnHt5oN50bjk7Sw+f1ihY983/mBKiWpik
	U155dQ4g==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsHbI-0000000CGy2-00RB
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 10:14:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EA5551A149B;
	Fri,  7 Aug 2026 10:14:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4E39603F0;
	Fri,  7 Aug 2026 10:14:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B06C811C37523;
	Fri,  7 Aug 2026 12:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YWnz58YfuThg2Y1pxrGRLMdb8YcgIGotzUnz6k9q4no=;
	b=lvS2hipMDSYWOxnkxqgr0rihSyMb51oOPYbpTZ4iqLAnGaT5lpSo5e/rLi6KJURUSZenek
	H3WQmnn54ru8pcpkyaswNXicHCqaveMZWCjxxYodH9WrOrS5hIYYxEQgQrRypZQ96vNYHn
	ZGkgeq+k4prALb7zW+IeaDrmYKOwJfeV3l0S7X3fXvPchJQVGhP3CU/Y37JvjAwXoI9Qys
	E/HKQZ9EFCSb0ZlDmboBz/eiPrVb6qGXCIdPhV9HwBHIVMKCB/71Dk0Sf96dpJPVBlWQTg
	iYlpNLYEF2N4iAud8XCLhU4rp7ZF09ON4wEaHxUSB8ikaA/Q2eetsFSm1KjxmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:13:58 +0200
Subject: [PATCH v2 06/18] mtd: spi-nor: winbond: Drop the .name entry of JV
 chips
MIME-Version: 1.0
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-6-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111452_135686_DD6498F8 
X-CRM114-Status: UNSURE (   9.02  )
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

This is a legacy field. It is often incorrectly filled and will soon
become very inconsistent due to IDs being reused. As an example, chips
ending with JV-Q or JV-N and soon RV-Q and RV-N all share the same ID.

There are comments above the fields which already list the correct names
being supported by a single entry. The names not being part of any
stable ABI (they are not displayed through sysfs, which only shows the
mtd name being spi-norX.Y), they are only available through debugfs, so
let's just drop that field when it becomes a problem.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 01a693033448..88fdcfeb6eff 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -200,14 +200,12 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q32JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x16),
-		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
-		.name = "w25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
@@ -223,7 +221,6 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
-		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
@@ -232,7 +229,6 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q512JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x20),
-		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
@@ -304,35 +300,30 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
-		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
-		.name = "w25q32jv",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),
-		.name = "w25q64jvm",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),
-		.name = "w25q128jv",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
-		.name = "w25q256jvm",
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
