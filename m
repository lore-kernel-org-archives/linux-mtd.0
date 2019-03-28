Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD9FC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896D42173C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OPfU/sTM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896D42173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LltGW/kdBwSAi4Z4wx9KsGQ/cyW9iTLjKBiqKtpm7zY=; b=OPf
	U/sTMCdwRTz1WDdS3IYmyma1hq0p41OyLES9Bqs54fxrFmFMFdqPc6x/5eeAQxnp9dU7u7kFj/zW5
	euRfYcqtK3dImUXfF/2vVNxJ7s1CcAiIsQdKXeUMGfws2341LPvwEU/mWZpm//6gzDTRjoDsLzea0
	S0lMPyHR9J0qqx1hX6wA8YAcDi9Zw4+ItNs4OlkY+4XDrCehyYN3wBmK86xRpTYin/yp7XC37R+WZ
	LCRSFGj6dWbPb/PyY40J0rDaP0bOGn8CCee7CavVjOZUmPm3fhqE3UEIjp85E9wdEikAYCsKcYuYI
	ZT4pEv9MNGa1/0Ce9OqEfdP26xUfTKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9RqJ-0005BR-SK; Thu, 28 Mar 2019 10:01:03 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9RpD-0002bU-OW
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 10:00:20 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x2S9wlJJ052359;
 Thu, 28 Mar 2019 17:58:47 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, bbrezillon@kernel.org, dwmw2@infradead.org,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 computersforpeace@gmal.com, paul.burton@mips.com, stefan@agner.ch,
 christophe.kerello@st.com, liang.yang@amlogic.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 0/7] Add Macronix MX25F0A MFD driver and NAND function 
Date: Thu, 28 Mar 2019 18:18:31 +0800
Message-Id: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com x2S9wlJJ052359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_025956_390272_A9920678 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 zhengxunli@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

These patches support
1. Add Macronix MX25F0A MFD driver for SPI and raw NAND controller.
2. Add direct mapping read mode for SPI host controller.
3. Macronix NAND device read retry and randomizer function.
4. Macronix NAND device block protection function.

thanks for your review.

best regards,
Mason


Mason Yang (7):
  mfd: Add Macronix MX25F0A MFD controller driver
  mtd: rawnand: Add Macronix MX25F0A NAND controller driver
  spi: Patch Macronix MX25F0A SPI controller driver
  dt-bindings: mfd: Document Macronix MX25F0A controller bindings
  spi: Add direct mapping mode for Macronix SPI controller
  mtd: rawnand: Add Macronix NAND read retry and randomizer support
  mtd: rawnand: Add Macronix NAND block protection driver

 .../devicetree/bindings/mfd/mxic-mx25f0a.txt       |  66 +++++
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/mxic-mx25f0a.c                         |  90 ++++++
 drivers/mtd/nand/raw/Kconfig                       |   6 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/mxic_nand.c                   | 306 +++++++++++++++++++++
 drivers/mtd/nand/raw/nand_macronix.c               | 216 +++++++++++++++
 drivers/spi/spi-mxic.c                             | 288 +++++++------------
 include/linux/mfd/mxic-mx25f0a.h                   | 176 ++++++++++++
 10 files changed, 974 insertions(+), 185 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
 create mode 100644 drivers/mfd/mxic-mx25f0a.c
 create mode 100644 drivers/mtd/nand/raw/mxic_nand.c
 create mode 100644 include/linux/mfd/mxic-mx25f0a.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
