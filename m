Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6A2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVAEYE4XPBFFeE/PoEXEtTB3xpa9+romM5nDZ+C9Qmg=; b=DRIrf9AKJcbSeB
	7aZH83l9lfzMPY0I11Tga25t+8DUKaJTESm/vcI6iTmNo3UIZwAOl6IQ9i/Tat0NM5eej2tR3Uwjc
	Xd7R8PrP1PpNK/IZErfQCyjZmQZJ+vG6cA2KtuXltXygzUPVVPlsdgNC3BTSJsVCKdIomGNzpvkNe
	Ak6UuefHzokGWHwQz3dEWCwpIMBEmeziqCv0Fc8TqDk9B/NnGEWDrNYQxnCQAvicHI5F5zIp5HClw
	FM7W8eJk3c5UGQrX7+8YYVvszupSEsV4AVBdvUPGLj4M/NEPPhONat8lyaW6+wgoq+GyIL+CSyMKU
	eIFfC8dgASAfV89fvkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uFy-004vym-Jp; Fri, 07 Jan 2022 18:46:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uFw-004vxZ-7z
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id c3so5529115pls.5
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XB3qeJcSBcf8eMlXphifoGBmW/0nXSWJUuM6PxhB61Y=;
 b=gqglK9N7NIsjzh9fOC0WbaxR2rJcQ4cpFdn+N3B+VaQnr03ZwH7/818GkcX4KZoY16
 tnAHr6bF5ni7u5pi6/Dq2h6EMTjpbbFJFisBj+EEIK7oYy+TY79claJIfbZEL1op5+Nv
 IQrZ+TnYS8CAg2YW55LjHIJ5397SODhNI0k0aEGXAJFu6Nsu9U5gw3sODBBiQJR73VQS
 MUAAnS6bKly9zs0nHxP9qCGNkDJk7C+Up44cISI1SOjB/xecVfUqNpEBLB0kybUjqCcB
 ovH32HzaRMSGAPVL/d4TzmDdRRyKrxND8eJKWvxovIVw15ushuCaVa65HQgowm+DAUuQ
 OOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XB3qeJcSBcf8eMlXphifoGBmW/0nXSWJUuM6PxhB61Y=;
 b=tL191JmZ8XsprL7MNRZj4vRUTLedjojCySn/2RUFlHngI2VOY1+0slnNfNFveb6cEI
 cHhwXPRu4H6toLi3bptXUmn7mM7dB1mrsen/35ZLMvdUuvMVBdc0iTE0nlyvoDvS7RjB
 C/Bd5pMttLDqbBhnN4akfg5I0vXf1nf5ubqxo0ln3mcpH5JH+mnWQ3wwUDu7td1nj393
 +RN5quD7e8Gs3psTiJCFtPKJ0Q4U6Fr4cBdmUtIzOnUqAhNA6KzKYN+ZGRsOK63jtmuY
 j/i+fh01ReESW43GH3i1R55reGPYq9LVjoVrY6BPp3e/1CFn1OB9fVaW5nTh2hqCMvL7
 2x8A==
X-Gm-Message-State: AOAM531gdpfybxB0gmiz3/qTzrRfUUoo91nDam/BL/GidqZBE7DF746X
 oteXC0G3QueaKfr5oH47QHpBpRp7uOY=
X-Google-Smtp-Source: ABdhPJxMLXEYriYmlPKoBveSZPW5smrNCmITAocarOohLpy1timn0pdDfZwRwiMzquronYWF6W5MoA==
X-Received: by 2002:a17:902:db03:b0:149:50cf:d591 with SMTP id
 m3-20020a170902db0300b0014950cfd591mr65326057plx.112.1641581186055; 
 Fri, 07 Jan 2022 10:46:26 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:25 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v3 0/9] BCMA support for brcmnand
Date: Fri,  7 Jan 2022 10:46:05 -0800
Message-Id: <20220107184614.2670254-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104628_315557_0A69FBE3 
X-CRM114-Status: GOOD (  20.74  )
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

Hi all,

This patch series adds support for the BRCMNAND controller revision 3.4
embedded in MIPS-based SoCs such as 5357, typically found in the Netgear
WNR3500L v2 and other kinds of Wi-Fi routers. The upstream platform that
uses this controller is under arch/mips/bcm47xx/ and does not use Device
Tree (and probably never will by now). BCMA (Broadcom AMBA) is a special
kind of discoverable memory mapped interface which requires the use of
special accessors to read from/write to the hardware block.

The integration of brcmnand into that SoC is a bit quirky in that every
register offering byte level data about the flash (OOB, device ID, etc.)
requires byte swapping. The command shift should also have been 24, but
is in fact 0, took me a while to understand why no reads were actually
working because of that.

This has been tested with Linux 5.10.82 and Linus' master with OpenWrt
and confirmed that the squashfs + jffs2 overlay that OpenWrt creates is
entirely functional and that written data is made persistent.

Changes in v3:

- fixed a few typo/grammar errors in the commit messages, mention when
  changes are non functional changes
- removed the stray hunk in 2 to enable the static key

Changes in v2:

- re-ordered the patch such that the soc variable is initialized as
  early as possible
- corrected bug in the conversion of brcmnand_init_cs() which
  incorrectly used the wrong device_node variable (parent instead of
  child)
- took Andy's feedback to make the test for a valid interrupt to be > 0
  while calling platform_get_irq_optional()
- utilized static branch (disabled by default) and conditional
  compilation and confirm with disassembly that the generated code is
  as efficient as before if not enabling the BCMA shim and as efficient
  as possible if enabling BCMA shim
- updated BCMA shim driver descriptor, author and added helper function
  to encapsulate the container_of usage
- added comment to explain why a slightly different platform device name
  is used for the 5357-style NAND controller

Florian Fainelli (9):
  mtd: rawnand: brcmnand: Assign soc as early as possible
  mtd: rawnand: brcmnand: Allow SoC to provide I/O operations
  mtd: rawnand: brcmnand: Avoid pdev in brcmnand_init_cs()
  mtd: rawnand: brcmnand: Move OF operations out of brcmnand_init_cs()
  mtd: rawnand: brcmnand: Allow working without interrupts
  mtd: rawnand: brcmnand: Add platform data structure for BCMA
  mtd: rawnand: brcmnand: Allow platform data instantation
  mtd: rawnand: brcmnand: BCMA controller uses command shift of 0
  mtd: rawnand: brcmnand: Add BCMA shim

 MAINTAINERS                                 |   1 +
 drivers/bcma/driver_chipcommon_nflash.c     |  20 ++-
 drivers/mtd/nand/raw/Kconfig                |  13 ++
 drivers/mtd/nand/raw/brcmnand/Makefile      |   2 +
 drivers/mtd/nand/raw/brcmnand/bcma_nand.c   | 132 ++++++++++++++++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c    | 160 +++++++++++++-------
 drivers/mtd/nand/raw/brcmnand/brcmnand.h    |  29 ++++
 include/linux/bcma/bcma_driver_chipcommon.h |   5 +
 include/linux/platform_data/brcmnand.h      |  12 ++
 9 files changed, 321 insertions(+), 53 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/brcmnand/bcma_nand.c
 create mode 100644 include/linux/platform_data/brcmnand.h

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
