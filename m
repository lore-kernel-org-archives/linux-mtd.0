Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2B2C3600D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 07:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cOZxHIyDfucJDt76OeY7CzG+mZFK/mrTeWyNlFOzJmU=; b=4DNMJMOxu4ewME
	v/QVXiPVZ0UOj61WTmXQSd0TPKWUCRqnRGr6G1WAIORBOGELY3InYvwEegt9Q/mhY8NeUImB+rZ0H
	9570tHPOWdWJ9oqFOQvvOH5XjookPM6MtZPa0E/liYZgM9QK9R4/G1O/NXkW0X+zr1iE3VYoRraHM
	nbvGcAXWt1r90EJZdAOKbtTRcBRmFd7oHTl5XHTAWmdfAWcvadriDR6uFYEdbrGBsNOBI6OwcvR96
	IgCW5IpfQ5xJ8VYo3wq46WUlWx05g/sdfP75P659fYZe3fkaqFQnQFy6D4o1263lK1wAE9kQVsuPC
	CcSrN6jDwyikN9vnOuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txL92-00000007m15-1Yob;
	Wed, 26 Mar 2025 07:25:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txL5j-00000007lOh-2fdn;
	Wed, 26 Mar 2025 07:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742973744; x=1774509744;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LkdvidHwFI1XZ/fCNSF3hN2TCT+VGgb2P8S9pghKT6c=;
  b=sMU3a2KSS3KbMpiRDMATz4RbonU6wnyhPIMJN51RhJ3SYRGcLQ1dI9Q8
   Yfz6bFTgXsnT503Njc3D3UXun2ItBjFStPf51uPV7emoke00dDdztkL1h
   l/Kzlc0TPF3OjoNicNb0majB8Z0sPpXuliuYL5YvSCA7YBbzM+dCUlwKy
   NRZzjhh/wpIJ6DfC/hlq+nvSGkJX41XEz5SqVzvxJS3s4KDnGgi6TeCBH
   aUjoSi9sFe8Qa5Vbyf59+0A/EouhbshDVo4hhF+gm3mZUmsLvm7Oo8ICE
   7hAAw8q4Zh7To2NDTZ1IQ/QlTByDDb0as7NZVF0A4tj5F5aNh8svqGihx
   Q==;
X-CSE-ConnectionGUID: QApF+UAWRZutY2upgn7tGQ==
X-CSE-MsgGUID: rG3UIBc2SbONS57bMchvBg==
X-IronPort-AV: E=Sophos;i="6.14,277,1736838000"; 
   d="scan'208";a="271100162"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 00:22:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 00:21:51 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 00:21:44 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 0/3] Read MAC Address from SST vendor specific SFDP region
Date: Wed, 26 Mar 2025 12:51:37 +0530
Message-ID: <20250326072140.172244-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_002223_808749_C18DF364 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

This patch series adds support to parse the SFDP SST vendor map, read and
store the EUI-48 and EUI-64 Address (if its programmed) using the
resource-managed devm_kcalloc which will be freed on driver detach.
Register EUI addresses into NVMEM framework for the net drivers to access
them using nvmem properties.
This change ensures consistent and reliable MAC address retrieval
from QSPI benefiting boards like the sama5d29 curiosity and
sam9x75 curiosity.

--------
changes in v2:

- 1/3 - parse the SST vendor table, read and store the addresses
	into a resource - managed space. Register the addresses
	into NVMEM framework
- 2/3 - add support to update the QSPI partition into 'fixed-partition'
	binding
--------

Manikandan Muralidharan (3):
  mtd: spi-nor: sfdp: parse SFDP SST vendor map and register EUI
    addresses into NVMEM framework
  ARM: dts: microchip: sama5d29_curiosity: update the QSPI partitions
    using "fixed-partition" binding
  ARM: dts: microchip: sama5d29_curiosity: Add nvmem-layout in QSPI for
    EUI48 MAC Address

 .../dts/microchip/at91-sama5d29_curiosity.dts |  62 ++++---
 drivers/mtd/spi-nor/sfdp.c                    | 161 ++++++++++++++++++
 include/linux/mtd/spi-nor.h                   |   7 +
 3 files changed, 206 insertions(+), 24 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
