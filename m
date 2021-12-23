Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A5BC4167D
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2LeZhnhl6oyR9TqPCO4NLQAYybWJXBLVOFjBhVlp8G4=; b=0MzACLMlXz9yBP
	OQaO+pbmTaxdGvMlEO0Me7+g0MUoZRwdbJij+Mxe1f108ENPqOl8f/eB4QFay4wPt5f4UVysz4JeG
	fU3zAomrJng/rHC1PzxUBybaqphr82qSlQaWWz+38KwBpQEY3LP16vfN4nWUI9RWQm5+wcZZnKy1l
	02BNbfGO61Nd1ad1WdNq67OHQTp52QfiLuCkknFCRhScF44Fc77RLKwS45vbiHoa/n5xqIOmyqJw6
	wRo6a4WMnMs2MpSYKK7shcObSkES2hYVTqwM8CQNp0VB1V4H5egkHYQVa5M/+pDeioFEtU8SmEKE6
	hgRYp4SX98SGqHrHtxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0BsS-00BXfK-2N; Thu, 23 Dec 2021 00:22:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0BsP-00BXeV-M4
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id w7so2498070plp.13
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P39LfhwxkLFrxQ44U3zppl8kfgBNoQrx/J3cE0xenlI=;
 b=K/Ez51dKunsJZ8vBNNFO3KebPxek8mDQ1hC0jf3nixqLPjV4dvpqWn8Iol3nWzoOzc
 pShPnKZ+mjHjBzTNuoKuH/4fto3jz7CtMOjb7vjU+BVTXHqBABOIIVAIlNjvSRngTsp7
 urJ3FfAkuIdI7c5z3QGDDqKghSqfKuoBxaNBUFvTAkeybXsowoL9lbaI/6pjDM4zkaNO
 xRGPZhsUH8Hw5uFesA/7isf1GiZehjH5e9IFpDhlZ1CYfs5onhvwYbeJlQw2IV8/jZL/
 bT7jvwTHYAhunzEdOVlqUcwG1iHuaa0uWeYTh4udQggFvrjcd4+t19ksmcyugT5wr9yu
 k0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P39LfhwxkLFrxQ44U3zppl8kfgBNoQrx/J3cE0xenlI=;
 b=CkaAlx0eFiKGA1x7jNbXf/lFz3fztx/0l8y8hXDsuFKvD4cLM6ujNWrsIXZ2MEvYMq
 +NcMM/ljG6OZp+cxVWNywDyNz/vtJvEadZ1bXXnoQL5WxohJ3qb8peA5Eu5UJ5Lv9wPq
 WDHAjZE6hCVW6TBVFnYkjhFaMbKiA34qiB03NUwrQRaKMWqmY9Qr8/M2w3UrNeapBiQT
 Vr7JAh7h1zn+Hs4m2BxfS91bTq6WwXtmbxjF1qVoCdjRSFIlnoN6dU98T4YlxB8fOJK6
 8m/QwtekdyR6hyIKrXwtncYQ2gay8WwyCKcnnc5A/nOZG+GA5HtybVE7TVmROTs1qYA2
 LGUw==
X-Gm-Message-State: AOAM533aQmZq0lji9p/qYPn7rbYAwYUyPQY77TJRrKuQ5g2b5mWYiIaZ
 LMKOfQnoxjx5nQ2FKpAKwjWiVaoULEA=
X-Google-Smtp-Source: ABdhPJzl57hPs6LxL73Za49Xak/ITCib73mzXMNU4QF6wDYyiYziBWC0LD2Xi3oGfVVURxLLs6ft+w==
X-Received: by 2002:a17:90b:3e8c:: with SMTP id
 rj12mr66383pjb.152.1640218950843; 
 Wed, 22 Dec 2021 16:22:30 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:30 -0800 (PST)
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
Subject: [PATCH 0/9] BCMA support for brcmnand
Date: Wed, 22 Dec 2021 16:22:16 -0800
Message-Id: <20211223002225.3738385-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162233_790020_558AE4FE 
X-CRM114-Status: GOOD (  18.77  )
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

There are a number of open questions:

- the flash that is used is a s34ml01g100tf100 part which is said to be
  ONFI 1.0 compliant however the ONFI signature is not ONFI, but the
  device ID of the flash as if read with address 0, is that a known
issue?

- because no ONFI detection is taking place we fallback to the
  identification table matching, but there is no default ECC
  size/strength filed by the rawnand framework, probably made largely
  worse by the absence of a suitable Device Tree information?


Florian Fainelli (9):
  mtd: rawnand: brcmnand: Allow SoC to provide I/O operations
  mtd: rawnand: brcmnand: Assign soc as early as possible
  mtd: rawnand: brcmnand: Avoid pdev in brcmnand_init_cs()
  mtd: rawnand: brcmnand: Move OF operations out of brcmnand_init_cs()
  mtd: rawnand: brcmnand: Allow working without interrupts
  mtd: rawnand: brcmnand: Add platform data structure for BCMA
  mtd: rawnand: brcmnand: Allow platform data instantation
  mtd: rawnand: brcmnand: BCMA controller uses command shift of 0
  mtd: rawnand: brcmnand: Add BCMA shim

 MAINTAINERS                                 |   1 +
 drivers/bcma/driver_chipcommon_nflash.c     |  17 ++-
 drivers/mtd/nand/raw/Kconfig                |  11 ++
 drivers/mtd/nand/raw/brcmnand/Makefile      |   2 +
 drivers/mtd/nand/raw/brcmnand/bcma_nand.c   | 131 ++++++++++++++++++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c    | 142 +++++++++++++-------
 drivers/mtd/nand/raw/brcmnand/brcmnand.h    |  23 ++++
 include/linux/bcma/bcma_driver_chipcommon.h |   5 +
 include/linux/platform_data/brcmnand.h      |  12 ++
 9 files changed, 291 insertions(+), 53 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/brcmnand/bcma_nand.c
 create mode 100644 include/linux/platform_data/brcmnand.h

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
