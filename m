Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDB6C3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 21:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Inu83gBuCZwqNvXF5FRdxmm9kqzX5xOHf9nhg0yVQ/Y=; b=3CadjXIbMEiDDV
	1YV4ujEQBu7cClXDyrO9ju+BI/hraplqO+ZYTXRtS2h/MbaiDM0C+KPNIgTVMDLXdB5/WPDeYA7HD
	arqii3l6fUa8vwJodT0UPApoKVMchS0ufabmdGvqVb9v6pN/+/GjB2CyQN/l1QIyH+i5D7RPmmdTG
	dsggKlYNM7TGy0LgPBLv3iGk9pZM0jbvZVWrFmKU0Nb0iBqPOKrqcx0uWpOe7b70WFC6K2KBFDRam
	ahU7dGe/sLbCeyEoiZdNiV5prIdJGi1U77WWZA3eUwCW/Fkz3snSSBc3N9VFdzfsxqdVzkpGdxyBl
	lVvjznnuJIAKHGPugEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDY0k-00FDk8-8w; Thu, 05 Jan 2023 21:42:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV19-00DciS-Ck; Thu, 05 Jan 2023 18:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kRXVuRpvqaphclmK+hkq1NkqgK+M2BOh8YfObS2FkKM=; b=keeb5/S/psFsc1D7GkVW39Bw3F
	Y/j71xs2xKdH1+qTrPfcqJRXD0fXgqrtGvy8+1ztkX0+Jc0t1CkztYkxzc9CAWkaDaYnvro3ro4DA
	TPudwrpu4RxdZY1sbDfi30U63gfBpvRqBpZK44Y32TamlUQVBqOIafGypMqmjP58PoufitkLGWe9D
	1d852uFRyhJuJV21bBbksJQU0u0T8a4FH7G+hYeAk9hfSsaN7XYIINR47fyDo5pIbNH9PNqISVBTl
	Cf7mWzaJgUUEd5we8CDJKAvkcc4cmF2zYoCb0k4E45gOJ9fixUgUDqC66H7eM9fdPCX0Lfx5mvrw1
	mTAYutPQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDQai-001M5b-1S;
	Thu, 05 Jan 2023 13:47:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E32B61A8A;
	Thu,  5 Jan 2023 13:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D14FC433F2;
	Thu,  5 Jan 2023 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672926456;
	bh=g5Ktac+x1WGnROCjyNkddZbbPKWiUR9G99wt906iw8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gViws4OEe4zM6qcAS0UnXS2+/1WszliXtvKxww8VZLvGh98sQBsfici0N9eZxla9K
	 ecWwuQNy64kkQ5m+503yV7Mr4GfjC4lRogui6olzhYA8eGwpnH8YVg1pd0gqbszlsK
	 Ia7XTX3rFDgkez3DJmAIqM/9c3XSNHvYrqHUFXFxs86MhozWMtPDAuGv2HeatyVSKa
	 bZjXe7swuB2k1P4RI9bAHLaI6xPVBA/E44hTVo57SmRpmuR0VfV6flGWJ9FqwaGJrl
	 mCsvt57IhfFJmTHiyTgW0ZxyaGRPbsG+TNzTgEvFCXI+KvB8tEvmaeaX802mU9+d/R
	 fi3IctlTmQaqA==
From: Arnd Bergmann <arnd@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 20/27] mtd: remove tmio_nand driver
Date: Thu,  5 Jan 2023 14:46:15 +0100
Message-Id: <20230105134622.254560-21-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134622.254560-1-arnd@kernel.org>
References: <20230105134622.254560-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_134732_857027_79960092 
X-CRM114-Status: GOOD (  15.37  )
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

From: Arnd Bergmann <arnd@arndb.de>

With the TMIO MFD drivers gone, the NAND support is also
obsolete and can be removed.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/Kconfig     |   7 -
 drivers/mtd/nand/raw/Makefile    |   1 -
 drivers/mtd/nand/raw/tmio_nand.c | 533 -------------------------------
 3 files changed, 541 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/tmio_nand.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 048b1c8f08ee..170f1185ddc4 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -193,13 +193,6 @@ config MTD_NAND_PASEMI
 	  Enables support for NAND Flash interface on PA Semi PWRficient
 	  based boards
 
-config MTD_NAND_TMIO
-	tristate "Toshiba Mobile IO NAND controller"
-	depends on MFD_TMIO
-	help
-	  Support for NAND flash connected to a Toshiba Mobile IO
-	  Controller in some PDAs, including the Sharp SL6000x.
-
 source "drivers/mtd/nand/raw/brcmnand/Kconfig"
 
 config MTD_NAND_BCM47XXNFLASH
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index fa1d00120310..917cdfb815b9 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -23,7 +23,6 @@ omap2_nand-objs := omap2.o
 obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
 obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
 obj-$(CONFIG_MTD_NAND_MARVELL)		+= marvell_nand.o
-obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
 obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
 obj-$(CONFIG_MTD_NAND_PASEMI)		+= pasemi_nand.o
 obj-$(CONFIG_MTD_NAND_ORION)		+= orion_nand.o
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
deleted file mode 100644
index 8f1a42bf199c..000000000000
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
