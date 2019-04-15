Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F58C10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 09:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E65D2073F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 09:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c3h5UQqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E65D2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UbHZILdBRp3Ng99LdAqIIA4nuPPKOQPJyi2oKcr2GJM=; b=c3h
	5UQqMPMgQFK3wQ0aIwI2MFZZCbHibCcVE2gsV5dOS2Hv5RbYp7E4i0Qr96aTnbCX/uoM/54TGByg+
	HrunMcdfXDMN1cPjwaZv9tEusTmF1qwntQfod88EVy5dPLldXqH4UooK5PYPEt/3LGCdJls75EAou
	Vdg3hD7IZhW2vcQ7JFeWnpQQP9bNPs9OB4RXhwqZmq8WxohEu+rny+CstHMUBE92rWl8AQHs62grJ
	LWUREnNI9ZbQ8d5ViFEpyX9NoXtT0PcF1w++aClLN6N2nnnVCRMSuDlv3jvjfwXIUxDW0gl9uG3YJ
	lVmX2LtC15xa4kvBrhtDjOjknU568mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxZc-0001hc-93; Mon, 15 Apr 2019 09:06:44 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxZR-0001Wn-Fl
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 09:06:35 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x3F93pKp042176;
 Mon, 15 Apr 2019 17:03:51 +0800 (GMT-8)
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
Subject: [PATCH v3 0/4] Add Macronix MX25F0A MFD driver for raw nand and spi
Date: Mon, 15 Apr 2019 17:23:50 +0800
Message-Id: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com x3F93pKp042176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_020633_800959_296270AE 
X-CRM114-Status: UNSURE (   7.15  )
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

v3 patch is to rename the title of SPI controller driver.
"Patch Macronix SPI controller driver according to MX25F0A MFD driver"

v2s patches is to support Macronix MX25F0A MFD driver 
for raw nand and spi controller which is separated 
form previous patchset:

https://patchwork.kernel.org/patch/10874679/

thanks for your review.

best regards,
Mason

Mason Yang (4):
  mfd: Add Macronix MX25F0A MFD controller driver
  mtd: rawnand: Add Macronix MX25F0A NAND controller
  spi: Patch Macronix SPI controller driver according to MX25F0A MFD
    driver
  dt-bindings: mfd: Document Macronix MX25F0A controller bindings

 .../devicetree/bindings/mfd/mxic-mx25f0a.txt       |  51 ++++
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/mxic-mx25f0a.c                         |  84 ++++++
 drivers/mtd/nand/raw/Kconfig                       |   6 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/mxic_nand.c                   | 294 +++++++++++++++++++++
 drivers/spi/spi-mxic.c                             | 275 ++++---------------
 include/linux/mfd/mxic-mx25f0a.h                   | 175 ++++++++++++
 9 files changed, 670 insertions(+), 226 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
 create mode 100644 drivers/mfd/mxic-mx25f0a.c
 create mode 100644 drivers/mtd/nand/raw/mxic_nand.c
 create mode 100644 include/linux/mfd/mxic-mx25f0a.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
