Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F028C5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PB4QC/J/yTSlcLi+5WUrz/U7v0sVOKrTajVkv250RC0=; b=1VPL7GeICQdHkv
	STBrYMbE28Qr9kZ4VyZTPjTJa0Sc3HuDJ173ITRGlWDcKG9W58hpd3JRXf5NdgWulmzqLFR+fEwtP
	+A04qUch/d37xR4CfjA01EAblTfSvyGJp6It2RZSKEGOxCvMoM+ZEQBhJtYRaEF9L/xLP6C672bG0
	S184lpWbebetj6Uz1teLXaDyaAw+oO5Jp/KGF9p1fY5NsbSINz25P8Dhgy1+qeXDG9fxDGAnkj7No
	g4HHS2Rf6CGZRMnT6+ZTrPPvlCW8gLHZ8949sAfknYT4bK3HE00nBHencA24kdgbWnBFsMSq6yQVD
	fKytF1NUC7czOgjJ17Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXEH-00000000xfJ-0bZB;
	Thu, 13 Aug 2026 15:20:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXEE-00000000xcU-42JQ
	for linux-mtd@bombadil.infradead.org;
	Thu, 13 Aug 2026 15:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LOA0I4OIjSAj2IPm1iGUjZcRXwqyX2FFHo3g/tnp9uA=; b=FSjhflcF2Z9ALpWZHCXyHrVwSN
	y38DCrOvz9MHg0xGdbiYdTNku1/buJ+qiC4ZYEw67ev3t5+Z+IydodTf5ewbwhuxlo+ndXLnK5wg6
	Fw+5Sv4+2rVCJLN7lGX6BF630oveoso0qF5zkHpEZj+Dref6/+R3KtV068iNajcpQH1DA4/eGdeRX
	aZu2t5Iv8NU6mhA48lPaDxx1mxOrDra0sWOAG+1nLXp0gqBknh2Jr2iGlglTiBRmz8qm4ZFGtVuA2
	xR2XHlGhkyE25QqrN2KD0FGXzXRdYIR7Phb+EfHgyrrRI/8jREwXtmu7rZfTyxE+hsudACsj8I99F
	f6GE/YNA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuXEB-0000000GH8u-2Tlk
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 15:20:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E67391A15E8;
	Thu, 13 Aug 2026 15:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4007602B8;
	Thu, 13 Aug 2026 15:20:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40C5311C4E074;
	Thu, 13 Aug 2026 17:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LOA0I4OIjSAj2IPm1iGUjZcRXwqyX2FFHo3g/tnp9uA=;
	b=VaU3o9Tj9vB0eQqDWkKb1gmPzfvOG8Y0qXTBJPTtIABJVi8ysZ3uh6HBn4AQt7xmEqaZ1R
	rrWxtqe/imxkUXgSe01UAd9dAT3us8IUNOhMk1gHkbuZr2ZNMv0jFd0rWEe0KQmCrxngbp
	TjO3UHEkPCfw9MsCJoysrV6dX2vIjNOPx8XRvgZRVhllax5mkoVtw/n2GGfljQ9F/hWeKL
	d36gEw4AeTISMUkyvZrwfsO/mabsQt3fPk1bsDnvMVbQjEuZL2aJnNzp/YKlj4+wdYXGJJ
	ivDBjoflnPV/UwDv57a9+1hJVVbcI8s+FXd4/mrOXt03z20I1wsh1fLAcdZSag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:08 +0200
Subject: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_162019_723477_BCC1414B 
X-CRM114-Status: GOOD (  12.78  )
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

There is an ID collision between the JV and RV families. Both chips are
very similar in practice, it is mostly a matter of electrical
differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
the new SFDP (rev F) field which forces an alternate write SR2 opcode
(0x31). They also do not require the multi-die fixups which must remain
assigned to the JV chips.

Finally, since they share the IDs but not the names, we must hide the
names using a fixup.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 56 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 583b1669270f..8c1cad9e21b4 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -146,6 +146,51 @@ static const struct spi_nor_fixups winbond_nor_multi_die_fixups = {
 	.post_sfdp = winbond_nor_multi_die_post_sfdp_fixups,
 };
 
+static int winbond_nor_partname_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * W25QxxRV parts re-use the JEDEC IDs of the JV family. Their name
+	 * being a legacy field, it is kept for the already established JV parts
+	 * but must not be exposed by the newer RV ones.
+	 */
+	nor->partname = NULL;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_partname_fixups = {
+	.post_sfdp = winbond_nor_partname_post_sfdp_fixups,
+};
+
+static bool is_w25qxxrv(const struct spi_nor *nor)
+{
+	struct sfdp_header *sfdp_h = (struct sfdp_header *)nor->sfdp->dwords;
+
+	/*
+	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
+	 *
+	 * Chips are very similar, W25QxxRV brings mostly performance and power
+	 * consumption improvements. The RV family does not require the multi
+	 * die fixup.
+	 *
+	 * They can be distinguished based on their SFDP minor revision:
+	 * W25QxxJV:        JESD216A, minor revision == 05h
+	 * W25Q512/01/02JV: JESD216B, minor revision == 06h
+	 * W25QxxRV:        JESD216F, minor revision >= 0Ah
+	 */
+	return sfdp_h->minor >= SFDP_JESD216F_MINOR;
+}
+
+static bool winbond_jv_match(const struct spi_nor *nor)
+{
+	return !nor->sfdp || !is_w25qxxrv(nor);
+}
+
+static bool winbond_rv_match(const struct spi_nor *nor)
+{
+	return nor->sfdp && is_w25qxxrv(nor);
+}
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -552,9 +597,14 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	{ .fixups = &winbond_nor_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x18), .fixups = &w25q128_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x19), .fixups = &w25q256_fixups },
-	{ .id = SNOR_ID(0xef, 0x40, 0x21), .fixups = &winbond_nor_multi_die_fixups },
-	{ .id = SNOR_ID(0xef, 0x70, 0x21), .fixups = &winbond_nor_multi_die_fixups },
-	{ .id = SNOR_ID(0xef, 0x70, 0x22), .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x40), .match = winbond_rv_match,
+	  .fixups = &winbond_nor_partname_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x21), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
