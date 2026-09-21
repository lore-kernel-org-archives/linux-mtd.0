Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C37C982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IqBJv8GZtVXFQ2giwQ0u2sxi0PxIrOCiYl2yU0+k/A=; b=3Q00PPvBUPrebu
	Sc/6yoSGSB9R9epnJe4ReV5ceh2k2PqTikhEl99Gn/UBiKDEpeB5ghGUNGf14NoR9muSAE16gWALI
	h0k0iWQha6OMnSBeftwDD+BEt0uPDrzXN2kaP79zwlGv/A0sAtR5LJ+7N7CEWlNrXXeBbK0BpPdLL
	HpztwtGcw5pIGYTn5kHB3MFThznuYFkQ8t9YGbucZjYigajcoCvikCsVyqEm3GGCbqDL2TkKGg2HR
	v4DFNWnb6eIjNLftTMin2tRwak0vvugGlLemdmQuVaWE/vEyusfqmCDd1/a8YAZqApN0TRXBdXeKB
	gP3ZUBRaGqGSEAbVhWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlA-000000015PD-2xLo;
	Mon, 21 Sep 2026 06:44:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xl8-000000015MO-2B64
	for linux-mtd@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZusB55Nq+U/G32co+/l/qbuTZAYFRtaEk7lbQ4QjEZY=; b=qKKvn0J+AB7z2Bnpp0WDDo5jD9
	hNt/VueVgVKmgZZvj6bobWARAhjKwoxmfysESCsHg7U5fDW/lK1Si+wwOsk41ZpRcYy2pZkNSOKG8
	jD38LIoOabrb22WJCRrugnITgwAIszyvBHaBySJZka6zr1Y6YK67CxyaOiA6MrqYgHbHJ1KrcMvBr
	NNiZMAYVYPv0zVBQCYDfKIVdnKrb2BXpL9WF15c2C/9IaWL96JjCMIYON4ZFIm62IYE0r1Z07H3pZ
	s3U/W+Mw6ZerU+S0Wknr9LEmUq94x5ehEqZ/+msqN/dtScmGsqCb9bJnRjn79Ozipgzx2oQAJaFAQ
	JianlOIQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xl5-0000000Ffp8-38vp
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0CB54E40C5C;
	Mon, 21 Sep 2026 06:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 749EA60339;
	Mon, 21 Sep 2026 06:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DA11103290E5;
	Mon, 21 Sep 2026 08:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZusB55Nq+U/G32co+/l/qbuTZAYFRtaEk7lbQ4QjEZY=;
	b=y9o8Mh6RrwKlRjwdXNTgCc76K4+QAARGpcGbb05qtnVxvwfXqeGoRSxqLfvtCliP8mu/mt
	9aJTzBH77vOfsfmX3X0KmugtI1DbGrvvNUxwsdqEPHEuCHDBWDslFCFfdrfdxvc7rk+1uX
	ihVhKoV0mGMCoiDiozDxeiSJrp/OYg4e3LnzsePz63LcjM107H3ki9gPog36z70HMik8wM
	fFBgREQ6QqeffB+zainy5mI9TJYeKng9IFxbH1ceDvHVPyDVG3PVKVOg7xAzqUrLcLEQvN
	ApxMf9niI1JhA4TVwpC21w9px5xqDpIRf32zwf9MCz62u4CdJ/ZnZGyEcKcEBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:47 +0200
Subject: [PATCH v3 16/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-Q/N parts
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-16-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_074411_874194_C44057C2 
X-CRM114-Status: GOOD (  13.14  )
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

There is an ID collision between chips of same density from the JW
family (which it self conflicted with yet another family) with new PW
parts. Chips are very similar in practice, it is mostly a matter of
electrical differences (mostly power consumption being lower) as well as
the addition of inline ECC capability for the higher devices (> 32Mb).

Chips with ECC capability protect 16 bytes chunks are against single
errors. In case a non-aligned write happens, ECC is locally disabled
until the next erase.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 55 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fbad9e408d7a..a2dea77dfc2c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -71,6 +71,41 @@ static bool winbond_rv_match(const struct spi_nor *nor)
 	return nor->sfdp && is_w25qxxrv(nor);
 }
 
+static bool is_w25qxxpw(const struct spi_nor *nor)
+{
+	struct sfdp_header *sfdp_h = spi_nor_sfdp_get_header(nor);
+
+	/*
+	 * W25QxxPW chips re-use the same ID as the W25QxxJW/NW family.
+	 *
+	 * Chips are very similar, W25QxxPW brings mostly performance and power
+	 * consumption improvements. One key difference in behaviour is the
+	 * automatic 16-byte based error correction.
+	 *
+	 * They can be distinguished based on their SFDP minor revision:
+	 * W25QxxJW:       JESD216B, minor revision == 06h
+	 * W25Q51/01/02NW: JESD216B, minor revision == 06h
+	 * W25QxxPW:       JESD216F, minor revision >= 0Ah
+	 */
+	return sfdp_h->minor >= SFDP_JESD216F_MINOR;
+}
+
+static bool winbond_pw_match(const struct spi_nor *nor)
+{
+	return nor->sfdp && is_w25qxxpw(nor);
+}
+
+static bool winbond_pw_with_ecc_match(const struct spi_nor *nor)
+{
+	const struct spi_nor_id *id = nor->info->id;
+
+	if (!winbond_pw_match(nor))
+		return false;
+
+	/* W25QxxPW densities <= 32 Mbit (id[2] <= 0x16) do not have built-in ECC support */
+	return id->len == 3 && id->bytes[2] >= 0x17;
+}
+
 static int
 w25q128_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -201,6 +236,22 @@ static const struct spi_nor_fixups winbond_nor_partname_fixups = {
 	.post_sfdp = winbond_nor_partname_post_sfdp_fixups,
 };
 
+static int winbond_nor_ecc_configuration_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * PW chips feature automatic error correction. Non 16-byte aligned
+	 * writes work, but disable error correction on the region until next erase.
+	 */
+	nor->params->writesize = 16;
+	nor->params->flags |= SNOR_F_ECC;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_ecc_configuration_fixups = {
+	.post_sfdp = winbond_nor_ecc_configuration_post_sfdp_fixups,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -622,6 +673,10 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x60), .match = winbond_pw_with_ecc_match,
+	  .fixups = &winbond_nor_ecc_configuration_fixups },
+	{ .id = SNOR_ID(0xef, 0x60), .match = winbond_pw_match,
+	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70), .match = winbond_rv_match,
 	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x18), .fixups = &w25q128_fixups },

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
