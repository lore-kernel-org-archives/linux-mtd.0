Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C00CD1284
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ba896EtuyORlqW9D26/P64N7j6oBUWIA9dfvbxZ8OU=; b=gjzH1fxnVopc4m
	rf6LRHOCcfyBs/ZRP97wCZE/IQ/DT1i2iNIStSHD779yT+MKjlkSifzCMRRJwME38QV4qY/XbIvd/
	H5UUWrnbMjg1giH+yiOLlZjGmQXLVxImYpQ7ojGYf5gbpIt+CSQr7F1PJ55EPFoQa+nnk5f2Fms5n
	ge+hAY36FqOxJCRUrXcidYH180rlNgcFXwzB1WEuhMU8zx181mY7mY5OBB6xGGCdLGFhOMWI07qXT
	tPZCgr+tSiXRkSjlyxlfftTy5OJCeKXG8CQSSWlNN+ZUk6IZG/nRn1yKe9TbKh1h/uahdAziiMEsx
	Kd4pfOX4dcI3x9VyGhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQmB-00000008SjU-2Zai;
	Wed, 27 Mar 2024 10:44:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQm6-00000008SgC-2ZqY
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 10:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B20C3CE1BD3;
	Wed, 27 Mar 2024 10:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD69C433A6;
	Wed, 27 Mar 2024 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711536291;
	bh=rpDdqi9H/9+yY97geGXJz7EymWFNjuM/TNqVLXbS7jY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EaSyHLv0YBqbe9fVrkSH3v+BogorJ/tul+/vfmFQyBVy3K0z0BQAWZ/UxkgWyRd+U
	 9w4TUes1a6QzbMSN3J6WAruOwCVl9JKQVFxg1PDj+bey/nteHCS2eEfDHpI3z0kVz4
	 ZuOTg66TvPaDncMlAenMyQ+riPGyUl7v4dTv6wIk92PBISpgDQRBFW196PRqX/3vau
	 2HtNGHROfvFrVgGgi0Jl5sODTE16XQsoehOGpJBPzVl11JWi3l/N9hqdZTeICQe3Eh
	 /HbkaVxgE/WvjQhL0QTAvgN2YihiYJKfirwK5rY0OmcDuf9pw2NljXfolGjtpaPHNd
	 3K6H/U1JZHi3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE9DCD1283;
	Wed, 27 Mar 2024 10:44:51 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 27 Mar 2024 18:44:00 +0800
Subject: [PATCH v6 2/3] mtd: rawnand: Enable monolithic read when reading
 subpages
MIME-Version: 1.0
Message-Id: <20240327-loongson1-nand-v6-2-7f9311cef020@gmail.com>
References: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
In-Reply-To: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711536289; l=2162;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=lS2LSZ/s5Z4DeAh+vHqnlTAlI1Wu1nzKK/BPFHeBtfc=;
 b=jswAkTrM2ib8XVP9hzAqLEdJrjizPymy8TfvB7eIXISh60W8V0vf2sTb+pWo5AXZDxYFqVxq0
 TOgwt6PbWkYD9qEkmXxlJXaJWaV/TZCv+eBZKcqpxkLIwTTX4oWrFmH
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_034455_144312_E305FA1B 
X-CRM114-Status: GOOD (  12.82  )
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
