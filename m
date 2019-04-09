Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F76FC10F14
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 02:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D401C213F2
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 02:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4VFsruN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D401C213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/yroWRbfAQ1TJZ6n9D9js35LibQMWmlQd1UVNFXDwmg=; b=B4V
	FsruNyIJ+7UT08hhzBX5ejKtIYuSNkGb2l7dzyOgjvkDGUaqdKwIDjOCxAKyTqSkPFwcmi/HZDeOF
	AmfWrWYlPCPh055X2kyX9h4y/mzbQ7k+oMnIpqroJ+VlqG46AWfkY47ECWlsdGoYb2uCD8S1NqmU9
	V0CsEq/LwY4g3603FBFBlv4jFBr+nxSrPyGVHlj/mcYfz+V4F1z6egRyIzaSacD/whq6nQhJ29uC2
	KrgXfhQhRlHbVW8yUdVAe5KlIUtxVtb/hnDCiSc0r9j4L9lYY7yozwMkbup2NSSOSZtoIfmzrCyKL
	6jh2+Ed7cTdpG88hF1OILAl5HheRaLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDgEM-0006G5-Mq; Tue, 09 Apr 2019 02:11:22 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDgE3-0005qn-JC
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 02:11:06 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x3929vUi032141;
 Tue, 9 Apr 2019 10:09:57 +0800 (GMT-8)
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
Subject: [PATCH v2 0/4] Add Macronix MX25F0A MFD driver for raw nand and spi
Date: Tue,  9 Apr 2019 10:29:56 +0800
Message-Id: <1554777000-10542-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com x3929vUi032141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_191103_988223_B18CDE7E 
X-CRM114-Status: UNSURE (   6.42  )
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

This patches support Macronix MX25F0A MFD driver for raw nand and spi
controller which is separated form previous patchset:

https://patchwork.kernel.org/patch/10874679/

thanks for your review.

best regards,
Mason

Mason Yang (4):
  mfd: Add Macronix MX25F0A MFD controller driver
  mtd: rawnand: Add Macronix MX25F0A NAND controller driver
  spi: Add MFD for Macronix MX25F0A SPI controller driver
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
