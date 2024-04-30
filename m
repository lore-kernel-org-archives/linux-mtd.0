Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66425C19F53
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2024 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHy6HLZYXbf6fLOCLOUXBSDYKb7u4BV7m+jIPAKoDlY=; b=ZK4clXXPCLvOZq
	p9hj3DDmAwZ+d8E5s4vV13emh2dBssEoTKqSBha7zkHqtJvdWFY8Oy1Sgkq09jOQ0UNiVmOxdbyxO
	QluMRUbCG7C4FyLJgBP9cFz6xfWuhbNSDDhQlg8HBAuNy2PF1dDRzK6+Osz7/fntwNVLu0TzQ11mZ
	TQ8aDq/6QCIjydahFO0G0nwczuo0zyssjlVFTxPM62TTGVboVCdqR9he/alk/ruNplYNFWMv+I2oi
	9hCe0ZT3tVgaopfMh+mmS8NQ8TFMz1HdYomALDq4aDzigVFAV02GbnZlPAXPKc+ZuEBWCcp5+saib
	+EmELYkgOdNYY/6wGkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lOf-000000068be-0cUj;
	Tue, 30 Apr 2024 11:11:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lOZ-000000068YQ-1Zgd
	for linux-mtd@lists.infradead.org;
	Tue, 30 Apr 2024 11:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5055860C75;
	Tue, 30 Apr 2024 11:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6393C4AF1A;
	Tue, 30 Apr 2024 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714475493;
	bh=2n6RKhZ6Alf/wZaO1MKOWwaDevD0k3b+5zSEVw4UWKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eKuhx1K+SwtgMP71K/LghjaKXGuYS90nfXBjhKShGHvmuGy54dtW31bs4aznwXVR8
	 +Xq3Ts6cFAtynwNPEjMa/cxE0Ieql0KT+Mz0A6Q2H8ZJivSQy9CgnMy95/6AkC2101
	 2Q0CLoHSinF6U5aoP6Lvei/5WkCoZqob+tf+B+7h/xdqAf/g9kBNsg0eP8V6IdxbuK
	 NwWAE/QeISov9QZlHSnPn6SY4SkzlY8CAuoJFo+iq9/6QJHydHNYeEq4VhlbtdXgWx
	 Jbgj7JphcSX7ZKcszIA0CgCPRKI3Anpr41p6ywaBsem4nPoJ7I9qHFc/4hIezW16zZ
	 l8g04i9weF70w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D70C4345F;
	Tue, 30 Apr 2024 11:11:33 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Tue, 30 Apr 2024 19:11:11 +0800
Subject: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when reading
 subpages
MIME-Version: 1.0
Message-Id: <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
In-Reply-To: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714475491; l=2188;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=wxQD1HBRVqdAYZRkfcNz/OdgGE3Cin/b3Ag8hRQf9EE=;
 b=qDOtiX5d4aKcQL2FPn2OyNayDTvIp5rLphjmsU/ftUr6P5kvU+uapKzBtmSJ/WRUiabEBChwh
 aCMaYeMxjLVBrdMF8NlJVpvxvgOeSPpm4aw4cFeheZOOjofdE3W3IPl
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_041135_637173_D262AE31 
X-CRM114-Status: GOOD (  12.88  )
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
Reply-To: keguang.zhang@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Keguang Zhang <keguang.zhang@gmail.com>

nand_read_subpage() reads data and ECC data by two separate
operations.
This patch allows the NAND controllers who support
monolithic page read to do subpage read by a single operation,
which is more effective than nand_read_subpage().
---
Changes in v7:
- None

Changes in v6:
- A newly added patch

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 5 +++--
 include/linux/mtd/rawnand.h      | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d7dbbd469b89..eeb654c6b4fc 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3630,7 +3630,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 							      oob_required,
 							      page);
 			else if (!aligned && NAND_HAS_SUBPAGE_READ(chip) &&
-				 !oob)
+				 !NAND_HAS_MONOLITHIC_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(chip, col, bytes,
 							     bufpoi, page);
 			else
@@ -3648,7 +3648,8 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			 * partial pages or when a bounce buffer is required.
 			 */
 			if (use_bounce_buf) {
-				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
+				if ((!NAND_HAS_SUBPAGE_READ(chip) ||
+				     NAND_HAS_MONOLITHIC_READ(chip)) && !oob &&
 				    !(mtd->ecc_stats.failed - ecc_stats.failed) &&
 				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagecache.page = realpage;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e84522e31301..92d3ab491c9c 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -150,6 +150,11 @@ struct gpio_desc;
 /* Device needs 3rd row address cycle */
 #define NAND_ROW_ADDR_3		BIT(14)
 
+/* Device supports monolithic reads */
+#define NAND_MONOLITHIC_READ	BIT(15)
+/* Macros to identify the above */
+#define NAND_HAS_MONOLITHIC_READ(chip) ((chip->options & NAND_MONOLITHIC_READ))
+
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	BIT(16)

-- 
2.40.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
