Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDADC61DCB
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2026 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYNdwgH3d1h0zCKen3zemculNQcM7yX5XnI1djmlZeg=; b=rd4/x1GrvtW3tt
	AqTAZofMuYoUInqbLMYBa1Lw+uVUKcbnktpPQbZvOZRu0LvYkacebVsHWyh7j3GIck/cQcBjIHimH
	rtKj8ebaFVNdL34xvNrKIDLg2vE/IVxKQV9rYOR++Np4qoFHgUNDJY6ujTzjMdM9L2KHhQrK916te
	e0XuPe4boQZqUqdXogAUnleiD5MWQ7aJLzqVQzaKMRc7RNu13OE7NRNLAncXiB1CaxHVgwxf6Tgs8
	NA/u2aZoU5lxt/PJChzxJ26FxfALgIEppuxZgCZPSaShAJkxBJEmbUbdcjLP0IpAOl8cPWCvkTXNE
	SxDArVywU0XB+LIN+rSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x07Uv-00000006ZC1-0dlL;
	Sat, 29 Aug 2026 01:04:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x07Us-00000006ZBc-2MZM
	for linux-mtd@lists.infradead.org;
	Sat, 29 Aug 2026 01:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDA8C447D4;
	Sat, 29 Aug 2026 01:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6D43C2BCF6;
	Sat, 29 Aug 2026 01:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787965477;
	bh=wnU3s+PY7ZNxdKFVmGRin9VkrUvIoJthhqJ8bKEVwTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lO1Loyky1yafw/YKJFYgfsyow4GYg920D6keIGv/KY1zTWFveA6M9Rmxk9EuMbMGq
	 wxHHvltYy+zhTbwnYX09mfPBF+nYvoMr0khAs6r2AUYTy9MB+4oR+rnQHcVExNT+7a
	 sakP2Ah5SO80/pt+1xoJVi9nQp986IhoNDpqZCMjBm9WIBUbYMaNjyGZRhlNOIlNiI
	 xBhuRltNs+gTRELygG/uXr/Q9YgrCsdvPAoBwwaVZdHMpW645+TokicpHHhc/smRSm
	 unNYov79ykRv5frU62leR4vzJ42P1mfpMyWq3ZJ7aSoqDMODeojTB73uJe241h/HRz
	 st1qk+zRsFOlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80986C61DD3;
	Sat, 29 Aug 2026 01:04:37 +0000 (UTC)
From: Tobias Jakobsen via B4 Relay <devnull+tjakobsen84.protonmail.com@kernel.org>
Date: Sat, 29 Aug 2026 03:04:32 +0200
Subject: [PATCH 1/2] mtd: spi-nor: allow the platform to supply write
 protection state
MIME-Version: 1.0
Message-Id: <20260829-spi-nor-platform-lock-v1-1-cd362d4914e2@protonmail.com>
References: <20260829-spi-nor-platform-lock-v1-0-cd362d4914e2@protonmail.com>
In-Reply-To: <20260829-spi-nor-platform-lock-v1-0-cd362d4914e2@protonmail.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Tobias Jakobsen <tjakobsen84@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787965476; l=5341;
 i=tjakobsen84@protonmail.com; s=20260829; h=from:subject:message-id;
 bh=UHLaWTixtcU+k1LSS+E9v9r7hrQI/HQPhvP207K3ckc=;
 b=Uc6lZZVF5l+oa1XBG2QK/BZpMBVQdT7Qg/6dqsmR7YyvjNV08simmoHiRb+3omLFJzKFQtWHc
 Y/MO/PaaGykBXxyYOT5YnunkGFGSnmR9LQJng5ZjWBG3BLxnMaZuOfR
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

Some flashes are write protected by the platform they are attached to
rather than by their own block protection bits. An Intel PCH SPI
controller programmed with protected range registers is one example: it
refuses writes to a range regardless of what the chip's status register
says, while the chip's block protection bits are typically left clear.

MEMISLOCKED therefore either fails with -EOPNOTSUPP, or, once the chip
gains SPI_NOR_HAS_LOCK, reports a range as unlocked while writes to it
are in fact being refused.

