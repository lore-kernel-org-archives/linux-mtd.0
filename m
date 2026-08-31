Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0911C61DE2
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMrJ3ZcUhiAuc+oO7R8ICmeTPMsaU9ALCZsAdQLh6P8=; b=Fr7FMg4IVzt1Bg
	mewVRSY4qWKlPLiy3Jh19rcHw7N+Y4A5dy/wJcVaTW7qcoP3W1Z469BfphalsG9DY+yf5RULKXXED
	fQCOsolDL0UwuB+Xf077TldM//RSHN7kB+0lLFZWpzYH4HfRYWdAVnRkR4jtAs4fzWxsEwxrvI6sc
	NlUTIJVH8Fcl6kJgjQA6+9x9baM+uh9IQEDevAcfEv9THWkhL42ZV/MOlYkyliE6Pq2NM3JtdxpQx
	2nXlE65nR4/XJr6FbxkCNcRd05zdy5OvX9jGHO3vjCk/UsjdYFBwdjenLYlWbUfNNRk0ljp2z/ZJS
	BE9dLsKaY7BxWiuDOUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10lz-00000009GGx-0S0O;
	Mon, 31 Aug 2026 12:05:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10lw-00000009GG3-2HYO
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF51F43D7E;
	Mon, 31 Aug 2026 12:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AC5CC2BCFC;
	Mon, 31 Aug 2026 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788177955;
	bh=F1+FfGZtXVn4f1NtX43blQ71NZ9In0wKXvLvW0MwbMA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eEP7hGCf2RnkcowUWTG9HlNAT8XX1/7GSwl7E9hFgEy1eTv2c8ovHcKHxsUbpFrEe
	 Rpx1AQrVXJsI6LFFhEgqcPW//MQxGr+qGv5u0Edw9V/v64GvkriRPI+0j4Fn5bSk1r
	 ghV4U8Ooc5Y/nP0y5TE4mxZQpQekCe0E3Zv/1i5Pl+8i8d6rSiBDg9ScPgZKCjgTlx
	 MqaDeQDm52wzw4AzqKDycYBqO7/3KtThxWUZBbSP2gFtUOgfF0TJYJMV6RU/d5kEEH
	 1yGlgzbDxRgvX0JgueClN9ahx9bngPPqIQEgmv4VP9ZeWANoQyHgj6vO+Luru3P/ed
	 PBO0Ct9pHmCDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA32C61DD3;
	Mon, 31 Aug 2026 12:05:55 +0000 (UTC)
From: Tobias Jakobsen via B4 Relay <devnull+tjakobsen84.protonmail.com@kernel.org>
Date: Mon, 31 Aug 2026 14:05:52 +0200
Subject: [PATCH v2 2/2] spi: spi-intel: report controller enforced write
 protection
MIME-Version: 1.0
Message-Id: <20260831-spi-nor-platform-lock-v2-2-6cc75b909241@protonmail.com>
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
In-Reply-To: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Tobias Jakobsen <tjakobsen84@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788177954; l=4515;
 i=tjakobsen84@protonmail.com; s=20260829; h=from:subject:message-id;
 bh=hnJ5ZrAUjiYnonyAjO1RxiM6tEYPy3JJWHB4oxKDt+M=;
 b=aHxQRdIuNRun/v9aWrq5iqZrpjZYWvw0mh/38zfg43Dy5itL94mf6v9Qy7SNUU5E4REshttif
 mO+Xbpon6q3AqtO4/rjM9wyeGg+gsIChC02ii7a8+kBgmdnItgHaa8M
X-Developer-Key: i=tjakobsen84@protonmail.com; a=ed25519;
 pk=UREd6cisfwsFIDP455nUH6Ysx+ZDGnAVE9nGmKzm1Ks=
X-Endpoint-Received: by B4 Relay for tjakobsen84@protonmail.com/20260829
 with auth_id=986
X-Original-From: Tobias Jakobsen <tjakobsen84@protonmail.com>
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
Reply-To: tjakobsen84@protonmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tobias Jakobsen <tjakobsen84@protonmail.com>

On Intel PCH platforms write protection is enforced by the controller's
protected range registers, not by the flash chip's block protection
bits, which are typically left clear. The SPI MEM conversion left
spi-intel without visibility of the MTD device, so it cannot supply MTD
locking operations directly.

Pass a write protection query through struct flash_platform_data, which
spi-intel already uses to hand the partition layout to spi-nor.

