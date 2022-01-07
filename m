Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367FFC433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m2ZudHeOQVPbuuYdBpHrW57ejcEFU5aC/BBvGskSGcw=; b=bnlS2y2bxpebov
	EzlyJRYmluWhGC3JaTTK/WhLAqwLBeQ4byAeLYKxZOXc7DMdBJvB1GOIGM4oCXIJVU/NyZqwT3q/G
	2CLtIeZbo8KF3ZjIGv2W2KTfpdUEM6UbnD3ff2CTV9t8NH3cW6AJIlMnUvG4uYli49jOA8TEqDsWy
	kVQSZkhYRdCH/vRZG7zOblfPjNKoxm1XD3YwY35nfdVzzuUO+PDr/enZf+C/MxOKl4mH7e392QsX8
	KpAODusJ4zYfy6pM5GhCgzoMZ5EjejBN7XPNXBdxtvCPfY40pMtCxuP17Mcgp57FJCa55HNePfdo7
	V7haG0jcNqwHKZiIue1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ctR-001d6G-Kj; Fri, 07 Jan 2022 00:14:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ctO-001d4s-Tq
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso2978852pjo.5
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bHp8KHmssnLYTaOK1agSupyvSqkjwpt0DTwhR+0qxuQ=;
 b=OXC+WfjOI7Dw/780ZlSKKOJzpuyxzgwPvAn3vd5y6IIL5/USBcS/+EaFEydk/P9fQW
 I8seI4B9zA0/MGxPODSkOM9ZDZRH+cO8KQ6b0oDrQXmRtDE/44L5wYuaL8ZxDwXL1G3K
 b3XBMgo5lMG9hXK0h5wObvGX5v+4NIBh7krq4ad1ieKoJ4O1jP44XxoEhjGH9jcwJwhz
 ty6BtKXTF2hpc/1tgHTjkmdSf8x0jYj8LiAj69jCG2AOoYo1Q2ZvMX496O7PmOjiBO3d
 CXkf7I9yF7IPB7Qo40feEfYj8pP6Qk3Qido+AHnwlFaM4t/7xP77Vr+tN10CWwrCcs2S
 m5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bHp8KHmssnLYTaOK1agSupyvSqkjwpt0DTwhR+0qxuQ=;
 b=iP2rfM7ah+25OIIwBbTMtbpNXkMkVe5Rg+Pgr2ex8TRfWegLdmvCrOHMooDJX0bZvX
 3VWw+7n6+VMXfIXj7lQmKjKASjJAXv86Ci1InSfYmdknyYlwh3XMmgZc1+cRitiaQNmy
 IkuuteZU6dQddxzhvkMwd3X0lHTRz6iq89/0E77k+ySkgQTL4gHOtB+v3qEDmwrtmEIz
 7WDAMvxzF07d2dFxdyC/XHlJRSdHx7f4jp8e2M1yPEi2Sp+9i7OFHasOCzWKy4jo9tG2
 0J2LxVEXczl2OV0XX1NnE3ufp8e/Q7x7ZPk4bryp9ilKfU7ZrguBPdy5ZSxrw+shr9wb
 s9uQ==
X-Gm-Message-State: AOAM53195xp4j0S460OtU7esFcBQ1X29rcvJD+l/xdv6UmztkpY/lHL9
 fxSNoyGhnV0FSBDA1/fLzEd2ldq4cOo=
X-Google-Smtp-Source: ABdhPJxs5ngIS8diKlG5kij1EnlAAnRL98ICjCAo5rn2ZWpvA4FWNRG7fhGUSWexig/0VqQWjrMFHQ==
X-Received: by 2002:a17:903:300b:b0:149:f48b:e8b8 with SMTP id
 o11-20020a170903300b00b00149f48be8b8mr4420991pla.108.1641514441399; 
 Thu, 06 Jan 2022 16:14:01 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:00 -0800 (PST)
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
Subject: [PATCH v2 0/9] BCMA support for brcmnand
Date: Thu,  6 Jan 2022 16:13:19 -0800
Message-Id: <20220107001328.2233896-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161402_987293_C3F6F4EB 
X-CRM114-Status: GOOD (  20.14  )
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