Let the platform supply an optional is_locked() callback in struct
flash_platform_data, alongside the partitions it can already supply, and
prefer it over the chip's own block protection bits. This is independent
of SPI_NOR_HAS_LOCK, so an answer is also given for chips that have no
block protection support of their own.

lock() and unlock() return -EOPNOTSUPP, as platform enforced protection
is not expected to be changed at runtime.

Platforms that do not supply the callback are unaffected.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221927
Signed-off-by: Tobias Jakobsen <tjakobsen84@protonmail.com>
---
 drivers/mtd/spi-nor/core.c | 52 ++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/spi/flash.h  | 12 +++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cd..a5c37eea4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3001,6 +3001,50 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 }
 
+static int spi_nor_platform_lock(struct spi_nor *nor, loff_t ofs, u64 len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int spi_nor_platform_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int spi_nor_platform_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
+{
+	struct flash_platform_data *data = dev_get_platdata(nor->dev);
+
+	return data->is_locked(nor->spimem->spi, ofs, len);
+}
+
+static const struct spi_nor_locking_ops spi_nor_platform_locking_ops = {
+	.lock = spi_nor_platform_lock,
+	.unlock = spi_nor_platform_unlock,
+	.is_locked = spi_nor_platform_is_locked,
+};
+
+/**
+ * spi_nor_init_platform_locking_ops() - Use the platform supplied write
+ *	protection query, if there is one.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Some flashes are write protected by the platform they are attached to rather
+ * than by their own block protection bits, for example by an Intel PCH SPI
+ * controller programmed with protected range registers. In that case the chip's
+ * block protection bits are typically left clear and say nothing about what is
+ * actually enforced, so prefer the platform supplied query when available.
+ */
+static void spi_nor_init_platform_locking_ops(struct spi_nor *nor)
+{
+	struct flash_platform_data *data = dev_get_platdata(nor->dev);
+
+	if (!data || !data->is_locked || !nor->spimem)
+		return;
+
+	nor->params->locking_ops = &spi_nor_platform_locking_ops;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -3040,9 +3084,13 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	spi_nor_init_fixup_flags(nor);
 
 	/*
-	 * NOR protection support. When locking_ops are not provided, we pick
-	 * the default ones.
+	 * NOR protection support. Platform enforced protection is preferred
+	 * over the chip's own, as the chip is not necessarily aware of it.
+	 * When locking_ops are not provided, we pick the default ones.
 	 */
+	if (!nor->params->locking_ops)
+		spi_nor_init_platform_locking_ops(nor);
+
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
 
diff --git a/include/linux/spi/flash.h b/include/linux/spi/flash.h
index 2401a0887..f415e2c0b 100644
--- a/include/linux/spi/flash.h
+++ b/include/linux/spi/flash.h
@@ -2,7 +2,10 @@
 #ifndef LINUX_SPI_FLASH_H
 #define LINUX_SPI_FLASH_H
 
+#include <linux/types.h>
+
 struct mtd_partition;
+struct spi_device;
 
 /**
  * struct flash_platform_data: board-specific flash data
@@ -11,6 +14,13 @@ struct mtd_partition;
  * @nr_parts: number of mtd_partitions for static partitioning
  * @type: optional flash device type (e.g. m25p80 vs m25p64), for use
  *	with chips that can't be queried for JEDEC or other IDs
+ * @is_locked: optional callback to query write protection enforced by the
+ *	platform rather than by the flash chip itself, for example a SPI
+ *	controller that gates writes to a range of the flash. Returns 1 if
+ *	the whole range is protected, 0 if it is not, or a negative errno.
+ *	When supplied it takes precedence over the chip's own block
+ *	protection bits, which do not necessarily reflect what is actually
+ *	being enforced.
  *
  * Board init code (in arch/.../mach-xxx/board-yyy.c files) can
  * provide information about SPI flash parts (such as DataFlash) to
@@ -26,6 +36,8 @@ struct flash_platform_data {
 
 	char		*type;
 
+	int		(*is_locked)(struct spi_device *spi, loff_t ofs, u64 len);
+
 	/* we'll likely add more ... use JEDEC IDs, etc */
 };
 

-- 
2.53.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
