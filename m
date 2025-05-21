Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4516DC54E65
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 07:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oS+yye5aYLh9nHbap6XwEpyUVK9S6vb5OzwN6EFiQLI=; b=CIXYsgcU69Bmyc
	ucdU4+kgNpc491Bhhl3LgmQsisExEkrzH4PZeTQrBRMuxswVT28T3OWJaM+26qQPfc5T+cqU4pF5B
	Tbgmo0IfNsA0daPLkoouAa0pcmZwz6hcyBW68JGEfrXaxUd30jyDzP/Gnq6TO0Vhe21RF354OA7dq
	zLe3G2xhV8u8d2YI85iW1SPd4Dm/h/5U2cumxLOJM7aVG/pvIsYqFY2F00xIfn5xzIdjuWSyE23Mp
	UmZWvhaYd7SWc/L3lfHN4dK/uUwsabDNSgLXm82tis2fZ5/mCPae+GEK63dxWKaUilTi3GolzrOcg
	bQx+Cn6UTnjcFKAWYLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdYQ-0000000F1Hk-12eo;
	Wed, 21 May 2025 07:07:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdUl-0000000F0VM-1G3F;
	Wed, 21 May 2025 07:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747811047; x=1779347047;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C2oODVLtH9/VdmDMbvX4+EZYiZzWYKNovQyJnAFylQk=;
  b=qAnqaFDdvOsnKoHnswS17UgmcfzDMoyylGo4gB7fbCBUpWMd52BNX7Uz
   fTTTGP/vypQEfrM9WjKrobZ8+zIXt/mYBPkxE/SjjpdV9f8LUFPaW6hE2
   HDE2YPhlJD/t5twZOay+3ASw0rJxvs4CtaecrZT/zTt76/nHxr7Ug9gtG
   Ei0a06FSoBjPfSPS9WNdskMbmjmY1DajkSO3IVhHUCzOz+SnGbGKwKuuq
   +5dGtZDzz30S/Zoud0hwt5M8BPjk2OmKruHvyoxR+SLnXdHOaL4AJ25xB
   dc12BR1PEA5WV1rkWzPiAYYiEkVfCqp/ujMHTebD2vABOYRY5xhcZHvEc
   w==;
X-CSE-ConnectionGUID: Pj+r2YzxQHq6YitjaiF/ww==
X-CSE-MsgGUID: EEPYZbNBR/yRNlAIfM5lKQ==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="46698916"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 May 2025 00:04:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 21 May 2025 00:03:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 21 May 2025 00:03:48 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v3 0/3] Read MAC Address from SST vendor specific SFDP region
Date: Wed, 21 May 2025 12:33:33 +0530
Message-ID: <20250521070336.402202-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000407_548409_BD8C1C25 
X-CRM114-Status: GOOD (  10.39  )
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
from QSPI benefiting boards like the sama5d27_wlsom1, sama5d29 curiosity
and sam9x75 curiosity.

--------
changes in v3:
- 2/3 - add support to update the QSPI partition into 'fixed-partition'
	binding in sama5d27_wlsom1
- 3/3 - add nvmem-layout in qspi node for EUI48 MAC Address and nvmem cell
	properties for macb node in sama5d27_wlsom1

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
  ARM: dts: microchip: sama5d27_wlsom1: update the QSPI partitions using
    "fixed-partition" binding
  ARM: dts: microchip: sama5d27_wlsom1: Add nvmem-layout in QSPI for
    EUI48 MAC Address

 .../dts/microchip/at91-sama5d27_wlsom1.dtsi   |  65 ++++---
 drivers/mtd/spi-nor/sfdp.c                    | 161 ++++++++++++++++++
 include/linux/mtd/spi-nor.h                   |   7 +
 3 files changed, 209 insertions(+), 24 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
