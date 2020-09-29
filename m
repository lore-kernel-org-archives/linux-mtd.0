Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90DFC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:00:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4467A206A5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UgPjq4k/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KaNR1JVA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4467A206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xxAnBu0L8PLQAXubrUAOcyCurk86B4hJGXxhavT/Ils=; b=UgPjq4k/Ubb6aHSCzk18KcPxX
	FJb0mBAjZb2QF5xRqvIxE2BytdL9iBTZQb31AQ8qDEGAuKB3UYfhAMvE+OX2A2YSaVK5/2HVleUmy
	voQWN/EPA1UgL5MKdSNpuPdY2CT1jZfCiA5TEno1HojJUq9IwBfYyluNbqWqNTIFsmUsYscYhQ4ar
	HbIDaatWwCd/XI/YvmrwScFd2IXuioqt7z/frjafQ4gI3qUav2gYDdXrcosi6cO5k7iu37pDCjFsD
	uQrRb2r4tVBNvWOqkw5PIlyBZ9M5bJ6MuhfYsI0JUoGB+I84qTgZaujk/oDj1CsTjMPsXGf5JlXE7
	gtopD7ZLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNCQa-0003zY-P6; Tue, 29 Sep 2020 10:00:08 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNCQR-0003xL-U1
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 10:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601373600; x=1632909600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cu69HIcgGSdlgNuwF6Hj+SbTIxuPhxtas1dOTY7FDXA=;
 b=KaNR1JVAN/CYLZZxBiNnuoc1dVmlrahmnLlmmPs61SHP3MqJPoKNVi9r
 CLg3AWOuATN8Z3XPPLBvR54kNnhyRO81wpR+vrTaEVKof+rHDa1a/1a+t
 NoRzGbSsaghfDMnCSMkI8wuqlPxkx/WmdbSkTrGBphCqKPB4z6M1dfetS
 iBbLomgIR0h47zvL5zKnzDJ+rnZ6IpIfzaCOKYCqLnOeZyAbjLmjs3qMT
 q/5K3z8ezWIMyVB/sApec4WSOLBECMUpfwBrngWqNDiEc4X6PFcBBAV66
 OQ3eTJvXcYWmCK5X5A+t8NLqHIXaN+pyy1xcj8A15f5qGI9ypQyM3JzDy Q==;
IronPort-SDR: j4sKAl3FTdf4+QbHv7XYJHwqRp08gLHFmKENBn3POez2WgR5k1TBd8Kh5XEfCUOhCFsuztG+YR
 jDX53CUGHQ3v/rKaoxKkljujYXwrh0AqtQAQvwHegqICdKFMuBkE9t6TY6rHH//+5dWPYsufHw
 vvKJjtrLcfxtb+COOXLXom8AquanXMUZMrXkeHLqiZeValMn0rDZkx7ebiepEmaWtoL1X9fK/j
 QDQf3I1rPx96aYEPNYWuI1ngf9NOuVm4rRhKTseSnCl3KM/PuUWqTYVcepcN9Ln0iPIKkai1tq
 jjM=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="92761633"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 02:59:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 02:59:49 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 29 Sep 2020 02:59:47 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: [RFC PATCH 2/3] mtd: spi-nor: Introduce
 MTD_SPI_NOR_ALLOW_STATEFUL_MODES
Date: Tue, 29 Sep 2020 12:59:50 +0300
Message-ID: <20200929095951.1575658-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929095951.1575658-1-tudor.ambarus@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200929095951.1575658-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_060000_369687_019A85A2 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some users may teach their bootloaders to discover and recover a
flash even when left in a statefull mode (a X-X-X I/O mode that is
configured via a non-volatile bit).

Provide a way for those users to enter in stateful modes. A reset
or a crash will leave the flash in full I/O mode and if the bootloader
does not know how to recover, the SPI NOR boot will be broken.

Flashes that will enable stateful modes will be accepted only if a
hook to recover from the stateful mode is provided in the kernel.
With this, even if a user will break its SPI NOR boot, it'll be able
to recover the flash at the kernel level (on those systems that have
at least another boot media). Both the Kconfig and the acceptance
restriction are needed, so that we don't end up completely hopeless
and look at a flash for which there is no software to discover and
recover the flash. Even if we can recover the flash from a stateful
mode in kernel, entering the stateful mode is still dangerous if one's
bootloader can't handle it. We need a way to pass the responsibility
to the user and let him decide conciously about the risks of allowing
stateful modes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/Kconfig | 10 ++++++++++
 drivers/mtd/spi-nor/core.c  |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index ffc4b380f2b1..ab62457559b2 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -24,6 +24,16 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 	  Please note that some tools/drivers/filesystems may not work with
 	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
 
+config MTD_SPI_NOR_ALLOW_STATEFUL_MODES
+	bool "Allow stateful modes (DANGEROUS)"
+	help
+	  Allow the flash to enter in full I/O mode via a non-volatile bit.
+	  A reset or a crash will leave the flash in the full I/O mode and if
+	  the bootloader does not know how to recover, the SPI NOR boot will be
+	  broken.
+
+	  Say N, unless you absolutely know what you are doing.
+
 source "drivers/mtd/spi-nor/controllers/Kconfig"
 
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c149b318e2e8..e89c3ea9a736 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3089,8 +3089,10 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
 		return 0;
 
+#ifndef CONFIG_MTD_SPI_NOR_ALLOW_STATEFUL_MODES
 	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
 		return 0;
+#endif
 
 	ret = nor->params->octal_dtr_enable(nor, enable);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