Note this asks the opposite question to intel_spi_is_protected(): rather
than whether a flash region contains a protected range, it asks whether
the queried range is itself entirely covered by one, which is what the
MTD layer means by locked.

Tested on a Coffee Lake i5 with PR0 covering 0x860000-0xffffff and
FLOCKDN set, querying MEMISLOCKED over four ranges:

                               PR0 range  whole chip  in PR0  below PR0
  unpatched                       -95        -95       -95      -95
  chip lock flags only              0          0         0        0
  patched, no chip lock flags       1          0         1        0
  patched + chip lock flags         1          0         1        0

The whole chip and below-PR0 columns stay unlocked because only
0x860000-0xffffff is covered by a protected range.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221927
Assisted-by: LLM
Signed-off-by: Tobias Jakobsen <tjakobsen84@protonmail.com>
---
 drivers/spi/spi-intel.c | 68 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index 7494b921a..63639f742 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -1201,21 +1201,36 @@ static int intel_spi_init(struct intel_spi *ispi)
 	return 0;
 }
 
+/*
+ * Read protected range register @idx and decode it, provided any of the
+ * protection bits in @mask are set.
+ */
+static bool intel_spi_pr_range(const struct intel_spi *ispi, int idx, u32 mask,
+			       unsigned int *base, unsigned int *limit)
+{
+	u32 pr_value = readl(ispi->pregs + PR(idx));
+
+	if (!(pr_value & mask))
+		return false;
+
+	*limit = (pr_value & PR_LIMIT_MASK) >> PR_LIMIT_SHIFT;
+	*base = pr_value & PR_BASE_MASK;
+
+	return true;
+}
+
 static bool intel_spi_is_protected(const struct intel_spi *ispi,
 				   unsigned int base, unsigned int limit)
 {
 	int i;
 
 	for (i = 0; i < ispi->pr_num; i++) {
-		u32 pr_base, pr_limit, pr_value;
+		unsigned int pr_base, pr_limit;
 
-		pr_value = readl(ispi->pregs + PR(i));
-		if (!(pr_value & (PR_WPE | PR_RPE)))
+		if (!intel_spi_pr_range(ispi, i, PR_WPE | PR_RPE, &pr_base,
+					&pr_limit))
 			continue;
 
-		pr_limit = (pr_value & PR_LIMIT_MASK) >> PR_LIMIT_SHIFT;
-		pr_base = pr_value & PR_BASE_MASK;
-
 		if (pr_base >= base && pr_limit <= limit)
 			return true;
 	}
@@ -1223,6 +1238,41 @@ static bool intel_spi_is_protected(const struct intel_spi *ispi,
 	return false;
 }
 
+/*
+ * Unlike intel_spi_is_protected(), which asks whether a flash region contains
+ * any protected range, this asks the opposite: whether the given range is
+ * itself entirely covered by a write protected range. That is what the MTD
+ * layer means by "locked".
+ */
+static bool intel_spi_is_range_protected(const struct intel_spi *ispi,
+					 unsigned int base, unsigned int limit)
+{
+	int i;
+
+	for (i = 0; i < ispi->pr_num; i++) {
+		unsigned int pr_base, pr_limit;
+
+		if (!intel_spi_pr_range(ispi, i, PR_WPE, &pr_base, &pr_limit))
+			continue;
+
+		if (base >= pr_base && limit <= pr_limit)
+			return true;
+	}
+
+	return false;
+}
+
+static int intel_spi_is_locked(struct spi_device *spi, loff_t ofs, u64 len)
+{
+	struct intel_spi *ispi = spi_controller_get_devdata(spi->controller);
+
+	if (!len)
+		return 0;
+
+	return intel_spi_is_range_protected(ispi, ofs >> 12,
+					    (ofs + len - 1) >> 12);
+}
+
 /*
  * There will be a single partition holding all enabled flash regions. We
  * call this "BIOS".
@@ -1395,6 +1445,12 @@ static int intel_spi_populate_chip(struct intel_spi *ispi)
 
 	intel_spi_fill_partition(ispi, pdata->parts);
 
+	/*
+	 * The protected range registers address the first chip, so only it can
+	 * be queried this way.
+	 */
+	pdata->is_locked = intel_spi_is_locked;
+
 	memset(&chip, 0, sizeof(chip));
 	snprintf(chip.modalias, 8, "spi-nor");
 	chip.platform_data = pdata;

-- 
2.53.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
