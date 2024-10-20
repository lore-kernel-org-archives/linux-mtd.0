Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776CFD3C930
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2024 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tOEHY4nyaY2EmkyyIk8yhHVUQcv62ryilgNcMDsZfJ4=; b=h0RXJIhU3I+olY
	dtDXIVhPa67jLVwKbJo0vvY+2lPlkQmgppyfYEuftE/wnlcDYrrjyQ8ISC/xxL1DKSkclY4jmsOT+
	Dmq5QW+gdo7D8qBqBVkEdV7nxuGKp4UXGWZNJY9S7IxeJ51YfKLw6z5MO/sFhDdSHDKTM2dfnGHJh
	mvzofjleopCjS+N9SHxnGYKbYfHqWBso0rVpwmeswonHyfgO/dC7si/HIe+2AJk0euD8CG0TynRcw
	/VbncEDi380htxRA6EpuQptgnYAjc6PQvED0LrIy6utz62x6K7SMqWZ5Sa+itjYXrjVjOy8OfXWA0
	VtNrdmAjPs6XYBDBi43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2VzZ-00000004vj8-30OR;
	Sun, 20 Oct 2024 13:29:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Vy2-00000004vRn-2JL8;
	Sun, 20 Oct 2024 13:27:36 +0000
X-UUID: 0cc32f448ee711ef9048ed6ed365623b-20241020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xgv59uFY/bRi9k1+Qc9CuwJ5ULI4vYv5ePGUW0MUTIg=;
	b=XnSJato9bHSTcLfBZOa4p+FCo76bSAv+OgbsSDEa7SKYcpKXVvRZqWQNMUjMJk8uU1bDgl4rtNancoLfYZyVR9/eh4q4zNkacge+mA5E1shyz2jpBvrhmTBzARPccMxQW1rqC5hj5ryCztMTSc6+gOjL+vCpuy4Tfz/tjcCf+ew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:d57b144b-df74-400f-951f-5c421a9ce60a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:0d245925-9cd9-4037-af6e-f4241b90f84d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 0cc32f448ee711ef9048ed6ed365623b-20241020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1920579413; Sun, 20 Oct 2024 06:27:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 20 Oct 2024 21:27:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 20 Oct 2024 21:27:24 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle
	<daniel@makrotopia.org>, Chia-Lin Kao <acelan.kao@canonical.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
Date: Sun, 20 Oct 2024 21:27:18 +0800
Message-ID: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_062734_622502_94BD0791 
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

From: "Sky Huang" <skylake.huang@mediatek.com>

Hi, this is Qi-Ze Huang(Sky Huang) from MediaTek. On our router platforms
chips, we have to quality lots of SPI-NAND devices and are eager for
a standard so that we don't need to maintain trivial flash ID table
anymore. I also noticed a talk in 2019 Embedded Linux Conference,
Memory Technology Devices: what's new, which mentioned "ONFI for
SPI-NANDs? Maybe, maybe not".

So earlier this year, I proposed a bold idea, CASN page (Common Attributes
for SPI-NAND). I worked together with top 3 SPI-NAND market share flash
vendors and other vendors to integrate CASN page on their SPI-NAND devices
including but not limited to:
[ESMT]
F50L1G41LB
F50L2G41KA

[Etron]
EM73C044VCF-H
EM73D044VCO-H
EM73E044VCE-H
EM73F044VCA-H

[GigaDevice]
GD5F1GM7UE
GD5F1GQ5UEYIG
GD5F2GM7UE
GD5F2GQ5UEYIG
GD5F4GM8UE
GD5F4GQ6UEYIG

[Macronix (MXIC)]
MX35LF1GE4ABZ4IG

[Winbond]
W25N01GV
W25N01KV
W25N02KV
W25N04KV

A document of CASN is hosted on github(https://github.com/mtk-openwrt/
doc/blob/main/CASN%20Page%20Introduction.pdf) So I'll try to keep it
simple here.

With CASN page, we don't need to maintain SPI-NAND flash ID table anymore.
Currently, it's integrated in 3.3V SPI-NANDs of small density and it's not
JEDEC standard yet. But it should be able to handle 1.8V and can be easily
integrated by flash vendors.

I believe this idea and implementation have room for improvement. Hope to
hear you open source community's comments soon.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
Sky Huang (4):
  mtd: nand: Create param.c to do CRC check and bitwise majority for
    Parameter & CASN page
  include: mtd: Add CASN page definition and related structs.
  include: mtd: spinand: Add CASN page related macros and flags.
  mtd: nand: spi: Add CASN page support

 drivers/mtd/nand/Makefile        |   2 +-
 drivers/mtd/nand/param.c         |  52 +++
 drivers/mtd/nand/raw/nand_onfi.c |  43 +-
 drivers/mtd/nand/spi/core.c      | 741 ++++++++++++++++++++++++++++++-
 include/linux/mtd/casn.h         | 191 ++++++++
 include/linux/mtd/param.h        |  20 +
 include/linux/mtd/spinand.h      | 100 ++++-
 7 files changed, 1094 insertions(+), 55 deletions(-)
 create mode 100644 drivers/mtd/nand/param.c
 create mode 100644 include/linux/mtd/casn.h
 create mode 100644 include/linux/mtd/param.h

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
