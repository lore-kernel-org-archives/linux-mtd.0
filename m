Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8FFC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5650760F6D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5650760F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nn/oXuqtyiDRsSIOvZ0W3KeGFQL1Esmz0RsP3u4w4bU=; b=hp0zUs0fzhxGJI
	BrcfIVRn0SAqRkl9TD/+eMv8yM18Ey+I81nlaBmrNqqRGdhT8KP6ZCwD5m2X1oRvmBNpq6MnnT6dW
	AsJHq9lfQ30qHquEiInRFK6P1+Cct5Dso2kEYGewhdpMsGXKQLzKXf6j1VKXsjLj8jzJGJGMoueGz
	Qjbdj2eBJdaKp8UKMhZYRclJKQ5/1t81kmP4b2mccp7OKd+LwwEWN5xjjLsQ8K6TB2iKuhu/vlMGU
	TFRCO5eF1cgZCHvI/MrqKyZUy+NJQRtOMaOw+Z17XsFrwmEfCNMIxz5BNMqClcP+6wxM05YLD/WwS
	tFURzcUZMYXzhQWwQmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUjZS-001eGu-3o; Mon, 27 Sep 2021 05:52:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUjYq-001e8I-8a; Mon, 27 Sep 2021 05:52:21 +0000
X-UUID: f404508c5da2471a84e367b5de5da203-20210926
X-UUID: f404508c5da2471a84e367b5de5da203-20210926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1035462492; Sun, 26 Sep 2021 22:52:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 22:42:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 13:42:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 13:42:11 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <info@bootlin.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v2 0/4] Add a driver for Mediatek SPI Nand controller
Date: Mon, 27 Sep 2021 13:42:01 +0800
Message-ID: <20210927054205.17960-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_225220_358102_DF647300 
X-CRM114-Status: GOOD (  11.59  )
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

Add a driver for Mediatek SPI Nand controller

Mediatek SPI Nand controller cosists of two parts: on-host HW ECC and
snfi(stand for spi nand flash interface). They can cowork with high
performance which called ECC nfi mode. The nfi stand for nand flash
interfacei(snfi a one part of nfi) which can support SPI Nand flash
and raw nand flash.

However, the snfi driver in spi subsytem need to be aware of nand
parameter(page/spare size) and ecc status(enable/disable) when work
at ECC nfi mode. The snfi driver in spi subsystem seems difficult to
know these.

Therefore, consider two ways to let snfi can get these information.
The RFC patch send to review whether they are suitable and which
solution maybe better.

RFC patch v1:
Add nfi register base at bch(ecc) dts node and config nand parameter
and ecc status into nfi registers in ecc driver, then parse these
information at snfi driver to use.

RFC patch v2:
Export some function in HW ECC driver and snfi driver.
In HW ECC driver, export function include get nand page/spare size, HW
ECC status(enable/disable) and fdm(oob free per sector in ooblayout) size.
In snfi driver need export empty page status which the nfi can be aware
when in ECC nfi mode(the spim framework can not return this information).

This series patch is the v2 solution, and only take mt7622 board for dts
node example.

Xiangsheng Hou (4):
  mtd: ecc: move mediatek HW ECC driver
  mtd: ecc: realize Mediatek HW ECC driver
  spi: add Mediatek SPI Nand controller driver
  arm64: dts: add snfi node for spi nand

 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   17 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   13 +
 drivers/mtd/nand/Kconfig                      |    9 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/core.c                       |    2 +-
 drivers/mtd/nand/ecc.c                        |   19 +
 drivers/mtd/nand/{raw => }/mtk_ecc.c          |  317 ++++-
 drivers/mtd/nand/raw/Kconfig                  |    1 +
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 drivers/mtd/nand/raw/mtk_nand.c               |    2 +-
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-mtk-snfi.c                    | 1087 +++++++++++++++++
 .../nand/raw => include/linux/mtd}/mtk_ecc.h  |    0
 include/linux/mtd/nand.h                      |   12 +
 15 files changed, 1490 insertions(+), 4 deletions(-)
 rename drivers/mtd/nand/{raw => }/mtk_ecc.c (65%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename {drivers/mtd/nand/raw => include/linux/mtd}/mtk_ecc.h (100%)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
